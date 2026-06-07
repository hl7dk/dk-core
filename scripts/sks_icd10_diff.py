#!/usr/bin/env python3
"""
sks_icd10_diff.py
=================

Download the Danish SKS classification (SKScomplete.txt) and the international
ICD-10 CodeSystem from a FHIR terminology server, then map out *where* the
Danish additions sit relative to plain ICD-10.

Background
----------
SKS ("Sundhedsvaesenets Klassifikations System") is the Danish health
classification. Its diagnosis register ("dia") is the Danish edition of
ICD-10: every diagnosis code is the ICD-10 code prefixed with a literal "D"
("D" for *Diagnose*), e.g. SKS ``DA022`` == ICD-10 ``A02.2``.

On top of plain ICD-10 the Danes add extra detail. Three relationships exist
between an SKS diagnosis code and the international ICD-10 CodeSystem:

  1. ``icd10_standard``       - the code IS a plain ICD-10 code Denmark reuses
                                (e.g. DA000 -> A00.0).
  2. ``danish_extension``     - extra granularity *under* a real ICD-10
                                category, usually a trailing letter
                                (e.g. DA022A -> A02.2A, which lives under the
                                real ICD-10 category A02 but is not itself an
                                ICD-10 code).
  3. ``danish_only_block``    - the 3-char category itself does not exist in
                                ICD-10 at all; an entirely Danish block
                                (e.g. the DU.../DV... supplementary codes).

The script writes a per-code mapping (CSV), a Danish-addons-only CSV, a
summary.json that groups the additions by ICD-10 chapter and category so you
can see at a glance *where* the Danish additions cluster, a standalone FHIR
CodeSystem (``CodeSystem-sks-icd10-deviations.json``, ``content: complete`` by
default) enumerating every deviation and extension as its own concepts, and a
FHIR CodeSystem (``CodeSystem-sks.json``) for the rest of SKS — every register
except diagnoses and ATC, under the SKS root OID ``urn:oid:1.2.208.176.2.4``.

Data sources
------------
SKS download page : https://sundhedsdatastyrelsen.dk/indberetning/klassifikationer/sks-klassifikationer/download-sks
SKS complete file : https://filer.sundhedsdata.dk/sks/data/skscomplete/SKScomplete.txt
ICD-10 (FHIR)     : tx.fhir.org/r4, CodeSystem url http://hl7.org/fhir/sid/icd-10

The SKScomplete.txt file is ~23 MB, fixed-width and Latin-1 (ISO-8859-1)
encoded. The ICD-10 CodeSystem on tx.fhir.org is ~4.6 MB JSON with ~13.8k
concepts (content = complete), so we fetch it once and diff locally rather
than hammering the server with tens of thousands of $validate-code calls.

Only the Python standard library is used.

Usage
-----
    python3 scripts/sks_icd10_diff.py
    python3 scripts/sks_icd10_diff.py --force-download --out-dir /tmp/sksout

Run ``--help`` for all options.
"""

from __future__ import annotations

import argparse
import csv
import datetime as dt
import email.utils
import json
import os
import sys
import urllib.parse
import urllib.request

# ---------------------------------------------------------------------------
# Defaults
# ---------------------------------------------------------------------------
SKS_URL = "https://filer.sundhedsdata.dk/sks/data/skscomplete/SKScomplete.txt"
TX_BASE = "https://tx.fhir.org/r4"
ICD10_SYSTEM = "http://hl7.org/fhir/sid/icd-10"

# SKScomplete uses 25000101 as the "no end date" sentinel. It is the source
# format's encoding of absence, not a real date, so open-ended validity is
# emitted as an *absent* validTo rather than this placeholder far-future date.
OPEN_ENDED_SKS = "25000101"

# SKS "hovedgrupper" (main groups): the leading letter of every code is an
# official top-level classification axis, distinct from (and cross-cutting) the
# SKScomplete register. Source:
# https://sundhedsdatastyrelsen.dk/indberetning/klassifikationer/sks-klassifikationer/hovedgrupper
# Codes whose leading letter is not one of these (e.g. T/V/Y) get no mainGroup.
SKS_HOVEDGRUPPER = {
    "A": "Administrative forhold",
    "B": "Behandlings- og Plejeklassifikation",
    "D": "Klassifikation af sygdomme (dansk ICD-10)",
    "E": "Klassifikation af ydre årsager",
    "F": "Klassifikation af funktionsevne (ICF)",
    "K": "Klassifikation af operationer (NCSP)",
    "M": "Laegemiddelstofklassifikation ATC",
    "N": "Anaestesi, intensiv og praehospital",
    "R": "Resultatindberetning",
    "U": "Klassifikation af undersoegelser",
    "W": "Klinisk fysiologi og nuklearmedicin",
    "Z": "Tillaegskoder og diverse procedurer",
}

# Canonical base for the generated supplement CodeSystem (DK Core IG).
SUPPLEMENT_CANONICAL = "http://hl7.dk/fhir/core/CodeSystem/sks-icd10-deviations"

# Canonical for the ICD-10 Danish-translation supplement (DK Core IG).
ICD10_DA_CANONICAL = "http://hl7.dk/fhir/core/CodeSystem/icd10-da"

# Identifier for the full Danish SKS CodeSystem (the SKS root OID).
SKS_CANONICAL = "urn:oid:1.2.208.176.2.4"
# Registers excluded from the SKS CodeSystem: 'dia' (diagnoses, covered by
# ICD-10 + the deviations CodeSystem) and 'atc' (WHO international drug codes).
SKS_EXCLUDE_REGISTERS = "dia,atc"

# SKScomplete.txt fixed-width layout (1-indexed columns):
#   1-3    register   ("dia", "opr", "atc", ...)
#   4-23   code        (20 chars, right-padded with spaces)
#   24-31  valid from  (YYYYMMDD)
#   32-39  modified    (YYYYMMDD)
#   40-47  valid to    (YYYYMMDD)  - "25000101" is the open-ended sentinel
#   48-167 Danish text  (120 chars, space-padded)
#   168-173 level code  (6 digits) ; 180-182 source ("SKS") ; then version
REG = slice(0, 3)
CODE = slice(3, 23)
DATE_FROM = slice(23, 31)
DATE_TO = slice(39, 47)
TEXT = slice(47, 167)

DIAGNOSIS_REGISTER = "dia"
USER_AGENT = "dk-core-sks-icd10-diff/1.0 (+https://github.com/hl7dk)"


# ---------------------------------------------------------------------------
# Download helpers
# ---------------------------------------------------------------------------
def _http_get(url: str, accept: str | None = None) -> bytes:
    req = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    if accept:
        req.add_header("Accept", accept)
    with urllib.request.urlopen(req, timeout=300) as resp:
        return resp.read()


def download_to(url: str, dest: str, accept: str | None = None,
                force: bool = False) -> str:
    """Download ``url`` to ``dest`` unless it already exists (or ``force``)."""
    if os.path.exists(dest) and not force:
        size = os.path.getsize(dest)
        print(f"  cached: {dest} ({size:,} bytes)")
        return dest
    print(f"  downloading {url}")
    req = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    if accept:
        req.add_header("Accept", accept)
    tmp = dest + ".part"
    with urllib.request.urlopen(req, timeout=600) as resp, open(tmp, "wb") as fh:
        last_modified = resp.headers.get("Last-Modified")
        total = 0
        while True:
            chunk = resp.read(1 << 16)
            if not chunk:
                break
            fh.write(chunk)
            total += len(chunk)
    os.replace(tmp, dest)
    # Persist the server's Last-Modified date so the source revision survives
    # caching (the file itself carries no version; the HTTP header is the
    # authoritative revision date, bumped on each quarterly SKS release).
    rev = _parse_http_date(last_modified)
    if rev:
        with open(dest + ".lastmod", "w", encoding="utf-8") as fh:
            fh.write(rev)
        print(f"  source revision (Last-Modified): {rev}")
    print(f"  saved: {dest} ({total:,} bytes)")
    return dest


def _parse_http_date(value: str | None) -> str:
    """Parse an HTTP Last-Modified header to an ISO date ('' if absent/bad)."""
    if not value:
        return ""
    try:
        return email.utils.parsedate_to_datetime(value).date().isoformat()
    except (TypeError, ValueError):
        return ""


def revision_date(dest: str) -> str:
    """Return the cached source file's revision date (YYYY-MM-DD) from its
    stored Last-Modified, or '' if unknown."""
    side = dest + ".lastmod"
    if os.path.exists(side):
        with open(side, "r", encoding="utf-8") as fh:
            return fh.read().strip()
    return ""


def fetch_icd10_codesystem(tx_base: str, system: str, dest: str,
                           force: bool = False) -> dict:
    """Resolve the ICD-10 CodeSystem by canonical url and cache the full JSON."""
    if os.path.exists(dest) and not force:
        print(f"  cached: {dest} ({os.path.getsize(dest):,} bytes)")
        with open(dest, "r", encoding="utf-8") as fh:
            return json.load(fh)

    # 1) find the resource id/version for this canonical url
    search = (f"{tx_base}/CodeSystem?url={urllib.parse.quote(system, safe='')}"
              f"&_format=json")
    print(f"  resolving CodeSystem {system}")
    bundle = json.loads(_http_get(search, accept="application/fhir+json"))
    if not bundle.get("entry"):
        raise SystemExit(f"ICD-10 CodeSystem '{system}' not found on {tx_base}")
    res = bundle["entry"][0]["resource"]
    cs_id = res["id"]
    version = res.get("version", "?")
    print(f"  found CodeSystem/{cs_id} version '{version}', "
          f"count={res.get('count', '?')}, content={res.get('content')}")

    # 2) fetch the full resource (search payload already inlines concepts, but
    #    fetch the canonical resource to be safe and version-stable)
    full = (f"{tx_base}/CodeSystem/{urllib.parse.quote(cs_id)}?_format=json")
    raw = _http_get(full, accept="application/fhir+json")
    with open(dest, "wb") as fh:
        fh.write(raw)
    print(f"  saved: {dest} ({len(raw):,} bytes)")
    return json.loads(raw)


# ---------------------------------------------------------------------------
# ICD-10 model
# ---------------------------------------------------------------------------
class Icd10:
    """In-memory view of the ICD-10 CodeSystem with chapter resolution."""

    def __init__(self, codesystem: dict):
        self.version = codesystem.get("version", "?")
        self.codes: set[str] = set()
        self._parent: dict[str, str] = {}
        self._kind: dict[str, str] = {}
        self._display: dict[str, str] = {}

        for concept in codesystem.get("concept", []):
            code = concept["code"]
            self.codes.add(code)
            self._display[code] = concept.get("display", "")
            for prop in concept.get("property", []):
                pc = prop.get("code")
                if pc == "parent":
                    # first parent wins (a category has exactly one block parent)
                    self._parent.setdefault(code, prop.get("valueCode", ""))
                elif pc == "kind":
                    self._kind[code] = prop.get("valueCode", "")

        self._chapter_cache: dict[str, tuple[str, str]] = {}

    def contains(self, code: str) -> bool:
        return code in self.codes

    def display(self, code: str) -> str:
        return self._display.get(code, "")

    def chapter_of(self, code: str) -> tuple[str, str]:
        """Walk parents to the owning chapter; returns (chapter_code, title)."""
        if code in self._chapter_cache:
            return self._chapter_cache[code]
        seen: list[str] = []
        cur = code
        result = ("", "")
        guard = 0
        while cur and guard < 16:
            guard += 1
            seen.append(cur)
            if self._kind.get(cur) == "chapter":
                result = (cur, self._display.get(cur, ""))
                break
            cur = self._parent.get(cur, "")
        for c in seen:
            self._chapter_cache[c] = result
        return result


# ---------------------------------------------------------------------------
# SKS parsing
# ---------------------------------------------------------------------------
class SksDiag:
    """One distinct SKS diagnosis code, collapsing its history rows."""

    __slots__ = ("code", "text", "_latest_from", "valid_from", "valid_to")

    def __init__(self, code: str):
        self.code = code          # full SKS code incl. leading D, e.g. "DA022A"
        self.text = ""
        self._latest_from = ""    # newest valid-from seen, used to pick the text
        self.valid_from = ""      # earliest valid-from across rows (YYYYMMDD)
        self.valid_to = ""        # latest valid-to across rows (YYYYMMDD)

    def observe(self, date_from: str, date_to: str, text: str) -> None:
        # Track the full validity span of the code across all its history rows
        if not self.valid_from or date_from < self.valid_from:
            self.valid_from = date_from
        if date_to > self.valid_to:
            self.valid_to = date_to
        # Keep the description from the most recent (by from-date) row
        if date_from >= self._latest_from:
            self._latest_from = date_from
            self.text = text


def parse_sks_diagnoses(path: str) -> dict[str, SksDiag]:
    """Read SKScomplete.txt (Latin-1) and return distinct 'dia' codes."""
    out: dict[str, SksDiag] = {}
    with open(path, "r", encoding="latin-1") as fh:
        for line in fh:
            if line[REG] != DIAGNOSIS_REGISTER:
                continue
            code = line[CODE].strip()
            if not code or code == "D":   # skip the empty root concept
                continue
            entry = out.get(code)
            if entry is None:
                entry = out[code] = SksDiag(code)
            entry.observe(line[DATE_FROM], line[DATE_TO], line[TEXT].rstrip())
    return out


class SksConcept:
    """One distinct SKS code from any register, collapsing its history rows."""

    __slots__ = ("code", "text", "_latest_from", "valid_from", "valid_to",
                 "registers")

    def __init__(self, code: str):
        self.code = code
        self.text = ""
        self._latest_from = ""
        self.valid_from = ""
        self.valid_to = ""
        self.registers: set[str] = set()

    def observe(self, register: str, date_from: str, date_to: str,
                text: str) -> None:
        self.registers.add(register)
        if not self.valid_from or date_from < self.valid_from:
            self.valid_from = date_from
        if date_to > self.valid_to:
            self.valid_to = date_to
        if date_from >= self._latest_from:
            self._latest_from = date_from
            self.text = text


def parse_sks_codes(path: str, exclude: set[str]) -> dict[str, SksConcept]:
    """
    Read SKScomplete.txt and return distinct codes from every register except
    those in ``exclude``. Codes that appear in more than one register (e.g.
    the ``KZ`` codes shared by 'opr' and 'til') are merged into one concept
    that records all of its registers.
    """
    out: dict[str, SksConcept] = {}
    with open(path, "r", encoding="latin-1") as fh:
        for line in fh:
            reg = line[REG]
            if reg in exclude:
                continue
            code = line[CODE].strip()
            if not code:
                continue
            entry = out.get(code)
            if entry is None:
                entry = out[code] = SksConcept(code)
            entry.observe(reg, line[DATE_FROM], line[DATE_TO],
                          line[TEXT].rstrip())
    return out


def prefix_hierarchy(codes: set[str]) -> tuple[dict, dict]:
    """
    Derive the SKS is-a hierarchy positionally, exactly as for ICD-10: a code's
    parent is its nearest existing shorter prefix (SKS is one prefix-structured
    code space, e.g. K -> KA -> KAA -> KAAA -> KAAA00). Returns (parent_of,
    children) keyed by code.
    """
    parent_of: dict[str, str] = {}
    children: dict[str, list[str]] = {}
    for code in codes:
        prefix = code[:-1]
        while prefix:
            if prefix in codes:
                parent_of[code] = prefix
                children.setdefault(prefix, []).append(code)
                break
            prefix = prefix[:-1]
    return parent_of, children


def build_sks_codesystem(concepts: dict[str, SksConcept], today: str,
                         canonical: str, version: str, content: str) -> dict:
    """
    Build a FHIR CodeSystem for the Danish SKS classification, covering every
    register except the excluded ones (by default the ICD-10-mapped diagnoses
    and ATC). Hierarchy is modelled as ICD-10 does it: ``hierarchyMeaning:
    is-a`` on a flat concept list with ``parent``/``child`` properties.

    The tree is rooted under the SKS *hovedgrupper* (main groups). Where the
    single-letter code already exists in SKS (A, B, F, K, N, R, U, W) it serves
    as the root for its branch; for hovedgrupper present only as deeper codes
    (D, E, Z) a synthetic single-letter root concept is added and that branch's
    former roots are reparented under it. M (ATC) is out of scope, and the
    non-hovedgruppe letters T/V/Y stay as their own roots.
    """
    code_set = set(concepts)
    parent_of, children = prefix_hierarchy(code_set)

    # Reparent each branch's roots under a hovedgruppe (main-group) concept,
    # synthesizing the single-letter root where SKS itself has none (D, E, Z).
    synthetic_roots: dict[str, list[str]] = {}
    for code in code_set:
        if code in parent_of:
            continue  # not a root
        letter = code[:1]
        if letter in SKS_HOVEDGRUPPER and letter not in code_set:
            parent_of[code] = letter
            synthetic_roots.setdefault(letter, []).append(code)

    legend = "; ".join(f"{k}={v}" for k, v in SKS_HOVEDGRUPPER.items())
    properties = [
        {"code": "register",
         "description": "SKScomplete register the code belongs to "
                        "(opr, pro, til, uly, adm, res, und, spc, ...).",
         "type": "code"},
        {"code": "mainGroup",
         "description": "SKS hovedgruppe (main group): the code's leading "
                        "letter, an official top-level classification axis "
                        "distinct from the register. " + legend +
                        ". Absent if the leading letter is not an official "
                        "hovedgruppe.",
         "type": "code"},
        {"code": "status",
         "description": "Whether the SKS code is currently active.",
         "type": "code"},
        {"code": "validFrom",
         "description": "Date the SKS code first became valid.",
         "type": "dateTime"},
        {"code": "validTo",
         "description": "Date the SKS code is valid until "
                        "(absent means open-ended).",
         "type": "dateTime"},
        {"code": "parent", "description": "Parent concept (is-a).",
         "type": "code"},
        {"code": "child", "description": "Child concept (is-a).",
         "type": "code"},
    ]

    concept_list = []
    for code in sorted(concepts):
        c = concepts[code]
        props = [{"code": "register", "valueCode": r}
                 for r in sorted(c.registers)]
        if code[:1] in SKS_HOVEDGRUPPER:
            props.append({"code": "mainGroup", "valueCode": code[:1]})
        props.append({"code": "status",
                      "valueCode": "active" if c.valid_to >= today
                      else "retired"})
        vf, vt = to_fhir_date(c.valid_from), to_fhir_date(c.valid_to)
        if vf:
            props.append({"code": "validFrom", "valueDateTime": vf})
        if vt and c.valid_to != OPEN_ENDED_SKS:
            props.append({"code": "validTo", "valueDateTime": vt})
        if code in parent_of:
            props.append({"code": "parent", "valueCode": parent_of[code]})
        for child in sorted(children.get(code, [])):
            props.append({"code": "child", "valueCode": child})
        concept = {"code": code, "property": props}
        if c.text:
            concept["display"] = c.text
        concept_list.append(concept)

    # Synthetic hovedgruppe root concepts (only for D/E/Z, which SKS has no
    # single-letter code for). Real single-letter roots (A/B/F/K/N/R/U/W) are
    # already in concept_list with their own SKS display.
    for letter in sorted(synthetic_roots):
        props = [{"code": "mainGroup", "valueCode": letter},
                 {"code": "status", "valueCode": "active"}]
        for child in sorted(synthetic_roots[letter]):
            props.append({"code": "child", "valueCode": child})
        concept_list.append({"code": letter,
                             "display": SKS_HOVEDGRUPPER[letter],
                             "property": props})

    # Keep the concept list in stable code order (synthetic roots interleaved).
    concept_list.sort(key=lambda c: c["code"])

    return {
        "resourceType": "CodeSystem",
        "id": "sks",
        "url": canonical,
        "version": version,
        "name": "SKS",
        "title": "SKS - Sundhedsvaesenets Klassifikations System (Danish)",
        "status": "draft",
        "experimental": True,
        "date": dt.date.today().isoformat(),
        "publisher": "HL7 Denmark",
        "jurisdiction": [{"coding": [{
            "system": "urn:iso:std:iso:3166", "code": "DK",
            "display": "Denmark"}]}],
        "description": (
            "The Danish SKS classification as published in SKScomplete.txt, "
            "excluding the diagnosis (ICD-10) and ATC registers: surgical "
            "procedures, treatment/nursing procedures, supplementary codes "
            "(tillaegskoder), external causes, administrative markers, results "
            "and investigations. Diagnoses are covered by ICD-10 and the "
            "sks-icd10-deviations CodeSystem instead. A fragment of the SKS "
            "code system (urn:oid:1.2.208.176.2.4), generated by "
            "scripts/sks_icd10_diff.py."),
        "caseSensitive": True,
        "hierarchyMeaning": "is-a",
        "content": content,
        "count": len(concept_list),
        "property": properties,
        "concept": concept_list,
    }


# ---------------------------------------------------------------------------
# Mapping logic
# ---------------------------------------------------------------------------
def icd_candidates(stripped: str) -> tuple[str, str]:
    """
    Given an SKS diagnosis code with the leading 'D' removed, return the two
    ICD-10 representations to test for membership:
      - the dotted form  (A022A -> A02.2A, A000 -> A00.0)
      - the no-dot form  (A00 -> A00, M008 -> M008)
    tx.fhir.org stores some codes both with and without the dot, so we test
    both and treat a hit on either as "present in ICD-10".
    """
    if len(stripped) <= 3:
        return stripped, stripped
    dotted = stripped[:3] + "." + stripped[3:]
    return dotted, stripped


def classify(sks_code: str, icd: Icd10) -> dict:
    """
    Classify one SKS diagnosis code against ICD-10.

    Fields returned:
      sks_code        full SKS code incl. leading D       (DA022A)
      danish_code     ICD-10-style Danish representation   (A02.2A)
      status          icd10_standard | danish_extension | danish_only_block
      icd10_code      exact base ICD-10 code, only when status==icd10_standard
      icd10_category  the real ICD-10 category it sits under ('' for Danish-only)
      icd10_chapter   owning ICD-10 chapter code
      chapter_title   owning ICD-10 chapter title
    """
    stripped = sks_code[1:] if sks_code.startswith("D") else sks_code
    category = stripped[:3]
    dotted, plain = icd_candidates(stripped)

    if icd.contains(dotted) or icd.contains(plain):
        status = "icd10_standard"
        icd10_code = dotted if icd.contains(dotted) else plain
        danish_code = icd10_code
        cat = category if icd.contains(category) else ""
    elif icd.contains(category):
        status = "danish_extension"      # extra detail under a real ICD-10 cat.
        icd10_code = ""
        danish_code = dotted
        cat = category
    else:
        status = "danish_only_block"     # category absent from ICD-10 entirely
        icd10_code = ""
        danish_code = stripped           # faithful: no artificial dot
        cat = ""

    chap_code, chap_title = icd.chapter_of(cat) if cat else ("", "")
    return {
        "sks_code": sks_code,
        "danish_code": danish_code,
        "status": status,
        "icd10_code": icd10_code,
        "icd10_category": cat,
        "icd10_chapter": chap_code,
        "chapter_title": chap_title,
    }


def is_active(valid_to: str, today: str) -> bool:
    return valid_to >= today


def to_fhir_date(yyyymmdd: str) -> str:
    """Convert an SKS 'YYYYMMDD' date to a FHIR date 'YYYY-MM-DD' ('' if bad)."""
    s = (yyyymmdd or "").strip()
    if len(s) == 8 and s.isdigit():
        return f"{s[0:4]}-{s[4:6]}-{s[6:8]}"
    return ""


# ---------------------------------------------------------------------------
# Reporting
# ---------------------------------------------------------------------------
def build_report(diags: dict[str, SksDiag], icd: Icd10) -> dict:
    today = dt.date.today().strftime("%Y%m%d")
    rows = []
    for code in sorted(diags):
        d = diags[code]
        info = classify(code, icd)
        info["active"] = is_active(d.valid_to, today)
        info["valid_from"] = to_fhir_date(d.valid_from)
        # Open-ended validity is left blank (emitted as an absent validTo),
        # not the 25000101 sentinel; status already conveys active/retired.
        info["valid_to"] = ("" if d.valid_to == OPEN_ENDED_SKS
                            else to_fhir_date(d.valid_to))
        info["danish_text"] = d.text
        rows.append(info)

    addons = [r for r in rows if r["status"] != "icd10_standard"]

    def tally(key, subset):
        counts: dict[str, int] = {}
        for r in subset:
            counts[r[key]] = counts.get(r[key], 0) + 1
        return counts

    by_status = tally("status", rows)
    # "where" the additions are: by ICD-10 chapter and category
    chapter_counts = tally("icd10_chapter", addons)
    by_chapter = []
    for ch_code, n in sorted(chapter_counts.items(),
                             key=lambda kv: (-kv[1], kv[0])):
        title = next((r["chapter_title"] for r in addons
                      if r["icd10_chapter"] == ch_code), "")
        by_chapter.append({"chapter": ch_code or "(none)",
                           "title": title, "danish_additions": n})

    category_counts = tally("icd10_category", addons)
    top_categories = sorted(
        ((c, n) for c, n in category_counts.items() if c),
        key=lambda kv: (-kv[1], kv[0]))[:40]

    summary = {
        "icd10_version": icd.version,
        "generated": dt.date.today().isoformat(),
        "totals": {
            "sks_diagnosis_codes": len(rows),
            "icd10_standard": by_status.get("icd10_standard", 0),
            "danish_extension": by_status.get("danish_extension", 0),
            "danish_only_block": by_status.get("danish_only_block", 0),
            "danish_additions_total": len(addons),
            "active_codes": sum(1 for r in rows if r["active"]),
        },
        "danish_additions_by_chapter": by_chapter,
        "top_categories_with_danish_additions": [
            {"category": c, "display": icd.display(c), "danish_additions": n}
            for c, n in top_categories
        ],
    }
    return {"rows": rows, "addons": addons, "summary": summary}


def compute_hierarchy(addons: list[dict], icd: Icd10,
                      is_supplement: bool) -> tuple[dict, dict]:
    """
    Resolve the is-a hierarchy among the addon concepts, mirroring how ICD-10
    models it (a flat concept list with ``parent``/``child`` code properties).

    The ICD-10 hierarchy is positional: each extra character is one level
    deeper (category ``A02`` -> subcategory ``A02.2`` -> Danish ``A02.2A`` ->
    ``A02.2A0``). So a code's parent is its nearest existing ancestor obtained
    by trimming trailing characters.

    Standalone (complete/fragment): parents must exist in *this* system, so we
    only link an addon to a shallower **addon** ancestor. Codes whose real
    parent is a plain ICD-10 code become roots (their ICD-10 anchor is recorded
    separately as ``baseCategory``).

    Supplement: ICD-10 is the base system, so a parent may also be a plain
    ICD-10 code, yielding a fully integrated tree.

    Returns (parent_of, children) keyed by the concept code (danish_code).
    """
    def stripped(sks_code: str) -> str:
        return sks_code[1:] if sks_code.startswith("D") else sks_code

    by_stripped = {stripped(r["sks_code"]): r["danish_code"] for r in addons}

    def icd_code_for(prefix: str) -> str | None:
        dotted = prefix[:3] + "." + prefix[3:] if len(prefix) > 3 else prefix
        if icd.contains(dotted):
            return dotted
        if icd.contains(prefix):
            return prefix
        return None

    parent_of: dict[str, str] = {}
    children: dict[str, list[str]] = {}
    for r in addons:
        code = r["danish_code"]
        prefix = stripped(r["sks_code"])[:-1]
        parent = None
        while prefix:
            if prefix in by_stripped:
                parent = by_stripped[prefix]
                break
            if is_supplement:
                hit = icd_code_for(prefix)
                if hit:
                    parent = hit
                    break
            prefix = prefix[:-1]
        if parent:
            parent_of[code] = parent
            children.setdefault(parent, []).append(code)
    return parent_of, children


def build_codesystem(addons: list[dict], icd: Icd10, system: str,
                     canonical: str, version: str, content: str) -> dict:
    """
    Build a FHIR CodeSystem enumerating every Danish deviation/extension to
    ICD-10 (i.e. the codes that are NOT plain ICD-10).

    By default this is a standalone ``content: complete`` CodeSystem: the
    Danish additions are genuinely new codes that do not exist in ICD-10, so
    they form their own code system rather than annotating ICD-10.

    With ``content == "supplement"`` the resource instead declares
    ``supplements`` = the ICD-10 CodeSystem (version-pinned), and the is-a
    hierarchy can then reach plain ICD-10 parents. (A strict FHIR supplement is
    meant to annotate concepts that already exist in the base system, so a
    terminology server may object to these new codes; the standalone forms
    avoid that.)

    Hierarchy is expressed exactly as ICD-10 does it: ``hierarchyMeaning:
    is-a`` on a flat concept list, with ``parent``/``child`` code properties.

    Each concept carries:
      - display          : the Danish term
      - deviationType    : extension (under a real ICD-10 category) | deviation
      - sksCode          : the original SKS code (incl. leading D)
      - baseCategory     : the related ICD-10 category ('' for Danish blocks)
      - icd10Chapter     : owning ICD-10 chapter
      - status           : active | retired (per current SKS validity)
      - validFrom        : earliest valid-from date across the code's history
      - validTo          : latest valid-to date (absent means open-ended)
      - parent / child   : is-a links to the nearest in-scope ancestor/children
    """
    is_supplement = content == "supplement"
    parent_of, children = compute_hierarchy(addons, icd, is_supplement)

    properties = [
        {"code": "deviationType",
         "description": "How the code relates to ICD-10: 'extension' adds "
                        "detail under an existing ICD-10 category; 'deviation' "
                        "is a Danish-only block absent from ICD-10.",
         "type": "code"},
        {"code": "sksCode",
         "description": "Original SKS diagnosis code, including the leading D.",
         "type": "code"},
        {"code": "baseCategory",
         "description": "The ICD-10 category this code relates to; empty for "
                        "Danish-only blocks.",
         "type": "code"},
        {"code": "icd10Chapter",
         "description": "Owning ICD-10 chapter code.",
         "type": "code"},
        {"code": "status",
         "description": "Whether the SKS code is currently active.",
         "type": "code"},
        {"code": "validFrom",
         "description": "Date the SKS code first became valid "
                        "(earliest across its history).",
         "type": "dateTime"},
        {"code": "validTo",
         "description": "Date the SKS code is valid until "
                        "(latest across its history; absent means open).",
         "type": "dateTime"},
        {"code": "parent",
         "description": "Parent concept in the is-a hierarchy "
                        "(nearest shallower in-scope code).",
         "type": "code"},
        {"code": "child",
         "description": "Child concept in the is-a hierarchy.",
         "type": "code"},
    ]

    concepts = []
    for r in addons:
        code = r["danish_code"]
        props = [
            {"code": "deviationType",
             "valueCode": ("extension" if r["status"] == "danish_extension"
                           else "deviation")},
            {"code": "sksCode", "valueCode": r["sks_code"]},
            {"code": "status",
             "valueCode": "active" if r["active"] else "retired"},
        ]
        if r["icd10_category"]:
            props.append({"code": "baseCategory",
                          "valueCode": r["icd10_category"]})
        if r["icd10_chapter"]:
            props.append({"code": "icd10Chapter",
                          "valueCode": r["icd10_chapter"]})
        if r["valid_from"]:
            props.append({"code": "validFrom",
                          "valueDateTime": r["valid_from"]})
        if r["valid_to"]:
            props.append({"code": "validTo",
                          "valueDateTime": r["valid_to"]})
        if code in parent_of:
            props.append({"code": "parent", "valueCode": parent_of[code]})
        for child in sorted(children.get(code, [])):
            props.append({"code": "child", "valueCode": child})
        concept = {"code": code, "property": props}
        if r["danish_text"]:
            concept["display"] = r["danish_text"]
        concepts.append(concept)

    cs = {
        "resourceType": "CodeSystem",
        "id": canonical.rstrip("/").rsplit("/", 1)[-1],
        "url": canonical,
        "version": version,
        "name": "SksIcd10Deviations",
        "title": "SKS deviations and extensions to ICD-10",
        "status": "draft",
        "experimental": True,
        "date": dt.date.today().isoformat(),
        "publisher": "HL7 Denmark",
        "jurisdiction": [{"coding": [{
            "system": "urn:iso:std:iso:3166", "code": "DK",
            "display": "Denmark"}]}],
        "description": (
            "Danish SKS diagnosis codes that are not part of plain ICD-10: "
            "finer-grained extensions under existing ICD-10 categories and "
            "Danish-only blocks. Generated from SKScomplete.txt diffed against "
            f"{system} version {icd.version} by scripts/sks_icd10_diff.py."),
        "caseSensitive": True,
        "hierarchyMeaning": "is-a",
        "content": content,
        "count": len(concepts),
        "property": properties,
        "concept": concepts,
    }
    if is_supplement:
        cs["supplements"] = f"{system}|{icd.version}"
    return cs


def build_icd10_da_supplement(rows: list[dict], icd: Icd10, system: str,
                              canonical: str, version: str) -> dict:
    """
    Build a FHIR CodeSystem *supplement* that adds the Danish display to the
    international ICD-10 codes Denmark actually reuses.

    Only the SKS diagnosis codes classified ``icd10_standard`` are included —
    i.e. codes that genuinely exist in ``system`` (a supplement must not
    introduce codes absent from the base system). The Danish text is added as a
    ``da``-language ``designation`` (not ``concept.display`` — a supplement must
    not override the base system's display), so the supplement is a clean
    ICD-10 → Danish translation layer surfaced via ``displayLanguage=da``.
    """
    # One entry per base ICD-10 code; prefer an active SKS row, then the one
    # whose Danish form matches the ICD-10 code exactly, for a stable display.
    best: dict[str, dict] = {}
    for r in rows:
        if r["status"] != "icd10_standard":
            continue
        code = r["icd10_code"]
        text = r["danish_text"]
        if not code or not text or not icd.contains(code):
            continue
        cur = best.get(code)
        if cur is None:
            best[code] = r
            continue
        # Tie-break deterministically: active wins, then exact-form, then text.
        better = ((r["active"], r["danish_code"] == code, r["danish_text"])
                  > (cur["active"], cur["danish_code"] == code,
                     cur["danish_text"]))
        if better:
            best[code] = r

    # A supplement must not override the base ICD-10 display (English); the
    # Danish text is added as a da-language designation, which terminology
    # servers surface via displayLanguage=da. No concept.display here.
    concepts = []
    for code in sorted(best):
        text = best[code]["danish_text"]
        concepts.append({
            "code": code,
            "designation": [{"language": "da", "value": text}],
        })

    return {
        "resourceType": "CodeSystem",
        "id": canonical.rstrip("/").rsplit("/", 1)[-1],
        "url": canonical,
        "version": version,
        "name": "Icd10DanishTranslations",
        "title": "ICD-10 Danish translations (from SKS)",
        "status": "draft",
        "experimental": True,
        "date": dt.date.today().isoformat(),
        "publisher": "HL7 Denmark",
        "jurisdiction": [{"coding": [{
            "system": "urn:iso:std:iso:3166", "code": "DK",
            "display": "Denmark"}]}],
        "description": (
            "Danish-language display supplement for the international ICD-10 "
            "code system: the Danish text from the SKS diagnosis register for "
            "the ICD-10 codes Denmark reuses unchanged. Generated from "
            f"SKScomplete.txt and {system} version {icd.version} by "
            "scripts/sks_icd10_diff.py. Danish extensions and Danish-only "
            "diagnosis blocks are out of scope here (they are not ICD-10 "
            "codes) and live in the sks-icd10-deviations CodeSystem instead."),
        "caseSensitive": True,
        "content": "supplement",
        "supplements": f"{system}|{icd.version}",
        "count": len(concepts),
        "concept": concepts,
    }


def write_csv(path: str, rows: list[dict], fields: list[str]) -> None:
    with open(path, "w", encoding="utf-8", newline="") as fh:
        w = csv.DictWriter(fh, fieldnames=fields, extrasaction="ignore")
        w.writeheader()
        for r in rows:
            w.writerow(r)


def print_summary(summary: dict) -> None:
    t = summary["totals"]
    print("\n" + "=" * 70)
    print(f"SKS diagnosis (dia) register vs ICD-10 {summary['icd10_version']}")
    print("=" * 70)
    print(f"  distinct SKS diagnosis codes : {t['sks_diagnosis_codes']:>7,}")
    print(f"    plain ICD-10 (reused)      : {t['icd10_standard']:>7,}")
    print(f"    Danish extensions          : {t['danish_extension']:>7,}  "
          f"(extra detail under a real ICD-10 category)")
    print(f"    Danish-only blocks         : {t['danish_only_block']:>7,}  "
          f"(category absent from ICD-10)")
    print(f"    -> Danish additions total  : {t['danish_additions_total']:>7,}")
    print(f"  currently-active codes       : {t['active_codes']:>7,}")

    print("\nWhere the Danish additions are (by ICD-10 chapter):")
    print(f"  {'chapter':<8}{'adds':>7}  title")
    for c in summary["danish_additions_by_chapter"]:
        print(f"  {c['chapter']:<8}{c['danish_additions']:>7}  {c['title']}")

    print("\nTop ICD-10 categories receiving Danish additions:")
    print(f"  {'cat':<6}{'adds':>6}  display")
    for c in summary["top_categories_with_danish_additions"][:20]:
        print(f"  {c['category']:<6}{c['danish_additions']:>6}  {c['display']}")
    print()


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------
def main(argv: list[str]) -> int:
    p = argparse.ArgumentParser(
        description="Map Danish SKS diagnosis additions against plain ICD-10.")
    p.add_argument("--sks-url", default=SKS_URL)
    p.add_argument("--tx-base", default=TX_BASE,
                   help="FHIR terminology server base (R4).")
    p.add_argument("--icd-system", default=ICD10_SYSTEM,
                   help="ICD-10 CodeSystem canonical url.")
    p.add_argument("--cache-dir", default=".sks-cache",
                   help="Where downloaded source files are cached.")
    p.add_argument("--out-dir", default="sks-icd10-out",
                   help="Where result CSV/JSON files are written.")
    p.add_argument("--force-download", action="store_true",
                   help="Re-download sources even if cached.")
    p.add_argument("--supplement-canonical", default=SUPPLEMENT_CANONICAL,
                   help="Canonical url for the generated CodeSystem.")
    p.add_argument("--supplement-version", default=None,
                   help="Version for the generated CodeSystem (default: the "
                        "SKS source revision date from Last-Modified, else "
                        "today).")
    p.add_argument("--content", default="complete",
                   choices=["complete", "fragment", "supplement"],
                   help="CodeSystem.content for the deviations resource. "
                        "'complete'/'fragment' emit a standalone Danish code "
                        "system; 'supplement' links to (supplements) ICD-10.")
    p.add_argument("--sks-canonical", default=SKS_CANONICAL,
                   help="Identifier for the full SKS CodeSystem.")
    p.add_argument("--sks-version", default=None,
                   help="Version for the SKS CodeSystem (default: the SKS "
                        "source revision date from Last-Modified, else today).")
    p.add_argument("--sks-exclude-registers", default=SKS_EXCLUDE_REGISTERS,
                   help="Comma-separated SKScomplete registers to leave out of "
                        "the SKS CodeSystem.")
    p.add_argument("--icd10-da-canonical", default=ICD10_DA_CANONICAL,
                   help="Canonical url for the ICD-10 Danish-translation "
                        "supplement CodeSystem.")
    p.add_argument("--icd10-da-version", default=None,
                   help="Version for the ICD-10 Danish-translation supplement "
                        "(default: the SKS source revision date, else today).")
    args = p.parse_args(argv)

    os.makedirs(args.cache_dir, exist_ok=True)
    os.makedirs(args.out_dir, exist_ok=True)

    print("[1/4] Acquiring SKS complete file ...")
    sks_path = download_to(args.sks_url,
                           os.path.join(args.cache_dir, "SKScomplete.txt"),
                           force=args.force_download)
    # The SKScomplete file carries no internal version; its HTTP Last-Modified
    # is the authoritative revision date and is the default version/date stamp.
    source_rev = revision_date(sks_path)
    default_version = source_rev or dt.date.today().isoformat()
    if source_rev:
        print(f"  using SKS revision date as default version: {source_rev}")

    print("[2/4] Acquiring ICD-10 CodeSystem ...")
    cs = fetch_icd10_codesystem(args.tx_base, args.icd_system,
                                os.path.join(args.cache_dir, "icd10.json"),
                                force=args.force_download)
    icd = Icd10(cs)
    print(f"  ICD-10 codes loaded: {len(icd.codes):,}")

    print("[3/4] Parsing SKS diagnosis register ...")
    diags = parse_sks_diagnoses(sks_path)
    print(f"  distinct 'dia' codes: {len(diags):,}")

    print("[4/4] Classifying & writing reports ...")
    report = build_report(diags, icd)

    map_csv = os.path.join(args.out_dir, "sks-icd10-mapping.csv")
    add_csv = os.path.join(args.out_dir, "danish-addons.csv")
    summ_json = os.path.join(args.out_dir, "summary.json")
    cs_json = os.path.join(args.out_dir,
                           "CodeSystem-sks-icd10-deviations.json")
    fields = ["sks_code", "danish_code", "status", "icd10_code",
              "icd10_category", "icd10_chapter", "chapter_title",
              "active", "valid_from", "valid_to", "danish_text"]
    write_csv(map_csv, report["rows"], fields)
    write_csv(add_csv, report["addons"], fields)
    with open(summ_json, "w", encoding="utf-8") as fh:
        json.dump(report["summary"], fh, ensure_ascii=False, indent=2)

    version = args.supplement_version or default_version
    codesystem = build_codesystem(report["addons"], icd, args.icd_system,
                                  args.supplement_canonical, version,
                                  args.content)
    if source_rev:
        codesystem["date"] = source_rev
    with open(cs_json, "w", encoding="utf-8") as fh:
        json.dump(codesystem, fh, ensure_ascii=False, indent=2)

    print(f"  wrote {map_csv}  ({len(report['rows']):,} rows)")
    print(f"  wrote {add_csv}  ({len(report['addons']):,} rows)")
    print(f"  wrote {summ_json}")
    print(f"  wrote {cs_json}  (CodeSystem '{args.content}', "
          f"{codesystem['count']:,} concepts)")

    print("[5/5] Building SKS CodeSystem (non-diagnosis registers) ...")
    exclude = {r.strip() for r in args.sks_exclude_registers.split(",")
               if r.strip()}
    sks_concepts = parse_sks_codes(sks_path, exclude)
    today = dt.date.today().strftime("%Y%m%d")
    sks_version = args.sks_version or default_version
    sks_cs = build_sks_codesystem(sks_concepts, today, args.sks_canonical,
                                  sks_version, "fragment")
    if source_rev:
        sks_cs["date"] = source_rev
    sks_json = os.path.join(args.out_dir, "CodeSystem-sks.json")
    with open(sks_json, "w", encoding="utf-8") as fh:
        json.dump(sks_cs, fh, ensure_ascii=False, indent=2)
    print(f"  excluded registers: {', '.join(sorted(exclude))}")
    print(f"  wrote {sks_json}  (CodeSystem 'fragment', "
          f"{sks_cs['count']:,} concepts)")

    print("[6/6] Building ICD-10 Danish-translation supplement ...")
    da_version = args.icd10_da_version or default_version
    da_cs = build_icd10_da_supplement(report["rows"], icd, args.icd_system,
                                      args.icd10_da_canonical, da_version)
    if source_rev:
        da_cs["date"] = source_rev
    da_json = os.path.join(args.out_dir, "CodeSystem-icd10-da.json")
    with open(da_json, "w", encoding="utf-8") as fh:
        json.dump(da_cs, fh, ensure_ascii=False, indent=2)
    print(f"  wrote {da_json}  (CodeSystem 'supplement', "
          f"{da_cs['count']:,} Danish ICD-10 displays)")

    print_summary(report["summary"])
    return 0


if __name__ == "__main__":
    try:
        sys.exit(main(sys.argv[1:]))
    except urllib.error.URLError as e:
        print(f"network error: {e}", file=sys.stderr)
        sys.exit(2)
    except KeyboardInterrupt:
        sys.exit(130)

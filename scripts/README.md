# scripts

## `sks_icd10_diff.py`

Maps out **where the Danish SKS additions sit relative to plain ICD-10**.

It downloads:

- the Danish SKS complete file `SKScomplete.txt` from
  <https://filer.sundhedsdata.dk/sks/data/skscomplete/> (see the
  [SKS download page](https://sundhedsdatastyrelsen.dk/indberetning/klassifikationer/sks-klassifikationer/download-sks)),
- the international ICD-10 `CodeSystem`
  (`http://hl7.org/fhir/sid/icd-10`) from the FHIR terminology server
  `tx.fhir.org/r4`,

and diffs the SKS diagnosis register (`dia`) against ICD-10.

### How the mapping works

Every SKS diagnosis code is the ICD-10 code prefixed with a literal `D`
(*Diagnose*), e.g. SKS `DA022` == ICD-10 `A02.2`. After stripping the `D`
each code falls into one of three buckets:

| status              | meaning                                                        | example                |
|---------------------|----------------------------------------------------------------|------------------------|
| `icd10_standard`    | plain ICD-10 code Denmark reuses                               | `DA000` → `A00.0`      |
| `danish_extension`  | extra granularity **under a real ICD-10 category**             | `DA022A` → `A02.2A`    |
| `danish_only_block` | the 3-char category does **not** exist in ICD-10 at all        | `DUB`, `DVRA01` (U/V…) |

### Usage

```bash
python3 scripts/sks_icd10_diff.py            # uses ./.sks-cache and ./sks-icd10-out
python3 scripts/sks_icd10_diff.py --force-download
python3 scripts/sks_icd10_diff.py --help
```

No third-party dependencies — Python 3 standard library only. The two source
files (~23 MB SKS, ~4.6 MB ICD-10) are cached under `.sks-cache/` and reused on
subsequent runs.

### Output (`sks-icd10-out/`)

- `sks-icd10-mapping.csv` — every SKS diagnosis code with its `danish_code`
  (ICD-10-style form), status, exact `icd10_code` (when reused), ICD-10
  category, chapter, `active`, `valid_from` / `valid_to` and the Danish
  description.
- `danish-addons.csv` — the additions only (`danish_extension` +
  `danish_only_block`).
- `summary.json` — totals plus the additions grouped by ICD-10 chapter and the
  top categories receiving Danish additions (i.e. *where* the additions are).
- `CodeSystem-sks-icd10-deviations.json` — a standalone **FHIR CodeSystem**
  enumerating every Danish deviation/extension (14k+ concepts) as its own
  codes. Default `content: complete` (these are genuinely new codes absent from
  ICD-10, so they form their own code system, not an ICD-10 supplement). Each
  concept carries properties: `deviationType` (`extension`/`deviation`),
  `sksCode`, `baseCategory` (the related ICD-10 category), `icd10Chapter`,
  `status` (`active`/`retired`), and `validFrom` / `validTo` (`dateTime`,
  spanning the code's full SKS history; `validTo` of `2500-01-01` means
  open-ended).

  Hierarchy is modelled exactly as ICD-10 models it — `hierarchyMeaning:
  is-a` on a flat concept list with `parent`/`child` code properties (ICD-10
  does **not** nest `concept.concept`). The Danish hierarchy is positional:
  each extra character is one level deeper (`A02` → `A02.2` → `A02.2A` →
  `A02.2A0`).
  - In the standalone default, `parent` only links to a shallower **Danish**
    code, because a CodeSystem's parents must exist in the same system
    (~1.2k internal links). Codes whose real parent is a plain ICD-10 code are
    roots; their `baseCategory` records the ICD-10 anchor.
  - In `--content supplement`, ICD-10 is the base system, so `parent` reaches
    plain ICD-10 codes too, giving a fully integrated tree.

  Customise with `--supplement-canonical` (the canonical url),
  `--supplement-version` and `--content {complete,fragment,supplement}`.
  `--content supplement` instead links to ICD-10 via `supplements:
  http://hl7.org/fhir/sid/icd-10|<version>` and adds an is-a `parent` to each
  extension — but note a terminology server may reject a supplement that
  introduces codes not present in the base system, which is why `complete` is
  the default.
- `CodeSystem-sks.json` — a **FHIR CodeSystem** for the rest of the Danish SKS
  classification: every SKScomplete register **except** diagnoses (`dia`, which
  are covered by ICD-10 + the deviations CodeSystem) and ATC (`atc`, WHO
  international). ~38k concepts: surgical procedures (`opr`), treatment/nursing
  procedures (`pro`, incl. the `ZZ…` measurement codes used in
  `DkCoreObservation`), supplementary codes (`til`), external causes (`uly`),
  administrative markers (`adm`), results/investigations (`res`/`und`/`spc`).
  `content: fragment` under the SKS root OID `urn:oid:1.2.208.176.2.4`, so the
  existing `$SKS` profile slices resolve to it with no profile edits. Each
  concept carries `register` (multi-valued — codes shared across registers,
  e.g. the `KZ…` codes in `opr`+`til`, are merged), `status`, `validFrom` /
  `validTo`, and `parent`/`child` is-a links derived positionally (the SKS
  prefix hierarchy, e.g. `K` → `KA` → `KAA` → `KAAA` → `KAAA00`).

  Customise with `--sks-canonical`, `--sks-version`, and
  `--sks-exclude-registers` (default `dia,atc`).

Both `.sks-cache/` and `sks-icd10-out/` are git-ignored. To publish the two
generated CodeSystems, copy them into `input/resources/` (predefined resources
the IG Publisher picks up automatically):

```bash
cp sks-icd10-out/CodeSystem-sks-icd10-deviations.json input/resources/
cp sks-icd10-out/CodeSystem-sks.json                  input/resources/
```

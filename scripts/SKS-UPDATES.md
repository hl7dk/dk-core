# SKS update cadence

The Danish SKS classification (*Sundhedsvæsenets Klassifikations System*) that
this directory digests into FHIR `CodeSystem`s is **not static** — Sundhedsdata‑
styrelsen revises it on a fixed quarterly rhythm. This note records that
rhythm so a maintainer (or the automated workflow, see below) knows *when* the
upstream `SKScomplete.txt` is expected to change and the generated CodeSystems
should be regenerated.

Source of truth:
<https://sundhedsdatastyrelsen.dk/indberetning/klassifikationer/sks-klassifikationer/opdateringer>

## What the authority says

> *"Sundhedsdatastyrelsen opdaterer løbende SKS og udsender ændringerne til
> sygehusene. Dette sker kvartalsvis, normalt d. 17. i måneden op til et
> kvartalsskifte."*
>
> *"Den nyeste version af SKS vil således være klar til brug d. 1 ved hvert
> kvartalsskifte."*

In English: SKS is maintained continuously, but changes are **bundled and
released quarterly**. They are announced — and the system‑update files are sent
to the hospitals — **on the 17th of the month preceding a quarter change**, and
the new version is **ready for use on the 1st at each quarter change**.

Additional rules stated on the page:

- **Codes are never closed retroactively.** A closed (retired) code keeps its
  validity up to the closing date.
- A **new code normally takes effect on the 1st of the following month**; only
  in exceptional cases is it back‑dated when registration requires it.
- When a code is closed, the documents give the **replacement code** and the
  **effective date**.

## The quarterly calendar

| Quarter change | New version live | Announced / files distributed |
|----------------|------------------|-------------------------------|
| Q1             | **1 January**    | ~**17 December**              |
| Q2             | **1 April**      | ~**17 March**                 |
| Q3             | **1 July**       | ~**17 June**                  |
| Q4             | **1 October**    | ~**17 September**             |

So `SKScomplete.txt` at
<https://filer.sundhedsdata.dk/sks/data/skscomplete/SKScomplete.txt>
is expected to carry new content shortly after each of those quarter changes.

## Historical updates

The authority keeps a public archive of per‑release change documents (PDFs of
*new codes* and *closed codes* with their replacements and effective dates):

- **Annual compilations from 2006 through 2025.**
- **Per‑month documents in the most recent years** (e.g. *January 2026* and
  *April 2026* are listed individually).

The change documents are descriptive only — the machine‑readable truth is
always the current `SKScomplete.txt`, which is what `sks_icd10_diff.py`
consumes. There is **no RSS/subscription feed**; the page must be polled (the
quarterly calendar above is the polling schedule).

## What this means for DK Core

The two generated CodeSystems (`CodeSystem-sks.json` and
`CodeSystem-sks-icd10-deviations.json`, committed under `input/resources/`)
are a snapshot of `SKScomplete.txt` at generation time. To stay aligned with
the upstream classification they should be **regenerated once per quarter**,
just after each quarter change.

That regeneration is automated by
[`.github/workflows/sks-update.yml`](../.github/workflows/sks-update.yml),
which runs on the quarterly schedule above, re‑downloads the source, runs
`scripts/sks_icd10_diff.py`, and opens a pull request **only when the SKS
content has actually changed** (version/date stamps alone do not trigger a PR).
To regenerate by hand:

```bash
python3 scripts/sks_icd10_diff.py --force-download
cp sks-icd10-out/CodeSystem-sks.json                  input/resources/
cp sks-icd10-out/CodeSystem-sks-icd10-deviations.json input/resources/
```

### Versioning: the file's revision date

`SKScomplete.txt` carries **no internal version string** (the trailing
per‑record field is just a record‑type marker). The authoritative revision
signal is the **HTTP `Last-Modified` header** on
<https://filer.sundhedsdata.dk/sks/data/skscomplete/SKScomplete.txt> — it is
bumped on each quarterly release and lines up with the calendar above (e.g.
`Last-Modified: Mon, 16 Mar 2026` is the Q2‑2026 release, distributed ~17 March
and live 1 April).

The script therefore defaults the generated CodeSystems' `version` **and**
`date` to that revision date (`YYYY-MM-DD`), stored as a `.lastmod` sidecar in
the cache so it survives caching. This means:

- the `version`/`date` change **only when SKS actually releases**, not on every
  run — so re‑running the generator produces a byte‑identical result and no
  spurious diffs;
- a consumer can read `CodeSystem.version` to see exactly which SKS edition a
  snapshot came from.

Pass `--sks-version` / `--supplement-version` only if you want to override the
revision date with a custom label.

### Scope and usage

The Danish Core Immunization profile is intended to represent an **administered** vaccination, as sourced from Det Danske Vaccinationsregister (DDV). Authoritative DDV XML schemas are published at [wiki.fmk-teknik.dk/fmk:ddv:extensions:e1](https://wiki.fmk-teknik.dk/fmk:ddv:extensions:e1) with target namespace `http://vaccinationsregister.dk/schemas/2013/12/01` (interface 1.4.0 + extension E1). Service delivery is described at [nspop.dk](https://www.nspop.dk/pages/releaseview.action?pageId=31798109).

#### Two DDV concepts: Vaccinations vs PlannedVaccinations

DDV exposes two overarching data types, fetched via separate services:

- **Vaccinations** (`getVaccinationCard`) — administered/effectuated vaccinations. This is what the Danish Core Immunization profile represents. Only `Vaccinations` expose **historical** data via the interface; history is controlled internally in DDV's database with `ValidFrom`/`ValidTo` dates, and `VersionID` is used internally for optimistic locking on updates.
- **PlannedVaccinations** (`getPlannedVaccinations`) — recommended/planned vaccinations. Historical entries for `PlannedVaccinations` **cannot** be fetched via the interface.

A consequence is that a citizen who has **declined or omitted** a planned/recommended vaccination leaves no trace in DDV `Vaccinations` (a refusal is never recorded there), and because `PlannedVaccinations` history is not retrievable, the refusal cannot be inferred either. Therefore the FHIR fields **`status = not-done` / `statusReason` cannot be derived from DDV** — see the status section below.

A DDV `Vaccination` carries a numeric `VaccinationIdentifier` (with `VaccinationVersionIdentifier` as a revision/optimistic-locking token, carried in `meta.versionId`), a structured `Vaccine` element (`VaccineIdentifier` + `VaccineName` + `Disease[]` + `ATC` + optional `SSIDrug[]` and keyword metadata), an optional `Effectuated` structure (date, effectuator name, authorisation and organisation), an optional `EffectuatedPlannedItem` (course/series context), `CoverageDuration`, `BatchNumber`, `ActiveStatus`, `NegativeConsentIndicator` (citizen private-marking — **not** a refusal), `VaccinationCredibility` (a credibility enum), and flags such as `IsPrevious` and `ConfirmedByPrescriptionServer`.

In dk-core the `patient` element has been constrained to [DkCorePatient](StructureDefinition-dk-core-patient.html) and `performer.actor` to the Danish core profiles for Practitioner, PractitionerRole or Organization. When the DDV effectuator is available only as free text (e.g. "Danske Lægers Vaccinations Service"), it should be carried as `performer.actor.display`.

#### Mapping from DDV

| DDV field | FHIR target |
| --- | --- |
| `Vaccination.VaccinationIdentifier` | `identifier[DdvVaccinationId]` (`http://vaccinationsregister.dk/schemas/2013/12/01/VaccinationIdentifier`) |
| `Vaccination.VaccinationVersionIdentifier` | `meta.versionId` — revision/optimistic-locking token; aligns with FHIR's `_history` versioning |
| `Vaccination.Vaccine.VaccineIdentifier` | `vaccineCode.coding[DdvVaccine]` (`http://vaccinationsregister.dk/schemas/2013/12/01/VaccineIdentifier`) |
| `Vaccination.Vaccine.VaccineName` | `vaccineCode.text` |
| `Vaccination.Vaccine.ATC.Code` / `ATC.Text` | `vaccineCode.coding[ATC]` (`http://www.whocc.no/atc`) — typically J07* |
| `Vaccination.Vaccine.Disease[]` | `protocolApplied.targetDisease` (with `DiseaseIdentifier` / `DiseaseName` / `DiseaseNameDK` / `ATC` as children) |
| `Vaccination.EffectuatedDateTime` / `Vaccination.Effectuated.EffectuatedDateTime` | `occurrenceDateTime` |
| `Vaccination.Created.CreatedDateTime` | `recorded` (fall back to `EffectuatedDateTime` when the record has no distinct `Created` element) |
| `Vaccination.Effectuated.EffectuatedByName` (≤200 char free text) | `performer.actor.display` |
| `Vaccination.Effectuated.AuthorisationIdentifier` | `performer.actor` → `Reference(DkCorePractitioner)` when resolvable |
| `Vaccination.Effectuated.EffectuatedByOrganisationName` / `Number` / `Type` | `performer.actor` → `Reference(DkCoreOrganization)` when resolvable; free-text fallback via `actor.display` |
| `Vaccination.BatchNumber` | `lotNumber` |
| `Vaccination.EffectuatedPlannedItem` | `protocolApplied` (vaccination course/series context, when the effectuation is part of a planned course) |
| `Vaccination.CoverageDuration` | `note` (free text, e.g. "CoverageDuration: 1 year") |
| `Vaccination.VaccinationCredibility` | `note` (e.g. "VaccinationCredibility: Oprettet af borger"). Credibility/origin of the record. |
| `Vaccination.ActiveStatus = true` (Status=A) | `status = #completed` (a registered DDV Vaccination is always effectuated) |
| `Vaccination.ActiveStatus = false` (Status=D, deleted) | `status = #entered-in-error` |
| `Vaccination.NegativeConsentIndicator = true` | `meta.security = `[`v3-Confidentiality#R`](http://terminology.hl7.org/CodeSystem/v3-Confidentiality)` (Restricted)` — citizen private-marking, **not** a status change. See section below. |
| `Vaccination.IsPrevious = true` | `note` (effectuation done at another time/place/person, e.g. abroad or pre-mandate) |
| `Vaccination.ConfirmedByPrescriptionServer` | `note` (historical data-quality marker; mirrored by `VaccinationCredibility`) |

#### Status semantics

A registered DDV `Vaccination` is **always** an administered/effectuated vaccination. `ActiveStatus` is **not** a clinical status — it is only used to indicate deletion: a `Vaccination` may exist in several versions with `Status=A` (Active), and when it is deleted the latest version gets `Status=D` (Deleted). The mapping is therefore:

- `ActiveStatus = true` (Status=A) → `status = #completed`. This is the normal value.
- `ActiveStatus = false` (Status=D, deleted) → `status = #entered-in-error`. Records whose `VaccinationCredibility` is `Slettet` ("deleted") likewise map here.

`status = #not-done` and `statusReason` are **not derivable from DDV** and are not used by this profile. A citizen who declines or omits a planned/recommended vaccination leaves no `Vaccination` record (refusals are never written to `Vaccinations`), and `PlannedVaccinations` history is not retrievable via the interface, so the refusal cannot be inferred. Consumers must not infer a refusal from the absence of a record.

#### Private-marking (NegativeConsentIndicator)

`NegativeConsentIndicator = true` is **not** a refusal and does **not** change `status` — the vaccination is still effectuated on equal footing with every other registration. The flag indicates that the citizen has chosen to **private-mark** the specific vaccination: it must not be made visible unless the responsible health professional invokes *værdispring* (break-glass) or holds the citizen's consent.

This is modelled the same way dk-core marks confidential data on [DkCorePatient](StructureDefinition-dk-core-patient.html): a security label

```
meta.security = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#R   // "Restricted"
```

Systems consuming dk-core Immunization resources must treat a `#R` (Restricted) security label as a private-mark and suppress the resource from normal display, releasing it only under *værdispring* or consent.

#### IsPrevious, ConfirmedByPrescriptionServer and credibility

- **`IsPrevious = true`** indicates that the actual effectuation happened at a different time, place and/or by a different person than the one performing the registration — e.g. vaccinations received abroad or before registration in DDV became legally required. Such previous vaccinations may be created by health professionals as well as by the citizen themselves; this is reflected in `VaccinationCredibility`.
- **`ConfirmedByPrescriptionServer`** has only historical interest and primarily reflects the data quality of the registration. Comparable information can be read from `VaccinationCredibility`.
- **`EffectuatedPlannedItem`** carries course/series context when the effectuation was part of a planned vaccination course; map to `protocolApplied`.

Many of the non-mandatory data elements inherited from the generic profile do exist in DDV, but remain optional here and will only be populated in certain cases.

#### Vaccine coding

DDV delivers the vaccine as a structured `Vaccine` element with a free-text `VaccineName`, an SSI `VaccineIdentifier`, an ATC code (typically J07*), a list of target diseases (each with its own ATC coding), and optional SSI-defined drugs (`SSIDrug`). The profile accommodates this via three coding slices on `vaccineCode` (`ATC`, `SCTVaccineCode`, `DdvVaccine`) with the free-text name in `vaccineCode.text`. A SNOMED CT coding MAY be added where known.

#### Identifier namespace note

Earlier drafts of this profile used `https://www.sundhed.dk/vaccination/...` URLs deduced from the sundhed.dk JSON proxy. Those URLs are not registered anywhere and have been replaced with URIs rooted at the authoritative DDV XML schema namespace (`http://vaccinationsregister.dk/schemas/2013/12/01`). Consumers proxying DDV via sundhed.dk should normalise their identifier systems to these authoritative URIs when producing dk-core resources.

### Scope and usage

The Danish Core Immunization profile is intended to represent an administered or refused vaccination, as sourced from Det Danske Vaccinationsregister (DDV). Authoritative DDV XML schemas are published at [wiki.fmk-teknik.dk/fmk:ddv:extensions:e1](https://wiki.fmk-teknik.dk/fmk:ddv:extensions:e1) with target namespace `http://vaccinationsregister.dk/schemas/2013/12/01` (interface 1.4.0 + extension E1). Service delivery is described at [nspop.dk](https://www.nspop.dk/pages/releaseview.action?pageId=31798109).

A DDV `Vaccination` carries a numeric `VaccinationIdentifier` (paired with `VaccinationVersionIdentifier` for revision tracking), a structured `Vaccine` element (`VaccineIdentifier` + `VaccineName` + `Disease[]` + `ATC` + optional `SSIDrug[]` and keyword metadata), an optional `Effectuated` structure (date, effectuator name, authorisation and organisation), `CoverageDuration`, `BatchNumber`, `ActiveStatus`, `NegativeConsentIndicator`, `VaccinationCredibility` (a credibility enum), and flags such as `IsPrevious` and `ConfirmedByPrescriptionServer`.

In dk-core the `patient` element has been constrained to [DkCorePatient](StructureDefinition-dk-core-patient.html) and `performer.actor` to the Danish core profiles for Practitioner, PractitionerRole or Organization. When the DDV effectuator is available only as free text (e.g. "Danske Lægers Vaccinations Service"), it should be carried as `performer.actor.display`.

#### Mapping from DDV

| DDV field | FHIR target |
| --- | --- |
| `Vaccination.VaccinationIdentifier` | `identifier[DdvVaccinationId]` (`http://vaccinationsregister.dk/schemas/2013/12/01/VaccinationIdentifier`) |
| `Vaccination.VaccinationVersionIdentifier` | `identifier[DdvVaccinationVersion]` (`http://vaccinationsregister.dk/schemas/2013/12/01/VaccinationVersionIdentifier`) — populate when pointing to a specific revision |
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
| `Vaccination.CoverageDuration` | `note` (free text, e.g. "CoverageDuration: 1 year") |
| `Vaccination.VaccinationCredibility` | `note` (e.g. "VaccinationCredibility: Oprettet af borger"). See status section. |
| `Vaccination.ActiveStatus = true` | `status = #completed` |
| `Vaccination.ActiveStatus = false` | `status = #not-done` |
| `Vaccination.NegativeConsentIndicator = true` | `status = #not-done` (takes precedence over `ActiveStatus`) |
| `Vaccination.IsPrevious = true` | `note` (history entry marker) |
| `Vaccination.ConfirmedByPrescriptionServer` | `note` (pharmacy-confirmed marker) |

#### Status semantics

DDV does not expose the full set of FHIR `Immunization.status` values. The mapping collapses DDV's boolean flags as follows:

- `NegativeConsentIndicator = true` → `status = #not-done` (regardless of `ActiveStatus`).
- `ActiveStatus = true` → `status = #completed`.
- `ActiveStatus = false` → `status = #not-done`.
- Unknown / missing → omit `status` (the resource will fail the base cardinality check; ensure one of the flags is known before producing the resource).

`entered-in-error` may be used for DDV records whose `VaccinationCredibility` is `Slettet` ("deleted").

#### Vaccine coding

DDV delivers the vaccine as a structured `Vaccine` element with a free-text `VaccineName`, an SSI `VaccineIdentifier`, an ATC code (typically J07*), a list of target diseases (each with its own ATC coding), and optional SSI-defined drugs (`SSIDrug`). The profile accommodates this via three coding slices on `vaccineCode` (`ATC`, `SCTVaccineCode`, `DdvVaccine`) with the free-text name in `vaccineCode.text`. A SNOMED CT coding MAY be added where known.

#### Identifier namespace note

Earlier drafts of this profile used `https://www.sundhed.dk/vaccination/...` URLs deduced from the sundhed.dk JSON proxy. Those URLs are not registered anywhere and have been replaced with URIs rooted at the authoritative DDV XML schema namespace (`http://vaccinationsregister.dk/schemas/2013/12/01`). Consumers proxying DDV via sundhed.dk should normalise their identifier systems to these authoritative URIs when producing dk-core resources.

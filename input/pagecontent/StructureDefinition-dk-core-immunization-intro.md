### Scope and usage

The Danish Core Immunization profile is intended to represent an administered or refused vaccination, as sourced from Det Danske Vaccinationsregister (DDV) via the sundhed.dk vaccination API. Source documentation for the DDV service: [nspop.dk - DDV](https://www.nspop.dk/pages/releaseview.action?pageId=31798109).

A DDV vaccination record carries a numeric `VaccinationIdentifier`, a free-text `Vaccine` name, an effectuator, an effectuation date/time, and a set of flags (`ActiveStatus`, `NegativeConsent`, `SelfCreated`, `IsEditable`) plus an optional `CoverageDuration`. In dk-core the `patient` element has been constrained to [DkCorePatient](StructureDefinition-dk-core-patient.html) and `performer.actor` to the Danish core profiles for Practitioner, PractitionerRole or Organization. When the DDV effectuator is available only as free text (e.g. "Danske Lægers Vaccinations Service"), it should be carried as `performer.actor.display`.

#### Mapping from DDV

| DDV field | FHIR target |
| --- | --- |
| `VaccinationIdentifier` | `identifier[DdvVaccinationId]` (`https://www.sundhed.dk/vaccination/id`) |
| `Vaccine` | `vaccineCode.text` (ATC or SNOMED CT coding MAY also be supplied via `vaccineCode.coding[ATC]` / `vaccineCode.coding[SCTVaccineCode]`) |
| `EffectuatedDateTime` | `occurrenceDateTime` and, when no distinct registration timestamp is available, `recorded` |
| `EffectuatedBy` | `performer.actor` (or `performer.actor.display` when only a free-text name is known) |
| `ActiveStatus = true` | `status = #completed` |
| `ActiveStatus = false` | `status = #not-done` |
| `NegativeConsent = true` | `status = #not-done` (takes precedence over `ActiveStatus`) |
| `CoverageDuration` | `note` (free text, e.g. "Coverage duration: 1 year") |
| `SelfCreated = true` | `note` (free text, e.g. "Recorded as self-created") |
| `NegativeConsent = true` | `note` (free text, e.g. "Negative consent recorded") |
| DDV vaccination history entries | `note` (free text, listing prior entry dates/ids) |

#### Status semantics

DDV does not expose the full set of FHIR `Immunization.status` values. The mapping collapses DDV's boolean flags as follows:

- `NegativeConsent = true` → `status = #not-done` (regardless of `ActiveStatus`).
- `ActiveStatus = true` → `status = #completed`.
- `ActiveStatus = false` → `status = #not-done`.
- Unknown / missing → omit `status` (the resource will fail the base cardinality check; ensure one of the flags is known before producing the resource).

#### Vaccine coding

DDV typically returns the vaccine product name as free text in the `Vaccine` field. Implementations MAY supplement this with an ATC coding from the J07 group, or with a SNOMED CT coding where known. The free-text form is preserved in `vaccineCode.text` so no information is lost.

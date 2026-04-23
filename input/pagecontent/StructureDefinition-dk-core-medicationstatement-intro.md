### Scope and usage

The Danish Core MedicationStatement profile is intended to represent a statement about a medication that a patient is taking (or has taken), as sourced from the Danish Shared Medication Record (Fælles Medicinkort, FMK). Source documentation for FMK: [wiki.fmk-teknik.dk](https://wiki.fmk-teknik.dk/start).

A MedicationStatement is the natural FHIR representation of the FMK "medicinkort"/"aktuelt medicinbillede" — the authoritative list of medicines the patient is currently taking. Where a [DkCoreMedicationRequest](StructureDefinition-dk-core-medicationrequest.html) is the order that a prescriber issues, a DkCoreMedicationStatement is the snapshot of what is actually on the patient's medication card at a point in time.

In dk-core, the MedicationStatement has been constrained so that `subject` refers to a [DkCorePatient](StructureDefinition-dk-core-patient.html) and `informationSource` refers to the Danish core profiles for Practitioner, PractitionerRole, Organization, Patient or RelatedPerson.

The profile claims conformance to [MedicationStatement (EU core)](https://build.fhir.org/ig/hl7-eu/base/StructureDefinition-medicationStatement-eu-core.html) via an `imposeProfile` extension — any instance valid against DkCoreMedicationStatement must also be valid against the EU Core profile.

#### Mapping from FMK

| FMK field | FHIR target |
| --- | --- |
| `DrugMedication.OrdinationIdentifier` | `identifier[FmkOrdinationId]` (`https://www.sundhed.dk/medicinkort/ordination`) |
| `DrugMedication.DrugMedicationIdentifier` | `identifier[FmkDrugMedicationId]` (`https://www.sundhed.dk/medicinkort/drug-medication`) |
| `DrugMedication.AtcCode` / `AtcText` | `medicationCodeableConcept.coding[ATC]` (`http://www.whocc.no/atc`) or via `medicationReference` to a [DkCoreMedication](StructureDefinition-dk-core-medication.html) |
| `DrugMedication.ActiveSubstance` | `medicationCodeableConcept.coding[ActiveSubstance]` |
| `DrugMedication` (name/form/strength) | `medicationCodeableConcept.text` or the referenced DkCoreMedication |
| `Treatment.Cause` | `reasonCode.text` |
| `Treatment.StartDate` / `Treatment.EndDate` | `effectivePeriod.start` / `effectivePeriod.end` |
| `Dosage.Text` | `dosage.text` |
| `Treatment.Administration` | `dosage.route` (free-text allowed) |
| Snapshot timestamp (the time the card was retrieved) | `dateAsserted` |
| `HasNegativeConsent = true` | `status = #stopped` plus `extension[adherence]` with an appropriate `stopped` / `not-taking` code |
| `MedicationCardStatus.EnumStr` | `status` (active / completed / stopped / entered-in-error / unknown) |

Consumers of this profile should be aware that a MedicationStatement derived from an FMK medication card is, by design, a *view* on the current state of one or more ordinations rather than an authoritative clinical assertion. When populating `dateAsserted`, use the timestamp of the FMK retrieval, not the ordination date.

#### Extensions in use
The profile brings forward the R5 `adherence` extension from the HL7 Europe Base profile. FMK's `HasNegativeConsent` flag and card-level status should be surfaced as adherence codes where possible; the coarse `status = stopped` value remains but loses nuance compared to adherence codes such as `stopped`, `not-taking`, `on-hold`.

#### Effective[x]
`effective[x]` is restricted to either `effectiveDateTime` (point-in-time) or `effectivePeriod` (typical for FMK). Prefer `effectivePeriod` when an end date is known, or when the start date is known and the medication is ongoing.

#### Relationship to DkCoreMedicationRequest
When both resources are available (for example when proxying both `OrdinationDetails` and a medication card entry), the two resources MAY share identifiers so that a consumer can correlate a MedicationStatement with the MedicationRequest that it is derived from.

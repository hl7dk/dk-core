### Scope and usage

The Danish Core MedicationStatement profile is intended to represent a statement about a medication that a patient is taking (or has taken), as sourced from the Danish Shared Medication Record (Fælles Medicinkort, FMK). Source documentation for FMK: [wiki.fmk-teknik.dk](https://wiki.fmk-teknik.dk/fmk:extensions:e5) (XML schemas in namespace `http://www.dkma.dk/medicinecard/xml.schema/2015/06/01`).

A MedicationStatement is the natural FHIR representation of the FMK "medicinkort"/"aktuelt medicinbillede" — the authoritative list of medicines the patient is currently taking, materialised from the `DrugMedication` entries on the `MedicineCard`. Where a [DkCoreMedicationRequest](StructureDefinition-dk-core-medicationrequest.html) is the order that a prescriber issues, a DkCoreMedicationStatement is the snapshot of what is actually on the patient's medicinkort at a point in time.

In dk-core, the MedicationStatement has been constrained so that `subject` refers to a [DkCorePatient](StructureDefinition-dk-core-patient.html) and `informationSource` refers to the Danish core profiles for Practitioner, PractitionerRole, Organization, Patient or RelatedPerson.

The profile claims conformance to [MedicationStatement (EU core)](https://build.fhir.org/ig/hl7-eu/base/StructureDefinition-medicationStatement-eu-core.html) via an `imposeProfile` extension — any instance valid against DkCoreMedicationStatement must also be valid against the EU Core profile.

#### Mapping from FMK

| FMK field | FHIR target |
| --- | --- |
| `DrugMedication.Identifier` | `identifier[FmkDrugMedicationId]` (`http://www.dkma.dk/medicinecard/xml.schema/2015/06/01/DrugMedicationIdentifier`) |
| `DrugMedication.Version` | `identifier[FmkDrugMedicationVersion]` (`http://www.dkma.dk/medicinecard/xml.schema/2015/06/01/DrugMedicationVersion`) — populate alongside the Identifier when pointing to a specific revision |
| `DrugMedication.Drug.ATC.Code` / `ATC.Text` | `medicationCodeableConcept.coding[ATC]` (`http://www.whocc.no/atc`) or via `medicationReference` to a [DkCoreMedication](StructureDefinition-dk-core-medication.html) |
| `DrugMedication.Drug.Substances.ActiveSubstance` | `medicationCodeableConcept.coding[ActiveSubstance]` (source: `Medicinpriser` / `Local` / `Magistrel`) |
| `DrugMedication.Drug.Name` (with Form/Strength) | `medicationCodeableConcept.text` or the referenced DkCoreMedication |
| `DrugMedication.Indication` (Code + Text, or FreeText) | `reasonCode` |
| `DrugMedication.BeginEndDate.TreatmentStartDate` / `TreatmentEndDate` | `effectivePeriod.start` / `effectivePeriod.end` |
| `DrugMedication.Dosage` | `dosage.text` |
| `DrugMedication.RouteOfAdministration` (Code + Text) | `dosage.route` |
| MedicineCard retrieval timestamp | `dateAsserted` |
| `DrugMedication.Withdrawn` element present (seponeret) | `status = #stopped` plus `extension[adherence]` with an appropriate `stopped` / `not-taking` code |
| `DrugMedication.Paused` element present | `status = #on-hold` plus `extension[adherence]` with `on-hold` |

Consumers of this profile should be aware that a MedicationStatement derived from the FMK medicinkort is, by design, a *view* on the current state of one or more `DrugMedication` entries rather than an authoritative clinical assertion. When populating `dateAsserted`, use the timestamp of the FMK retrieval, not the ordination date.

#### Extensions in use
The profile brings forward the R5 `adherence` extension from the HL7 Europe Base profile. FMK's `Withdrawn` / `Paused` elements and card-level status should be surfaced as adherence codes where possible; the coarse `status` value remains but loses nuance compared to adherence codes such as `stopped`, `not-taking`, `on-hold`.

#### Effective[x]
`effective[x]` is restricted to either `effectiveDateTime` (point-in-time) or `effectivePeriod` (typical for FMK). Prefer `effectivePeriod` when an end date is known, or when the start date is known and the medication is ongoing. FMK alternatives `TreatmentStartedPreviously` and `TreatmentEndingUndetermined` are represented by the absence of an explicit start/end in the period.

#### Relationship to DkCoreMedicationRequest
When both resources are available (for example when proxying both an ordination detail view and a medicinkort entry), the two resources MAY share the `FmkDrugMedicationId` identifier so that a consumer can correlate a MedicationStatement with the MedicationRequest that it is derived from.

### Scope and usage

The Danish Core MedicationRequest profile is intended to represent a single medication order (ordination), in particular as sourced from the Danish Shared Medication Record (Fælles Medicinkort, FMK). Source documentation for FMK: [wiki.fmk-teknik.dk](https://wiki.fmk-teknik.dk/start).

In dk-core, the MedicationRequest has been constrained so that `subject` refers to a [DkCorePatient](StructureDefinition-dk-core-patient.html), and `requester` / `recorder` / `performer` refer to the Danish core profiles for Practitioner, PractitionerRole, Organization, Patient or RelatedPerson.

The profile claims conformance to [MedicationRequest (EU core)](https://build.fhir.org/ig/hl7-eu/base/StructureDefinition-medicationRequest-eu-core.html) via an `imposeProfile` extension — any instance valid against DkCoreMedicationRequest must also be valid against the EU Core profile.

#### Mapping from FMK
An FMK ordination carries two identifiers that are both useful for tracing a MedicationRequest back to its source:

* **OrdinationIdentifier** — stable identifier for the ordination itself, across versions. Mapped to `identifier` slice `FmkOrdinationId` with system `https://www.sundhed.dk/medicinkort/ordination`.
* **DrugMedicationIdentifier** — identifier for a specific version of the lægemiddelordination. Mapped to `identifier` slice `FmkDrugMedicationId` with system `https://www.sundhed.dk/medicinkort/drug-medication`.

The medicinal product can be represented in two ways:

* As an inline `medicationCodeableConcept` (preferred for simple, self-contained FMK mappings), sliced on `coding.system` for:
  * **ATC** (`http://www.whocc.no/atc`) from `DrugMedication.AtcCode` / `AtcText`.
  * **Active substance** (`https://www.sundhed.dk/medicinkort/active-substance`) from `DrugMedication.ActiveSubstance`.
  * A free-text product name in `medicationCodeableConcept.text`.
* As a `medicationReference` to a [DkCoreMedication](StructureDefinition-dk-core-medication.html) — useful when form, strength, ingredients or manufacturer need structured representation.

FMK treatment and dosage fields map as follows:

| FMK field | FHIR target |
| --- | --- |
| `Treatment.Cause` | `reasonCode.text` (or `reasonReference` when a coded condition is known) |
| `Treatment.StartDate` | `authoredOn` and `extension[effectiveDosePeriod].valuePeriod.start` |
| `Treatment.EndDate` | `extension[effectiveDosePeriod].valuePeriod.end` |
| `Treatment.Administration` | `dosageInstruction.route` (free-text allowed) |
| `Dosage.Text` | `dosageInstruction.text` and/or `extension[renderedDosageInstruction].valueMarkdown` |
| `HasNegativeConsent = true` | `status = #stopped` |
| `CreatedBy` | `requester` (display / reference) |
| `IsDoseDispensing = true` with a total quantity | `dispenseRequest.quantity` (and, when IHE Pharmacy MPD becomes an R4 dependency, the `prescribedQuantity` extension) |

Systems that proxy FMK should populate both identifier slices when possible so the resource can be cross-referenced back to the underlying ordination and lægemiddelordination.

#### Extensions in use
The profile brings forward three extensions from the HL7 Europe Base profile, all of which are already forward-compatible with FHIR R5:

* **`effectiveDosePeriod`** (R5 back-port) — records the period over which the medication is to be taken. Natural home for FMK's `Treatment.StartDate` / `Treatment.EndDate`.
* **`renderedDosageInstruction`** (R5 back-port) — carries the full human-rendered dosage instruction in Markdown. Natural home for FMK's `Dosage.Text`.
* **IHE Pharmacy `prescribedQuantity`** — not currently wired in as a slice because the IHE MPD package is R5-based and not yet an R4 dependency of this IG. Implementers may add it as an ad-hoc extension on `dispenseRequest` when needed for FMK dose-dispensing flows.

#### Status and intent
FMK ordinations are typically modelled with `intent = order`. Active ordinations use `status = active`; ordinations that have been stopped (seponeret) in FMK (`HasNegativeConsent = true`) use `status = stopped`. Historical/completed treatments use `status = completed`.

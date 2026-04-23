### Scope and usage

The Danish Core MedicationRequest profile is intended to represent a single medication order (lægemiddelordination), in particular as sourced from the Danish Shared Medication Record (Fælles Medicinkort, FMK). Source documentation for FMK: [wiki.fmk-teknik.dk](https://wiki.fmk-teknik.dk/fmk:extensions:e5) (XML schemas in namespace `http://www.dkma.dk/medicinecard/xml.schema/2015/06/01`).

In dk-core, the MedicationRequest has been constrained so that `subject` refers to a [DkCorePatient](StructureDefinition-dk-core-patient.html), and `requester` / `recorder` / `performer` refer to the Danish core profiles for Practitioner, PractitionerRole, Organization, Patient or RelatedPerson.

The profile claims conformance to [MedicationRequest (EU core)](https://build.fhir.org/ig/hl7-eu/base/StructureDefinition-medicationRequest-eu-core.html) via an `imposeProfile` extension — any instance valid against DkCoreMedicationRequest must also be valid against the EU Core profile.

#### Mapping from FMK

An FMK `DrugMedication` (lægemiddelordination) on the medicinkort is uniquely identified by a `DrugMedicationIdentifier` (a positive long). A specific revision is identified by the pair `(Identifier, Version)`; there is no separate "ordination" identifier on top of that.

* **DrugMedicationIdentifier** — mapped to `identifier` slice `FmkDrugMedicationId` with system `http://www.dkma.dk/medicinecard/xml.schema/2015/06/01/DrugMedicationIdentifier`.
* **DrugMedication.Version** — mapped to `identifier` slice `FmkDrugMedicationVersion` with system `http://www.dkma.dk/medicinecard/xml.schema/2015/06/01/DrugMedicationVersion`. Populate alongside the DrugMedicationIdentifier when pointing to a specific revision.

The medicinal product can be represented in two ways:

* As an inline `medicationCodeableConcept` (preferred for simple, self-contained FMK mappings), sliced on `coding.system` for:
  * **ATC** (`http://www.whocc.no/atc`) from `DrugMedication.Drug.ATC.Code` / `ATC.Text`.
  * **Active substance** (`http://www.dkma.dk/medicinecard/xml.schema/2015/06/01/ActiveSubstance`) from `DrugMedication.Drug.Substances.ActiveSubstance`. The FMK `source` attribute may be `Medicinpriser`, `Local` or `Magistrel`.
  * A free-text product name in `medicationCodeableConcept.text`.
* As a `medicationReference` to a [DkCoreMedication](StructureDefinition-dk-core-medication.html) — useful when form, strength, ingredients or manufacturer need structured representation.

FMK indication, treatment-period and dosage fields map as follows:

| FMK field | FHIR target |
| --- | --- |
| `DrugMedication.Indication` (Code + Text, or FreeText) | `reasonCode` (coded or free text), or `reasonReference` when a coded condition is known |
| `DrugMedication.BeginEndDate.TreatmentStartDate` | `authoredOn` and `extension[effectiveDosePeriod].valuePeriod.start` |
| `DrugMedication.BeginEndDate.TreatmentEndDate` | `extension[effectiveDosePeriod].valuePeriod.end` |
| `DrugMedication.BeginEndDate.TreatmentStartedPreviously` / `TreatmentEndingUndetermined` | Represented by the absence of an explicit start/end in `effectiveDosePeriod.valuePeriod` |
| `DrugMedication.RouteOfAdministration` (Code + Text) | `dosageInstruction.route` |
| `DrugMedication.Dosage` | `dosageInstruction.text` and/or `extension[renderedDosageInstruction].valueMarkdown` |
| `DrugMedication.Withdrawn` element present (seponeret) | `status = #stopped` |
| `DrugMedication.Paused` element present | `status = #on-hold` |
| `DrugMedication.Created.By` / `DrugMedication.ReportedBy` (E5) | `requester` (display / reference) |
| `DrugMedication.Dosage` with a total quantity for dose dispensing | `dispenseRequest.quantity` (and, when IHE Pharmacy MPD becomes an R4 dependency, the `prescribedQuantity` extension) |

#### Extensions in use
The profile brings forward three extensions from the HL7 Europe Base profile, all of which are already forward-compatible with FHIR R5:

* **`effectiveDosePeriod`** (R5 back-port) — records the period over which the medication is to be taken. Natural home for FMK's `DrugMedication.BeginEndDate.TreatmentStartDate` / `TreatmentEndDate`.
* **`renderedDosageInstruction`** (R5 back-port) — carries the full human-rendered dosage instruction in Markdown. Natural home for FMK's `DrugMedication.Dosage`.
* **IHE Pharmacy `prescribedQuantity`** — not currently wired in as a slice because the IHE MPD package is R5-based and not yet an R4 dependency of this IG. Implementers may add it as an ad-hoc extension on `dispenseRequest` when needed for FMK dose-dispensing flows.

#### Status and intent
FMK ordinations are typically modelled with `intent = order`. Active ordinations use `status = active`; ordinations with a `DrugMedication.Paused` element use `status = on-hold`; ordinations that have been stopped (`DrugMedication.Withdrawn` element set) use `status = stopped`. Historical/completed treatments use `status = completed`.

#### E5-specific considerations
FMK extension E5 introduces a handful of capabilities worth noting for implementers:

* **`DrugMedication.ReportedBy`** — identifies who reported the medication (distinct from who authored it). Use this where the prescriber differs from the original source, for example when a pharmacy or another clinician reports a medication seen outside of FMK. In FHIR the prescriber maps to `requester`; `ReportedBy` can be surfaced in `requester.display` or via the `reported[x]` field of MedicationRequest.
* **Prescriptions without a CPR** (`CreatePrescriptionWithoutCPR_2015_06_01_E2`) and **for use in practice** (`CreatePrescriptionForUseInPractice_2015_06_01_E2`) — these E5 operations create ordinations that are not tied to a specific person. For the first, `subject` may reference a placeholder Patient resource with an `X-eCPR` / `MedicineCardKey` PersonIdentifier source; for the second, `subject` references an organisational Patient representing the practice itself. In both cases consumers should be prepared for `subject.reference` to not resolve to a standard CPR-based patient.
* **Explicit dose dispensing** (`GetExplicitDoseDispensingCard_2015_06_01_E3`) — the separate DoseDispensingCard view carries per-period dispensed doses. When representing a single MedicationRequest sourced from an ordination attached to a DoseDispensingPeriod, `dispenseRequest.quantity` is appropriate for the period's total dispensed quantity; full period-by-period history is outside the scope of this profile.

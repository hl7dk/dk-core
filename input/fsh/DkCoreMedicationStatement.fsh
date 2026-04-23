Profile: DkCoreMedicationStatement
Parent: MedicationStatement
Id: dk-core-medicationstatement
Title: "Danish Core MedicationStatement Profile"
Description: "HL7 Denmark core profile for a statement about medication being taken by a patient, aligned with the Danish Shared Medication Record (Fælles Medicinkort, FMK) and the HL7 Europe Base MedicationStatement profile. Intended to represent the current, authoritative medication card snapshot (aktuelt medicinbillede)."
* ^status = #active
* ^extension[+].url = $imposeProfile
* ^extension[=].valueCanonical = $eu-medicationStatement
* extension contains
    $ms-adherence named adherence 0..1
* extension[adherence] ^short = "R5 back-port: whether the medication is being taken / refused / stopped. In FMK, presence of DrugMedication.Withdrawn (seponering) or DrugMedication.Paused should be surfaced here with an appropriate adherence code in addition to (or instead of) status."
* identifier ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
  * ^slicing.ordered = false
  * ^slicing.description = "Slice identifier by system to carry the FMK DrugMedicationIdentifier."
* identifier contains
    FmkDrugMedicationId 0..1 and
    FmkDrugMedicationVersion 0..1
* identifier[FmkDrugMedicationId] ^short = "[DA] FMK DrugMedicationIdentifier (positiv long)."
  * system 1..
  * system = $FmkDrugMedicationId (exactly)
  * value 1..
* identifier[FmkDrugMedicationVersion] ^short = "[DA] FMK DrugMedication.Version - pairs with FmkDrugMedicationId to identify a specific revision of the lægemiddelordination on the medicinkort."
  * system 1..
  * system = $FmkDrugMedicationVersion (exactly)
  * value 1..
* status ^short = "Status of the medication card entry. `active` = aktiv på medicinkortet; `on-hold` = Paused; `stopped` = seponeret (DrugMedication.Withdrawn er sat); `completed` = afsluttet behandling."
* medication[x] only CodeableConcept or Reference(DkCoreMedication)
* medicationCodeableConcept.coding ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
  * ^slicing.ordered = false
  * ^slicing.description = "Slice medication.coding by system to accommodate the terminologies FMK uses for a drug"
* medicationCodeableConcept.coding contains
    ATC 0..1 and
    ActiveSubstance 0..1
* medicationCodeableConcept.coding[ATC]
  * ^short = "WHO ATC code. In FMK: DrugMedication.Drug.ATC (Code + Text)."
  * system 1..
  * system = $atc (exactly)
  * code 1..
* medicationCodeableConcept.coding[ActiveSubstance]
  * ^short = "[DA] Aktivt stof. In FMK: DrugMedication.Drug.Substances.ActiveSubstance."
  * system 1..
  * system = $FmkActiveSubstance (exactly)
  * code 1..
* subject only Reference(DkCorePatient)
* subject 1..
* informationSource only Reference(DkCorePractitioner or DkCorePractitionerRole or DkCoreOrganization or DkCorePatient or DkCoreRelatedPerson)
* reasonReference only Reference(DkCoreCondition or DkCoreObservation)
* reasonCode ^short = "Indikation / årsag. In FMK: DrugMedication.Indication (Code + Text, or FreeText)."
* effective[x] only dateTime or Period
* effective[x] ^short = "When the medication is/was being taken. Prefer effectivePeriod when both start and end (or open-ended start) are known - maps to FMK DrugMedication.BeginEndDate.TreatmentStartDate / TreatmentEndDate. Use effectiveDateTime only for point-in-time statements."
* dateAsserted ^short = "Tidspunkt hvor udsagnet om medicineringen blev indført. Typisk hentningstidspunktet for medicinkortet."
* dosage ^short = "Dosering. In FMK: DrugMedication.Dosage; DrugMedication.RouteOfAdministration (Code + Text) maps to dosage.route."


Mapping: DkCoreMedicationStatementToFmk
Source: DkCoreMedicationStatement
Target: "https://wiki.fmk-teknik.dk/fmk:extensions:e5"
Title: "Fælles Medicinkort (FMK)"
Id: dk-core-medicationstatement-fmk
* -> "MedicineCard.DrugMedication" "**Snapshot of a lægemiddelordination on the FMK medicinkort (aktuelt medicinbillede).**"
* identifier[FmkDrugMedicationId] -> "DrugMedication.Identifier" "DrugMedicationIdentifier - unique id of the lægemiddelordination."
* identifier[FmkDrugMedicationVersion] -> "DrugMedication.Version" "Revision number, carried alongside the identifier when a specific version of the ordination is being referenced."
* status -> "DrugMedication.Withdrawn / DrugMedication.Paused" "`active` = neither Withdrawn nor Paused; `on-hold` = Paused element present; `stopped` = Withdrawn element present (seponeret) - SHOULD be supplemented via the adherence extension; `completed` = behandlingsperiode afsluttet; `entered-in-error` / `unknown` as per FHIR."
* medicationCodeableConcept.coding[ATC] -> "DrugMedication.Drug.ATC.Code / ATC.Text" "WHO ATC code for the drug."
* medicationCodeableConcept.coding[ActiveSubstance] -> "DrugMedication.Drug.Substances.ActiveSubstance" "Active-substance coding (source: Medicinpriser / Local / Magistrel)."
* medicationCodeableConcept.text -> "DrugMedication.Drug.Name (+ Form/Strength)" "Free-text rendering of the drug name, form and strength."
* subject -> "MedicineCard.Patient" "FMK patient reference."
* effective[x] -> "DrugMedication.BeginEndDate.TreatmentStartDate / TreatmentEndDate" "Prefer `effectivePeriod` when start and/or end are known; use `effectiveDateTime` for point-in-time statements. FMK also supports `TreatmentStartedPreviously` and `TreatmentEndingUndetermined`."
* dateAsserted -> "MedicineCard retrieval timestamp" "Timestamp of the FMK medicinkort retrieval (NOT the ordination date). In FMK, see GetMedicineCardResponse."
* reasonCode -> "DrugMedication.Indication" "Indikation / årsag (Code + Text, or FreeText)."
* dosage.text -> "DrugMedication.Dosage" "Human-rendered dosage."
* dosage.route -> "DrugMedication.RouteOfAdministration" "Administration route (Code + Text)."
* extension[adherence] -> "DrugMedication.Withdrawn / Paused" "R5 adherence code (e.g. `stopped`, `not-taking`, `on-hold`) for richer semantics than `status` alone."


Instance: JohnMedicationStatementSimvastatin
InstanceOf: DkCoreMedicationStatement
Title: "John's aktive Simvastatin på medicinkortet"
Description: "Example DkCoreMedicationStatement derived from the current FMK medicinkort for Simvastatin."
Usage: #example
* identifier[FmkDrugMedicationId].system = $FmkDrugMedicationId
* identifier[FmkDrugMedicationId].value = "987654321"
* status = #active
* medicationCodeableConcept.coding[ATC] = $atc#C10AA01 "Simvastatin"
* medicationCodeableConcept.coding[ActiveSubstance].system = $FmkActiveSubstance
* medicationCodeableConcept.coding[ActiveSubstance].code = #simvastatin
* medicationCodeableConcept.coding[ActiveSubstance].display = "Simvastatin"
* medicationCodeableConcept.text = "Simvastatin \"Actavis\" filmovertrukne tabletter 40 mg"
* subject = Reference(Patient/john)
* effectivePeriod.start = "2024-03-15"
* dateAsserted = "2026-04-20"
* reasonCode.text = "Hyperkolesterolæmi"
* dosage.text = "1 tablet dagligt til aftensmad"
* dosage.route = http://snomed.info/sct#26643006 "Oral route"


Instance: JohnMedicationStatementStopped
InstanceOf: DkCoreMedicationStatement
Title: "John's seponerede Metformin"
Description: "Example DkCoreMedicationStatement for a medication that has been stopped (seponeret i FMK, dvs. DrugMedication.Withdrawn er sat). Note: uses the adherence extension in addition to status = stopped to carry the richer R5 semantics."
Usage: #example
* identifier[FmkDrugMedicationId].system = $FmkDrugMedicationId
* identifier[FmkDrugMedicationId].value = "987654323"
* status = #stopped
* extension[adherence].extension[code].valueCodeableConcept.coding.system = "http://hl7.org/fhir/CodeSystem/medication-statement-adherence"
* extension[adherence].extension[code].valueCodeableConcept.coding.code = #stopped
* extension[adherence].extension[code].valueCodeableConcept.coding.display = "Stopped"
* medicationCodeableConcept.coding[ATC] = $atc#A10BA02 "Metformin"
* medicationCodeableConcept.text = "Metformin 500 mg"
* subject = Reference(Patient/john)
* effectivePeriod.start = "2022-05-01"
* effectivePeriod.end = "2023-11-01"
* dateAsserted = "2026-04-20"
* dosage.text = "2 tabletter morgen og aften"

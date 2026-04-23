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
* extension[adherence] ^short = "R5 back-port: whether the medication is being taken / refused / stopped. In FMK: HasNegativeConsent = true should be surfaced here with an appropriate adherence code in addition to (or instead of) status = stopped."
* identifier ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
  * ^slicing.ordered = false
  * ^slicing.description = "Slice identifier by system to distinguish FMK OrdinationIdentifier and DrugMedicationIdentifier"
* identifier contains
    FmkOrdinationId 0..1 and
    FmkDrugMedicationId 0..1
* identifier[FmkOrdinationId] ^short = "[DA] FMK OrdinationIdentifier"
  * system 1..
  * system = $FmkOrdinationId (exactly)
  * value 1..
* identifier[FmkDrugMedicationId] ^short = "[DA] FMK DrugMedicationIdentifier"
  * system 1..
  * system = $FmkDrugMedicationId (exactly)
  * value 1..
* status ^short = "Status of the medication card entry. active = aktiv på medicinkortet; stopped = seponeret (HasNegativeConsent = true i FMK); completed = afsluttet behandling."
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
  * ^short = "WHO ATC code. In FMK: DrugMedication.AtcCode / AtcText."
  * system 1..
  * system = $atc (exactly)
  * code 1..
* medicationCodeableConcept.coding[ActiveSubstance]
  * ^short = "[DA] Aktivt stof. In FMK: DrugMedication.ActiveSubstance or MedicationCardEntry.ActiveSubstance."
  * system 1..
  * system = $FmkActiveSubstance (exactly)
  * code 1..
* subject only Reference(DkCorePatient)
* subject 1..
* informationSource only Reference(DkCorePractitioner or DkCorePractitionerRole or DkCoreOrganization or DkCorePatient or DkCoreRelatedPerson)
* reasonReference only Reference(DkCoreCondition or DkCoreObservation)
* reasonCode ^short = "Indikation / årsag. In FMK: Treatment.Cause."
* effective[x] only dateTime or Period
* effective[x] ^short = "When the medication is/was being taken. Prefer effectivePeriod when both start and end (or open-ended start) are known - maps to FMK Treatment.StartDate / Treatment.EndDate. Use effectiveDateTime only for point-in-time statements."
* dateAsserted ^short = "Tidspunkt hvor udsagnet om medicineringen blev indført. Typisk hentningstidspunktet for medicinkortet."
* dosage ^short = "Dosering. In FMK: Dosage.Text; Treatment.Administration (route) kan lægges i dosage.route eller dosage.patientInstruction."


Mapping: DkCoreMedicationStatementToFmk
Source: DkCoreMedicationStatement
Target: "https://wiki.fmk-teknik.dk/start"
Title: "Fælles Medicinkort (FMK)"
Id: dk-core-medicationstatement-fmk
* -> "MedicationCard entry" "**Snapshot of a drug on the FMK medication card (aktuelt medicinbillede).**"
* identifier[FmkOrdinationId] -> "DrugMedication.OrdinationIdentifier" "Identifier of an FMK ordination."
* identifier[FmkDrugMedicationId] -> "DrugMedication.DrugMedicationIdentifier" "Identifier of a specific version of the drug medication."
* status -> "MedicationCardStatus.EnumStr / HasNegativeConsent" "`active` / `completed` / `stopped` / `entered-in-error` / `unknown`. `HasNegativeConsent = true` maps to `stopped` and SHOULD be supplemented via the adherence extension."
* medicationCodeableConcept.coding[ATC] -> "DrugMedication.AtcCode / AtcText" "WHO ATC code for the drug."
* medicationCodeableConcept.coding[ActiveSubstance] -> "DrugMedication.ActiveSubstance" "Active-substance coding."
* medicationCodeableConcept.text -> "DrugMedication (name/form/strength)" "Free-text rendering of the drug name, form and strength."
* subject -> "Patient" "FMK patient reference."
* effective[x] -> "Treatment.StartDate / Treatment.EndDate" "Prefer `effectivePeriod` when start and/or end are known; use `effectiveDateTime` for point-in-time statements."
* dateAsserted -> "Snapshot timestamp" "Timestamp of the FMK medication-card retrieval (NOT the ordination date)."
* reasonCode -> "Treatment.Cause" "Indikation / årsag."
* dosage.text -> "Dosage.Text" "Human-rendered dosage."
* dosage.route -> "Treatment.Administration" "Administration route (may be free text)."
* extension[adherence] -> "HasNegativeConsent" "R5 adherence code (e.g. `stopped`, `not-taking`, `on-hold`) for richer semantics than `status = stopped` alone."


Instance: JohnMedicationStatementSimvastatin
InstanceOf: DkCoreMedicationStatement
Title: "John's aktive Simvastatin på medicinkortet"
Description: "Example DkCoreMedicationStatement derived from the current FMK medication card for Simvastatin."
Usage: #example
* identifier[FmkOrdinationId].system = $FmkOrdinationId
* identifier[FmkOrdinationId].value = "123456789"
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
Description: "Example DkCoreMedicationStatement for a medication that has been stopped (seponeret). Note: uses the adherence extension in addition to status = stopped to carry the richer R5 semantics."
Usage: #example
* identifier[FmkOrdinationId].system = $FmkOrdinationId
* identifier[FmkOrdinationId].value = "987654321"
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

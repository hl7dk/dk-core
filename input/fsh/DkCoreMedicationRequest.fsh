Profile: DkCoreMedicationRequest
Parent: MedicationRequest
Id: dk-core-medicationrequest
Title: "Danish Core MedicationRequest Profile"
Description: "HL7 Denmark core profile for medication orders (ordinationer), aligned with the Danish Shared Medication Record (Fælles Medicinkort, FMK) and the HL7 Europe Base MedicationRequest profile."
* ^status = #active
* ^extension[+].url = $imposeProfile
* ^extension[=].valueCanonical = $eu-medicationRequest
* extension contains
    $mr-effectiveDosePeriod named effectiveDosePeriod 0..1 and
    $mr-renderedDosageInstruction named renderedDosageInstruction 0..1
* extension[effectiveDosePeriod] ^short = "R5 back-port: period over which the medication is to be taken. In FMK: Treatment.StartDate / Treatment.EndDate."
* extension[renderedDosageInstruction] ^short = "R5 back-port: full human-rendered dosage instruction. In FMK: Dosage.Text."
* identifier ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
  * ^slicing.ordered = false
  * ^slicing.description = "Slice identifier by system to distinguish FMK OrdinationIdentifier and DrugMedicationIdentifier"
* identifier contains
    FmkOrdinationId 0..1 and
    FmkDrugMedicationId 0..1
* identifier[FmkOrdinationId] ^short = "[DA] FMK OrdinationIdentifier - identificerer en ordination på det fælles medicinkort"
  * system 1..
  * system = $FmkOrdinationId (exactly)
  * value 1..
* identifier[FmkDrugMedicationId] ^short = "[DA] FMK DrugMedicationIdentifier - identificerer en lægemiddelordination (specifik version af ordinationen)"
  * system 1..
  * system = $FmkDrugMedicationId (exactly)
  * value 1..
* status ^short = "Status for ordinationen. Active = aktiv på medicinkortet; stopped = seponeret / HasNegativeConsent = true i FMK."
* intent ^short = "FMK ordinationer modelleres typisk som intent = order."
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
  * ^short = "WHO ATC code for the ordinated drug. In FMK: DrugMedication.AtcCode / AtcText."
  * system 1..
  * system = $atc (exactly)
  * code 1..
* medicationCodeableConcept.coding[ActiveSubstance]
  * ^short = "[DA] Aktivt stof for ordinationen. In FMK: DrugMedication.ActiveSubstance."
  * system 1..
  * system = $FmkActiveSubstance (exactly)
  * code 1..
* subject only Reference(DkCorePatient)
* subject 1..
* requester only Reference(DkCorePractitioner or DkCorePractitionerRole or DkCoreOrganization or DkCorePatient or DkCoreRelatedPerson or Device)
* recorder only Reference(DkCorePractitioner or DkCorePractitionerRole)
* performer only Reference(DkCorePractitioner or DkCorePractitionerRole or DkCoreOrganization or DkCorePatient or DkCoreRelatedPerson or Device or CareTeam)
* reasonReference only Reference(DkCoreCondition or DkCoreObservation)
* reasonCode ^short = "Indikation / årsag for ordinationen. In FMK: Treatment.Cause."
* dosageInstruction ^short = "Dosering. In FMK: Dosage.Text (free text, prefer the renderedDosageInstruction extension for full FMK text) and/or Treatment.Administration (route)."
* dispenseRequest.performer only Reference(DkCoreOrganization)


Mapping: DkCoreMedicationRequestToFmk
Source: DkCoreMedicationRequest
Target: "https://wiki.fmk-teknik.dk/start"
Title: "Fælles Medicinkort (FMK)"
Id: dk-core-medicationrequest-fmk
* -> "Ordination" "**FMK drug order (ordination).**"
* identifier[FmkOrdinationId] -> "DrugMedication.OrdinationIdentifier" "Identifier of an FMK ordination."
* identifier[FmkDrugMedicationId] -> "DrugMedication.DrugMedicationIdentifier" "Identifier of a specific version of the drug medication."
* status -> "MedicationCardStatus.EnumStr / HasNegativeConsent" "`active` / `stopped` / `completed`. `HasNegativeConsent = true` maps to `stopped`."
* intent -> "Ordination type" "FMK ordinations are typically modelled as `intent = order`."
* medicationCodeableConcept.coding[ATC] -> "DrugMedication.AtcCode / AtcText" "WHO ATC code."
* medicationCodeableConcept.coding[ActiveSubstance] -> "DrugMedication.ActiveSubstance" "Active-substance coding."
* medicationCodeableConcept.text -> "DrugMedication (name/form/strength)" "Free-text rendering of the drug name, form and strength."
* subject -> "Patient" "FMK patient reference."
* authoredOn -> "Ordination date" "When the ordination was authored."
* requester -> "Ordinerende behandler" "Prescriber."
* reasonCode -> "Treatment.Cause" "Indikation / årsag."
* dosageInstruction.text -> "Dosage.Text" "Human-rendered dosage."
* dosageInstruction.route -> "Treatment.Administration" "Administration route."
* extension[effectiveDosePeriod] -> "Treatment.StartDate / Treatment.EndDate" "R5 back-port: period over which the medication is to be taken."
* extension[renderedDosageInstruction] -> "Dosage.Text" "R5 back-port: full human-rendered dosage string."


Instance: JohnMedicationRequestSimvastatin
InstanceOf: DkCoreMedicationRequest
Title: "John's Simvastatin ordination"
Description: "Example of a DkCoreMedicationRequest derived from an FMK ordination for Simvastatin 40 mg."
Usage: #example
* identifier[FmkOrdinationId].system = $FmkOrdinationId
* identifier[FmkOrdinationId].value = "123456789"
* identifier[FmkDrugMedicationId].system = $FmkDrugMedicationId
* identifier[FmkDrugMedicationId].value = "DM-987654321"
* status = #active
* intent = #order
* medicationCodeableConcept.coding[ATC] = $atc#C10AA01 "Simvastatin"
* medicationCodeableConcept.coding[ActiveSubstance].system = $FmkActiveSubstance
* medicationCodeableConcept.coding[ActiveSubstance].code = #simvastatin
* medicationCodeableConcept.coding[ActiveSubstance].display = "Simvastatin"
* medicationCodeableConcept.text = "Simvastatin \"Actavis\" filmovertrukne tabletter 40 mg"
* subject = Reference(Patient/john)
* authoredOn = "2024-03-15"
* requester = Reference(Practitioner/AbrahamLaege)
* reasonCode.text = "Hyperkolesterolæmi"
* dosageInstruction
  * text = "1 tablet dagligt til aftensmad"
  * route = http://snomed.info/sct#26643006 "Oral route"
* extension[effectiveDosePeriod].valuePeriod.start = "2024-03-15"
* extension[renderedDosageInstruction].valueMarkdown = "1 tablet (40 mg) dagligt til aftensmad, til kontrol"


Instance: JohnMedicationRequestWithMedicationRef
InstanceOf: DkCoreMedicationRequest
Title: "John's Simvastatin ordination (with Medication reference)"
Description: "Example using Reference(DkCoreMedication) rather than inline CodeableConcept, demonstrating the EU-compatible path."
Usage: #example
* identifier[FmkOrdinationId].system = $FmkOrdinationId
* identifier[FmkOrdinationId].value = "123456790"
* status = #active
* intent = #order
* medicationReference = Reference(Medication/SimvastatinActavis40mg)
* subject = Reference(Patient/john)
* authoredOn = "2024-03-15"
* requester = Reference(Practitioner/AbrahamLaege)
* dosageInstruction.text = "1 tablet dagligt til aftensmad"


Instance: JohnMedicationRequestStopped
InstanceOf: DkCoreMedicationRequest
Title: "John's seponerede Metformin ordination"
Description: "Example of a DkCoreMedicationRequest that has been stopped (seponeret) in FMK (HasNegativeConsent = true)."
Usage: #example
* identifier[FmkOrdinationId].system = $FmkOrdinationId
* identifier[FmkOrdinationId].value = "987654321"
* status = #stopped
* intent = #order
* medicationCodeableConcept.coding[ATC] = $atc#A10BA02 "Metformin"
* medicationCodeableConcept.text = "Metformin 500 mg"
* subject = Reference(Patient/john)
* authoredOn = "2023-11-01"
* requester = Reference(Practitioner/AbrahamLaege)
* dosageInstruction.text = "2 tabletter morgen og aften"

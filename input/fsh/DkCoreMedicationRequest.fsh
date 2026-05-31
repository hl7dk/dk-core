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
* extension[effectiveDosePeriod] ^short = "R5 back-port: period over which the medication is to be taken. In FMK: DrugMedication.BeginEndDate.TreatmentStartDate / TreatmentEndDate."
* extension[renderedDosageInstruction] ^short = "R5 back-port: full human-rendered dosage instruction. In FMK: Dosage.Text."
* identifier ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
  * ^slicing.ordered = false
  * ^slicing.description = "Slice identifier by system to carry the FMK DrugMedicationIdentifier."
* identifier contains
    FmkDrugMedicationId 0..1 and
    FmkDrugMedicationVersion 0..1
* identifier[FmkDrugMedicationId] ^short = "[DA] FMK DrugMedicationIdentifier - unik identifikation af lægemiddelordinationen (positiv long)."
  * system 1..
  * system = $FmkDrugMedicationId (exactly)
  * value 1..
* identifier[FmkDrugMedicationVersion] ^short = "[DA] FMK DrugMedication.Version - pairs with FmkDrugMedicationId to identify a specific revision of the lægemiddelordination."
  * system 1..
  * system = $FmkDrugMedicationVersion (exactly)
  * value 1..
* status ^short = "Status for ordinationen. `active` = aktiv på medicinkortet; `stopped` = seponeret (DrugMedication.Withdrawn er sat); `on-hold` = pauseret (DrugMedication.Paused er sat); `completed` = afsluttet behandling."
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
  * ^short = "WHO ATC code for the ordinated drug. In FMK: DrugMedication.Drug.ATC (Code + Text)."
  * system 1..
  * system = $atc (exactly)
  * code 1..
* medicationCodeableConcept.coding[ActiveSubstance]
  * ^short = "[DA] Aktivt stof for ordinationen. In FMK: DrugMedication.Drug.Substances.ActiveSubstance."
  * system 1..
  * system = $FmkActiveSubstance (exactly)
  * code 1..
* subject only Reference(DkCorePatient)
* subject 1..
* requester only Reference(DkCorePractitioner or DkCorePractitionerRole or DkCoreOrganization or DkCorePatient or DkCoreRelatedPerson or Device)
* recorder only Reference(DkCorePractitioner or DkCorePractitionerRole)
* performer only Reference(DkCorePractitioner or DkCorePractitionerRole or DkCoreOrganization or DkCorePatient or DkCoreRelatedPerson or Device or CareTeam)
* reasonReference only Reference(DkCoreCondition or DkCoreObservation)
* reasonCode ^short = "Indikation / årsag for ordinationen. In FMK: DrugMedication.Indication (Code + Text, or FreeText)."
* dosageInstruction ^short = "Dosering. In FMK: DrugMedication.Dosage (prefer the renderedDosageInstruction extension for the full FMK dosage text) and DrugMedication.RouteOfAdministration (Code + Text) for the route."
* dispenseRequest.performer only Reference(DkCoreOrganization)


Mapping: DkCoreMedicationRequestToFmk
Source: DkCoreMedicationRequest
Target: "https://wiki.fmk-teknik.dk/fmk:extensions:e5"
Title: "Fælles Medicinkort (FMK)"
Id: dk-core-medicationrequest-fmk
* -> "DrugMedication" "**FMK lægemiddelordination (DrugMedication on the medicine card).**"
* identifier[FmkDrugMedicationId] -> "DrugMedication.Identifier" "DrugMedicationIdentifier - unique id of the lægemiddelordination."
* identifier[FmkDrugMedicationVersion] -> "DrugMedication.Version" "Revision number, carried alongside the identifier when a specific version of the ordination is being referenced."
* status -> "DrugMedication.Withdrawn / DrugMedication.Paused" "`active` = neither Withdrawn nor Paused; `stopped` = Withdrawn element present (seponeret); `on-hold` = Paused element present; `completed` = behandlingsperiode afsluttet."
* intent -> "Ordination" "FMK ordinations are typically modelled as `intent = order`."
* medicationCodeableConcept.coding[ATC] -> "DrugMedication.Drug.ATC.Code / ATC.Text" "WHO ATC code."
* medicationCodeableConcept.coding[ActiveSubstance] -> "DrugMedication.Drug.Substances.ActiveSubstance" "Active-substance coding (source: Medicinpriser / Local / Magistrel)."
* medicationCodeableConcept.text -> "DrugMedication.Drug.Name (+ Form/Strength)" "Free-text rendering of the drug name, form and strength."
* subject -> "DrugMedication (context patient)" "FMK patient reference (the MedicineCard.Patient that owns the DrugMedication)."
* authoredOn -> "DrugMedication.Created / DrugMedication.BeginEndDate.CreatedDateTime" "When the ordination was authored."
* requester -> "DrugMedication.Created.By / DrugMedication.ReportedBy" "Ordinerende behandler (prescriber). `ReportedBy` is the E5 addition."
* reasonCode -> "DrugMedication.Indication" "Indikation / årsag (Code + Text, or FreeText)."
* dosageInstruction.text -> "DrugMedication.Dosage" "Human-rendered dosage."
* dosageInstruction.route -> "DrugMedication.RouteOfAdministration" "Administration route (Code + Text)."
* extension[effectiveDosePeriod] -> "DrugMedication.BeginEndDate.TreatmentStartDate / TreatmentEndDate" "R5 back-port: treatment period. FMK also supports `TreatmentStartedPreviously` and `TreatmentEndingUndetermined` as alternatives to concrete dates."
* extension[renderedDosageInstruction] -> "DrugMedication.Dosage" "R5 back-port: full human-rendered dosage string."


Instance: JohnMedicationRequestSimvastatin
InstanceOf: DkCoreMedicationRequest
Title: "John's Simvastatin ordination"
Description: "Example of a DkCoreMedicationRequest derived from an FMK lægemiddelordination for Simvastatin 40 mg."
Usage: #example
* identifier[FmkDrugMedicationId].system = $FmkDrugMedicationId
* identifier[FmkDrugMedicationId].value = "987654321"
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
* identifier[FmkDrugMedicationId].system = $FmkDrugMedicationId
* identifier[FmkDrugMedicationId].value = "987654322"
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
Description: "Example of a DkCoreMedicationRequest that has been stopped (seponeret) in FMK (the DrugMedication.Withdrawn element is set)."
Usage: #example
* identifier[FmkDrugMedicationId].system = $FmkDrugMedicationId
* identifier[FmkDrugMedicationId].value = "987654323"
* status = #stopped
* intent = #order
* medicationCodeableConcept.coding[ATC] = $atc#A10BA02 "Metformin"
* medicationCodeableConcept.text = "Metformin 500 mg"
* subject = Reference(Patient/john)
* authoredOn = "2023-11-01"
* requester = Reference(Practitioner/AbrahamLaege)
* dosageInstruction.text = "2 tabletter morgen og aften"

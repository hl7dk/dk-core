Profile: DkCoreMedication
Parent: Medication
Id: dk-core-medication
Title: "Danish Core Medication Profile"
Description: "HL7 Denmark core profile for a medicinal product, aligned with the Danish Shared Medication Record (Fælles Medicinkort, FMK). Used where richer structured data about a drug is needed than fits in an inline CodeableConcept on MedicationRequest / MedicationStatement."
* ^status = #active
* code.coding ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
  * ^slicing.ordered = false
  * ^slicing.description = "Slice code.coding by system to accommodate the terminologies FMK uses for a drug"
* code.coding contains
    ATC 0..1 and
    ActiveSubstance 0..1
* code.coding[ATC]
  * ^short = "WHO ATC code. In FMK: DrugMedication.AtcCode / AtcText."
  * system 1..
  * system = $atc (exactly)
  * code 1..
* code.coding[ActiveSubstance]
  * ^short = "[DA] Aktivt stof. In FMK: DrugMedication.ActiveSubstance."
  * system 1..
  * system = $FmkActiveSubstance (exactly)
  * code 1..
* form ^short = "[DA] Lægemiddelform. In FMK: DrugMedication.Form (may be free text)."
* ingredient.strength ^short = "[DA] Styrke. In FMK: DrugMedication.Strength (may be free text until structured data is available)."
* manufacturer only Reference(DkCoreOrganization)


Instance: SimvastatinActavis40mg
InstanceOf: DkCoreMedication
Title: "Simvastatin \"Actavis\" 40 mg filmovertrukne tabletter"
Description: "Example DkCoreMedication for a named Simvastatin product, as it might be drawn from FMK's DrugMedication."
Usage: #example
* code.coding[ATC] = $atc#C10AA01 "Simvastatin"
* code.coding[ActiveSubstance].system = $FmkActiveSubstance
* code.coding[ActiveSubstance].code = #simvastatin
* code.coding[ActiveSubstance].display = "Simvastatin"
* code.text = "Simvastatin \"Actavis\" filmovertrukne tabletter 40 mg"
* status = #active
* form.text = "filmovertrukne tabletter"
* ingredient.itemCodeableConcept.coding = $FmkActiveSubstance#simvastatin "Simvastatin"
* ingredient.strength.numerator = 40 'mg' "mg"
* ingredient.strength.denominator = 1 '{tablet}' "tablet"

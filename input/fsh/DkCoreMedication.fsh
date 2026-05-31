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
    ActiveSubstance 0..1 and
    Varenummer 0..1
* code.coding[ATC]
  * ^short = "WHO ATC code. In FMK: DrugMedication.Drug.ATC (Code + Text)."
  * system 1..
  * system = $atc (exactly)
  * code 1..
* code.coding[ActiveSubstance]
  * ^short = "[DA] Aktivt stof. In FMK: DrugMedication.Drug.Substances.ActiveSubstance."
  * system 1..
  * system = $FmkActiveSubstance (exactly)
  * code 1..
* code.coding[Varenummer]
  * ^short = "[DA] Varenummer fra Medicinpriser (LMS01 felt 1, 11-cifret). In FMK: DrugMedication.Drug.Identifier (source = Medicinpriser / Local / Magistrel / Stærke vitaminer m.v. / Tilknyttede behandlinger)."
  * system 1..
  * system = $FmkDrugId (exactly)
  * code 1..
* form ^short = "[DA] Lægemiddelform. In FMK: DrugMedication.Drug.Form (Code + Text)."
* ingredient.strength ^short = "[DA] Styrke. In FMK: DrugMedication.Drug.Strength (Value + UnitCode + UnitText, or free text)."
* manufacturer only Reference(DkCoreOrganization)


Mapping: DkCoreMedicationToFmk
Source: DkCoreMedication
Target: "https://wiki.fmk-teknik.dk/fmk:extensions:e5"
Title: "Fælles Medicinkort (FMK)"
Id: dk-core-medication-fmk
* -> "DrugMedication.Drug" "**Named medicinal product within an FMK DrugMedication (lægemiddelordination).**"
* code.coding[ATC] -> "DrugMedication.Drug.ATC.Code / ATC.Text" "WHO ATC code."
* code.coding[ActiveSubstance] -> "DrugMedication.Drug.Substances.ActiveSubstance" "Active-substance coding (source: Medicinpriser / Local / Magistrel)."
* code.coding[Varenummer] -> "DrugMedication.Drug.Identifier" "Danish drug product number (varenummer, 11-digit, Medicinpriser)."
* code.text -> "DrugMedication.Drug.Name (+ Form/Strength)" "Free-text rendering of the drug name, form and strength."
* form -> "DrugMedication.Drug.Form" "Lægemiddelform (Code + Text)."
* ingredient.strength -> "DrugMedication.Drug.Strength" "Styrke (Value + UnitCode + UnitText, or free text)."
* manufacturer -> "DrugMedication.Drug (manufacturer)" "Organisation reference for the drug manufacturer."


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

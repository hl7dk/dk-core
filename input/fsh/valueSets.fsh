ValueSet: DkCoreProfessionGroupValueSet
Id: DkCoreProfessionGroupValueSet
Title: "DK Profession Group"
Description: "DK Profession Group codes"
* ^experimental = false
* ^status = #active
* include codes from system DkCoreProfessionGroupCodes

ValueSet: MunicipalityCodes
Id: dk-core-MunicipalityCodes
Title: "DK Municipality Codes"
Description: "Municipality codes used in Denmark"
* ^experimental = false
* include codes from system MunicipalityCodes
* include codes from system GreenlandMunicipalityCodes

ValueSet: RegionalSubdivisionCodes
Id: dk-core-RegionalSubDivisionCodes
Title: "DK Regional Subdivision Codes"
Description: "Subdivision codes (Regional codes) used in Denmark"
* ^experimental = false
* include codes from system DKCoreRegionalSubdivisionCodes

ValueSet: LoincVitalSigns
Id: dk-core-LoincVitalSigns
Title: "DK Core Vital Signs"
Description: "LOINC codes describing vital signs."
* ^experimental = false
* $LOINC#9279-1 "Respiratory rate"
* $LOINC#8867-4 "Heart rate"
* $LOINC#2708-6 "Oxygen saturation in Arterial blood"
* $LOINC#8310-5 "Body temperature"
* $LOINC#8480-6 "Systolic blood pressure"
* $LOINC#8462-4 "Diastolic blood pressure"


ValueSet: TechniquesSCTCodes
Id: dk-core-TechniquesSCTCodes
Title: "DK TechniquesSCTCodes"
Description: "SNOMED CT Codes for the technique used when obtaining an observation"
* ^experimental = false
* $sct#761996005 "Estimation technique (qualifier value)"
* $sct#733985002 "Reported (qualifier value)"
* $sct#272391002 "Measurement technique (qualifier value)"

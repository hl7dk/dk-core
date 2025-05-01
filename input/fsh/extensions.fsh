Extension: ConditionLastAssertedDate
Id: ConditionLastAssertedDate
Title: "ConditionLastAssertedDate"
Description: "Extension for the last date a Condition-instance was confirmed valid in its current state. E.g. with its current clinical- and verification status, stage and severity. Typically the last performed follow-up"
* . ^short = "ConditionLastAssertedDate"
  * ^definition = "Extension for the last date a Condition-instance was confirmed valid in its current state. E.g. with its current clinical- and verification status, stage and severity. Typically the last performed follow-up"
* value[x] only dateTime
* ^context.type = http://hl7.org/fhir/extension-context-type#element
* ^context.expression = "Condition"

Extension: NotFollowedAnymore
Id: NotFollowedAnymore
Title: "NotFollowedAnymore"
Description: "Extension for the date where a condition lost focus in a specific clinical context"
* . ^short = "NotFollowedAnymore"
  * ^definition = "Extension for the date where a condition lost focus in a specific clinical context"
* value[x] only dateTime
* ^context.type = http://hl7.org/fhir/extension-context-type#element
* ^context.expression = "Condition"

Extension: RegionalSubDivisionCodes
Id: dk-core-RegionalSubDivisionCodes
Title: "Danish Core Regional Sub Division Codes Extension"
Description: "Identifier holding the official organization identifier for a danish region"
* ^context[0].type = #element
* ^context[=].expression = "Address"
* ^context[+].type = #element
* ^context[=].expression = "Patient.address"
* . ^short = "Danish Core Regional Sub Division Codes Extension"
  * ^definition = "Identifier holding the official organization identifier for a danish region"
* value[x] only CodeableConcept
  * coding from RegionalSubdivisionCodes (required)

Extension: MunicipalityCodes
Id: dk-core-municipalityCodes
Title: "Danish Core Municipality codes"
Description: "Identifier holding the official identifier for a danish municipality"
* ^context[0].type = #element
* ^context[=].expression = "Patient.address"
* ^context[+].type = #element
* ^context[=].expression = "Address"
* . ^short = "Danish Core Municipality codes"
  * ^definition = "Identifier holding the official identifier for a danish municipality"
* value[x] only CodeableConcept
  * coding from MunicipalityCodes (required)
  
Extension: PlannedStartDate
Id: dk-core-planned-start-date
Title: "PlannedStartDate"
* . ^short = "PlannedStartDate"
  * ^definition = "The planned start date/time (or admission date) of the encounter"
* value[x] only dateTime
* ^context.type = http://hl7.org/fhir/extension-context-type#element
* ^context.expression = "Encounter"

Extension: PlannedEndDate
Id: dk-core-planned-end-date
Title: "PlannedEndDate"
* . ^short = "PlannedEndDate"
  * ^definition = "The planned end date/time (or discharge date) of the encounter"
* value[x] only dateTime
* ^context.type = http://hl7.org/fhir/extension-context-type#element
* ^context.expression = "Encounter"

Extension: CareProvider
Id: dk-core-care-provider
Title: "CareProvider"
* . ^short = "CareProvider"
  * ^definition = "The organization (facility) reponsible for the care of the patient during this encounter"
* value[x] only Reference(DkCoreOrganization)
* ^context.type = http://hl7.org/fhir/extension-context-type#element
* ^context.expression = "Encounter"
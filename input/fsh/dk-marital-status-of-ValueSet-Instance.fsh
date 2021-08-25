Instance: dk-marital-status-of-ValueSet
InstanceOf: ValueSet
Title: "DK MaritalStatus"
Description: "This value set defines the set of codes that can be used to indicate the marital status of a person in Denmark."
Usage: #definition
* id = "dk-marital-status"
* url = "http://hl7.dk/fhir/core/ValueSet/dk-marital-status"
* version = "0.9.0"
* name = "DK Marital Status Codes"
* title = "DK MaritalStatus"
* status = #active
* experimental = false
* date = "2019-11-01T09:29:23+11:00"
* publisher = "HL7 Denmark"
* contact[0].name = "HL7 Denmark"
* contact[0].telecom[0].system = #url
* contact[0].telecom[0].value = "https://www.hl7.dk/"
* description = "This value set defines the set of codes that can be used to indicate the marital status of a person in Denmark."
* jurisdiction[0] = urn:iso:std:iso:3166#DK
* copyright = "CC-BY-SA-4.0"
* compose.include[0].valueSet[0] = "http://hl7.org/fhir/ValueSet/marital-status"
* compose.include[1].system = "http://hl7.dk/fhir/core/CodeSystem/dk-marital-status"
* compose.include[1].concept[0].code = #P
* compose.include[1].concept[0].display = "Registered partnership"
* compose.include[1].concept[0].designation[0].language = #da-DK
* compose.include[1].concept[0].designation[0].value = "Registreret partnerskab"
* compose.include[1].concept[1].code = #O
* compose.include[1].concept[1].display = "Dissolved partnership"
* compose.include[1].concept[1].designation[0].language = #da-DK
* compose.include[1].concept[1].designation[0].value = "Ophævet partnerskab"

Extension: RegionalSubDivisionCodes
Id: dk-core-RegionalSubDivisionCodes
Title: "Danish Core Regional Sub Division Codes Extension"
Description: "Identifier holding the official organization identifier for a danish region"
* ^version = "0.9.0"
* ^status = #draft
* ^date = "2021-03-14T16:56:07+01:00"
* ^publisher = "HL7 Denmark"
* ^contact[0].name = "HL7 Denmark"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "https://www.hl7.dk/"
* ^jurisdiction[0] = urn:iso:std:iso:3166#DK
* ^copyright = "CC-BY-SA-4.0"
* ^context[0].type = #element
* ^context[0].expression = "Address"
* ^context[1].type = #element
* ^context[1].expression = "Patient.address"
* value[x] only CodeableConcept
* value[x].coding from RegionalSubdivisionCodes (required)
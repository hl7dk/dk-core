Profile: Lpr3Identifier
Parent: Identifier
Id: lpr3-Identifier
Title: "LPR3 Identifier"
Description: "Identifier holding a LPR3 identifier for an organization"
* ^version = "0.9.0"
* ^status = #draft
* ^date = "2021-03-14T16:56:07+01:00"
* ^publisher = "HL7 Denmark"
* ^contact[0].name = "HL7 Denmark"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "https://www.hl7.dk/"
* ^jurisdiction[0] = urn:iso:std:iso:3166#DK
* ^copyright = "CC-BY-SA-4.0"
* system 1..
* system = "https://www.esundhed.dk/Registre/Landspatientsregisteret" (exactly)
* value 1..
* value obeys uuidv5
* value ^constraint[1].requirements = "LPR3 episode of care identifiers must conform to a UUIDv5"
* value ^constraint[1].source = "https://scandihealth.github.io/lpr3-docs/"
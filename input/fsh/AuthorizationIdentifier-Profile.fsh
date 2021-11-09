Profile: AuthorizationIdentifier
Parent: Identifier
Id: dk-core-authorization-identifier
Title: "Authorization Identifier"
Description: "Identifier holding the official authorization identifier for a practitioner"
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
* system = "https://autregweb.sst.dk" (exactly)
* value 1..
* value obeys authorization-id-format
* value ^maxLength = 5
* value ^constraint[1].source = "https://stps.dk/da/autorisation/om-autorisationer/autorisations-id/"
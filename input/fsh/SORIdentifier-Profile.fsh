Profile: SORIdentifier
Parent: Identifier
Id: dk-core-sor-identifier
Title: "SOR Identifier"
Description: "Identifier holding the official SOR identifier for a danish healthcare organization"
* ^version = "0.9.0"
* ^status = #draft
* ^date = "2021-03-14T16:56:07+01:00"
* ^publisher = "HL7 Denmark"
* ^contact[0].name = "HL7 Denmark"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "https://www.hl7.dk/"
* ^jurisdiction[0] = urn:iso:std:iso:3166#DK
* ^copyright = "CC-BY-SA-4.0"
* use = #official (exactly)
* system 1..
* system = "urn:oid:1.2.208.176.1.1" (exactly)
* value 1..
* value obeys min-digits-sor
* value ^constraint[1].requirements = "SOR Identifiers are at minimum 11 digits long"
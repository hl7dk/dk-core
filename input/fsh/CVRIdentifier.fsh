Profile: CVRIdentifier
Parent: Identifier
Id: dk-core-cvr-identifier
* ^status = #draft
* use = #official (exactly)
* system 1..
* system = "urn:oid:2.16.840.1.113883.2.24.1.1" (exactly)
* value 1..
* value obeys min-digits-sor
* value ^constraint[1].requirements = "SOR Identifiers are at minimum 15 digits long"
* value ^constraint[1].source = "http://hl7.dk/fhir/core/StructureDefinition/dk-core-sor-identifier"
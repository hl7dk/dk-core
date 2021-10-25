Profile: KombitStsOrgIdentifier
Parent: Identifier
Id: dk-core-kombit-sts-org-identifier
Description: "Identifier holding the organization code issued by KOMBIT"
* ^status = #draft
* use = #official (exactly)
* system 1..
* system = "https://www.kombit.dk/sts/organisation" (exactly)
* value 1..
* value obeys min-digits-sor
* value ^constraint[1].requirements = "SOR Identifiers are at minimum 15 digits long"
* value ^constraint[1].source = "http://hl7.dk/fhir/core/StructureDefinition/dk-core-sor-identifier"
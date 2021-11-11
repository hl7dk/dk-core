Profile: DkCoreCprIdentifier
Parent: Identifier
Id: dk-core-cpr-identifier
Title: "Danish Central Person Register (CPR) Identifier"
Description: "This structure holds the danish [CPR](https://cpr.dk/) identifier"
* ^version = "0.9.0"
* ^status = #draft
* ^date = "2019-11-02"
* ^publisher = "HL7 Denmark"
* ^contact[0].name = "HL7 Denmark"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "https://www.hl7.dk/"
* ^jurisdiction[0] = urn:iso:std:iso:3166#DK
* ^copyright = "CC-BY-SA-4.0"
* use = #official (exactly)
* system 1..
* system from $dk-core-cpr-identifier-system_1 (required)
* value 1..
* value obeys cpr
* value ^maxLength = 10
* value ^constraint[1].requirements = "Requirement of danish civil registration numbers"
* value ^constraint[1].source = "https://cpr.dk/cpr-systemet/opbygning-af-cpr-nummeret/#:~:text=5%20%2D%206%20position%20angiver%20personens,i%20personnummeret%20angiver%20personens%20k%C3%B8n."
* value ^mustSupport = false

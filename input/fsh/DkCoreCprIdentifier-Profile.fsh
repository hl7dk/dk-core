Profile: DkCoreCprIdentifier
Parent: Identifier
Id: dk-core-cpr-identifier
Title: "Danish Core Central Person Register Extension"
Description: "This structure holds the danish *Central Person Register* (CPR) identifier"
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
* type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203" (exactly)
* type.coding.code = #NNDNK (exactly)
* system 1..
* system = "urn:oid:1.2.208.176.1.2" (exactly)
* value 1..
* value obeys cpr
* value ^maxLength = 10
* value ^constraint[1].requirements = "Requirement of danish civil registration numbers"
* value ^constraint[1].source = "https://cpr.dk/cpr-systemet/opbygning-af-cpr-nummeret/#:~:text=5%20%2D%206%20position%20angiver%20personens,i%20personnummeret%20angiver%20personens%20k%C3%B8n."
* value ^mustSupport = false
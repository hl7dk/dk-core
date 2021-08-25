Profile: DkCorePractitioner
Parent: Practitioner
Id: dk-core-practitioner
Title: "Danish Core Practitioner Profile"
* ^contact[0].name = "HL7 Denmark"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "https://www.hl7.dk/"
* ^jurisdiction[0] = urn:iso:std:iso:3166#DK
* ^copyright = "CC-BY-SA-4.0"

* qualification.code from DkCoreProfessionGroupValueSet (extensible)

Instance:       HanneSocialraadgiver
InstanceOf:     DkCorePractitioner
Title:          "HanneSocialrådgiver"
Description:    "Eksempel på socialrådgiveren Hanne"
* name.given = "Hanne"
* name.family = "Mortensen"
* qualification.code.text = "Socialrådgiver"

Instance:       AbrahamLaege
InstanceOf:     DkCorePractitioner
Title:          "AbrahamLæge"
Description:    "Eksempel på lægen Abraham fra akutsygeplejen"
* name.given = "Abraham"
* name.family = "Murakami"
* qualification[0].identifier.value = "005ML"
* qualification[0].identifier.system = $authorisationIDSystem
* qualification[0].code = DkCoreProfessionGroupCodes#7170 "Læge"

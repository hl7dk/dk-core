Profile: DkCorePractitioner
Parent: Practitioner
Id: dk-core-practitioner
Title: "Danish Core Practitioner Profile"
* ^contact[0].name = "HL7 Denmark"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "https://www.hl7.dk/"
* ^jurisdiction[0] = urn:iso:std:iso:3166#DK
* ^copyright = "CC-BY-SA-4.0"

* qualification ^slicing.discriminator.type = #value
* qualification ^slicing.discriminator.path = "identifier.system"
* qualification ^slicing.rules = #open
* qualification ^slicing.ordered = false   // can be omitted, since false is the default
* qualification ^slicing.description = "Slice based on the identifier.systemm value which allows for official qualifications to
Declaring the slices, and their cardinalities, to allow a KL-code and a SNOMED CT code"
* qualification contains
   officialHealthAuthorization 0..1 

* qualification[officialHealthAuthorization].identifier.system = $authorisationIDSystem
* qualification[officialHealthAuthorization].identifier only AuthorizationIdentifier
* qualification[officialHealthAuthorization].code from DkCoreProfessionGroupValueSet (extensible)

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
* qualification[officialHealthAuthorization].identifier.value = "005ML"
* qualification[officialHealthAuthorization].identifier.system = $authorisationIDSystem
* qualification[officialHealthAuthorization].code = DkCoreProfessionGroupCodes#7170 "Læge"

Profile: DkCorePractitioner
Parent: Practitioner
Id: dk-core-practitioner
Title: "Danish Core Practitioner Profile"
Description: "HL7 Denmark core profile for health professionals and other actors relevant in citizen and patient pathways"
* qualification ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "identifier.system"
  * ^slicing.rules = #open
  * ^slicing.ordered = false
  * ^slicing.description = "Slice based on the identifier.systemm value which allows for official qualifications to\nDeclaring the slices, and their cardinalities, to allow a KL-code and a SNOMED CT code"
* qualification contains officialHealthAuthorization 0..*
* qualification[officialHealthAuthorization].identifier only AuthorizationIdentifier
  * ^short = "[DA] Autorisationskode, som specificeret af autorisationsregisteret"
* qualification[officialHealthAuthorization].code from DkCoreProfessionGroupValueSet (extensible)
  * ^short = "[DA] Kode for kvalifikation, som specificeret af autorisationsregisteret"

Instance: AbrahamLaege
InstanceOf: DkCorePractitioner
Title: "AbrahamLæge"
Description: "Eksempel på lægen Abraham fra akutsygeplejen"
Usage: #example
* qualification[0].identifier.system = "https://autregweb.sst.dk"
* qualification[=].identifier.value = "005ML"
* qualification[=].code = $DkCoreProfessionGroupCodes#7170
* qualification[+].identifier.system = "https://autregweb.sst.dk"
* qualification[=].identifier.value = "005M6"
* qualification[=].code = $DkCoreProfessionGroupCodes#5166

* name.given = "Abraham"
* name.family = "Murakami"
* name.text = "Abraham Murakami"

Instance: SidselSygeplejerske
InstanceOf: DkCorePractitioner
Title: "SidselSygeplejerske"
Description: "Eksempel på en sygeplejerske"
Usage: #example
* qualification.code = $DkCoreProfessionGroupCodes#5166 "Sygeplejerske"
* name.given = "Sidsel"
* name.family = "Andersen"
* name.text = "Sidsel Andersen"

Instance: HanneSocialraadgiver
InstanceOf: DkCorePractitioner
Title: "HanneSocialrådgiver"
Description: "Eksempel på socialrådgiveren Hanne"
Usage: #example
* name.given = "Hanne"
* name.family = "Mortensen"
* name.text = "Hanne Mortensen"
* qualification.code.text = "Socialrådgiver"
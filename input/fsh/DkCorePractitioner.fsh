Profile: DkCorePractitioner
Parent: IPAPractitioner
Id: dk-core-practitioner
Title: "Danish Core Practitioner Profile"
Description: "HL7 Denmark core profile for health professionals and other actors relevant in citizen and patient pathways"
* qualification ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "identifier.system"
  * ^slicing.rules = #open
  * ^slicing.ordered = false
  * ^slicing.description = "Slice based on the identifier.systemm value which allows for official qualifications to\nDeclaring the slices, and their cardinalities, to allow a KL-code and a SNOMED CT code"
* qualification contains officialHealthAuthorization 0..1
* qualification[officialHealthAuthorization].identifier only AuthorizationIdentifier
  * ^short = "[DA] Autorisationskode, som specificeret af autorisationsregisteret"
* qualification[officialHealthAuthorization].code from DkCoreProfessionGroupValueSet (extensible)
  * ^short = "[DA] Kode for kvalifikation, som specificeret af autorisationsregisteret"

Instance: AbrahamLaege
InstanceOf: DkCorePractitioner
Title: "AbrahamLæge"
Description: "Eksempel på lægen Abraham fra akutsygeplejen"
Usage: #example
* qualification.identifier.system = "https://autregweb.sst.dk"
* qualification.identifier.value = "005ML"
* qualification.code = $DkCoreProfessionGroupCodes#7170 "Læge"
* name.given = "Abraham"
* name.family = "Murakami"

Instance: SidselSygeplejerske
InstanceOf: DkCorePractitioner
Title: "SidselSygeplejerske"
Description: "Eksempel på en sygeplejerske"
Usage: #example
* qualification.code = $DkCoreProfessionGroupCodes#5166 "Sygeplejerske"
* name.given = "Sidsel"
* name.family = "Andersen"

Instance: HanneSocialraadgiver
InstanceOf: DkCorePractitioner
Title: "HanneSocialrådgiver"
Description: "Eksempel på socialrådgiveren Hanne"
Usage: #example
* name.given = "Hanne"
* name.family = "Mortensen"
* qualification.code.text = "Socialrådgiver"
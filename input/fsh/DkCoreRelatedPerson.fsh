Profile: DkCoreRelatedPerson
Parent: RelatedPerson
Id: dk-core-related-person
Title: "Danish Core Related Person Profile"
Description: "HL7 Denmark core profile for a related person"

// Allow CPR and eCPR numbers as identifiers
* identifier 0..
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
* identifier contains
    cpr 0..1 and
    x-ecpr 0..1 and
    d-ecpr 0..1
* identifier[cpr] only DkCoreCprIdentifier
  * ^short = "[DA] cpr-nummer, som det fremgår af CPR registeret"
* identifier[x-ecpr] only DkCoreXeCprIdentifier
  * ^short = "[DA] X-eCPR, tildelt fra den nationale eCPR service"
* identifier[d-ecpr] only DkCoreDeCprIdentifier
  * ^short = "[DA] D-eCPR, decentral eCPR"

* patient only Reference(DkCorePatient)

* name ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "use"
  * ^slicing.rules = #open
* name contains official 0..1
* name[official] ^short = "[DA] Officielt navn, som det fremgår af CPR registeret"
  * use 1..
  * use = #official (exactly)
  * family 1..

* relationship from RelatedPersonRelationshipValues (extensible)

Instance: Child
InstanceOf: DkCoreRelatedPerson
Title: "Example of child as related person"
Description: "Example of child as related person"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "2503984876"
* name.use = #official
* name.family = "Nilson"
* name.given = "Luna"
* gender = #female
* birthDate = "1998-03-25"
* patient.reference = "Patient/john"
* relationship = $v3-RoleCode#CHILD

Instance: TwoRelations
InstanceOf: DkCoreRelatedPerson
Title: "Example of a person with two relationships"
Description: "Example of person that both a friend and a primary caretaker"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "2310969861"
* name.use = #official
* name.family = "Kristensen"
* name.given = "Karl"
* gender = #male
* birthDate = "1996-10-23"
* patient.reference = "Patient/283"
* relationship[0] = $v3-RoleCode#FRND
* relationship[1] = DkRelatedPersonRelationshipCodes#PRICARE

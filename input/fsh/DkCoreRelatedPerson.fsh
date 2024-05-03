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

* relationship from RelatedPersonRelationshipTypes (extensible)

Instance: Child
InstanceOf: DkCoreRelatedPerson
Title: "Example of child as related person"
Description: "Example of child as related person"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "1502799995"
* name.use = #official
* name.family = "Mosebryggersen"
* name.given = "Odd Haugen Test"
* gender = #male
* birthDate = "1979-02-15"
* patient.reference = "Patient/283"
* relationship = $v3-RoleCode#CHILD

Instance: TwoRelations
InstanceOf: DkCoreRelatedPerson
Title: "Example of a related person with two relations"
Description: "Example of a person that has relations as both neighbor and primary caretaker"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0201919996"
* name.use = #official
* name.family = "Lauridsen"
* name.given = "Ellen Louise Test"
* gender = #female
* birthDate = "1991-01-02"
* patient.reference = "Patient/283"
* relationship[0] = $v3-RoleCode#NBOR
* relationship[1] = DkRelatedPersonRelationshipCodes#PRICARE

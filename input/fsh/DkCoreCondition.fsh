Profile: DkCoreCondition
Parent: Condition
Id: dk-core-condition
Title: "Danish Core Condition Profile"
Description:  "HL7 Denmark core profile for conditions, as specified by danish health and social care organizations"

//Slicing code, declaring disciminator, and slicing type
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding ^slicing.ordered = false   // can be omitted, since false is the default
* code.coding ^slicing.description = "Slice based on the code.system value which allow different code-systems to represent a condition"  // optional - does not appear
//Declaring the slices, and their cardinalities, to allow a KL-code and a SNOMED CT code
* code.coding contains
   FSIIIConditionCode 0..1 and SCTConditionCode 0..1 and FFBCodes 0..1 and SKS-D 0..1 and ICPC2codes 0..1

//Declaring the value set binding for the KLConditionCode slice, and setting the system.
//System is fixed to allow the slicing to work

* code.coding[FSIIIConditionCode].system = "urn:oid:1.2.208.176.2.21"

//Declaring the value set binding for the SCTConditionCode slice, and setting the system.
//System is fixed to allow the slicing to work (See Aliases for value set, and system info)
* code.coding[SCTConditionCode] from http://hl7.org/fhir/ValueSet/condition-code
* code.coding[SCTConditionCode].system = "http://snomed.info/sct" // eller 1.2.208.176.2.5


* code.coding[FFBCodes].system = "urn:oid:1.2.208.176.2.22"

* code.coding[SKS-D].system = "urn:oid:1.2.208.176.2.4.12" //eller (1.2.208.176.2.4)

* code.coding[ICPC2codes].system = "urn:oid:1.2.208.176.2.31"

* extension contains
   http://hl7.org/fhir/StructureDefinition/condition-dueTo named dueTo 0..1 and
   ConditionLastAssertedDate named conditionLastAssertedDate 0..1


Extension: ConditionLastAssertedDate
Title: "ConditionLastAssertedDate"
Description: "Extension for the last date a condition was confirmed valid with its current clinical- and verification status, stage and severity, typically the last performed follow-up"
* value[x] only dateTime


Instance: JohnDiabetes
InstanceOf: DkCoreCondition
Title: "John diabetes"
Description: "Johns diabetes-diagnose fra lægen Abraham"
Usage: #example
* code.coding[SKS-D].system = "urn:oid:1.2.208.176.2.4.12"
* code.coding[SKS-D].code = #DE11
* code.coding[SKS-D].display = "Type 2-diabetes (kan ikke valideres fordi der ikke er adgang til koderne)"
* subject = Reference(john)
* asserter = Reference(AbrahamLaege)
* recorder = Reference(AbrahamLaege)
* extension[conditionLastAssertedDate].valueDateTime = 2021-04-12
* onsetDateTime = 2017-04-01
* recordedDate = 2020-03-15
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed

Instance: ConditionPressureUlcer
InstanceOf: DkCoreCondition
Description: "Example of the citizen, Mark, who has a pressure ulcer"
Usage: #example
* code.text = "Tryksår i stadium 2, siddende på venstre lår. 4cmx5cm, dybde 3mm, ingen infektion."
* code.coding[FSIIIConditionCode].system = "urn:oid:1.2.208.176.2.21"
* code.coding[FSIIIConditionCode].code = #I4.4
* code.coding[FSIIIConditionCode].display = "Problemer med tryksår"
* code.coding[SCTConditionCode] = http://snomed.info/sct#420324007 "Pressure ulcer stage 2"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* category.coding.system = "http://terminology.hl7.org/CodeSystem/condition-category"
* category.coding.code = #problem-list-item
* subject = Reference(john)
* recordedDate = 2020-06-05
* asserter = Reference(AbrahamLaege)



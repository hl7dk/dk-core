Profile: DkCoreCondition
Parent: Condition
Id: dk-core-condition
Title: "Danish Core Condition Profile"
Description:  "HL7 Denmark core profile for professionally asserted conditions, as specified by danish health and social care organizations"

//Slicing code, declaring disciminator, and slicing type
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding ^slicing.ordered = false   // can be omitted, since false is the default
* code.coding ^slicing.description = "Slice based on the code.system value which allow different code-systems to represent a condition"  // optional - does not appear
//Declaring the slices, and their cardinalities, to allow a KL-code and a SNOMED CT code
* code.coding contains
   FSIIIConditionCode 0..1 and SCTConditionCode 0..1 and FFBConditionCode 0..1 and SKS-D 0..1 and ICPC2code 0..1

//Declaring the value set binding for the KLConditionCode slice, and setting the system.
//System is fixed to allow the slicing to work

* code.coding[FSIIIConditionCode].system = "urn:oid:1.2.208.176.2.21"

//Declaring the value set binding for the SCTConditionCode slice, and setting the system.
//System is fixed to allow the slicing to work (See Aliases for value set, and system info)
* code.coding[SCTConditionCode] from http://hl7.org/fhir/ValueSet/condition-code
* code.coding[SCTConditionCode].system = "http://snomed.info/sct" // eller 1.2.208.176.2.5


* code.coding[FFBConditionCode].system = "urn:oid:1.2.208.176.2.22"

* code.coding[SKS-D].system = "urn:oid:1.2.208.176.2.4.12" //eller (1.2.208.176.2.4)

* code.coding[ICPC2code].system = "urn:oid:1.2.208.176.2.31"

* extension contains
   http://hl7.org/fhir/StructureDefinition/condition-dueTo named dueTo 0..1 and
   ConditionLastAssertedDate named conditionLastAssertedDate 0..1 and
   NotFollowedAnymore named notFollowedAnymore 0..1

* asserter only Reference(Practitioner or PractitionerRole)

* code.coding ^short = "Condition code, [DA] tilstandskode"
* code.coding[FSIIIConditionCode] ^short = "[DA] FSIII tilstandskode"
* code.coding[FFBConditionCode] ^short = "[DA] FFB undertemakode"
* code.coding[SCTConditionCode] ^short = "SNOMED CT condition code"
* code.coding[ICPC2code] ^short = "ICPC2 code"
* code.coding[SKS-D] ^short = "[DA] Kode fra D-hierarkiet i SKS"
* extension[conditionLastAssertedDate] ^short = "Last date a condition was confirmed valid in its current state"
* extension[notFollowedAnymore] ^short = "Date where a condition lost focus in a specific clinical context"

Extension: ConditionLastAssertedDate
Title: "ConditionLastAssertedDate"
Description: "Extension for the last date a condition was confirmed valid with its current clinical- and verification status, stage and severity, typically the last performed follow-up"
* value[x] only dateTime

Extension: NotFollowedAnymore
Title: "NotFollowedAnymore"
Description: "Extension for the date where a condition lost focus in a specific clinical context"
* value[x] only dateTime



Instance: JohnDiabetes
InstanceOf: DkCoreCondition
Title: "John diabetes"
Description: "Johns diabetes-diagnose, udskrivningsdiagnose fra hospitalet fx til brug i indberetning og epikrise"
Usage: #example
* code.coding[SKS-D].system = "urn:oid:1.2.208.176.2.4.12"
* code.coding[SKS-D].code = #DE11
* code.coding[SKS-D].display = "Type 2-diabetes"
* subject = Reference(john)
* asserter = Reference(AbrahamLaege)
* recorder = Reference(AbrahamLaege)
* category.coding.system = "http://terminology.hl7.org/CodeSystem/condition-category"
* category.coding.code = #encounter-diagnosis
* onsetDateTime = 2020-02-20
* recordedDate = 2020-03-15
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed

Instance: ConditionPressureUlcer
InstanceOf: DkCoreCondition
Title: "John tryksår"
Description: "John, tryksår, kommunal tilstand"
Usage: #example
* code.text = "Tryksår i stadium 2, siddende på venstre lår. 4cmx5cm, dybde 3mm, ingen infektion."
* code.coding[FSIIIConditionCode].system = "urn:oid:1.2.208.176.2.21"
* code.coding[FSIIIConditionCode].code = #I4.4
* code.coding[FSIIIConditionCode].display = "Problemer med tryksår"
* code.coding[SCTConditionCode] = http://snomed.info/sct#420324007 "Pressure ulcer stage 2"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* category.coding.system = "http://terminology.hl7.org/CodeSystem/condition-category"
* category.coding.code = #problem-list-item
* extension[conditionLastAssertedDate].valueDateTime = 2020-12-12
* subject = Reference(john)
* recordedDate = 2020-06-05

Instance: JohnMelanoma
InstanceOf: DkCoreCondition
Title: "John mistanke om Modermærkekræft"
Description: "Johns mistanke om modermærkekræft i huden, kan fx bruges som henvisningsdiagnosese"
Usage: #example
* code.coding[SKS-D].system = "urn:oid:1.2.208.176.2.4.12"
* code.coding[SKS-D].code = #DC43
* code.coding[SKS-D].display = "Modermærkekræft i huden"
* subject = Reference(john)
* asserter = Reference(AbrahamLaege)
* recorder = Reference(AbrahamLaege)
* category.coding.system = "http://terminology.hl7.org/CodeSystem/condition-category"
* category.coding.code = #encounter-diagnosis
* recordedDate = 2021-05-01
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#unconfirmed

Instance: HenvisningFraLageTilSygehus
InstanceOf: ServiceRequest
Title: "Henvisning vedr. modermærkekræft"
Description: "Henvisning fra læge til sygehus vedr. mistanke om at John har modermærkekræft"
Usage: #example
* requester = Reference(LaegerneHasserisBymidte)
* reasonCode.text = "John henvises til onkologisk specialundersøgelse hurtigts muligt pga mistanke om modermærkekræft"
* reasonReference = Reference(JohnMelanoma)
* subject = Reference(john)
* authoredOn = 2021-05-01
* status = http://hl7.org/fhir/request-status#active
* intent = http://hl7.org/fhir/request-intent#proposal
* priority = http://hl7.org/fhir/request-priority#asap

Instance: JohnPacemaker
InstanceOf: DkCoreCondition
Title: "John pacemakeer"
Description: "Johns status efter pacemakeroperation, udtrykt semantisk korrekt med fund frem for operationskode"
Usage: #example
* code.coding[SCTConditionCode].system = "http://snomed.info/sct"
* code.coding[SCTConditionCode].code = #441509002
* code.coding[SCTConditionCode].display = " kardiel pacemaker in situ"
* subject = Reference(john)
* recorder = Reference(AbrahamLaege)
* category.coding.system = "http://terminology.hl7.org/CodeSystem/condition-category"
* category.coding.code = #problem-list-item
* recordedDate = 2021-05-01
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
Profile: DkCoreCondition
Parent: Condition
Id: dk-core-condition
Title: "Danish Core Condition Profile"
Description: "HL7 Denmark core profile for professionally asserted conditions, as specified by danish health and social care organizations"
* ^status = #active
* extension contains
    $condition-dueTo named dueTo 0..1 and
    ConditionLastAssertedDate named conditionLastAssertedDate 0..1 and
    NotFollowedAnymore named notFollowedAnymore 0..1
* extension[conditionLastAssertedDate] ^short = "Last date a condition was confirmed valid in its current state"
* extension[notFollowedAnymore] ^short = "Date where a condition lost focus in a specific clinical context"
* code.coding ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
  * ^slicing.ordered = false
  * ^slicing.description = "Slice based on the code.system value which allow different code-systems to represent a condition"
  * ^short = "Condition code, [DA] tilstandskode"
* code.coding contains
    FSIIIConditionCode 0..1 and
    SCTConditionCode 0..1 and
    FFBConditionCode 0..1 and
    SKS-D 0..1 and
    ICPC2code 0..1
* code.coding[FSIIIConditionCode] ^short = "[DA] FSIII tilstandskode"
  * system 1..
  * system = "urn:oid:1.2.208.176.2.21"
* code.coding[SCTConditionCode] from $condition-code (required)
  * ^short = "SNOMED CT condition code"
  * system 1..
  * system = "http://snomed.info/sct"
* code.coding[FFBConditionCode] ^short = "[DA] FFB undertemakode"
  * system 1..
  * system = "urn:oid:1.2.208.176.2.22"
* code.coding[SKS-D] ^short = "[DA] Kode fra D-hierarkiet i SKS"
  * system 1..
  * system = "urn:oid:1.2.208.176.2.4.12"
* code.coding[ICPC2code] ^short = "ICPC2 code"
  * system 1..
  * system = "urn:oid:1.2.208.176.2.31"
* subject only Reference(DkCorePatient)
* recorder only Reference(DkCorePractitioner or DkCorePractitionerRole or DkCorePatient or DkCoreRelatedPerson)
* asserter only Reference(DkCorePractitioner or DkCorePractitionerRole)

Mapping: DkCoreConditionToDanishClassifications
Source: DkCoreCondition
Target: "https://medinfo.dk/sks/brows.php"
Title: "Danish Condition Classifications (SKS-D, ICPC-2, FSIII, FFB)"
Id: dk-core-condition-classifications
* -> "Condition / Tilstand" "**Danish condition-classification systems used across sectors. A single DkCoreCondition MAY carry multiple codings when the same condition is represented in more than one classification.**"
* code.coding[SCTConditionCode] -> "SNOMED CT" "International SNOMED CT condition code under `http://snomed.info/sct`; bound to the FHIR R4 condition-code value set."
* code.coding[SKS-D] -> "SKS (Sundhedsvæsenets Klassifikations System), D-hierarkiet" "Secondary-sector diagnosis code from the SKS D-hierarchy under `urn:oid:1.2.208.176.2.4.12`."
* code.coding[ICPC2code] -> "ICPC-2" "International Classification of Primary Care, 2nd edition under `urn:oid:1.2.208.176.2.31`. Primary-care / general practice."
* code.coding[FSIIIConditionCode] -> "FSIII tilstande" "Municipal-care condition code (Fælles Sprog III) under `urn:oid:1.2.208.176.2.21`."
* code.coding[FFBConditionCode] -> "FFB undertemaer" "Municipal rehabilitation sub-theme code (Fælles Faglige Begreber) under `urn:oid:1.2.208.176.2.22`."
* clinicalStatus -> "Klinisk status" "active / recurrence / relapse / inactive / remission / resolved."
* verificationStatus -> "Verifikationsstatus" "unconfirmed / provisional / differential / confirmed / refuted / entered-in-error."
* subject -> "Patient" "DkCorePatient reference."
* recorder -> "Registrerer" "Who recorded the condition (Practitioner / PractitionerRole / Patient / RelatedPerson)."
* asserter -> "Asserter" "Clinician asserting the condition (Practitioner / PractitionerRole)."
* extension[conditionLastAssertedDate] -> "Sidst bekræftet" "Last date the condition was confirmed valid in its current state (typically last follow-up)."
* extension[notFollowedAnymore] -> "Ikke længere fulgt" "Date the condition lost focus in a specific clinical context."
* extension[dueTo] -> "Forårsaget af" "Link to another condition / observation that caused this condition."


Instance: ConditionPressureUlcer
InstanceOf: DkCoreCondition
Title: "John tryksår"
Description: "John, tryksår, kommunal tilstand"
Usage: #example
* code.coding[0] = urn:oid:1.2.208.176.2.21#I4.4 "Problemer med tryksår"
* code.coding[+] = $sct#1163220007 "Pressure injury stage II"
* code.text = "Tryksår i stadium 2, siddende på venstre lår. 4cmx5cm, dybde 3mm, ingen infektion."
* extension.url = "http://hl7.dk/fhir/core/StructureDefinition/ConditionLastAssertedDate"
* extension.valueDateTime = "2020-12-12"
* clinicalStatus = $condition-clinical#active
* category = $condition-category#problem-list-item
* subject.reference = "Patient/john"
* recordedDate = "2020-06-05"

Instance: ElseGraviditet
InstanceOf: DkCoreCondition
Title: "Else Graviditet"
Description: "Else Graviditet, tilstandskode som indberettes ifm Elses ambulante forløb (fx jordemoder), og ved eventuel indlæggelse i graviditeten"
Usage: #example
* code = urn:oid:1.2.208.176.2.4.12#DZ340 "Graviditet, førstegangsfødende"
* subject.reference = "Patient/else"
* category = $condition-category#encounter-diagnosis
* recordedDate = "2021-07-03"
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed

Instance: JohnDiabetes
InstanceOf: DkCoreCondition
Title: "John diabetes"
Description: "Johns diabetes-diagnose, udskrivningsdiagnose fra hospitalet fx til brug i indberetning og epikrise"
Usage: #example
* code = urn:oid:1.2.208.176.2.4.12#DE11 "Type 2-diabetes"
* subject.reference = "Patient/john"
* asserter.reference = "Practitioner/AbrahamLaege"
* recorder.reference = "Practitioner/AbrahamLaege"
* category = $condition-category#encounter-diagnosis
* onsetDateTime = "2020-02-20"
* recordedDate = "2020-03-15"
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed

Instance: JohnFracture
InstanceOf: DkCoreCondition
Title: "John fraktur"
Description: "Johns fraktur-diagnose, udskrivningsdiagnose fra hospitalet med tillægskode"
Usage: #example
* code.coding[SKS-D] = urn:oid:1.2.208.176.2.4.12#DS721+TUL1 "Pertrokantær femurfraktur, højresidig"
* subject.reference = "Patient/john"
* asserter.reference = "Practitioner/AbrahamLaege"
* recorder.reference = "Practitioner/AbrahamLaege"
* category = $condition-category#encounter-diagnosis
* onsetDateTime = "2022-04-26"
* recordedDate = "2022-04-27"
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed


Instance: JohnMelanoma
InstanceOf: DkCoreCondition
Title: "John mistanke om Modermærkekræft"
Description: "Johns mistanke om modermærkekræft i huden, kan fx bruges som henvisningsdiagnosese"
Usage: #example
* code = urn:oid:1.2.208.176.2.4.12#DC43 "Modermærkekræft i huden"
* subject.reference = "Patient/john"
* asserter.reference = "Practitioner/AbrahamLaege"
* recorder.reference = "Practitioner/AbrahamLaege"
* category = $condition-category#encounter-diagnosis
* recordedDate = "2021-05-01"
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#unconfirmed

Instance: JohnPacemaker
InstanceOf: DkCoreCondition
Title: "John pacemaker"
Description: "Johns status efter pacemakeroperation, udtrykt semantisk korrekt med fund frem for operationskode"
Usage: #example
* code = $sct#441509002 "kardiel pacemaker in situ"
* subject.reference = "Patient/john"
* recorder.reference = "Practitioner/AbrahamLaege"
* category = $condition-category#problem-list-item
* recordedDate = "2021-05-01"
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
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
    ICD10Diagnosis 0..1 and
    ICD10DanishExtension 0..1 and
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
* code.coding[ICD10Diagnosis] from DkCoreDiagnosisCodes (required)
  * ^short = "ICD-10 diagnosis code"
  * system 1..
  * system = $icd10
* code.coding[ICD10DanishExtension] from DkCoreDiagnosisCodes (required)
  * ^short = "[DA] Dansk SKS-specifik diagnosekode (afvigelse/tilføjelse ift. ICD-10)"
  * system 1..
  * system = $icd10-danish-extensions
* code.coding[ICPC2code] ^short = "ICPC2 code"
  * system 1..
  * system = "urn:oid:1.2.208.176.2.31"
* subject only Reference(DkCorePatient)
* recorder only Reference(DkCorePractitioner or DkCorePractitionerRole or DkCorePatient or DkCoreRelatedPerson)
* asserter only Reference(DkCorePractitioner or DkCorePractitionerRole)

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
* code.coding[ICD10Diagnosis] = $icd10#Z34.0 "Graviditet, førstegangsfødende"
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
* code.coding[ICD10Diagnosis] = $icd10#E11 "Type 2-diabetes"
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
* code.coding[ICD10Diagnosis] = $icd10#S72.1 "Pertrokantær femurfraktur"
* code.text = "Pertrokantær femurfraktur, højresidig"
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
* code.coding[ICD10Diagnosis] = $icd10#C43 "Modermærkekræft i huden"
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

// Example: a diagnosis expressed with a plain international ICD-10 code, using
// the ICD10Diagnosis slice. This is the path for clinicians who code in plain
// ICD-10 (no Danish-specific deviation needed).
Instance: ElseHypertension
InstanceOf: DkCoreCondition
Title: "Else essentiel hypertension (ICD-10)"
Description: "Else, forhøjet blodtryk. Viser hvordan en diagnose udtrykkes med en almindelig international ICD-10-kode i ICD10Diagnosis-slicet."
Usage: #example
* code.coding[ICD10Diagnosis] = $icd10#I10 "Essentiel hypertension"
* code.text = "Forhøjet blodtryk"
* subject.reference = "Patient/else"
* category = $condition-category#encounter-diagnosis
* recordedDate = "2024-02-14"
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed

// Example: a Danish SKS-specific extension to ICD-10 (icd10-danish-extensions),
// here a sub-classification of ICD-10 A02.2 that does not exist in plain
// ICD-10. The intended pattern is to code the Danish extension in the
// ICD10DanishExtension slice and, when meaningful, also carry its parent
// ICD-10 category in the ICD10Diagnosis slice so the diagnosis remains
// interpretable internationally.
Instance: ElseSalmonellaArthritis
InstanceOf: DkCoreCondition
Title: "Else salmonella-artritis (dansk ICD-10-udvidelse)"
Description: "Else, salmonella-artritis. Viser brug af en dansk SKS-specifik ICD-10-udvidelse (icd10-danish-extensions#A02.2A) sammen med den overordnede internationale ICD-10-kode (A02.2)."
Usage: #example
* code.coding[ICD10Diagnosis] = $icd10#A02.2 "Lokaliseret salmonellainfektion"
* code.coding[ICD10DanishExtension] = $icd10-danish-extensions#A02.2A "Salmonella arthritis"
* code.text = "Salmonella-artritis"
* subject.reference = "Patient/else"
* category = $condition-category#encounter-diagnosis
* recordedDate = "2024-03-10"
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
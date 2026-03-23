Profile: DkCoreDiagnosticReport
Parent: DiagnosticReport
Id: dk-core-diagnostic-report
Description: "dk-core profile for laboratory reports."
Title: "Danish Core Diagnostic Report Profile"

* identifier 0..1
  * ^short = "[DK] undersøgelsesnummer"
  * system 1..1
  * system = "http://medcom/undersøgelsesnummer" (exactly)
//consider slicing

//* basedOn 1..1
//* basedOn only Reference(DkCoreServiceRequest)
//  * ^short = "[DK] rapportBaseretPå"
* status ^short = "[DK] rapportstatus"
* category 0..*
  * ^short = "[DK] rapportkategori"
* category ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* category contains
    studyType 0..* and
    specialty 0..* and
    danishSpecialty 0..*
* category[studyType] from LoincLabStudyTypes (required)
  * ^short = "The way of grouping of the test results into clinically meaningful domains (e.g. hematology study, microbiology study, etc.)"
* category[specialty] from dk-core-SCTLaboratorySpecialities (required)
  * ^short = "The clinical domain of the laboratory performing the observation (e.g. microbiology, toxicology, chemistry)"
* category[danishSpecialty] from dk-core-practice-setting-exclude-lab-code (required)
* code 1..1 
* code from dk-core-LoincDiagnosticDocumentTypes (extensible)
  * ^short = "[DK] rapportkode"

* subject only Reference(DkCorePatient or Group or DkCoreLocation or Device)
* performer only Reference(DkCorePractitioner or DkCoreOrganization or DkCorePractitionerRole or CareTeam)
* resultsInterpreter only Reference(DkCorePractitioner or DkCoreOrganization or DkCorePractitionerRole or CareTeam)
* basedOn only Reference(CarePlan or ImmunizationRecommendation or MedicationRequest or NutritionOrder or DkCorePersonServiceRequest)
* encounter only Reference(DkCoreEncounter)

Instance: ElseHomeNursingMeasurements
InstanceOf: DkCoreDiagnosticReport
Title: "Else's TOBS measurements and urin stix"
Description: "An example of urin stix and TOBS (Danish: Tidlig opsporing af begyndende sygdom) organized as a DiagnosticReport."
Usage: #example
* status = 	http://hl7.org/fhir/diagnostic-report-status#final
* code = $LOINC#11506-3 "Progress note"
* subject = Reference(else)
* category[danishSpecialty] = $sct#658161000005107 "hjemmesygepleje"
* result[0] = Reference(ElseConsciousness)
* result[+] = Reference(ElseBloodPressure)
* result[+] = Reference(ElseBodyTemperature)
* result[+] = Reference(ElseHeartRate)
* result[+] = Reference(ElseRespirationRate)
* result[+] = Reference(ElsesTOBSscore)
* result[+] = Reference(ElseUrinStix)
* performer = Reference(SidselSygeplejerske)
* conclusion = "Elses lidt høje TOBS og leukocytter i urin gør det nødvendigt med lægetilsyn snarest."
* effectiveDateTime = "2023-09-12T17:45:00.000Z"

Instance: ElseLaboratoryReport
InstanceOf: DkCoreDiagnosticReport
Title: "Else's Laboratory report using EHDS value sets"
Description: "An example of clinical chemistry report."
Usage: #example
* status = 	http://hl7.org/fhir/diagnostic-report-status#final
* code = $LOINC#11502-2 "Laboratory report"
* subject = Reference(else)
* category[specialty] = $sct#394596001 "klinisk biokemi"
* category[studyType] = $LOINC#18719-5	"Chemistry studies (set)"
* result[0] = Reference(ElseINR)
* result[+] = Reference(ElseKalium)
* result[+] = Reference(ElseNatrium)
* performer = Reference(KliniskBiokemiHBY)
* effectiveDateTime = "2023-09-15T10:00:00.000Z"

Instance: ElseINR
InstanceOf: DkCoreObservation
Usage: #example
* status = #final
* subject = Reference(else)
* effectiveDateTime = "2023-09-15T09:15:00.000Z"
* code.coding = $NPU#NPU01685 "P—Coagulation, tissue factor-induced; rel.time(actual/norm;INR;IRP 67/40;proc.) = ?"
* valueQuantity.value = 1.00
* valueQuantity.code = #1
* valueQuantity.system = $ucum

Instance: ElseKalium
InstanceOf: DkCoreObservation
Usage: #example
* status = #final
* subject = Reference(else)
* effectiveDateTime = "2023-09-15T09:15:00.000Z"
* code.coding = $NPU#NPU03230 "P—Potassium ion; subst.c. = ? mmol/L"
* valueQuantity.value = 3.0
* valueQuantity.code = #mmol/L
* valueQuantity.system = $ucum

Instance: ElseNatrium
InstanceOf: DkCoreObservation
Usage: #example
* status = #final
* subject = Reference(else)
* effectiveDateTime = "2023-09-15T09:15:00.000Z"
* code.coding = $NPU#NPU03429 "P—Sodium ion; subst.c. = ? mmol/L"
* valueQuantity.value = 150
* valueQuantity.code = #mmol/L
* valueQuantity.system = $ucum
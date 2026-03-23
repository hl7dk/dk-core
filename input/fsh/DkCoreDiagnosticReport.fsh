Profile: DkCoreDiagnosticReport
Parent: DiagnosticReport
Id: dk-core-diagnostic-report
Description: "dk-core profile for laboratory reports."

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
    danishSpeciality 0..*
* category[studyType] from LoincLabStudyTypes (required)
  * ^short = "The way of grouping of the test results into clinically meaningful domains (e.g. hematology study, microbiology study, etc.)"
* category[specialty] from dk-core-SCTLaboratorySpecialities (required)
  * ^short = "The clinical domain of the laboratory performing the observation (e.g. microbiology, toxicology, chemistry)"
* category[danishSpeciality] from dk-core-practice-setting-code (required)
* code 1..1 
* code from dk-core-LoincDiagnosticDocumentTypes
  * ^short = "[DK] rapportkode"

* subject only Reference(DkCorePatient or Group or DkCoreLocation or Device)
* performer only Reference(DkCorePractitioner or DkCoreOrganization or DkCorePractitionerRole or CareTeam)
* resultsInterpreter only Reference(DkCorePractitioner or DkCoreOrganization or DkCorePractitionerRole or CareTeam)
Profile: DkCoreLaboratoryReport
Parent: DiagnosticReport
Id: dk-core-laboratory-report
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
    specialty 0..*
* category[studyType] from http://hl7.eu/fhir/laboratory/ValueSet/lab-studyType-eu-lab (required)
  * ^short = "The way of grouping of the test results into clinically meaningful domains (e.g. hematology study, microbiology study, etc.)"
* category[specialty] from http://hl7.eu/fhir/laboratory/ValueSet/lab-speciality-eu-lab (required)
  * ^short = "The clinical domain of the laboratory performing the observation (e.g. microbiology, toxicology, chemistry)"
* code 1..1 
* code = $LOINC#11502-2
  * ^short = "[DK] rapportkode"

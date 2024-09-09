Profile: DkCorePersonServiceRequest
Parent: ServiceRequest
Id: dk-core-person-servicerequest
Title: "Danish Core Person ServiceRequest Profile"
Description: "HL7 Denmark core profile for requesting a service, such as diagnostic investigations, nursing services, treatments, and more for a Patient."
* subject only Reference(DkCorePatient)
* requester only Reference(DkCorePractitioner or PractitionerRole or DkCoreOrganization or DkCorePatient or DkCoreRelatedPerson or Device)
* performer only Reference(DkCorePractitioner or PractitionerRole or DkCoreOrganization or DkCorePatient or DkCoreRelatedPerson or HealthcareService or Device or CareTeam)
* code from DkCoreServiceRequestCodes (preferred)
* priority from DkCorePriorityCodes (required)
* reasonReference only Reference(DkCoreCondition or DkCoreObservation or DiagnosticReport or DocumentReference)
* reasonCode.coding ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
  * ^slicing.ordered = false
  * ^slicing.description = "Slice based on the code.system value which allow different code-systems to represent a reason"
  * ^short = "Reason code, [DA] begrundelses-kode"
* reasonCode.coding contains
    FSIIIConditionCode 0..1 and
    SCTCode 0..1 and
    FFBConditionCode 0..1 and
    SKS-D 0..1 and
    ICPC2code 0..1
* reasonCode.coding[FSIIIConditionCode] ^short = "[DA] FSIII tilstandskode"
  * system 1..
  * system = "urn:oid:1.2.208.176.2.21"
* reasonCode.coding[SCTCode]
  * ^short = "SNOMED CT kode, typisk klinisk fund eller procedure"
  * system 1..
  * system = "http://snomed.info/sct"
* reasonCode.coding[FFBConditionCode] ^short = "[DA] FFB undertemakode"
  * system 1..
  * system = "urn:oid:1.2.208.176.2.22"
* reasonCode.coding[SKS] ^short = "[DA] Kode fra SKS, typisk diagnose eller procedure"
  * system 1..
  * system = "urn:oid:1.2.208.176.2.4.12"
* reasonCode.coding[ICPC2code] ^short = "ICPC2 code"
  * system 1..
  * system = "urn:oid:1.2.208.176.2.31"


Instance: JohnsServiceRequest
InstanceOf: DkCorePersonServiceRequest
Title: "Request for nursing care of John."
Description: "Request for nursing care of John."
Usage: #example
* status = #active
* intent = #plan
* priority = http://hl7.org/fhir/request-priority#routine
* subject.reference = "Patient/john"
* code.coding = $sct#658161000005107 "hjemmesygepleje"

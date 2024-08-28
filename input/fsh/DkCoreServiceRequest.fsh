Profile: DkCorePersonServiceRequest
Parent: ServiceRequest
Id: dk-core-person-servicerequest
Title: "Danish Core Person ServiceRequest Profile"
Description: "HL7 Denmark core profile for requesting a service, such as diagnostic investigations, nursing services, treatments, and more for a Patient."
* subject only Reference(DkCorePatient)
* requester only Reference(DkCorePractitioner or PractitionerRole or DkCoreOrganization or DkCorePatient or DkCoreRelatedPerson or Device)
* performer only Reference(DkCorePractitioner or PractitionerRole or DkCoreOrganization or DkCorePatient or DkCoreRelatedPerson or HealthcareService or Device or CareTeam)
* code from DkCoreServiceRequestCodes (preferred)



Instance: JohnsServiceRequest
InstanceOf: DkCoreServiceRequest
Title: "Request for nursing care of John."
Description: "Request for nursing care of John."
Usage: #example
* status = #active
* intent = #plan
* subject.reference = "Patient/john"
* code.coding = $sct#658161000005107 "hjemmesygepleje"

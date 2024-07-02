Profile: DkCoreServiceRequest
Parent: ServiceRequest
Id: dk-core-servicerequest
Title: "Danish Core ServiceRequest Profile"
Description: "HL7 Denmark core profile for requesting a service, such as diagnostic investigations, nursing services, treatments, and more."
* subject only Reference(DkCorePatient or Group)
* requester only Reference(DkCorePractitioner or PractitionerRole or DkCoreOrganization or DkCorePatient or DkCoreRelatedPerson or Device)
* performer only Reference(DkCorePractitioner or PractitionerRole or DkCoreOrganization or DkCorePatient or DkCoreRelatedPerson or HealthcareService or Device or CareTeam)
* code from DkCoreServiceRequestCodes (preferred)


ValueSet: DkCoreServiceRequestCodes
Id: dk-core-servicerequest-codes
Title: "DK codes for ServiceRequest"
Description: "DK Codes"
* ^experimental = false
* ^status = #active
* codes from system $sct where concept is-a #224891009


Instance: JohnsServiceRequest
InstanceOf: DkCoreServiceRequest
Title: "Request for nursing care of John."
Description: "Request for nursing care of John."
Usage: #example
* status = #active
* intent = #plan
* subject.reference = "Patient/john"
* code.coding = $sct#658161000005107 "hjemmesygepleje"

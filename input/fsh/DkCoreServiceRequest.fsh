Profile: DkCoreServiceRequest
Parent: ServiceRequest
Id: dk-core-servicerequest
Title: "Danish Core ServiceRequest Profile"
Description: "HL7 Denmark core profile for requesting a service, such as diagnostic investigations, nursing services, treatments, and more."
* subject only Reference(DkCorePatient)
* requester only Reference(DkCorePractitioner or PractitionerRole or DkCoreOrganization or DkCorePatient or DkCoreRelatedPerson or Device)
* performer only Reference(DkCorePractitioner or PractitionerRole or DkCoreOrganization or DkCorePatient or DkCoreRelatedPerson or HealthcareService or Device or CareTeam)
* category from DkCoreServiceRequestCategoryValues (extensible)
* code from DkCoreServiceRequestCategoryValues (preferred)


CodeSystem: DkCoreServiceRequestCategory
Id: dk-core-servicerequest-category
Title: "DK Categories for ServiceRequest"
Description: "DK Category"
* ^experimental = false
* ^status = #active
* ^content = #complete
* ^caseSensitive = false
* #municipalityservice "Municipality service"
  * ^designation.language = #da
  * ^designation.value = "Kommunal service"
* #regionalservice "Regional service - Hospital??"
  * ^designation.language = #da
  * ^designation.value = "Regional service"
* #primarysektorservice "Primary sector service"
  * ^designation.language = #da
  * ^designation.value = "Primær sektor service"
* #laboratoryservice "Laboratory service"
  * ^designation.language = #da
  * ^designation.value = "Primær sektor service"

CodeSystem: DkCoreServiceRequestCodes
Id: dk-core-servicerequest-codes
Title: "DK Codes for ServiceRequest"
Description: "DK Codes"
* ^experimental = false
* ^status = #active
* ^content = #complete
* ^caseSensitive = false
* #homecarenursering "Homecare nursering"
  * ^designation.language = #da
  * ^designation.value = "Hjemmesygepleje"



ValueSet: DkCoreServiceRequestCategoryValues
Id: dk-core-servicerequest-category-values
Title: "DK Categories for ServiceRequest"
Description: "DK Category"
* ^experimental = false
* ^status = #active
* include codes from system DkCoreServiceRequestCategory

ValueSet: DkCoreServiceRequestCodeValues
Id: dk-core-servicerequest-code-values
Title: "DK Codes for ServiceRequest"
Description: "DK Code"
* ^experimental = false
* ^status = #active
* include codes from system DkCoreServiceRequestCodes


Instance: JohnsServiceRequest
InstanceOf: DkCoreServiceRequest
Title: "Request for nursing care of John."
Description: "Request for nursing care of John."
Usage: #example
* status = #active
* intent = #plan
* subject.reference = "Patient/john"
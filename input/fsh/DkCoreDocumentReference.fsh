Profile: DkCoreDocumentReference
Parent: MinimalDocumentReference
Id: dk-core-documentreference
Title: "Danish Core DocumentReference Profile"
* extension contains http://hl7.org/fhir/5.0/StructureDefinition/extension-DocumentReference.version named version 1..1
* context.facilityType from SorOrganizationType (extensible)
* context.practiceSetting from SorPracticeSettingCode (extensible)
* author only Reference(DkCorePatient or DkCorePractitioner or DkCorePractitionerRole or DkCoreRelatedPerson or DkCoreOrganization or Device)
* authenticator only Reference(DkCorePractitioner)
* subject only Reference(DkCorePatient)
* context.sourcePatientInfo only Reference(DkCorePatient)
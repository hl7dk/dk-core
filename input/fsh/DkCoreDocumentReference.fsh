Profile: DkCoreDocumentReference
Parent: DocumentReference
Id: dk-core-documentreference
Description: "HL7 Denmark core profile for xds-metatada (DocumentReference) for a Danish FHIR document."
* masterIdentifier 1..1 MS
* masterIdentifier.value 1..1 MS
* masterIdentifier ^short = "[DocumentEntry.uniqueId] Master Version Specific Identifier"
* identifier 0..1 MS
* identifier.value 0..1 MS 
* identifier ^short = "[DocumentEntry.entryUUID] Identifier for the document"
* identifier obeys dk-core-uuid
* status MS 
* status ^short = "[DocumentEntry.availabilityStatus] current = active | superseded = deprecated"
// TypeCode
* type 1.. MS
* type ^short = "[DocumentEntry.typeCode] Kind of document"
* type.coding.system 1.. MS
* type.coding.code 1.. MS
* authenticator 0..1 MS
* authenticator ^short = "[DocumentEntry.legalAuthenticator] Who authenticated the document"
* authenticator only Reference(DkCorePractitioner)
* authenticator ^type.aggregation = #contained
// ClassCode
* category 1..1 MS 
* category from $ClassCodeVS (extensible)
//* category.coding.code 1.. MS
//* category.coding.system 1.. MS
* category ^short = "[DocumentEntry.class] Categorization of document"
* author 1..2 MS 
* author ^type.aggregation = #contained
* author ^short = "[DocumentEntry.author] Who and/or what authored the document"
* author ^slicing.discriminator.type = #type
  * ^slicing.discriminator.path = "$this.resolve()"
  * ^slicing.rules = #closed
* author contains
    institution 1..1 and
    person 0..1
* author[institution] MS
* author[institution] only Reference(DkCoreOrganization)
* author[institution] ^short = "[DocumentEntry.author.authorInstitution] The organization who authored the document"
* author[person] MS
* author[person] only Reference(DkCorePractitioner)
* author[person] ^short = "[DocumentEntry.author.authorPerson] The person who authored the document"
* securityLabel 1.. MS  
* securityLabel ^short = "[DocumentEntry.confidentialityCode] Document security-tags"
* subject 1..1 MS
* subject only Reference(DkCorePatient)
* subject ^type.aggregation = #contained
* subject ^short = "[DocumentEntry.sourcePatientInfo, DocumentEntry.sourcePatientId] Who/what is the subject of the document"
* content MS
* content.attachment.contentType ^short = "[DocumentEntry.mimeType] Mime type of the content, with charset etc."
* content.attachment.contentType 1.. MS
* content.attachment.contentType from $ContentTypeVS
* content.attachment.language ^short = "[DocumentEntry.languageCode] Human language of the content"
* content.attachment.language 1.. MS
* content.attachment.language from $LanguageVS (extensible)
* content.attachment.creation ^short = "[DocumentEntry.creationTime] Date attachment was first created"
* content.attachment.creation 1.. MS
* content.attachment.hash 0.. MS
* content.attachment.hash ^short = "[DocumentEntry.hash] Hash of the data (sha-1)"
* content.format ^short = "[DocumentEntry.formatCode] Format/content rules for the document"
* content.format 1.. MS
/* * content.format.coding.code 1.. MS
* content.format.coding.system 1.. MS */
* content.attachment.size 0.. MS
* content.attachment.title 1.. MS
* content.attachment.url 0.. MS
* content.attachment.size ^short = "[DocumentEntry.size] Number of bytes of content"
* content.attachment.title ^short = "[DocumentEntry.title] Label to display in place of the data"
* content.attachment.url ^short = "[DocumentEntry.URI] Uri where the data can be found"
* context 1.. MS
* context.event 0..1 MS 
* context.event.coding.code 1.. MS
* context.event.coding.system 1.. MS
* context.event ^short = "[DocumentEntry.eventCodeList] Main clinical acts documented"
* context.period MS
* context.period.start MS
* context.period.end MS
* context.period ^short = "[DocumentEntry.serviceStartTime, DocumentEntry.serviceStopTime] Time of service that is being documented"
* context.facilityType 1.. MS
* context.facilityType.coding.code 1.. MS
* context.facilityType.coding.system 1.. MS
* context.facilityType.coding.system from $FacilityTypeVS (extensible)
* context.facilityType ^short = "[DocumentEntry.healthcareFacilityTypeCode] Kind of facility where patient was seen"
* context.practiceSetting 1.. MS
* context.practiceSetting.coding.code 1.. MS
* context.practiceSetting.coding.system 1.. MS
* context.practiceSetting.coding.system from $PracticeSettingVS (extensible)
* context.practiceSetting ^short = "[DocumentEntry.practiceSettingCode] Additional details about where the content was created (e.g. clinical specialty)"
* context.related 0..* MS
* context.related ^short = "[DocumentEntry.referenceIdList] Related identifiers or resources"
* context.sourcePatientInfo 1..1 MS
* context.sourcePatientInfo ^short = "[DocumentEntry.sourcePatientId and DocumentEntry.sourcePatientInfo] Patient demographics from source. Must be the same reference as in DocumentReference.subject."
* extension contains 
    dk-core-document-homecommunityid-extension named homeCommunityid 1..1 MS SU and
    dk-core-documentreference-version-id-extension named versionid 1..1 MS SU
* extension[homeCommunityid] ^short = "[DocumentEntry.homeCommunityId] A unique identifier for a community where the DocumentEntry and document can be accessed"
* extension[versionid] ^short = "Specifies the version of the DocumentReference for a standard."

Invariant: dk-core-uuid
Description: "General UUID expression"
Severity: #error
Expression: "value.matches('[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}')"

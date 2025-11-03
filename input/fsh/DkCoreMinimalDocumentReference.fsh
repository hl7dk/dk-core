Profile: DkCoreMinimalDocumentReference
Parent: MinimalDocumentReference
Id: dk-core-minimaldocumentreference
Title: "Danish Core Minimal DocumentReference Profile"
Description: "HL7 Denmark core profile for a Minimal DocumentReference inherited from IHE MHD Minimal DocumentReference"
//* extension contains http://hl7.org/fhir/5.0/StructureDefinition/extension-DocumentReference.version named version 1..1
* extension contains dk-core-documentreference-version-id-extension named versionid 0..1 MS
* extension[versionid] ^short = "Specifies the version of the DocumentReference profile for a standard."
* context.facilityType from SorOrganizationType (extensible)
* context.practiceSetting from SorPracticeSettingCode (extensible)
* context.event from $v3-ActCode3.0.0 
* author 1..*
* author only Reference(DkCorePatient or DkCorePractitioner or DkCorePractitionerRole or DkCoreRelatedPerson or DkCoreOrganization or Device)
* authenticator only Reference(DkCorePractitioner or DkCorePractitionerRole or DkCoreOrganization)
* subject 1..1
* subject only Reference(DkCorePatient)
* context.sourcePatientInfo only Reference(DkCorePatient)

// DkCoreDocumentReference instance
Instance: 94e65db8-2f0c-4a2c-a7c9-06a160d59a12
InstanceOf: DkCoreMinimalDocumentReference
Title: "APD-DK DocumentReference instance of DkCoreMinimalDocumentReference."
Description: "APD-DK DocumentReference instance of DkCoreMinimalDocumentReference, containing relevant metadata"
* contained[+] = 42cb9200-f421-4d08-8391-7d51a2503cb4
* contained[+] = 8fa7df76-bec2-4fe2-9a44-750030a0eda0
* contained[+] = 37628912-7816-47a3-acd8-396b610be142
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:uuid:bf1bb63b-d405-4dfe-9810-37b16b333a01"
* status = #current "Current"
* type = $LOINC#56446-8 "Appointment Summary Document"
* authenticator = Reference(42cb9200-f421-4d08-8391-7d51a2503cb4)
* category = $DanishXdsOid#001 "Klinisk rapport"
* author = Reference(8fa7df76-bec2-4fe2-9a44-750030a0eda0)
* subject = Reference(37628912-7816-47a3-acd8-396b610be142)
* securityLabel = #N
* content.attachment.contentType = $IANAMediaOID#text/xml "MimeType-text/xml"
* content.attachment.language = $IANALanguageOID#da "Danish"
* content.attachment.creation = "2023-09-08T13:28:17+01:00"
* content.attachment.hash = "ZGEzOWEzZWU1ZTZiNGIwZDMyNTViZmVmOTU2MDE4OTBhZmQ4MDcwOQ==" //hash "da39a3ee5e6b4b0d3255bfef95601890afd80709"
* content.attachment.size = 3654
* content.attachment.url = "DOC001.XML"
* content.attachment.title = "Aftale for 0201919990"
* content.format = $MedComFormatOID#urn:ad:dk:medcom:apd-v2.0.1:full "DK APD schema"
* context.event = $SKS#ALAL03 "Psykiske lidelser og adfærdsmæssige forstyrrelser"
* context.sourcePatientInfo = Reference(37628912-7816-47a3-acd8-396b610be142)
* context.facilityType = $sct#554871000005105 "psykiatrienhed"
* context.practiceSetting = $sct#394588006 "børne- og ungdomspsykiatri"
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-DocumentReference.version"
* extension[=].valueString = "1.0.0"

// Metadata instance
Instance: 94e65db8-2f0c-4a2c-a7c9-06a160d59a13
InstanceOf: DkCoreMinimalDocumentReference
Title: "DocumentReference instance"
Description: "DocumentReference instance"
* contained[+] = 42cb9200-f421-4d08-8391-7d51a2503cb4
* contained[+] = 8fa7df76-bec2-4fe2-9a44-750030a0eda0
* contained[+] = 37628912-7816-47a3-acd8-396b610be142
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:uuid:bf1bb63b-d405-4dfe-9810-37b16b333a01"
* status = #current "Current"
* identifier.value = "urn:uuid:7c596b9a-112e-4386-ae71-5ecdd3ed7c50"
* type = $LOINC#11450-4 "Problem list - Reported"
* authenticator = Reference(42cb9200-f421-4d08-8391-7d51a2503cb4)
* category = $DanishXdsOid#001 "Klinisk rapport"
* author = Reference(8fa7df76-bec2-4fe2-9a44-750030a0eda0)
* subject = Reference(37628912-7816-47a3-acd8-396b610be142)
* content.attachment.contentType = $IANAMediaOID#application/fhir+json "MimeType-application/fhir+json"
* securityLabel = #N
* content.attachment.language = $IANALanguageOID#da "Danish"
* content.attachment.creation = "2024-05-01T12:00:00+01:00"
* content.attachment.url = "DOC001.XML"
* content.attachment.title = "Diagnoseoversigt for 2509479989"
* content.format = $MedComFormatOID#urn:ad:dk:medcom:plr-v1.0:full "DK PLR schema"
* context.facilityType = $sct#394761003 "almen lægepraksis"
* context.practiceSetting = $sct#408443003 "almen medicin"
* context.sourcePatientInfo = Reference(37628912-7816-47a3-acd8-396b610be142)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-DocumentReference.version"
* extension[=].valueString = "1.0.0"

Instance: 42cb9200-f421-4d08-8391-7d51a2503cb4
InstanceOf: DkCorePractitioner
Title: "XDS document bundled Author Person"
Description: "Instance of a XDS document bundled  author person"
Usage: #example
* name.given = "Sidsel"
* name.family = "Andersen"

Instance: 8fa7df76-bec2-4fe2-9a44-750030a0eda0
InstanceOf: DkCoreOrganization
Title: "XDS document bundled Author Organization"
Description: "Instance of a XDS document bundled  author organization"
Usage: #example
* identifier[SOR-ID].value = "61741000016007"
* identifier[SOR-ID].system = "urn:oid:1.2.208.176.1.1"
* name = "Lægerne Hasseris Bymidte"

Instance: 37628912-7816-47a3-acd8-396b610be142
InstanceOf: DkCorePatient
Title: "XDS document bundled Source Patient"
Description: "Instance of a XDS document bundled  source patient"
Usage: #example
* identifier[cpr].system = "urn:oid:1.2.208.176.1.2"
* identifier[cpr].value = "0201919990"
* name[official].use = #official
* name[official].family = "Lauridsen"
* name[official].given[0] = "Else"
* name[official].given[+] = "Test"
* gender = #female
* birthDate = "1991-02-02"


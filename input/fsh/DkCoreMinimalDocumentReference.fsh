Profile: DkCoreMinimalDocumentReference
Parent: MinimalDocumentReference
Id: dk-core-minimaldocumentreference
Title: "Danish Core Minimal DocumentReference Profile"
Description: "HL7 Denmark core profile for a Minimal DocumentReference inherited from IHE MHD Minimal DocumentReference"
* extension contains http://hl7.org/fhir/5.0/StructureDefinition/extension-DocumentReference.version named versionid 1..1
* extension[versionid] ^short = "Specifies the version of the DocumentReference profile for a standard."
* context.facilityType from SorOrganizationType (extensible)
* context.practiceSetting from SorPracticeSettingCode (extensible)
* context.event from $v3-ActCode3.0.0 (example)
* author 1..*
* author only Reference(DkCorePatient or DkCorePractitioner or DkCorePractitionerRole or DkCoreRelatedPerson or DkCoreOrganization or Device)
* authenticator only Reference(DkCorePractitioner or DkCorePractitionerRole or DkCoreOrganization)
* subject 1..1
* subject only Reference(DkCorePatient)
* context.sourcePatientInfo only Reference(DkCorePatient)

Mapping: DkCoreMinimalDocumentReferenceToXds
Source: DkCoreMinimalDocumentReference
Target: "https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html"
Title: "IHE MHD / MedCom XDS DocumentEntry"
Id: dk-core-minimaldocref-xds
* -> "DocumentEntry" "**IHE MHD DocumentReference mapped to an XDS DocumentEntry. Format and category codings follow the Danish XDS OID (`urn:oid:1.2.208.184.100.9`) and the MedCom format OID (`urn:oid:1.2.208.184.100.10`).**"
* masterIdentifier -> "DocumentEntry.uniqueId" "[DocumentEntry.uniqueId](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.2.26)"
* identifier -> "DocumentEntry.entryUUID" "[DocumentEntry.entryUUID](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.2.7)"
* status -> "DocumentEntry.availabilityStatus" "[DocumentEntry.availabilityStatus](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.2.2)"
* type -> "DocumentEntry.typeCode" "[DocumentEntry.typeCode](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.2.28) - LOINC document type."
* category -> "DocumentEntry.classCode" "[DocumentEntry.classCode](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.2.3) - bound to the Danish XDS category OID."
* subject -> "DocumentEntry.patientId" "[DocumentEntry.patientId](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.2.16) - CPR-keyed."
* author -> "DocumentEntry.author" "[DocumentEntry.author](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.2.1)"
* authenticator -> "DocumentEntry.legalAuthenticator" "[DocumentEntry.legalAuthenticator](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.2.14)"
* securityLabel -> "DocumentEntry.confidentialityCode" "[DocumentEntry.confidentialityCode](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.2.4)"
* content.attachment -> "DocumentEntry.repositoryUniqueId / size / hash / mimeType / language" "Physical document metadata and pointer."
* content.format -> "DocumentEntry.formatCode" "[DocumentEntry.formatCode](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.2.8) - MedCom format OID (e.g. APD, PLR)."
* context.event -> "DocumentEntry.eventCodeList" "[DocumentEntry.eventCodeList](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.2.6) - SKS event codes."
* context.facilityType -> "DocumentEntry.healthcareFacilityTypeCode" "[DocumentEntry.healthcareFacilityTypeCode](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.2.10) - SOR organization-type binding."
* context.practiceSetting -> "DocumentEntry.practiceSettingCode" "[DocumentEntry.practiceSettingCode](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.2.17) - SOR practice-setting binding."
* context.sourcePatientInfo -> "DocumentEntry.sourcePatientInfo" "[DocumentEntry.sourcePatientInfo](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.2.23)"
* extension[versionid] -> "DocumentEntry.version" "R5 back-port: document version string."


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
* context.facilityType = $sct#554871000005105 "psykiatri"
* context.practiceSetting = $sct#394588006 "børne- og ungdomspsykiatri"
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-DocumentReference.version"
* extension[=].valueString = "1.0.0"

// Metadata instance
Instance: 94e65db8-2f0c-4a2c-a7c9-06a160d59a13
InstanceOf: DkCoreMinimalDocumentReference
Title: "PLR-DK DocumentReference instance of DkCoreMinimalDocumentReference."
Description: "PLR-DK DocumentReference instance of DkCoreMinimalDocumentReference, containing relevant metadata"
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
* context.practiceSetting = $sct#408443003 "almen lægepraksis"
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
* birthDate = "1991-01-02"


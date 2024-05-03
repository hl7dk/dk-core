Profile: DkCoreOrganization
Parent: Organization
Id: dk-core-organization
Title: "Danish Core Organization Profile"
Description: "HL7 Denmark core profile for a danish health organization"
* obeys dk-core-organization-mandatory-identifier
* identifier 1..
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
* identifier contains
    EAN-ID 0..1 and
    SOR-ID 0..1 and
    KOMBIT-ORG-ID 0..1 and
    Ydernummer 0..1 and
    CVR-ID 0..1 and
    Kommunekode 0..1 and
    Regionskode 0..1 and
    ProducentID 0..1
* identifier[EAN-ID] only GLNIdentifier
  * ^short = "GLN identifier, [DA] EAN-nummer"
* identifier[SOR-ID] only SORIdentifier
  * ^short = "[DA] SOR-id"
* identifier[KOMBIT-ORG-ID] only KombitOrgIdentifier
  * ^short = "[DA] Organisationsenheds-id som specificeret af FK-ORG"
* identifier[Ydernummer] ^short = "[DA] Ydernummer"
  * system 1..
  * system = "urn:oid:1.2.208.176.1.4" (exactly)
  * value 1..
* identifier[CVR-ID] only CVRIdentifier
  * ^short = "VAT identification number, [DA] CVR-nummer"
* identifier[Kommunekode] ^short = "[DA] Kommunekode"
  * system 1..
  * system = "http://hl7.dk/fhir/core/CodeSystem/dk-core-municipality-codes" (exactly)
  * value 1..
  * value from MunicipalityCodes (required)
* identifier[Regionskode] ^short = "[DA] Regionskode"
  * system 1..
  * system = "http://hl7.dk/fhir/core/CodeSystem/dk-core-regional-subdivision-codes" (exactly)
  * value 1..
* identifier[ProducentID] only ProducentId
  * ^short = "[DA] Producent Id"
* type from $sor-organization-type (preferred)

Instance: CenterForDiabetes
InstanceOf: DkCoreOrganization
Title: "Center for Diabetes"
Description: "Center for Diabetes"
Usage: #example
* identifier[0].system = "urn:oid:1.2.208.176.1.1"
* identifier[=].value = "633271000016006"
* identifier[+].system = "http://cvr.dk"
* identifier[=].value = "64942212"
* type = $sct#264361005

Instance: CenterForDiabetesTeamDiabetes
InstanceOf: DkCoreOrganization
Title: "Center for Diabetes Team Diabetes"
Description: "Center for Diabetes Team Diabetes"
Usage: #example
* identifier[0].system = "urn:oid:1.2.208.176.1.1"
* identifier[=].value = "1133181000016000"
* identifier[+].system = "http://cvr.dk"
* identifier[=].value = "64942212"
* type = $sct#264361005
* partOf.reference = "Organization/CenterForDiabetes"

Instance: CenterForDiabetesTeamHjerte
InstanceOf: DkCoreOrganization
Title: "Center for Diabetes Team Hjerte"
Description: "Center for Diabetes Team Hjerte"
Usage: #example
* identifier[0].system = "urn:oid:1.2.208.176.1.1"
* identifier[=].value = "1133191000016003"
* identifier[+].system = "http://cvr.dk"
* identifier[=].value = "64942212"
* type = $sct#264361005
* partOf.reference = "Organization/CenterForDiabetes"

Instance: CenterForDiabetesTeamKvalitet
InstanceOf: DkCoreOrganization
Title: "Center for Diabetes Team Kvalitet"
Description: "Center for Diabetes Team Kvalitet"
Usage: #example
* identifier[0].system = "urn:oid:1.2.208.176.1.1"
* identifier[=].value = "1133201000016001"
* identifier[+].system = "http://cvr.dk"
* identifier[=].value = "64942212"
* type = $sct#264361005
* partOf.reference = "Organization/CenterForDiabetes"

Instance: LaegerneHasserisBymidte
InstanceOf: DkCoreOrganization
Title: "LaegerneHasserisBymidte"
Description: "Praktisernede læge i Hasseris, som defineret af SOR"
Usage: #example
* identifier[0].value = "61741000016007"
* identifier[=].system = "urn:oid:1.2.208.176.1.1"
* identifier[+].system = "urn:oid:1.2.208.176.1.4"
* identifier[=].value = "77410"
* name = "Lægerne Hasseris Bymidte"
* telecom.value = "98182233"
* telecom.system = #phone
* type = $sct#394761003

Instance: b08997bb-4476-4dd0-84dd-2e297f809364
InstanceOf: DkCoreOrganization
Title: "MedCom Test Organization"
Description: "MedCom Test Organization with SOR id"
Usage: #example
* identifier[0].system = "urn:oid:1.2.208.176.1.1"
* identifier[=].value = "12345678901"
* identifier[+].system = "http://cvr.dk"
* identifier[=].value = "26919991"
* identifier[+].system = "https://www.gs1.org/gln"
* identifier[=].value = "5798002472264"
* identifier[+].system = "https://kombit.dk/sts/organisation"
* identifier[=].value = "urn:uuid:a107fd1e-9f35-422c-9d1e-add097bbf4a6"
* type = $sct#264372000

Instance: 154b8c96-a061-45bf-9ce4-1947c7c3c283
InstanceOf: DkCoreOrganization
Title: "Producer Test Organization"
Description: "Producer of Lab Results Test Organization"
Usage: #example
* identifier[0].system = "urn:oid:1.2.208.176.1.1"
* identifier[=].value = "12345678901"
* identifier[+].system = "http://medcomfhir.dk/ig/terminology/CodeSystem/MedComProducentID"
* identifier[=].value = "KAF"
* type = $sct#264361005

Invariant: dk-core-organization-mandatory-identifier
Description: "Minimum one identifier shall be of type SOR-ID, KOMBIT-ORG-ID or CVR-ID"
Severity: #error
Expression: "identifier.where(system='urn:oid:1.2.208.176.1.1' or system='https://kombit.dk/sts/organisation' or system='urn:oid:2.16.840.1.113883.2.24.1.1').exists()"

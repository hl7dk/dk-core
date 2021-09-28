Profile: DkCoreOrganization
Parent: Organization
Id: dk-core-organization
Title: "Danish Core Organization Profile"
* ^status = #draft
* obeys dk-core-organization-mandatory-identifier
* identifier 1..
* identifier ^slicing.discriminator[0].type = #value
* identifier ^slicing.discriminator[0].path = "system"
* identifier ^slicing.rules = #open
* identifier contains
    EAN-ID ..1 and
    SOR-ID ..1 and
    KOMBIT-STS-ORG-ID ..1 and
    Ydernummer ..1 and
    CVR-ID ..1 and
    Kommunekode ..1 and
    Regionskode ..1
* identifier[EAN-ID].system 1..
* identifier[EAN-ID].system = "urn:oid:1.3.88" (exactly)
* identifier[EAN-ID].value 1..
* identifier[SOR-ID] only SORIdentifier
* identifier[KOMBIT-STS-ORG-ID] only KombitStsOrgIdentifier
* identifier[Ydernummer].system 1..
* identifier[Ydernummer].system = "urn:oid:1.2.208.176.1.4" (exactly)
* identifier[Ydernummer].value 1..
* identifier[CVR-ID] only CVRIdentifier
* identifier[Kommunekode].system 1..
* identifier[Kommunekode].value 1..
* identifier[Regionskode].system 1..
* identifier[Regionskode].value 1..
* type MS

Invariant: dk-core-organization-mandatory-identifier
Description: "Minimum one identifier shall be of type SOR-ID, KOMBIT-STS-ORG-ID or CVR-ID"
Severity: #error
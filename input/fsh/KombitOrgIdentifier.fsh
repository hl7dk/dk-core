Profile: KombitOrgIdentifier
Parent: Identifier
Id: dk-core-kombit-org-identifier
Title: "Kombit Org Identifier"
Description: "Identifier holding the organization code issued by KOMBIT"
* ^status = #draft
* use = #official (exactly)
* system 1..
* system = "https://kombit.dk/sts/organisation" (exactly)
* value 1..
  * obeys uuid

Invariant: uuid
Description: "General UUID expression"
Severity: #error
Expression: "value.matches('urn:uuid:[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}')"
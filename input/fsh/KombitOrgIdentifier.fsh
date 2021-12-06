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
* value obeys uuid
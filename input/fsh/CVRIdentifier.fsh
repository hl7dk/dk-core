Profile: CVRIdentifier
Parent: Identifier
Id: dk-core-cvr-identifier
Description: "Identifier holding an official company number"
* ^status = #draft
* use = #official (exactly)
* system 1..
* system = "urn:oid:2.16.840.1.113883.2.24.1.1" (exactly)
* value 1..
* value obeys CVR-length

Invariant:   CVR-length
Description: "CVR must be exactly 8 numeric characters long"
Expression:  "value.matches('^[0-9]{8}$')"
Severity:    #error
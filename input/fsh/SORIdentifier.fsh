Profile: SORIdentifier
Parent: Identifier
Id: dk-core-sor-identifier
Title: "SOR Identifier"
Description: "Identifier holding the official SOR identifier for a danish healthcare organization"
* use = #official (exactly)
* system 1..
* system = "urn:oid:1.2.208.176.1.1" (exactly)
* value 1..
  * obeys min-digits-sor
// WARNING: The constraint index in the following rule (e.g., constraint[0]) may be incorrect.
// Please compare with the constraint array in the original definition's snapshot and adjust as necessary.
  * ^constraint.requirements = "SOR Identifiers are at minimum 11 digits long"

Invariant: min-digits-sor
Description: "SOR Identifiers are at minimum 11 digits long. See https://sundhedsdatastyrelsen.dk/-/media/sds/filer/rammer-og-retningslinjer/organisationsregistrering/adgang-til-sor/info-om-opbygningen-af-sor-ider.pdf"
Severity: #error
Expression: "matches('^([0-9]){11,}$')"
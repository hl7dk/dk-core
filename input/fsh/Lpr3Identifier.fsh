Profile: Lpr3Identifier
Parent: Identifier
Id: lpr3-Identifier
Title: "LPR3 Identifier"
Description: "Identifier holding a LPR3 identifier for an organization"
* system 1..
* system = "https://www.esundhed.dk/Registre/Landspatientsregisteret" (exactly)
* value 1..
  * obeys uuidv5
// WARNING: The constraint index in the following rule (e.g., constraint[0]) may be incorrect.
// Please compare with the constraint array in the original definition's snapshot and adjust as necessary.
  * ^constraint.source = "https://scandihealth.github.io/lpr3-docs/"
// WARNING: The constraint index in the following rule (e.g., constraint[0]) may be incorrect.
// Please compare with the constraint array in the original definition's snapshot and adjust as necessary.
  * ^constraint.requirements = "LPR3 episode of care identifiers must conform to a UUIDv5"

Invariant: uuidv5
Description: "LPR3 episode of care identifiers must conform to a UUIDv5"
Severity: #error
Expression: "value.matches('urn:uuid:[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[5][a-fA-F0-9]{3}-[89aAbB][a-fA-F0-9]{3}-[a-fA-F0-9]{12}')"
Invariant: uuidv5
Description: "LPR3 episode of care identifiers must conform to a UUIDv5"
Severity: #error
Expression: "value.matches('urn:uuid:[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[5][a-fA-F0-9]{3}-[89aAbB][a-fA-F0-9]{3}-[a-fA-F0-9]{12}')"
Profile: AuthorizationIdentifier
Parent: Identifier
Id: dk-core-authorization-identifier
Title: "Danish Health Professionals Authorization Identifier"
Description: "Identifier holding the official [authorization identifier](https://en.stps.dk/en/health-professionals-and-authorities/online-register-registered-health-professionals/) for a practitioner."
* system 1..
* system = "https://autregweb.sst.dk" (exactly)
* value 1..
  * obeys authorization-id-format
  * ^maxLength = 5
// WARNING: The constraint index in the following rule (e.g., constraint[0]) may be incorrect.
// Please compare with the constraint array in the original definition's snapshot and adjust as necessary.
  * ^constraint.source = "https://stps.dk/da/autorisation/om-autorisationer/autorisations-id/"

Invariant: authorization-id-format
Description: "Authorization ID consists of exactly 5 consonants and Y and or numbers in any order"
Severity: #error
Expression: "matches('^([b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z0-9]){5}$')"
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
  
Invariant: authorization-id-format
Description: "Authorization ID consists of exactly 5 consonants and Y and or numbers in any order. See https://stps.dk/da/autorisation/om-autorisationer/autorisations-id/"
Severity: #error
Expression: "matches('^([b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z0-9]){5}$')"

Profile: DkCoreCprIdentifier
Parent: Identifier
Id: dk-core-cpr-identifier
Title: "Danish Central Person Register (CPR) Identifier"
Description: "This structure holds the danish [CPR](https://cpr.dk/) identifier"
* use = #official (exactly)
* system 1..
* system = "urn:oid:1.2.208.176.1.2" (exactly)
* value 1..
  * obeys cpr
  * ^maxLength = 10
  * ^mustSupport = false

Invariant: cpr
Description: "Requirement of danish civil registration numbers. See https://cpr.dk/cpr-systemet/opbygning-af-cpr-nummeret/#:~:text=5%20%2D%206%20position%20angiver%20personens,i%20personnummeret%20angiver%20personens%20k%C3%B8n."
Severity: #error
Expression: "value.matches('^((((0[1-9]|1[0-9]|2[0-9]|3[0-1])(01|03|05|07|08|10|12))|((0[1-9]|1[0-9]|2[0-9]|30)(04|06|09|11))|((0[1-9]|1[0-9]|2[0-9])(02)))[0-9]{6})$')"
* requirements = "Requirement of danish civil registration numbers"

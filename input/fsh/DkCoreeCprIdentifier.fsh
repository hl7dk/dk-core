Profile: DkCoreXeCprIdentifier
Parent: Identifier
Id: dk-core-x-ecpr-identifier
Title: "National eCPR service, called X-eCPR"
Description: "This strucure holds the danish [X-eCPR](https://sundhedsdatastyrelsen.dk/da/registre-og-services/ecpr) identifier, maintained by the Danish Health Data Authority."
* use = #temp (exactly)
* system 1..
* system = "urn:oid:1.2.208.176.1.6.1.1" (exactly)
* value 1..
  * obeys x-ecpr
  * ^maxLength = 10
  * ^mustSupport = false

Invariant: x-ecpr
Description: "Requirement of danish X-eCPR. See https://wiki.fmk-teknik.dk/doku.php?id=fmk:ecpr:1.0:definition"
Severity: #error
Expression: "value.matches('^((((0[1-9]|1[0-9]|2[0-9]|3[0-1])(01|03|05|07|08|10|12))|((0[1-9]|1[0-9]|2[0-9]|30)(04|06|09|11))|((0[1-9]|1[0-9]|2[0-9])(02)))([0-9]{2})((1|7){1})([A-Z]{2})([0-9]{1}))$')"

Profile: DkCoreDeCprIdentifier
Parent: Identifier
Id: dk-core-d-ecpr-identifier
Title: "Decentralised eCPR, called D-eCPR"
Description: "This strucure holds the danish [D-eCPR (see p. 32 in 'Fællesindhold for basisregistrering af sygehuspatienter 2019-1: Vejledningsdel (PDF)')](https://sundhedsdatastyrelsen.dk/da/rammer-og-retningslinjer/om-patientregistrering/patientregistrering-feallesindhold) identifier, which is often used by the Danish regions."
* use = #temp (exactly)
* system 1..
* system from DkCoreDeCPRValueSet
* value 1..
  * obeys d-ecpr
  * ^maxLength = 10
  * ^mustSupport = false

Invariant: d-ecpr
Description: "Requirement of danish D-eCPR. See https://sundhedsdatastyrelsen.dk/da/rammer-og-retningslinjer/om-patientregistrering/patientregistrering-feallesindhold"
Severity: #error
Expression: "value.matches('^((((0[1-9]|1[0-9]|2[0-9]|3[0-1])(01|03|05|07|08|10|12))|((0[1-9]|1[0-9]|2[0-9]|30)(04|06|09|11))|((0[1-9]|1[0-9]|2[0-9])(02)))([0-9]{2})((0|5|6){1})([A-Z]{2})([0-9]{1}))$')"

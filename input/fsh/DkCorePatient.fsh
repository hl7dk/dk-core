Profile: DkCorePatient
Parent: Patient
Id: dk-core-patient
Title: "Danish Core Patient Profile"
Description: "HL7 Denmark core profile for a patient"
* obeys marital-status-unknown-usage
// WARNING: The constraint index in the following rule (e.g., constraint[0]) may be incorrect.
// Please compare with the constraint array in the original definition's snapshot and adjust as necessary.
* . ^constraint.source = "https://cpr.dk/borgere/hvad-staar-der-om-mig-i-cpr-registerindsigt/hvad-og-hvem-er-registreret-i-cpr-og-hvem-opdaterer-oplysninger-om-dig-i-cpr/"
// WARNING: The constraint index in the following rule (e.g., constraint[0]) may be incorrect.
// Please compare with the constraint array in the original definition's snapshot and adjust as necessary.
  * ^constraint.requirements = "Marital status is legally unknown in Denmark"
* identifier 1..
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
* identifier contains 
    cpr 0..1 and
    x-ecpr 0..1 and 
    d-ecpr 0..1
* identifier[cpr] only DkCoreCprIdentifier
  * ^short = "[DA] cpr-nummer, som det fremgår af CPR registeret"
* identifier[x-ecpr] only DkCoreXeCprIdentifier
  * ^short = "[DA] X-eCPR, tildelt fra den nationale eCPR service"
* identifier[d-ecpr] only DkCoreDeCprIdentifier
  * ^short = "[DA] D-eCPR, decentral eCPR"
* name ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "use"
  * ^slicing.rules = #open
* name contains official 0..1
* name[official] ^short = "[DA] Officielt navn, som det fremgår af CPR registeret"
  * use 1..
  * use = #official (exactly)
  * family 1..
* address ^definition = "An address for the individual. Danish addresses must comply with directions issued by https://dawa.aws.dk/ and underlying authorities"
  * extension contains
      MunicipalityCodes named municipalityCode 0..1 and
      RegionalSubDivisionCodes named regionalSubDivisionCodes 0..1
  * extension[municipalityCode] ^short = "[DA] Kommunekode"
  * extension[regionalSubDivisionCodes] ^short = "[DA] Regionskode"
* maritalStatus from $dk-marital-status_1 (extensible)
* generalPractitioner ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "identifier.system"
  * ^slicing.rules = #open
* generalPractitioner contains referencedSORUnit 0..*
* generalPractitioner[referencedSORUnit] ^short = "[DA] Praktiserende læges SOR-id på sundhedsinstistutionsniveau"
  * identifier only SORIdentifier

Instance: 283
InstanceOf: DkCorePatient
Title: "Example of valid patient with full address"
Description: "Example of valid patient with full address"
Usage: #example
* identifier.use = #official
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0108589995"
* name.use = #official
* name.family = "Mosebryggersen"
* name.given[0] = "Schwendlund"
* name.given[1] = "Test"
* gender = #male
* birthDate = "1958-08-01"
* address.extension[0].url = "http://hl7.dk/fhir/core/StructureDefinition/dk-core-municipalityCodes"
* address.extension[=].valueCodeableConcept = $dk-core-municipality-codes#0330
* address.extension[+].url = "http://hl7.dk/fhir/core/StructureDefinition/dk-core-RegionalSubDivisionCodes"
* address.extension[=].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-85
* address.use = #home
* address.type = #postal
* address.line = "Nordre Ringgade 3"
* address.city = "Frederiksberg C"
* address.postalCode = "8000"
* address.country = "DK"
* maritalStatus = $v3-MaritalStatus#U "unmarried"
* generalPractitioner.identifier.system = "urn:oid:1.2.208.176.1.1"
* generalPractitioner.identifier.value = "79641000016006"
* generalPractitioner.display = "Peter Sønderby"

Instance: Confidential
InstanceOf: DkCorePatient
Title: "Example of a patient with confidential adress and name"
Description: "Example of a patient with confidential adress and name"
Usage: #example
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">This instance is an example of a Danish citizen who has requested name and address protection (Navne- og adressebeskyttelse), why the instance is marked with a security label. Only personnel using systems in public/official affairs are allowed to see name and address for the citizen, why these information are included in the profile.<p></p><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\">Resource \"Confidential\"</p><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-dk-core-patient.html\">Danish Core Patient Profile</a></p><p style=\"margin-bottom: 0px\">Security Labels: <span title=\"{http://terminology.hl7.org/CodeSystem/v3-Confidentiality http://terminology.hl7.org/CodeSystem/v3-Confidentiality}\">http://terminology.hl7.org/CodeSystem/v3-Confidentiality</span></p></div><p><b>identifier</b>: id: 1502779995</p><p><b>name</b>: Hans Hansen (OFFICIAL)</p><p><b>gender</b>: male</p><p><b>birthDate</b>: 1976-08-09</p><p><b>address</b>: Julianevej 22 6000 Kolding (HOME)</p></div>"
* text.status = #additional
* meta.security.code = $v3-Confidentiality#R
* meta.security.display = "Restricted"
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "1502779995"
* name.use = #official
* name.family = "Berggren"
* name.given[0] = "Ruddi"
* name.given[1] = "Test"
* gender = #male
* birthDate = "1977-02-15"
* address.use = #home
* address.line = "Julianevej 22"
* address.city = "6000 Kolding"

Instance: else
InstanceOf: DkCorePatient
Title: "Example of a woman of childbearing age"
Description: "Example of a woman of childbearing age. Else is a MedCom test-patient"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0201919990"
* name.use = #official
* name.family = "Lauridsen"
* name.given[0] = "Else"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1991-02-02"
* maritalStatus = $v3-MaritalStatus#M "Married"

Instance: john
InstanceOf: DkCorePatient
Title: "Example of valid patient with multiple names"
Description: "Example of valid patient with multiple names"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0201609995"
* name[0].use = #official
* name[=].family = "Meyerhofen"
* name[=].given[0] = "John"
* name[=].given[+] = "Christian"
* name[=].prefix = "Mr"
* name[+].use = #usual
* name[=].given = "Johnny"
* gender = #male
* birthDate = "1960-01-02"
* generalPractitioner.identifier.system = "urn:oid:1.2.208.176.1.1"
* generalPractitioner.identifier.value = "487341000016005"
* generalPractitioner.display = "Charlottenlund Lægehus"

Instance: Max
InstanceOf: DkCorePatient
Title: "Example of valid patient with danish marital status"
Description: "Example of valid patient with danish marital status"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0107729995"
* name.use = #official
* name.family = "Berggren"
* name.given[0] = "Max"
* name.given[1] = "Test"
* name.prefix = "Mr"
* gender = #male
* birthDate = "1972-07-01"
* maritalStatus = $dk-marital-status#P

Instance: ukendt
InstanceOf: DkCorePatient
Title: "Example of valid patient unknown identifier registry"
Description: "Example of valid patient unknown identifier registry. The patient is a 'John Doe' with an Identifier from an unofficial register"
Usage: #example
* identifier.system = "http://rn.dk"
* identifier.value = "0706830VJ9"
* name.use = #temp
* name.family.extension.url = "http://terminology.hl7.org/CodeSystem/data-absent-reason"
* name.family.extension.valueCode = #unknown
* name.given = "Anders"
* gender = #male
* birthDate = "1983-06-07"


Instance: ukendt-D-eCPR
InstanceOf: DkCorePatient
Title: "Example of valid patient with a D-eCPR as identifier"
Description: "Example of valid patient with a D-eCPR as identifier."
Usage: #example
* identifier.system = #urn:oid:1.2.208.176.1.6.1.3.177
* identifier.value = "1206550VK9"
* name.use = #temp
* name.family = "Ukendt"
* name.given = "Peter"
* gender = #male
* birthDate = "1955-06-12"

Instance: ukendt-X-eCPR
InstanceOf: DkCorePatient
Title: "Example of valid patient with a X-eCPR as identifier"
Description: "Example of valid patient with a X-eCPR as identifier."
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.6.1.1"
* identifier.value = "0703921VJ4"
* name.use = #temp
* name.family = "Ukendt"
* name.given = "Mia"
* gender = #female
* birthDate = "1992-03-07"

Invariant: marital-status-unknown-usage
Description: "Status in maritalStatus is unknown in a danish context. Consider mapping the value to UNK"
Severity: #warning
Expression: "maritalStatus.coding.where(code = 'P' and system = 'http://terminology.hl7.org/CodeSystem/v3-MaritalStatus').empty() or maritalStatus.coding.where(code = 'A' and system = 'http://terminology.hl7.org/CodeSystem/v3-MaritalStatus').empty()"
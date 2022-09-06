Profile: DkCorePatient
Parent: Patient
Id: dk-core-patient
Title: "Danish Core Patient Profile"
Description:  "HL7 Denmark core profile for a patient"
* ^version = "0.9.0"
* ^date = "2020-02-04"
* ^publisher = "HL7 Denmark"
* ^contact[0].name = "HL7 Denmark"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "https://www.hl7.dk/"
* ^jurisdiction[0] = urn:iso:std:iso:3166#DK
* ^copyright = "CC-BY-SA-4.0"
* obeys marital-status-unknown-usage
* . ^constraint[5].requirements = "Marital status is legally unknown in Denmark"
* . ^constraint[5].source = "https://cpr.dk/borgere/hvad-staar-der-om-mig-i-cpr-registerindsigt/hvad-og-hvem-er-registreret-i-cpr-og-hvem-opdaterer-oplysninger-om-dig-i-cpr/"
* identifier 1..
* identifier ^slicing.discriminator[0].type = #value
* identifier ^slicing.discriminator[0].path = "system"
* identifier ^slicing.rules = #open
* identifier contains cpr ..1
* identifier[cpr] only DkCoreCprIdentifier
* name 0..
* name ^slicing.discriminator[0].type = #value
* name ^slicing.discriminator[0].path = "use"
* name ^slicing.rules = #open
* name contains official ..1
* name[official].use = #official (exactly)
* name[official].family 1..
* address ^definition = "An address for the individual. Danish addresses must comply with directions issued by https://dawa.aws.dk/ and underlying authorities"
* address.extension ^slicing.discriminator[0].type = #value
* address.extension ^slicing.discriminator[0].path = "url"
* address.extension ^slicing.rules = #open
* address.extension contains
    MunicipalityCodes named municipalityCode 0..1 and
    RegionalSubDivisionCodes named regionalSubDivisionCodes 0..1
* maritalStatus from $dk-marital-status_1 (extensible)
* generalPractitioner ^slicing.discriminator[0].type = #value
* generalPractitioner ^slicing.discriminator[0].path = "identifier.system"
* generalPractitioner ^slicing.rules = #open
* generalPractitioner contains referencedSORUnit 0..*
* generalPractitioner[referencedSORUnit].identifier only SORIdentifier

Invariant: cpr
Description: "Requirement of danish civil registration numbers"
Severity: #error
Expression: "value.matches('^(?:(?:31(?:0[13578]|1[02])|(?:30|29)(?:0[13-9]|1[0-2])|(?:0[1-9]|1[0-9]|2[0-8])(?:0[1-9]|1[0-2]))[0-9]{2}[0-9]|290200[4-9]|2902(?:(?!00)[02468][048]|[13579][26])[0-3])[0-9]{3}$')"


Instance: 283
InstanceOf: DkCorePatient
Title: "Example of valid patient with full address"
Description: "Example of valid patient with full address"
Usage: #example
* identifier[0].use = #official
* identifier[0].system = "urn:oid:1.2.208.176.1.2"
* identifier[0].value = "0506504005"
* name[0].use = #official
* name[0].family = "Lind"
* name[0].given[0] = "Torsteinn"
* gender = #male
* birthDate = "1950-06-04"
* address[0].extension[0].url = "http://hl7.dk/fhir/core/StructureDefinition/dk-core-municipalityCodes"
* address[0].extension[0].valueCodeableConcept = $dk-core-municipality-codes#0330
* address[0].extension[1].url = "http://hl7.dk/fhir/core/StructureDefinition/dk-core-RegionalSubDivisionCodes"
* address[0].extension[1].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-85
* address[0].use = #home
* address[0].type = #postal
* address[0].line[0] = "Nordre Ringgade 3"
* address[0].city = "Frederiksberg C"
* address[0].postalCode = "8000"
* address[0].country = "DK"
* maritalStatus = $v3-MaritalStatus#U "unmarried"
* generalPractitioner[0].identifier.system = "urn:oid:1.2.208.176.1.1"
* generalPractitioner[0].identifier.value = "79641000016006"
* generalPractitioner[0].display = "Peter Sønderby"

Instance: mogensen
InstanceOf: DkCorePatient
Title: "Example of valid patient with danish marital status"
Description: "Example of valid patient with danish marital status"
Usage: #example
* identifier[0].system = "urn:oid:1.2.208.176.1.2"
* identifier[0].value = "1112640001"
* name[0].use = #official
* name[0].family = "Mogensen"
* name[0].given[0] = "Jan"
* name[0].prefix[0] = "Mr"
* gender = #male
* birthDate = "1964-12-11"
* maritalStatus = $dk-marital-status#P "Registreret partnerskab"

Instance: ukendt
InstanceOf: DkCorePatient
Title: "Example of valid patient unknown identifier registry"
Description: "Example of valid patient unknown identifier registry. The patient is a 'John Doe' with an Identifier from an unofficial register"
Usage: #example
* identifier[0].system = "http://rn.dk"
* identifier[0].value = "0706830VJ9"
* name[0].use = #temp
* name[0].family = "Ukendt"
* name[0].given[0] = "Anders"
* gender = #male
* birthDate = "1983-06-07"

Instance: john
InstanceOf: DkCorePatient
Title: "Example of valid patient with multiple names"
Description: "Example of valid patient with multiple names"
Usage: #example
* identifier[0].system = "urn:oid:1.2.208.176.1.2"
* identifier[0].value = "1112640001"
* name[0].use = #official
* name[0].family = "Meyerhofen"
* name[0].given[0] = "John"
* name[0].given[1] = "Christian"
* name[0].prefix[0] = "Mr"
* name[1].use = #usual
* name[1].given[0] = "Johnny"
* gender = #male
* birthDate = "1964-12-11"
* generalPractitioner[0].identifier.system = "urn:oid:1.2.208.176.1.1"
* generalPractitioner[0].identifier.value = "487341000016005"
* generalPractitioner[0].display = "Charlottenlund Lægehus"
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
* identifier 1.. MS
* identifier ^slicing.discriminator[0].type = #value
* identifier ^slicing.discriminator[0].path = "system"
* identifier ^slicing.rules = #open
* identifier contains cpr ..1
* identifier[cpr] only DkCoreCprIdentifier
* name 0.. MS
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
    MunicipalityCodes named municipalityCode 0..* and
    RegionalSubDivisionCodes named regionalSubDivisionCodes 0..*
* maritalStatus from $dk-marital-status_1 (extensible)
* generalPractitioner ^slicing.discriminator[0].type = #value
* generalPractitioner ^slicing.discriminator[0].path = "identifier.system"
* generalPractitioner ^slicing.rules = #open
* generalPractitioner contains referencedSORUnit 0..*
* generalPractitioner[referencedSORUnit].identifier only SORIdentifier
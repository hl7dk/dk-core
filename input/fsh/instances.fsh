Instance: cpr
InstanceOf: NamingSystem
Title: "cpr"
Description: "The Danish civil registration system (\"CPR\") encompasses basic personal data about anyone with a civil registration number. A civil registration number shall be allocated to anyone who: 1) is registered in the national register in Denmark on the grounds of birth or relocation from abroad; 2) is included under Arbejdsmarkedets TillægsPension (ATP); 3) according to the tax authorities, is required to have a civil registration number for the purpose of tax processing in Denmark."
Usage: #definition
* name = "DK Central Person Registry (CPR)"
* status = #active
* kind = #identifier
* date = "1968-04-02"
* publisher = "HL7 Denmark"
* contact.name = "HL7 Denmark"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.hl7.dk/"
* responsible = "CPR-kontoret, Indenrigs- og Sundhedsministeriets departement"
* description = "The Danish civil registration system (\"CPR\") encompasses basic personal data about anyone with a civil registration number. A civil registration number shall be allocated to anyone who: 1) is registered in the national register in Denmark on the grounds of birth or relocation from abroad; 2) is included under Arbejdsmarkedets TillægsPension (ATP); 3) according to the tax authorities, is required to have a civil registration number for the purpose of tax processing in Denmark."
* jurisdiction = urn:iso:std:iso:3166#DK
* uniqueId[0].type = #oid
* uniqueId[=].value = "1.2.208.176.1.2"
* uniqueId[+].type = #uri
* uniqueId[=].value = "http://www.cpr.dk/cpr-systemet"

Instance: sor
InstanceOf: NamingSystem
Title: "sor"
Description: "SOR is provided by the Danish Health Data Authority under the Danish Ministry of Health. The register holds organizations within the Danish health sector, their geographical and virtual addresses as well as codes for their identification and for EDI-communication. Danish Health Data Authority is responsible for issuing and publishing codes to identify organizations across health care sectors and related public and private services. SOR includes organizational data on hospitals, the primary care sector (physiotherapists, general practitioners, dentists etc.) and municipal health service organizations as well as non-health care organizations that need to be able to receive data from the former."
Usage: #definition
* name = "DK Central Healthcare Organization Registry (SOR)"
* status = #active
* kind = #identifier
* date = "2021-03-14T16:56:07+01:00"
* publisher = "HL7 Denmark"
* contact.name = "HL7 Denmark"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.hl7.dk/"
* responsible = "The Health Service's Organizational Register was developed in the National Board of Health in 2006-2007 in cooperation with the regions and MedCom"
* type = $v2-0203#PRN "Provider number"
* description = "SOR is provided by the Danish Health Data Authority under the Danish Ministry of Health. The register holds organizations within the Danish health sector, their geographical and virtual addresses as well as codes for their identification and for EDI-communication. Danish Health Data Authority is responsible for issuing and publishing codes to identify organizations across health care sectors and related public and private services. SOR includes organizational data on hospitals, the primary care sector (physiotherapists, general practitioners, dentists etc.) and municipal health service organizations as well as non-health care organizations that need to be able to receive data from the former."
* jurisdiction = urn:iso:std:iso:3166#DK
* uniqueId[0].type = #oid
* uniqueId[=].value = "urn:oid:1.2.208.176.1.1"
* uniqueId[+].type = #uri
* uniqueId[=].value = "https://sundhedsdatastyrelsen.dk/da/registre-og-services/om-sor"

Instance: HenvisningFraLageTilSygehus
InstanceOf: DkCorePersonServiceRequest
Title: "Henvisning vedr. modermærkekræft"
Description: "Henvisning fra læge til sygehus vedr. mistanke om at John har modermærkekræft"
Usage: #example
* requester = Reference(Organization/LaegerneHasserisBymidte)
* reason.concept.text = "John henvises til onkologisk specialundersøgelse hurtigts muligt pga mistanke om modermærkekræft"
* reason.reference = Reference(Condition/JohnMelanoma)
* subject = Reference(Patient/john)
* authoredOn = "2021-05-01"
* status = #active
* intent = #proposal
* priority = #asap

Instance: dk-marital-status
InstanceOf: ValueSet
Description: "This value set defines the set of codes that can be used to indicate the marital status of a person in Denmark."
Usage: #definition
Title: "DK Core Marital Status"
* experimental = false
* url = "http://hl7.dk/fhir/core/ValueSet/dk-marital-status"
* title = "DK MaritalStatus"
* status = #active
* publisher = "HL7 Denmark"
* contact.name = "HL7 Denmark"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.hl7.dk/"
* description = "This value set defines the set of codes that can be used to indicate the marital status of a person in Denmark."
* jurisdiction = urn:iso:std:iso:3166#DK
* copyright = "CC-BY-SA-4.0"
* compose.include[0].valueSet = "http://hl7.org/fhir/ValueSet/marital-status"
* compose.include[+].system = "http://hl7.dk/fhir/core/CodeSystem/dk-marital-status"
* compose.include[=].concept[0].code = #P
* compose.include[=].concept[=].display = "Registered partnership"
* compose.include[=].concept[=].designation.language = #da
* compose.include[=].concept[=].designation.value = "Registreret partnerskab"
* compose.include[=].concept[+].code = #O
* compose.include[=].concept[=].display = "Dissolved partnership"
* compose.include[=].concept[=].designation.language = #da
* compose.include[=].concept[=].designation.value = "Ophævet partnerskab"
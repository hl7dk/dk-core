Instance: cpr
InstanceOf: NamingSystem
Title: "cpr"
Description: "The Danish civil registration system (\"CPR\") encompasses basic personal data about anyone with a civil registration number. A civil registration number shall be allocated to anyone who: 1) is registered in the national register in Denmark on the grounds of birth or relocation from abroad; 2) is included under Arbejdsmarkedets TillægsPension (ATP); 3) according to the tax authorities, is required to have a civil registration number for the purpose of tax processing in Denmark."
Usage: #definition
* name = "DkCoreDanishCivilRegistrationSystem"
* status = #active
* kind = #identifier
* date = "1968-04-02"
* publisher = "HL7 Denmark"
* contact.name = "HL7 Denmark"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.hl7.dk/"
* responsible = "CPR-kontoret, Økonomi- og Indenrigsministeriets departement"
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
* name = "DkCoreSor"
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
InstanceOf: ServiceRequest
Title: "Henvisning vedr. modermærkekræft"
Description: "Henvisning fra læge til sygehus vedr. mistanke om at John har modermærkekræft"
Usage: #example
* requester = Reference(Organization/LaegerneHasserisBymidte)
* reasonCode.text = "John henvises til onkologisk specialundersøgelse hurtigts muligt pga mistanke om modermærkekræft"
* reasonReference = Reference(Condition/JohnMelanoma)
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

Instance: sor-organization-type
InstanceOf: ValueSet
Description: "Value set used for indicating the organization type for organizations from SOR"
Title: "DK Core SOR Organization Type"
Usage: #definition
* experimental = false
* url = "http://hl7.dk/fhir/core/ValueSet/sor-organization-type"
* name = "SorOrganizationType"
* status = #active
* title = "DK SOR Organization Type"
* description = "Value set used for indicating the organization type for organizations from SOR"
* copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* compose.include[0].system = "http://snomed.info/sct"
* compose.include[=].version = "http://snomed.info/sct/554471000005108"
* compose.include[=].concept[0].code = #554221000005108
* compose.include[=].concept[=].display = "Dwilling place"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Dwilling place"
* compose.include[=].concept[+].code = #546821000005103
* compose.include[=].concept[=].display = "Occupational therapy clinic"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Occupational therapy clinic"
* compose.include[=].concept[+].code = #547011000005103
* compose.include[=].concept[=].display = "Physiotherapy clinic"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Physiotherapy clinic"
* compose.include[=].concept[+].code = #546811000005109
* compose.include[=].concept[=].display = "Rehabilitation center"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Rehabilitation center"
* compose.include[=].concept[+].code = #550621000005101
* compose.include[=].concept[=].display = "District nursing"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "District nursing"
* compose.include[=].concept[+].code = #550631000005103
* compose.include[=].concept[=].display = "Midwife clinic"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Midwife clinic"
* compose.include[=].concept[+].code = #550641000005106
* compose.include[=].concept[=].display = "Chiropractic clinic"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Chiropractic clinic"
* compose.include[=].concept[+].code = #550651000005108
* compose.include[=].concept[=].display = "Medical laboratory"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Medical laboratory"
* compose.include[=].concept[+].code = #550661000005105
* compose.include[=].concept[=].display = "Emergency medical service"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Emergency medical service"
* compose.include[=].concept[+].code = #554211000005102
* compose.include[=].concept[=].display = "Prehospital unit"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Prehospital unit"
* compose.include[=].concept[+].code = #550711000005101
* compose.include[=].concept[=].display = "Psychological counseling clinic"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Psychological counseling clinic"
* compose.include[=].concept[+].code = #550671000005100
* compose.include[=].concept[=].display = "Medical specialist practice site"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Medical specialist practice site"
* compose.include[=].concept[+].code = #554061000005105
* compose.include[=].concept[=].display = "Chiropodist clinic"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Chiropodist clinic"
* compose.include[=].concept[+].code = #554041000005106
* compose.include[=].concept[=].display = "Health administration"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Health administration"
* compose.include[=].concept[+].code = #554021000005101
* compose.include[=].concept[=].display = "Health visitors"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Health visitors"
* compose.include[=].concept[+].code = #550681000005102
* compose.include[=].concept[=].display = "dental practice"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Dental practice"
* compose.include[=].concept[+].code = #550691000005104
* compose.include[=].concept[=].display = "Dental care clinic"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Dental care clinic"
* compose.include[=].concept[+].code = #550701000005104
* compose.include[=].concept[=].display = "Dental technician clinic"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Dental technician clinic"
* compose.include[=].concept[+].code = #554231000005106
* compose.include[=].concept[=].display = "Vaccination clinic"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Vaccination clinic"
* compose.include[=].concept[+].code = #554051000005108
* compose.include[=].concept[=].display = "Reflexology clinic"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Reflexology clinic"
* compose.include[=].concept[+].code = #550811000005108
* compose.include[=].concept[=].display = "Administrative unit"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Administrative unit"
* compose.include[=].concept[+].code = #547211000005108
* compose.include[=].concept[=].display = "Municipality"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Municipality"
* compose.include[=].concept[+].code = #550891000005100
* compose.include[=].concept[=].display = "Private"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Private"
* compose.include[=].concept[+].code = #550881000005103
* compose.include[=].concept[=].display = "Region"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Region"
* compose.include[=].concept[+].code = #550411000005105
* compose.include[=].concept[=].display = "Other health institution"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Other health institution"
* compose.include[=].concept[+].code = #554851000005102
* compose.include[=].concept[=].display = "Asylum centre"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Asylum centre"
* compose.include[=].concept[+].code = #550861000005106
* compose.include[=].concept[=].display = "Physiotherapy and occupational clinic"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Physiotherapy and occupational clinic"
* compose.include[=].concept[+].code = #554881000005108
* compose.include[=].concept[=].display = "Handicap and psychiatry"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Handicap and psychiatry"
* compose.include[=].concept[+].code = #554861000005100
* compose.include[=].concept[=].display = "Handicap"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Handicap"
* compose.include[=].concept[+].code = #554821000005109
* compose.include[=].concept[=].display = "Home care"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Home care"
* compose.include[=].concept[+].code = #554411000005101
* compose.include[=].concept[=].display = "Employment agency"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Employment agency"
* compose.include[=].concept[+].code = #554871000005105
* compose.include[=].concept[=].display = "Psychiatry"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Psychiatry"
* compose.include[=].concept[+].code = #550821000005102
* compose.include[=].concept[=].display = "Service unit"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Service unit"
* compose.include[=].concept[+].code = #550871000005101
* compose.include[=].concept[=].display = "Emergency admission unit"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Emergency admission unit"
* compose.include[=].concept[+].code = #554241000005103
* compose.include[=].concept[=].display = "Technical location number"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Technical location number"
* compose.include[=].concept[+].code = #550841000005107
* compose.include[=].concept[=].display = "Research unit"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Research unit"
* compose.include[=].concept[+].code = #550851000005109
* compose.include[=].concept[=].display = "Clinical unit"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Clinical unit"
* compose.include[=].concept[+].code = #551611000005102
* compose.include[=].concept[=].display = "Surgical ward"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Surgical ward"
* compose.include[=].concept[+].code = #554071000005100
* compose.include[=].concept[=].display = "Hospital pharmacy"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Hospital pharmacy"
* compose.include[=].concept[+].code = #550831000005104
* compose.include[=].concept[=].display = "Education unit"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Education unit"
* compose.include[=].concept[+].code = #554031000005103
* compose.include[=].concept[=].display = "dietician clinic"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Dietician clinic"
* compose.include[=].concept[+].code = #557511000005107
* compose.include[=].concept[=].display = "Acupuncture clinic"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Acupuncture clinic"
* compose.include[=].concept[+].code = #557501000005109
* compose.include[=].concept[=].display = "Pharmacy branch"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Pharmacy branch"
* compose.include[=].concept[+].code = #557531000005103
* compose.include[=].concept[=].display = "Prosthetist clinic"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Prosthetist clinic"
* compose.include[=].concept[+].code = #557591000005104
* compose.include[=].concept[=].display = "Web-based care"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Web-based care"
* compose.include[=].concept[+].code = #557521000005101
* compose.include[=].concept[=].display = "Alternative treatment clinic"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Alternative treatment clinic"
* compose.include[=].concept[+].code = #557561000005105
* compose.include[=].concept[=].display = "Consulting firm"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Consulting firm"
* compose.include[=].concept[+].code = #557541000005106
* compose.include[=].concept[=].display = "Cosmetic treatment clinic"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Cosmetic treatment clinic"
* compose.include[=].concept[+].code = #557581000005102
* compose.include[=].concept[=].display = "Optometrist or optician clinic"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Optometrist or optician clinic"
* compose.include[=].concept[+].code = #556841000005105
* compose.include[=].concept[=].display = "Social psychological counseling"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Social psychological counseling"
* compose.include[=].concept[+].code = #557671000005101
* compose.include[=].concept[=].display = "Osteopathy clinic"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Osteopathy clinic"
* compose.include[+].system = "http://snomed.info/sct"
* compose.include[=].concept[0].code = #398070004
* compose.include[=].concept[=].display = "State"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "State"
* compose.include[=].concept[+].code = #394761003
* compose.include[=].concept[=].display = "General practitioner practice site"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "General practitioner practice site"
* compose.include[=].concept[+].code = #20078004
* compose.include[=].concept[=].display = "Substance abuse treatment center"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Substance abuse treatment center"
* compose.include[=].concept[+].code = #722173008
* compose.include[=].concept[=].display = "Prison based care site"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Prison based care site"
* compose.include[=].concept[+].code = #702871004
* compose.include[=].concept[=].display = "Infertility clinic"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Infertility clinic"
* compose.include[=].concept[+].code = #276037005
* compose.include[=].concept[=].display = "Volunteer helper"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Volunteer helper"
* compose.include[=].concept[+].code = #22232009
* compose.include[=].concept[=].display = "Hospital"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Hospital"
* compose.include[=].concept[+].code = #702824005
* compose.include[=].concept[=].display = "Audiology clinic"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Audiology clinic"
* compose.include[=].concept[+].code = #42665001
* compose.include[=].concept[=].display = "Nursing home"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Nursing home"
* compose.include[=].concept[+].code = #264361005
* compose.include[=].concept[=].display = "Health centre"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Health centre"
* compose.include[=].concept[+].code = #703069008
* compose.include[=].concept[=].display = "Nurse practitioner clinic"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Nurse practitioner clinic"
* compose.include[=].concept[+].code = #309964003
* compose.include[=].concept[=].display = "Radiology department"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Radiology department"
* compose.include[=].concept[+].code = #309904001
* compose.include[=].concept[=].display = "Intensive care unit"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Intensive care unit"
* compose.include[=].concept[+].code = #309939001
* compose.include[=].concept[=].display = "Palliative care department"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Palliative care department"
* compose.include[=].concept[+].code = #225728007
* compose.include[=].concept[=].display = "Accident and Emergency department"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Accident and Emergency department"
* compose.include[=].concept[+].code = #255203001
* compose.include[=].concept[=].display = "Additional values"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Additional values"
* compose.include[=].concept[+].code = #264372000
* compose.include[=].concept[=].display = "Pharmacy"
* compose.include[=].concept[=].designation.language = #en-US
* compose.include[=].concept[=].designation.value = "Pharmacy"
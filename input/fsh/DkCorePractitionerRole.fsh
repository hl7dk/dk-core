Profile: DkCorePractitionerRole
Parent: PractitionerRole
Id: dk-core-practitioner-role
Title: "Danish Core PractitionerRole Profile"
Description: "HL7 Denmark core profile for health professional roles"
* organization only Reference(DkCoreOrganization)
* practitioner only Reference(DkCorePractitioner)
* location only Reference(DkCoreLocation) 


Mapping: DkCorePractitionerRoleToSor
Source: DkCorePractitionerRole
Target: "https://www.nspop.dk/display/public/web/SOR"
Title: "SOR (Sundhedsvæsenets Organisationsregister)"
Id: dk-core-practitionerrole-sor
* -> "SOR practitioner-at-unit" "**A health professional performing a role at a SOR-registered organizational unit.** Complements the DkCoreOrganization mapping (SOR unit) and the DkCorePractitioner mapping (Autorisationsregisteret)."
* practitioner -> "Autoriseret sundhedsperson" "Reference to the DkCorePractitioner performing the role."
* organization -> "SOR enhed" "Reference to the DkCoreOrganization (SOR-unit) where the role is performed."
* location -> "Fysisk lokation" "Physical site of service delivery."
* code -> "Rollekode" "Role the practitioner performs at the SOR unit."
* specialty -> "Speciale" "SNOMED CT speciality (e.g. `408443003` = almen lægepraksis)."
* availableTime -> "Åbningstider" "Practitioner availability at the SOR unit."


Instance: AbrahamPractitionerRole
InstanceOf: DkCorePractitionerRole
Title: "Licensed physician in primary care"
Description: "This is an example of PractitionerRole profile. The example describes the service which practitioner is performing in a specific location in a specific role."
Usage: #example
* active = true
* practitioner = Reference(AbrahamLaege)
* organization = Reference(CenterForDiabetes)
* code = http://terminology.hl7.org/CodeSystem/v2-0286#PP
* specialty = http://snomed.info/sct/554471000005108#408443003
//* location = Reference(LocationExample)
* availableTime[0].daysOfWeek[0] = #mon
* availableTime[=].daysOfWeek[+] = #tue
* availableTime[=].daysOfWeek[+] = #wed
* availableTime[=].availableStartTime = "09:00:00"
* availableTime[=].availableEndTime = "15:30:00"
* availableTime[+].daysOfWeek[0] = #thu
* availableTime[=].daysOfWeek[+] = #fri
* availableTime[=].availableStartTime = "09:00:00"
* availableTime[=].availableEndTime = "12:00:00"

Instance: PlaceholderPractitionerRole
InstanceOf: DkCorePractitionerRole
Title: "Placeholder for a physician"
Description: "This is an example of PractitionerRole where it acts as a placeholder for an unknown person. This may be useful in several scenarios."
Usage: #example
* active = true
* organization = Reference(CenterForDiabetes)
* code = http://terminology.hl7.org/CodeSystem/v2-0286#PP
* specialty = http://snomed.info/sct/554471000005108#408443003
Profile: DkCoreLocation
Parent: Location
Id: dk-core-location
Title: "Danish Core Location Profile"
Description: "HL7 Denmark core profile for locations"
* managingOrganization only Reference(DkCoreOrganization)
* partOf only Reference(DkCoreLocation)

Instance: ambulance
InstanceOf: DkCoreLocation
Usage: #example
* status = #active
* description = "Ambulance provided by Acme Corp"
* mode = #kind
* type = http://terminology.hl7.org/CodeSystem/v3-RoleCode#AMB "Ambulance"
* contact.telecom.system = #phone
* contact.telecom.value = "+4523292833"
* contact.telecom.use = #mobile
* form = http://terminology.hl7.org/CodeSystem/location-physical-type#ve "Vehicle"
* managingOrganization = Reference(Organization/b08997bb-4476-4dd0-84dd-2e297f809364)


Instance: neuroradiologyUnit
InstanceOf: DkCoreLocation
Usage: #example
* status = #active
* name = "Neuro unit"
* mode = #instance
* type = http://terminology.hl7.org/CodeSystem/v3-RoleCode#RNEU "Neuroradiology unit"
* contact.telecom.system = #phone
* contact.telecom.value = "+4523292329"
* form = http://terminology.hl7.org/CodeSystem/location-physical-type#ro "Room"
* managingOrganization = Reference(Organization/CenterForDiabetesTeamKvalitet)
* partOf = Reference(Location/ambulance)

Profile: DkCoreEncounter
Parent: Encounter
Id: dk-core-encounter
Title: "Danish Core Encounter Profile"
Description: "HL7 Denmark core profile for an encounter"
* extension contains
    PlannedStartDate named plannedStartDate 0..1 and
    PlannedEndDate named plannedEndDate 0..1 and
    CareProvider named careProvider 0..1
* extension[plannedStartDate] ^short = "The planned start date/time (or admission date) of the encounter"
* extension[plannedEndDate] ^short = "The planned end date/time (or discharge date) of the encounter"
* extension[careProvider] ^short = "The organization (facility) responsible for the care of the patient during this encounter"
* priority from DkCoreEncounterPriority (extensible)
* subject only Reference(DkCorePatient)
* serviceProvider only Reference(DkCoreOrganization)

Instance: 0c5e4905-5c2e-4254-8837-770c3724cd13
InstanceOf: DkCoreEncounter
Title: "An open-ended (ongoing) inpatient encounter"
Description: "Encounter is happening on a surgery department on a hospital"
Usage: #example
* extension[0].url = "http://hl7.dk/fhir/core/StructureDefinition/dk-core-planned-start-date"
* extension[=].valueDateTime = "2025-11-14T09:00:00.0000+01:00"
* extension[+].url = "http://hl7.dk/fhir/core/StructureDefinition/dk-core-planned-end-date"
* extension[=].valueDateTime = "2025-11-15"
* extension[+].url = "http://hl7.dk/fhir/core/StructureDefinition/dk-core-care-provider"
* extension[=].valueReference.reference = "Organization/19f9ee18-7677-4caf-88fe-8f6df2f2906e"
* status = #in-progress
* class.system = "http://terminology.hl7.org/CodeSystem/v3-ActCode"
* class.code = #IMP
* subject.reference = "Patient/283"
* period.start = "2025-11-14T08:50:00.0000+01:00"
* serviceProvider.reference = "Organization/8510eec9-180b-4e9c-95b6-02fad9f853d3"

Instance: 915a3cfb-2f3e-477b-8a9d-5d86c30e4929
InstanceOf: DkCoreEncounter
Title: "A closed inpatient encounter"
Description: "Encounter happened on a surgery department on a hospital"
Usage: #example
* extension[0].url = "http://hl7.dk/fhir/core/StructureDefinition/dk-core-care-provider"
* extension[=].valueReference.reference = "Organization/19f9ee18-7677-4caf-88fe-8f6df2f2906e"
* status = #finished
* class.system = "http://terminology.hl7.org/CodeSystem/v3-ActCode"
* class.code = #IMP
* subject.reference = "Patient/john"
* period.start = "2022-04-27T08:50:00.0000+01:00"
* period.end = "2022-04-28T14:00:00.0000+01:00"
* diagnosis[0].condition.reference = "Condition/JohnFracture"
* diagnosis[=].rank = 1
* diagnosis[+].condition.reference = "Condition/JohnDiabetes"
* diagnosis[=].rank = 2
* serviceProvider.reference = "Organization/8510eec9-180b-4e9c-95b6-02fad9f853d3"
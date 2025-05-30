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
* diagnosis 0..*
* diagnosis ^short = "The list of diagnosis relevant to this encounter"
* diagnosis.condition 1..1
* diagnosis.condition only Reference(DkCoreCondition)
* diagnosis.use 0..1
* diagnosis.use from DkCoreDiagnosisRole (preferred)
* serviceProvider only Reference(DkCoreOrganization)
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
* extension[careProvider] ^short = "The organization (facility) reponsible for the care of the patient during this encounter"
* priority from DkCoreEncounterPriority (required)
* subject only Reference(DkCorePatient)
* serviceProvider only Reference(DkCoreOrganization)
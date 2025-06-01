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
* diagnosis ^slicing.discriminator.type = #value
* diagnosis ^slicing.discriminator.path = "use"
* diagnosis ^slicing.rules = #open
* diagnosis ^slicing.description = "Slicing based on diagnosis use"
* diagnosis contains
    primary 0..1 and
    secondary 0..*
* diagnosis[primary].condition only Reference(DkCoreCondition)
* diagnosis[primary].use from DkCoreDiagnosisRole (required)
* diagnosis[primary].use = #PRIMARY
* diagnosis[secondary].condition only Reference(DkCoreCondition)
* diagnosis[secondary].use from DkCoreDiagnosisRole (required)
* diagnosis[secondary].use = #SECONDARY
* serviceProvider only Reference(DkCoreOrganization)
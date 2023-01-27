Profile: DkCoreObservation
Parent: Observation
Id: dk-core-observation
Title: "Danish Core Observation Profiles"
Description: "HL7 Denmark core profile for observations"
* code.coding ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
* code.coding contains
    LOINC 0..1 and
    SNOMEDCT 0..1 and
    NPU 0..1 and
    KiAP 0..1 and
    MedCom 0..1
* code.coding[LOINC] 
  * ^short = "LOINC code for the observation"
  * system 1..
  * system = "http://loinc.org" (exactly)
  * code 1..
* code.coding[SNOMEDCT]
  * ^short = "SNOMED CT code for the observation"
  * system 1..
  * system = "https://www.snomed.org/" (exactly)
  * code 1..
* code.coding[NPU]
  * ^short = "NPU code for the observation. NPU codes are administred by the Danish Health Data Authority." 
  * system 1..
  * system = "https://labterm.dk/" (exactly)
  * code 1..
* code.coding[KiAP] 
  * ^short = "[DA] Kvalitet i Almen Praksis."
  * system 1..
  * system = "https://kiap.dk/" (exactly)
  * code 1..
* code.coding[MedCom] 
  * ^short = "MedCom code for the observation. MedCom codes are administred by the MedCom). These codes are prefixed with 'MC'."
  * system 1..
  * system = "https://www.medcom.dk/" (exactly)
  * code 1..
* subject only Reference(DkCorePatient)
* performer only Reference(DkCorePractitioner or DkCoreOrganization or DkCorePatient or PractitionerRole or CareTeam or RelatedPerson)
* device ^short = "The device used for the measurement. It is recommended that when information about the device is sent, it is contained in the same Bundle as the Observation the device measured."
* valueQuantity.system = $ucum

Profile: DkCoreObservationVitalSigns
Parent: dk-core-observation
Id: dk-core-observation-vitalsigns
Title: "Danish Core Observation Profile for Vital Signs"
Description: "HL7 Denmark core profile for observations of vital signs"
* category 1..1
* category = #vital-signs
* code.coding[LOINC] 
  * code from http://hl7.dk/fhir/core/ValueSet/dk-core-LoincVitalSigns (preferred)


/* Instance: ObservationBloodPressureNPU
InstanceOf: DkCoreObservationVitalSignsNPU
Title: "John's blood pressure measurement"
Description: "John, blood pressure measurement, NPU-code"
Usage: #example 
[Add content here]
*/

/* Instance: ObservationBloodPressureLOINC
InstanceOf: DkCoreObservationVitalSignsLOINC
Title: "John's blood pressure measurement"
Description: "John, blood pressure measurement, LOINC-code derived from NPU-code"
Usage: #example 
[Add content here]
*/

Instance: ObservationHeightVitalSigns
InstanceOf: DkCoreObservationVitalSigns
Title: "John's Respiratory rate measurement, Vital Signs"
* category = #vital-signs
* status = #final
* code = $LOINC#9279-1 "Respiratory rate"
* valueQuantity.value = 50
* valueQuantity.code = #{Breaths}/min
* valueQuantity.system = $ucum
* valueQuantity.unit = "Breaths / minute"

Instance: ObservationHeightNPU
InstanceOf: DkCoreObservation
Title: "John's height measurement"
* status = #final
* code = $NPU#NPU03794 "Legeme højde;Pt"
* valueQuantity.value = 1.80
* valueQuantity.code = #m
* valueQuantity.system = $ucum
* valueQuantity.unit = "m" 
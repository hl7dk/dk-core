/* Profile: DkCoreObservationVitalSigns
Parent: dk-core-observation
Id: dk-core-observation-vitalsigns
Title: "Danish Core Observation Profile for Vital Signs"
Description: "HL7 Denmark core profile for observations of vital signs"
* category 1..1
* category = #vital-signs
* code.coding[LOINC] 
  * code from http://hl7.dk/fhir/core/ValueSet/dk-core-LoincVitalSigns (preferred)
 */

/* Instance: ObservationBloodPressureNPU
InstanceOf: DkCoreObservationVitalSignsNPU
Title: "John's blood pressure measurement"
Description: "John, blood pressure measurement, NPU-code"
Usage: #example 
[Add content here]
*/



/* Instance: ObservationHeightVitalSigns
InstanceOf: DkCoreObservationVitalSigns
Title: "John's Respiratory rate measurement, Vital Signs"
* category = #vital-signs
* status = #final
* code.coding[LOINC] = $LOINC#9279-1 "Respiratory rate"
* valueQuantity.value = 50
* valueQuantity.code = #{Breaths}/min
* valueQuantity.system = $ucum
* valueQuantity.unit = "Breaths / minute"
* subject = Reference(john)
* performer = Reference(AbrahamLaege) */


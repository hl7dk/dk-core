Profile: DkCoreBasicParameter
Parent: dk-core-observation
Id: dk-core-basic-parameter
Title: "Danish Core Profile for Basic Parameters"
Description: "HL7 Denmark core profile for basic parameters, which is a profiling of DkCoreObservation."
* category 1..1
* category = #vital-signs
* code.coding[LOINC] 1..
* code.coding[LOINC] from $LOINC-vitalsigns


/* Instance: ObservationBloodPressureNPU
InstanceOf: DkCoreBasicParameter
Title: "John's blood pressure measurement"
Description: "John, blood pressure measurement, NPU-code"
Usage: #example 
[Add content here]
*/



/* Instance: ObservationHeightVitalSigns
InstanceOf: DkCoreBasicParameter
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


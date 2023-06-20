Profile: DkCoreBasicParameter
Parent: dk-core-observation
Id: dk-core-basic-parameter
Title: "Danish Core Basic Parameters"
Description: "HL7 Denmark core profile for basic parameters, which is a profiling of DkCoreObservation."
* category 1..1
* category = #vital-signs
* code.coding[LOINC] 1..
* code.coding[LOINC] from LoincBasicParameter (extensible)
* code.coding[SNOMEDCT] from SCTBasicParameter (extensible)
* code.coding[NPU] from NPUBasicParameter (extensible)
* code.coding[IEEE] from IEEEBasicParameter (extensible)
* valueQuantity.system from UCUMBasicUnits (extensible)
* component.valueQuantity.system from UCUMBasicUnits (extensible)



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


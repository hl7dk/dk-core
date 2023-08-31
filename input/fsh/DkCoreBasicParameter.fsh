Profile: DkCoreBasicParameter
Parent: dk-core-observation
Id: dk-core-basic-parameter
Title: "Danish Core Basic Parameters"
Description: "HL7 Denmark core profile for basic parameters, which is a profiling of DkCoreObservation."
* category 1..1
* category = $observation-category#vital-signs
* code.coding[LOINC] 1..
* code.coding[LOINC] from LoincBasicParameter (extensible)
* code.coding[SNOMEDCT] from SCTBasicParameter (extensible)
* code.coding[NPU] from NPUBasicParameter (extensible)
* code.coding[IEEE] from IEEEBasicParameter (extensible)
* valueQuantity.system from UCUMBasicUnits (extensible)
* component.valueQuantity.system from UCUMBasicUnits (extensible)



Instance: ObservationRespiratoryBasicParameter
InstanceOf: DkCoreBasicParameter
Title: "John's Respiratory rate measurement (Basic parameter)"
Description: "A simple basic-parameter observation of a hyperventilating patient"
Usage: #example
* category = $observation-category#vital-signs
* status = #final
* code.coding[LOINC] = $LOINC#9279-1 "Respiratory rate"
* valueQuantity.value = 50
* valueQuantity.code = #{Breaths}/min
* valueQuantity.system = $ucum
* valueQuantity.unit = "Breaths / minute"
* subject = Reference(john)
* performer = Reference(AbrahamLaege)

Instance: ObservationOxySatBasicParameterOrg
InstanceOf: DkCoreBasicParameter
Title: "John's oxygen saturation measurement (Basic parameter)"
Usage: #inline
* category = $observation-category#vital-signs
* status = #final
* code.coding[LOINC] = $LOINC#2708-6 "Oxygen saturation in Arterial blood"
* code.coding[IEEE] = $IEEEx73#150456 "MDC_PULS_OXIM_SAT_O2"
* valueQuantity.value = 97.0
* valueQuantity.code = #%
* valueQuantity.system = $ucum
* valueQuantity.unit = "%"
* subject = Reference(john)
* performer = Reference(AbrahamLaege)

Instance: ObservationOxySatBasicParameter
InstanceOf: DkCoreBasicParameter
Title: "John's oxygen saturation measurement (Basic parameter)"
Description: """
This example suggests a way to handle the oxygen saturation case, where the original measurement
was reported in '%' by a device or typed in manually, and then 'translated' to the NPU system,
which requires the value to be unitless.
"""
Usage: #example
* category = $observation-category#vital-signs
* status = #final
* code.coding[LOINC] = $LOINC#2708-6 "Oxygen saturation in Arterial blood"
* code.coding[NPU] = $NPU#NPU27280 "Hb(Fe; O₂-bind.;aB)—Oxygen(O₂); sat.(Pulse oximetry) = ?"
* valueQuantity.value = 0.97
* valueQuantity.code = #1
* valueQuantity.system = $ucum
* subject = Reference(john)
* performer = Reference(AbrahamLaege)
* contained[0] = ObservationOxySatBasicParameterOrg
* derivedFrom = Reference(ObservationOxySatBasicParameterOrg)

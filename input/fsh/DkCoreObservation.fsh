Profile: DkCoreObservationVitalSignsNPU
Parent: Observation //??? 
Id: dk-core-observation-vs
Title: "Danish Core Observation Profile for Vital Signs"
Description: "HL7 Denmark core profile for observations of vital signs"
// * code [ValueSet for NPU-koder]
// * method (indsnævret valueset?)
// * Category includeres?

Profile: DkCoreObservationVitalSignsLOINC
Parent: http://hl7.org/fhir/StructureDefinition/vitalsigns //??? 
Id: dk-core-observation-vs-loinc
Title: "Danish Core Observation Profile for Vital Signs"
Description: "HL7 Denmark core profile for observations of vital signs"
// * code [Slice 1: ValueSet for LOINC-koder, indsnævret ift. HL7s, slice 2: NPU-koder, slice 3: valgfri kode??]
// * Category includeres?
// * method (indsnævret valueset?)
// * derivedFrom 



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
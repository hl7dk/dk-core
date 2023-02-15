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
    IEEE 0..1 and
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
  * system = "urn:oid:1.2.208.176.2.1" (exactly)
  * code 1..
* code.coding[MedCom] 
  * ^short = "MedCom code for the observation. MedCom codes are administred by the MedCom. These codes are prefixed with 'MCS'."
  * system 1..
  * system = "https://www.medcom.dk/" (exactly)
  * code 1..
* code.coding[IEEE] 
  * ^short = "IEEE code for the observation"
  * system 1..
  * system = "urn:iso:std:iso:11073:10101" (exactly)
  * code 1..
* subject only Reference(DkCorePatient or Group or Location or Device)
* subject 1..
* performer only Reference(DkCorePractitioner or DkCoreOrganization or DkCorePatient or PractitionerRole or CareTeam or RelatedPerson)
* performer 1..
* device ^short = "The device used for the measurement. It is recommended that when information about the device is sent, it is contained in the same Bundle as the Observation the device measured."
* valueQuantity.system = $ucum
* component.code.coding ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
* component.code.coding contains
    LOINC 0..1 and
    SNOMEDCT 0..1 and
    NPU 0..1 and
    IEEE 0..1 and
    MedCom 0..1
* component.code.coding[LOINC] 
  * ^short = "LOINC code for the observation"
  * system 1..
  * system = "http://loinc.org" (exactly)
  * code 1..
* component.code.coding[SNOMEDCT]
  * ^short = "SNOMED CT code for the observation"
  * system 1..
  * system = "https://www.snomed.org/" (exactly)
  * code 1..
* component.code.coding[NPU]
  * ^short = "NPU code for the observation. NPU codes are administred by the Danish Health Data Authority." 
  * system 1..
  * system = "urn:oid:1.2.208.176.2.1" (exactly)
  * code 1..
* component.code.coding[MedCom] 
  * ^short = "MedCom code for the observation. MedCom codes are administred by the MedCom. These codes are prefixed with 'MCS'."
  * system 1..
  * system = "https://www.medcom.dk/" (exactly)
  * code 1..
* component.code.coding[IEEE] 
  * ^short = "IEEE code for the observation"
  * system 1..
  * system = "urn:iso:std:iso:11073:10101" (exactly)
  * code 1..

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



Instance: ObservationHeightVitalSigns
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
* performer = Reference(AbrahamLaege)

Instance: ObservationHeightNPU
InstanceOf: DkCoreObservation
Title: "John's height measurement"
* status = #final
* code.coding[NPU] = $NPU#NPU03794 "Legeme højde;Pt"
* valueQuantity.value = 1.80
* valueQuantity.code = #m
* valueQuantity.system = $ucum
* valueQuantity.unit = "m" 
* subject = Reference(john)
* performer = Reference(AbrahamLaege)

Instance: ObservationBloodPressureNPU
InstanceOf: DkCoreObservation
Title: "John's blood pressure measurement"
Description: "John, blood pressure measurement, NPU-code"
* device = Reference(ObservingDevice)
* status = #registered
* code.coding[NPU]
  * system = "urn:oid:1.2.208.176.2.1"
  * code = #DNK05462
  * display = "Arm—Blodtryk(diastolisk); tryk(liggende) = ? mmHg"
* subject = Reference(john)
* performer = Reference(AbrahamLaege)

Instance: ObservingDevice
InstanceOf: Device
Title: "The device that performed the observation"
* deviceName.name = "Blood Pressure Device"
* deviceName.type = #user-friendly-name
* serialNumber = "74E8FFFEFF051C00.001C05FFE874"
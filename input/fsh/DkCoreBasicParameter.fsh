Profile: DkCoreBasicObservation
Parent: dk-core-observation
Id: dk-core-basic-observation
Title: "Danish Core Basic Observations"
Description: "HL7 Denmark core profile for basic observations, which is a profiling of DkCoreObservation."
* category 1..1
* category = $observation-category#vital-signs
* code.coding[LOINC] 1..
* code.coding[LOINC] from LoincBasicObservation (extensible)
* code.coding[SNOMEDCT] from SCTBasicObservation (extensible)
* code.coding[NPU] from NPUBasicObservation (extensible)
* code.coding[IEEE] from IEEEBasicObservation (extensible)
* valueQuantity.system from UCUMBasicUnits (extensible)
* component.valueQuantity.system from UCUMBasicUnits (extensible)



Instance: ObservationRespiratoryBasicObservation
InstanceOf: DkCoreBasicObservation
Title: "John's Respiratory rate measurement (Basic observation)"
Description: "A simple basic observation of a hyperventilating patient"
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

Instance: ObservationOxySatBasicObservationOrg
InstanceOf: DkCoreBasicObservation
Title: "John's oxygen saturation measurement (Basic observation)"
Usage: #example
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

Instance: ObservationOxySatBasicObservation
InstanceOf: DkCoreBasicObservation
Title: "John's oxygen saturation measurement (Basic observation)"
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
* contained[0] = ObservationOxySatBasicObservationOrg
* derivedFrom = Reference(ObservationOxySatBasicObservationOrg)


/* **************
 *
 * TOBS example
 *
 * ************** */

Instance: ElseConsciousness
InstanceOf: DkCoreObservation
Usage: #example
* status = #final
* code = $sct#444714004
* subject = Reference(else)
* valueCodeableConcept.coding[+] = $sct#450847001
* method = $sct#733985002 "Reported (qualifier value)"
* effectiveDateTime = "2023-09-12T17:45:00.000Z"
* performer = Reference(SidselSygeplejerske)

Instance: ElseBloodPressure
InstanceOf: DkCoreBasicObservation
Usage: #example
* status = #final
* category = $observation-category#vital-signs
* code.coding[0] = $sct#75367002
* code.coding[LOINC] = $LOINC#85354-9
* subject = Reference(else)
* component[0].code.coding[LOINC] = $LOINC#8480-6
* component[=].code.coding[+] = $sct#407554009
* component[=].valueQuantity = 128 'mm[Hg]' "mmHg"
* component[+].code.coding[LOINC] = $LOINC#8462-4
* component[=].code.coding[+] = $sct#407555005
* component[=].valueQuantity = 80 'mm[Hg]' "mmHg"
* method = $sct#272391002 "Measurement technique (qualifier value)"
* effectiveDateTime = "2023-09-12T17:45:00.000Z"
* performer = Reference(SidselSygeplejerske)


Instance: ElseBodyTemperature
InstanceOf: DkCoreBasicObservation
Usage: #example
* status = #final
* category = $observation-category#vital-signs
* code.coding[0] = $sct#276885007
* code.coding[LOINC] = $LOINC#8310-5
* subject = Reference(else)
* method = $sct#272391002 "Measurement technique (qualifier value)"
* effectiveDateTime = "2023-09-12T17:45:00.000Z"
* valueQuantity = 38 'Cel' "grader celcius"
* performer = Reference(SidselSygeplejerske)

Instance: ElseHeartRate
InstanceOf: DkCoreBasicObservation
Usage: #example
* status = #final
* category = $observation-category#vital-signs
* code.coding[0] = $sct#364075005
* code.coding[LOINC] = $LOINC#8867-4
* subject = Reference(else)
* method = $sct#272391002 "Measurement technique (qualifier value)"
* effectiveDateTime = "2023-09-12T17:45:00.000Z"
* valueQuantity = 88 '/min' "slag/minut"
* performer = Reference(SidselSygeplejerske)

Instance: ElseRespirationRate
InstanceOf: DkCoreBasicObservation
Usage: #example
* status = #final
* category = $observation-category#vital-signs
* code.coding[0] = $sct#86290005
* code.coding[LOINC] = $LOINC#9279-1
* subject = Reference(else)
* method = $sct#272391002 "Measurement technique (qualifier value)"
* effectiveDateTime = "2023-09-12T17:45:00.000Z"
* valueQuantity = 13 '/min' "/min"
* performer = Reference(SidselSygeplejerske)

Instance: ElsesTOBS
InstanceOf: Bundle
Title: "Else's TOBS measurements"
Description: "An example of TOBS (Danish: Tidlig opsporing af begyndende sygdom), which includes level of consciousness, heart rate, respiration rate, blood pressure and temperature."
Usage: #example
* type = #collection
* timestamp = "2023-09-12T17:45:00.000Z"
* entry[+].fullUrl = "Patient/else"
* entry[=].resource = else
* entry[+].fullUrl = "Observation/ElseConsciousness"
* entry[=].resource = ElseConsciousness
* entry[+].fullUrl = "Observation/ElseBloodPressure"
* entry[=].resource = ElseBloodPressure
* entry[+].fullUrl = "Observation/ElseBodyTemperature"
* entry[=].resource = ElseBodyTemperature
* entry[+].fullUrl = "Observation/ElseHeartRate"
* entry[=].resource = ElseHeartRate
* entry[+].fullUrl = "Observation/ElseRespirationRate"
* entry[=].resource = ElseRespirationRate
* entry[+].fullUrl = "Practitioner/SidselSygeplejerske"
* entry[=].resource = SidselSygeplejerske

/* **************
*
* TOKS eksempel inkl. GCS
*
* ************** */

Instance: MogensensConsciousness
InstanceOf: DkCoreObservation
Usage: #example
* status = #final
* category = $observation-category#vital-signs
* code.coding[0] = $sct#86290005
* code.coding[LOINC] = $LOINC#9279-1
* subject = Reference(mogensen)
* valueCodeableConcept.coding[+] = $sct#450847001
* method = $sct#733985002 "Reported (qualifier value)"
* effectiveDateTime = "2023-08-08T13:30:00.000Z"

Instance: MogensensRespirationRate
InstanceOf: DkCoreBasicObservation
Usage: #example
* status = #final
* code.coding[0] = $sct#86290005
* code.coding[LOINC] = $LOINC#9279-1
* subject = Reference(mogensen)
* method = $sct#272391002 "Measurement technique (qualifier value)"
* effectiveDateTime = "2023-08-08T13:30:00.000Z"
* valueQuantity = 13 '/min' "/min"

Instance: MogensensHeartRate
InstanceOf: DkCoreBasicObservation
Usage: #example
* status = #final
* category = $observation-category#vital-signs
* code.coding[0] = $sct#364075005
* code.coding[LOINC] = $LOINC#8867-4
* subject = Reference(mogensen)
* effectiveDateTime = "2023-08-08T13:30:00.000Z"
* method = $sct#272391002 "Measurement technique (qualifier value)"
* valueQuantity = 68 '/min' "slag/minut"

Instance: MogensensBodyTemperature
InstanceOf: DkCoreBasicObservation
Usage: #example
* status = #final
* category = $observation-category#vital-signs
* code.coding[0] = $sct#276885007
* code.coding[LOINC] = $LOINC#8310-5
* subject = Reference(mogensen)
* effectiveDateTime = "2023-08-08T13:30:00.000Z"
* method = $sct#272391002 "Measurement technique (qualifier value)"
* valueQuantity = 37 'Cel' "grader celcius"

Instance: MogensensBloodPressure
InstanceOf: DkCoreBasicObservation
Usage: #example
* status = #final
* category = $observation-category#vital-signs
* code.coding[0] = $sct#75367002
* code.coding[LOINC] = $LOINC#85354-9
* subject = Reference(mogensen)
* effectiveDateTime = "2023-08-08T13:30:00.000Z"
* method = $sct#272391002 "Measurement technique (qualifier value)"
* component[0].code.coding[LOINC] = $LOINC#8480-6
* component[=].code.coding[+] = $sct#407554009
* component[=].valueQuantity = 156 'mm[Hg]' "mmHg"
* component[+].code.coding[LOINC] = $LOINC#8462-4
* component[=].code.coding[+] = $sct#407555005
* component[=].valueQuantity = 78 'mm[Hg]' "mmHg"

Instance: MogensensSaturation
InstanceOf: DkCoreBasicObservation
Usage: #example
* category = $observation-category#vital-signs
* status = #final
* code.coding[LOINC] = $LOINC#2708-6 "Oxygen saturation in Arterial blood"
* valueQuantity = 99.0 '%' "%"
* subject = Reference(mogensen)
* effectiveDateTime = "2023-08-08T13:30:00.000Z"
* method = $sct#272391002 "Measurement technique (qualifier value)"

Instance: MogensensGlasgowComaScale
InstanceOf: DkCoreObservation
Usage: #example
* status = #final
* code.coding[LOINC] = $LOINC#9269-2
* code.coding[+] = $sct#248241002
* subject = Reference(mogensen)
* valueQuantity = 13 '{score}' "{score}"
* referenceRange[0].high = 8 '{score}'
* referenceRange[=].type.text = "Severe TBI"
* referenceRange[+].low = 9 '{score}'
* referenceRange[=].high = 12 '{score}'
* referenceRange[=].type.text = "Moderate TBI"
* referenceRange[+].low = 13 '{score}'
* referenceRange[=].type.text = "Mild TBI"
* effectiveDateTime = "2023-08-08T13:30:00.000Z"
* component[0].code = $LOINC#9268-4 "Glasgow coma score motor"
* component[=].valueCodeableConcept.coding = $LOINC#LA6566-9 "Localizing pain"
* component[+].code = $LOINC#9270-0 "Glasgow coma score verbal"
* component[=].valueCodeableConcept.coding = $LOINC#LA6560-2 "Confused"
* component[+].code = $LOINC#9267-6 "Glasgow coma score eye opening"
* component[=].valueCodeableConcept.coding = $LOINC#LA6556-0 "Eyes open spontaneously"


Instance: MogensensTOKS
InstanceOf: Bundle
Title: "Mogensens TOKS measurements, including Glasgow Coma Scale assesment"
Description: "An example of TOBS (Danish: Tidlig opsporing af begyndende sygdom), which includes level of consciousness, heart rate, respiration rate, blood pressure and temperature."
Usage: #example
* type = #collection
* timestamp = "2023-08-08T13:30:00.000Z"
* entry[+].fullUrl = "Patient/mogensen"
* entry[=].resource = mogensen
* entry[+].fullUrl = "Observation/MogensensConsciousness"
* entry[=].resource = MogensensConsciousness
* entry[+].fullUrl = "Observation/MogensensBloodPressure"
* entry[=].resource = MogensensBloodPressure
* entry[+].fullUrl = "Observation/MogensensBodyTemperature"
* entry[=].resource = MogensensBodyTemperature
* entry[+].fullUrl = "Observation/MogensensHeartRate"
* entry[=].resource = MogensensHeartRate
* entry[+].fullUrl = "Observation/MogensensRespirationRate"
* entry[=].resource = MogensensRespirationRate
* entry[+].fullUrl = "Observation/MogensensGlasgowComaScale"
* entry[=].resource = MogensensGlasgowComaScale
### Scope and usage
The Danish Core Basic Observation profile is intended to represent observations of basic observations. A basic observation is, in a Danish context, a measurable and often used value. This can be observations such as vital signs and base observations like height and weight.

The profile inherits from DkCoreObservation and complies to [HL7's Vital Signs profile](http://hl7.org/fhir/R4/vitalsigns.html). However, there is an expansion of one code to the ValueSet of LOINC codes and the UCUM codes, which means that when using these codes compliance is not true.

#### Codes
It is required to include a LOINC code at Observation.code. The [LOINC ValueSet](http://hl7.org/fhir/R4/valueset-observation-vitalsignresult.html) used in the  HL7's Vital Signs profile is expanded with the code `59408-5 "Oxygen saturation in Arterial blood by Pulse oximetry"` (SPO2) because it is an often used, measurable parameter in Denmark.

Further, [Dk Core NPU Basic Observation](./valueset-dk-core-NPUBasicObservation.html), [Dk Core IEEE Basic Observation](./valueset-dk-core-IEEEBasicObservation.html), and [Dk Core SNOMED CT Basic Observation](./valueset-dk-core-SCTBasicObservation.html) ValueSets are added to the given slices, and codes from these ValueSets are optional to include. 

An overall guidance of using the ValueSets follows the guidance of DkCoreObservation and is further specified below:
* NPU codes preferred when exchanging codes from laboratories. When relevant they should be used in the context of the basic observations. 
* IEEE codes should be included, if the original observation of the device is represented with IEEE codes.
* SNOMED CT codes are accepted in Denmark. They can be included as a reference terminology, where it is used in addition to the original coding. SNOMED CT codes can also be used in areas where NPU does not cover.

The codes in the three ValueSets are selected to best represent the codes included in the LOINC ValueSet. The following describes the possible use of additional codes:
* No meaningful code: Not all LOINC codes are represented in ValueSets, as no meaningful codes exists in the terminology. An example is that the `8478-0 Mean blood pressure` does not exists in the NPUBasicObservation ValueSet. 
* One meaningful code: When one meaningful code is included from the ValueSet, as the code best represents the LOINC code. An example is the `150022 MDC_PRESS_BLD_NONINV_DIA` from the IEEE ValueSet which represents `8462-4 Diastolic blood pressure` best. 
* Multiple meaningful codes: Multiple codes in a ValueSet may be used to represent a code from the LOINC ValueSet, which may be relevant to express a higher level of granularity. An example is multiple codes representing systolic blood pressure in the SNOMED CT ValueSet depending on the circumstances of the measurement, which all represents `8480-6 Systolic blood pressure`.

#### Units
The [UCUM ValueSet](http://hl7.org/fhir/R4/valueset-ucum-vitals-common.html) used in HL7's Vital Signs profile is extended in the [Dk Core UCUM Basic Units ValueSet](./valueset-dk-core-UCUM-BasicUnits.html) to include a code for fraction `{fraction} fraction`. In the NPU ValueSet, this unit is used for the SPO2-code `NPU27280 Hb(Fe; O<sub>2</sub>-bind.;aB)—Oxygen(O<sub>2</sub>); sat.(Pulse oximetry) = ?`, why it is included. However, using the fraction unit is not compliant with [HL7's Vital Signs profile](http://hl7.org/fhir/R4/vitalsigns.html) and it a different unit than the unit `% percent` used for the LOINC code "2708-6 "Oxygen saturation in Arterial blood". The example [John's oxygen saturation measurement (Basic observation)](./Observation-ObservationOxySatBasicObservationOrg.html) illustrates how this can be handled by deriving the instance with the NPU code from an instance with a LOINC and IEEE code.

The Dk Core UCUM Basic Units ValueSet is added to the elements Observation.valueQuantity and Observation.component.valueQuantity. 

#### Examples
The table below includes instances of the DkCoreBasicObservation used to represent observations used to evaluate the patient based on different procedures used in Denmark. 

Example | Description
----------------- | ------------------------ 
[Glasgow Coma Scale (GCS)](./Bundle-MogensensGlasgowComaScale.html) | This example includes the relevant observation related to Glasgow Coma Scale. This scale is used to assess the level of consciousness in people with brain damage.
[TOKS (Danish: Tidlig opsporing af kritisk sygdom)](./Bundle-MogensensTOKS.html) | TOKS is a scoring system used to determine if a patient is in a critical state at a early state. The example includes basic observations, such as heartrate, temperature and more, as well as a Glasgow Coma Scale. 
[TOBS (Danish: Tidlig opsporing af begyndende sygdom)](./Bundle-ElsesTOBS.html) | TOBS is a scoring system used to determine if a citizen is in the early state of illnesses. The example includes basic observations, such as heartrate, temperature and more, as well as a reference to the performer of the observations. 
[Vital signs panel](./Bundle-VitalSignPanel.html) | ... 
[John's oxygen saturation measurement (Basic observation)](./Observation-ObservationOxySatBasicObservationOrg.html) | This example suggests a way to handle the oxygen saturation case, where the original measurement was reported in '%' by a device or typed in manually, and then 'translated' to the NPU system, which requires the value to be unitless.


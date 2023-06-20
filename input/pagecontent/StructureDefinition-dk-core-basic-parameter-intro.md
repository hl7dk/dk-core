### Scope and usage
The Danish Core Basic Parameter Observation profile is intended to represent observations of basic parameters. A basic parameter is, in a Danish context, a measurable and often used values, which includes as vital signs and base observations like height and weight.

The profile inherits from DkCoreObservation and complies to [HL7's Vital Signs profile](http://hl7.org/fhir/R4/vitalsigns.html). There is an expansion of one code to the ValueSet of LOINC codes and the UCUM codes, which means that when using these codes compliance is not true. 

#### Codes
It is required to include a LOINC code at Observation.code. The ValueSet is almost identical to the [LOINC ValueSet](http://hl7.org/fhir/R4/valueset-observation-vitalsignresult.html) used in the  HL7's Vital Signs profile. The only difference is that the code `21258-6 "Oxygen saturation"` is added, as it is a often used, measurable parameter in Denmark. 

Further, [Dk Core SNOMED CT Basic Paramater](./valueset-dk-core-SCTBasicParameter.html), [Dk Core IEEE Basic Paramater](./valueset-dk-core-IEEEBasicParameter.html), and [Dk Core NPU Basic Paramater](./valueset-dk-core-NPUBasicParameter.html) ValueSets are added to the given slices, and codes from these ValueSets are optional to include. The codes are selected to best represent the codes included in the LOINC ValueSet. 
* No meaningful code: Not all LOINC codes are represented in ValueSets, as no meaninful codes exsists in the ValueSet. An example could be that the `8478-0 Mean blood pressure` does not exists in the NPUBasicParamater ValueSet. 
* One meaningful code: When one meaningful code is included in the ValueSet, as the code best represents the LOINC code. An example is the `150022 MDC_PRESS_BLD_NONINV_DIA` from the IEEE ValueSet which represents `8462-4 Diastolic blood pressure` best. 
* Multiple meaningful codes: Multiple codes in a ValueSet may be used to represent a code from the LOINC ValueSet, which may be due to higher granularity. An example is multiple codes representing systolic blood pressure in the SNOMED CT Valueset depending on the circumstances of the measurement, which all represents `8480-6 Systolic blood pressure`.

#### Units
The [UCUM ValueSet](http://hl7.org/fhir/R4/valueset-ucum-vitals-common.html) used in HL7's Vital Signs profile is extended in the [Dk Core UCUM Basic Units ValueSet](./valueset-dk-core-UCUM-BasicUnits.html) to include a code for fraction `{fraction} fraction`. In the NPU ValueSet, this unit is used for SPO2 `NPU27280 Hb(Fe; O<sub>2</sub>-bind.;aB)—Oxygen(O<sub>2</sub>); sat.(Pulse oximetry) = ?`, why it is included. However, using the fraction unit is not compliant with [HL7's Vital Signs profile](http://hl7.org/fhir/R4/vitalsigns.html). 

The Dk Core UCUM Basic Units ValueSet is added to the elements Observation.valueQuantity and Observation.component.valueQuantity


#### Examples
The table below includes instances of the DkCoreBasicParameter used to represent observations used to evaluate the patient based on different procedures used in Denmark. 

Example | Description
----------------- | ------------------------ 
[Glasgow Coma Scale (GCS)](./Bundle-GlasgowComaScale.html) | This example includes the relevant observation related to Glasgow Coma Scale. This scale is used to assess the level of consciousness in people with brain damage.
[TOKS (Danish: Tidlig opsporing af kritisk sygdom)](./Bundle-TOKS.html) | TOKS is a scoring system used to determine if a patient is in a critical state. 
[TOBS (Danish: Tidlig opsporing af begyndende sygdom)](./Bundle-TOBS.html) | TOBS is ... 
[Vital signs panel](./Bundle-VitalSignPanel.html) | ... 

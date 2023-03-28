### Scope and usage
The Danish Core Observation profile is intended to represent observations for a variety of uses including:
* laboratory data
* results of using clinical assessment tools
* device measurements such as Pulse Oximetry data
* general health status

> Note: HL7-Denmark are working on an Observation profile for vital signs. Expected release is in Q4 2023.

#### Codes
Multiple CodeSystems are added to the elements Observation.code.coding and Observation.component.code.coding, to ensure similar use of relevant CodeSystems in a Danish context. In addition, locally defined codes may be added. HL7 Denmark recommend to add these in a new slice using a system, that clearly states from where the code originate.

skal omformuleres, så den lægger sig op ad HL7 håndtering af flere koder, nemlig hvis der er to koder, der alle er sande for den ting der er foregået I virkeligheden, kan de begge inkluderes. Kun én kode må være valgt af brugeren. 


Two or more codes may be assigned in the same Observation instance, if each code is true for the observation that happened in reality. Only one of the codes can be user selected, described by the element Observation.coding.userSelected = `true`. An example could be [HeartRate.Poul.1974654](./Observation-HeartRate.Poul.1974654.html), where a LOINC, IEEE and NPU code is used to describe the heart rate. If the codes and units does not represent the same meaning, one instance of an Observation can be derived from another, as described in section [Observation derived from other Observation](#observation-derived-from-other-observation).

None of the CodeSystems are reqiured, because each use case, may call for different codes to represent the observations. In the following, some overall recommendations about the use af the code systems are provided:
* NPU codes are the prefered first choice in official Danish health IT-systems. NPU mostly have laboratory codes.
* LOINC codes are generally not recommended, for clinical areas that NPU covers, because they are overlapping without being modelled in excactly the same way. For clinical areas not covered by NPU, LOINC can be used. LOINC is an international code system, and is the first choice for many FHIR-observations around the world. This also means that Observation standard-profiles often use LOINC codes, and that interoperability use cases using equipment/wearables intended for markets intenationally, very well may have build-in LOINC codes.
* IEEE codes, are the internal codes of many devices see [https://www.iso.org/standard/37890.html](https://www.iso.org/standard/37890.html). If an original observation from a device is represented, HL7 DK recommends using its original layout including the IEEE codes. Read more in IHE Personal Connected Health [https://wiki.ihe.net/index.php/Personal_Connected_Health](https://wiki.ihe.net/index.php/Personal_Connected_Health).
* SKS does have a few observation codes in use, most are found in the 'R' Hierarchy - se e.g. [https://medinfo.dk/sks/brows.php](https://medinfo.dk/sks/brows.php). HL7 Denmark does not recommend the use of SKS procedure codes from the 'ZZ' hierarchy as FHIR observation-codes. 
* MedCom codes are Danish codes, that are not part of SKS, but have been nessesary in Danish interoperability projects through time. They are sometime refered to as kiap-codes or MCS codes. They can be found here: [https://medcom.dk/standarder/koder/laboratorieomraadet/](https://medcom.dk/standarder/koder/laboratorieomraadet/) kiap-koder/ or here: [https://kiap.dk/kiap/praksis/services/koder/iupackoder.php](https://kiap.dk/kiap/praksis/services/koder/iupackoder.php)
* SNOMED CT codes are accepted in Denmark. SNOMED CT codes are relevant, for areas that NPU does not cover. Aditionally, SNOMED CT is often used as a reference terminology, to give a common language of retrieval for data that have originally been defined or coded in some other way. If SNOMED CT is used as a reference terminology, it is often relevant to provide a SNOMED CT code, in addition to the original coding. This is also true, if the SNOMED CT concept is less granular than the original code

#### Subjects and performers
The primary use of this profil is to describe an observation performed on a patient. The patient must be represented using the [DkCorePatient](StructureDefinition-dk-core-patient.html) profile. However, it is still possible to select Observation.subject to be a Group, Device or Location. This is choosen to enable different uses of the profile e.g. a device calibration result is an observation of the device, not of the person that usually uses the device.

The performer of the observation may be different kinds of actors depending on the use case. When a performer is known, it is recommended to include this information.

#### Quality of the Observation
If known, it is recommended to include information about the method used for the observation, in the element Observation.method, as this migth affect the interpretation of the observation. In DkCoreObservation profile, a slice is added which include an extensible ValueSet of commonly used SNOMED CT methods; `Estimation technique`, `Measurement technique`, and `Reported`. If a different method is used the ValueSet may be extended with SNOMED CT codes or a new slice may be added.

If a known device is used to collect the observation, and information about the device is exchanged, it is recommeded to include the instance of the Device or DeviceMetric resource in the same Bundle as the Observation instance. An example of usage, can be found in [Poul's home blood pressure measurement](./Bundle-ContinuaBundleWithDevice.html).

#### Units
If the unit of measure is known, it shall be included in the Observation instance. It is assummed, that in most situations these units can be represented with [UCUM](http://unitsofmeasure.org). For this reason, UCUM is included as system in the element Observation.valueQuantity.system. However, special cases may arise where the unit is not represented by UCUM. In such case, the unit shall be included in the element Observation.valueQuantity.unit as a string. Both cases are supported by the invariant **dk-core-observation-mandatory-units**, which ensures that when a valueQuantity.value is specified, a unit and/or code shall be present.

All NPU-codes include a unit internally in the observation-code. All the other code systems mentioned here, as well as the FHIR Observation resource, assumes that the unit is provided in a separate attribute. Consequently, it is important to provide the same unit in valueQuantity.code and/or valueQuantity.unit, as that provided in the NPU code. If consistency is not maintained, interpretation is impossible. No explicite rules to support the use of NPU consistently are implemented in this profile, so it should be considered before implementation.

#### Observation derived from other Observation
An Observation can refer to another, possibly contained Observation from which it is derived. This can be used in cases where the measuring Device provides the measured value in, for instance, another unit or precision than used in a particular exchange context.

An example is an oxygen saturation measured as a fraction in, say, the NPU code system. Exchanging the measurement as a vital signs Observation with oxygen saturation given as percent, the original NPU-based measurement can be contained and reference using `Observation.derivedFrom`. The example can be found in [John's oxygen saturation measurement](./Observation-ObservationOxySatVitalSigns.html).


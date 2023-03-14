### Scope and usage
The Danish Core Observation profile is intended to represent observations for a variety of uses including:
* laboratory data
* clinical assessment tools
* device measurements such as Pulse Oximetry data
* general health status

Vital signs must not be described using this profile. Instead, DkCoreObservationVitalSigns (a profile in development)<!-- [DkCoreObservationVitalSigns](StructureDefinition-dk-core-observation-vitalsigns.html) --> should be used. Vital signs type of observations (for instance blood pressure) can be made without use of the FHIR Core Vital Signs profile or DkCoreObservationVitalSigns<!-- [DkCoreObservationVitalSigns](StructureDefinition-dk-core-observation-vitalsigns.html) -->. In such case, the Observation `category` shall be other than `vital-signs`.

#### Codes
Multiple CodeSystems are added to the elements Observation.code.coding and Observation.component.code.coding, to ensure similar use of relevant CodeSystems in a Danish context. In case it is desired to add a locally defined code, it should be done by adding a new slice. In this case, it is recommended to add a system, that clearly states from where the code is originated.

Multiple codes may be assigned in the same Observation instance, if the codes represent the same meaning and has the same unit. An example could be [HeartRate.Poul.1974654](https://hl7.dk/fhir/core/Observation-HeartRate.Poul.1974654.html), where a LOINC, IEEE and NPU code is used to describe the heart rate. If the codes does not represent the same meaning, one instance of an Observation should be derived from another, as described in section [Observation derived from other Observation](#observation-derived-from-other-observation).

None of the CodeSystems are reqiured, as several of them represent different sorts of observations. 
<!-- Kirstine tilføjer tekst om de forskellige systemer -->

#### Subjects and performers
The intended use of this profil is to describe an observation performed on a patient. This is reflected in the added CodeSystems at Observation.code.coding, which all reflects an observation performed on a patient. The patient must be represented using the [DkCorePatient](StructureDefinition-dk-core-patient.html) profile. However, it is possible to select Observation.subject to be a Group, Device or Location. This is choosen to enable different usage of the profile. In such case, it might be necessary to include a new slice at Observation.code.coding to reflect the actual observation. 

The performer of the observation may be different kinds of actors depending on the use case. When a performer is known, it is recommended to include this information.

#### Quality of the Observation
If known, it is recommended to include information about the method used for the observation, in the element Observation.method. For example, when performing an observation, it is relevant to know if the method is a `Visual estimation` or `Measurement technique`, as this migth affect the interpretation of the observation. 

If a known device is used to collect the observation, and information about the device is exchanged, it is recommeded to include the instance of the Device or DeviceMetric resource in the same Bundle as the Observation instance. An example of usage, can be found in [Poul's home blood pressure measurement](https://hl7.dk/fhir/core/Bundle-ContinuaBundleWithDevice.html).

#### Units
All NPU-codes includes a unit of the observation and it is important to be aware that there is consistency in the implementation, if it is choosen to include Observation.valueQuantity.unit. No rules are applied in this profile, why it should be considered in before implementation. 

If the unit of a measure is known, it should be included in the Observation instance. It is assummed, that in most situations these units can be represented with a [UCUM-unit]( http://unitsofmeasure.org), why UCUM is included as system in the element Observation.valueQuantity.system. However, there migth be special cases where the unit is not represented by UCUM. In such case, the unit should be included in the element Observation.valueQuantity.unit as a string. 

#### Observation derived from other Observation
An Observation can refer to another, possibly contained Observation from which it is derived. This can be used in cases where the measuring Device provides the measured value in, for instance, another unit or precision than used in a particular exchange context.

An example is an oxygen saturation measured as a fraction in, say, the NPU code system. Exchanging the measurement as a vital signs Observation with oxygen saturation given as percent, the original NPU-based measurement can be contained and reference using `Observation.derivedFrom`. The example can be found in [John's oxygen saturation measurement](https://hl7.dk/fhir/core/Observation-ObservationOxySatVitalSigns.html).



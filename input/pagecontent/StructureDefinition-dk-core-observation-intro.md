### Scope and usage
The Danish Core Observation profile is intended to represent observations for a variety of uses including:
* laboratory data
* clinical assessment tools
* device measurements such as Pulse Oximetry data
* general health status

Vital signs must not be described using this profile. Instead, [DkCoreObservationVitalSigns](StructureDefinition-dk-core-observation-vitalsigns.html) must be used. This is the same apporach as applied in FHIR [International Patient Access (IPA) Observation](https://build.fhir.org/ig/HL7/fhir-ipa/StructureDefinition-ipa-observation.html#profile-specific-implementation-rules-and-guidance) with regards to vital signs. Vital signs type of observations (for instance blood pressure) can be made without use of the FHIR Core Vital Signs profile or DkCoreObservationVitalSigns. In such case, the Observation `category` shall be other than `vital-signs`.

#### Codes
Multiple CodeSystems have been added Observation.code.coding, to ensure similar use of relevant CodeSystems in a Danish context. In case it is desired to add a locally defined code, it should be done by adding a new slice. In this case, it is recommended to add a system, that clearly states from where the code is originated.

It is choosen not to include SKS-codes, since the codes represent procedures. Some of the SKS-codes are closely related to observations, e.g. blood pressure, why it migth be relevant to include in special cases. If this is choosen, it is recommended to use Observation.code.coding.system = `urn:oid:1.2.208.176.2.4`.

#### Subjects and performers
The intended use of this profil is to describe an observation performed on a patient or citizen. This is reflected in the added CodeSystems at Observation.code.coding, which all reflects an observation performed on a patient or citizen. The patient or citizen must be represented using the [DkCorePatient](StructureDefinition-dk-core-patient.html) profile. However, it is possible to select Observation.subject to be a Group, Device or Location. This is choosen to enable different usage. In this case, it migth be necessary to include a new slice at Observation.code.coding to reflect the actual observation. 

The performer of the observation may be different kinds of actors depended on the use case. There must always be a performer who is responsible for the observation. 

#### Quality of the Observation
If known, it is recommended to include information about the method used for the observation, in the element Observation.method. When performing an observation, it is relevant to know if the method is a `Visual estimation` or `Measurement technique`, as this migth affect the interpretation of the observation. 

If a known device is used to collect the observation and information about the device is exchanged, it is recommeded to include the instance of the Device or DeviceMetric resource in the same Bundle as the Observation instance. An example of usage, can be found in <!-- ... Der skal være id på device. 1) Update eller COnditionAndCreate og 2) logiske id skal være unikt. Evt. med reference til Continues design guidelines som eksemple. (phd).  -->

#### Units
All NPU-codes includes a unit of the observation and it is important to be aware that there is consistency in the implementation, if it is choosen to include Observation.unit. No rules are applied in this profile, why it should be considered in before application. 

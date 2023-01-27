### Scope and usage
 The Danish Core Observation profile defined here SHALL be used to represent Observation for a variety of uses including:
* vital signs
* laboratory data
* clinical assessment tools
* device measurements such as Pulse Oximetry data
* ...

This profile utilizes the same approach as applied in FHIR International Patient Access (IPA) [Observation](https://build.fhir.org/ig/HL7/fhir-ipa/StructureDefinition-ipa-observation.html#profile-specific-implementation-rules-and-guidance) with regard to vital signs:
The base FHIR specification defines the [FHIR Core Vital Signs profile](https://hl7.org/fhir/vitalsigns) on the Observation resource used to specifically represent vital signs. To adhere to Danish Core as well as the base FHIR specifications, implementers SHALL support the FHIR Core Vital Signs profile.

Vital sign type of observations (for instance height measurement) can be made without use of the FHIR Core Vital Signs profile. In such case, the Observation `category` shall be other than `vital-signs`.

#### Quality of Observation
<!-- Tilføj beskrivelse om, hvordan kvaliteten af målingen bør dokumenteres. Herunder at resourcer der beskriver fx Device eller Procedure bør være contained -->

#### Observation Method
<!-- Tilføj beskrivelse om, hvilken metode der er anvendt til målingen fx 'estimated technique' eller 'measurement' -->

#### Performer
<!-- Udføren af målingen skal altid fremgå og skal kunne være forskellige typer af aktører -->

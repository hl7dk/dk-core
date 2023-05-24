### Scope and usage
The Danish Core Basic Parameter Observation profile is intended to represent observations of basic parameters, such as vital signs, and base observations like height and weight ect.

The profile inherits from DkCoreObservation and complies to [HL7's Vital Signs profile](http://hl7.org/fhir/R4/vitalsigns.html). 

#### Codes
[TBD]
* LOINC codes are mandatory. 

#### Units
[TBD]

#### Observation derived from other Observation
[TBD]

#### Calculated values
[TBD]
<!-- Include description of: I tilfælde af at et resultat fra en beregning, fx BMI, deles og det ønskes at dele den tilhørende formel for beregningen, vil vi se på, hvordan formlen kan deles. Det foreslås, at vi kigger på Observation.method, da dette element formentlig kan holde de nødvendige informationer. -->

#### Examples
[TBD]
* Glasgow Coma scale
* TOKS/TOBS
* Mulitple codes
* Mulitple codes with different units (BasicParameter and Observation)
* Calculated values
* Vital signs panel

<!-- #### Examples
Example | Description
----------------- | ------------------------ 
[Poul's home blood pressure measurement](https://hl7.dk/fhir/core/Bundle-ContinuaBundleWithDevice.html) | This example demonstrates a DkCoreObservationVitalSigns and Continua-compliant Bundle containing a home blood pressure measurement uploaded to a Continua-compliant “FHIR Observation Reporting Server”. 
[Poul's A&D weight scale](https://hl7.dk/fhir/core/Observation-Weight.Poul.230221.html) | Poul has been instructed to perform a daily weighing in the morning. This is his daily weighing from Feb. 21st 2023. -->
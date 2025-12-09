### Scope and usage
This profile is intended to encapsulate information about encounters in the Danish health sectors.

### Responsibilities for treatment and care in hospitals
In hospitals in Denmark, there is a distinction between the organization responsible
for providing treatment to the patient and the organization responsible for providing
care. This distinction is also adressed by *encounter participants* in
[LPR3](https://sundhedsdatastyrelsen.dk/indberetning/patientregistrering/indberetning-lpr3/teknisk-information-om-lpr3), the registry
to where all hospital encounters must be reported:

{:class="grid"}
| Responsibility | Responsibility [DA] | LPR3 Encounter Participant | Description | 
| ------------- | ------------------ | -------------------------- | ----------- |
| Treatment responsibility | Behandlingsansvarlig | [Responsible Unit Participant](https://art-decor.org/art-decor/decor-templates--lpr-?id=1.2.208.176.7.1.10.49) | The organization where the doctor responsible for the patient's medical treatment is employed. | 
| Care responsibility | Plejeansvarlig | [Service Delivery Location Participant](https://art-decor.org/art-decor/decor-templates--lpr-?id=1.2.208.176.7.1.10.50) | The organization where the patient is actually located, and where day-to-day care is provided. |

The treatment responsibility is represented by Encounter.serviceProvider and the care
responsibility is represented by the extension [CareProvider](./StructureDefinition-dk-core-care-provider.html).

Use Encounter.serverProvider and the extension for CareProvider, when you need to convey the responsibilities as defined in LPR3.

### Specifying diagnosis
It is preferred, that the [Danish Core Condition](./StructureDefinition-dk-core-condition.html) is used when referencing diagnosis in a
Danish context.

Hospital encounters in Denmark have associated diagnoses that specify the primary diagnosis being treated ([DA] aktionsdiagnose) and
secondary diagnoses ([DA] bidiagnoser) that might be relevant to the treatment of the primary diagnosis. These can be given in the diagnosis
element and it is recommended to use the rank element to distinguish between primary and secondary diagnoses, the primary being given rank 1
and the secondary a rank > 1. Have a look at this [example](Encounter-915a3cfb-2f3e-477b-8a9d-5d86c30e4929.html).

### Priority
In Denmark, the only priorities commonly used is 'akut' and 'elektiv'. We have translated these to 'ASAP' and 'elective' in the recommended FHIR value set. To avoid other uses of the priority values, we have narrowed the value set down to only these two values. However, the binding is extensible, so if more priorities are needed they can be added as necessary.

### Handling future versions
In FHIR R5 and newer, significant changes have been made to the Encounter profile.

To be compatible with the changes to the value set bound to Encounter.class in FHIR R5 and newer, we recommend to restrict to using only
the values from the FHIR R5 value set [Encounter class](https://terminology.hl7.org/ValueSet-encounter-class.html), which is a subset of the
FHIR R4 value set [ActEncounterCode](https://hl7.org/fhir/R4/v3/ActEncounterCode/vs.html):

{:class="grid"}
| Code | Display | Typical use in Denmark |
| ---- | ------- | -------------- |
| IMP | inpatient encounter | Encounters where patients are admitted typically for more than 12 hours. |
| AMB | ambulatory | Encounters where patients are not admitted. |
| OBSENC | observation encounter | Not used. |
| EMER | emergency | Encounters where patients are admitted to an emergency ward typically for up to 72 hours. |
| VR | virtual | Virtual encounters with patients typically using televideo, telephone, or other means of telepresence. |
| HH | home health | Encounters with patients in their own home. |

Note that Encounter.class has an extensible binding, so if a class coding not part of the bound value set is needed, it is allowed to use an
alternate coding.

In order to support the addition of Encounter.plannedStartDate and Encounter.plannedEndDate in FHIR R5, the extensions
[PlannedStartDate](./StructureDefinition-dk-core-planned-start-date.html) and [PlannedEndDate](./StructureDefinition-dk-core-planned-end-date.html)
have been added to DkCore. However, note that in the R4 documentation it is stated that a planned start date could be given by placing
period.start in the future, and setting the status to ‘planned’. As a consequence, this practice is also acceptable in the dk-core R4 version, 
but the use of plannedStart and plannedEnd extensions are encouraged to make transition to future FHIR versions easier.

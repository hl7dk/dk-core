### Scope and usage
This profile is intended to encapsulate information about encounters in the Danish health sectors.

### Responsibilities for treatment and care
In Denmark there is a distinguishment between which organization has the reponsibility for providing treatment to the patient, and which organization
has the responsibility for providing care to the patient.

* Treatment responsibility: this lies with the service provider organization
* Care responsibility: this lies with the organization where the patient has a stay (is hospitalized)

The current care responsibility is represented by the extension [CareProvider](./StructureDefinition-dk-core-care-provider.html).

## Specifying primary and secondary diagnosis
Hospital encounters in Denmark have diagnosis associated that specifies the primary diagnosis beeing treated (Danish: aktionsdiagnose) and  secondary diagnosis (Danish: bidiagnose) that might be relevant to the treatment of the primary diagnosis. These can be given in the diagnosis element in the primary and secondary slices.

### Handling future versions
In FHIR R5 and newer, there have been made significant changes to Encounter profile.

In order to be compatible with the changes to the value set bound to Encounter.class in FHIR R5 and newer, we recommend to restrict to using only the
values from the FHIR R5 value set [Encounter class](https://terminology.hl7.org/5.2.0/ValueSet-encounter-class.html), which is a subset of the
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

In order to support the addition of Encounter.plannedStartDate and Encounter.plannedEndDate in FHIR R5, the extensions
[PlannedStartDate](./StructureDefinition-dk-core-planned-start-date.html) and [PlannedEndDate](./StructureDefinition-dk-core-planned-end-date.html)
have been added to DkCore.
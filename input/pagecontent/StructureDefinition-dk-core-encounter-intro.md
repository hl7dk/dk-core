### Scope and usage
This profile is intended to encapsulate information about encounters in the Danish health sectors.

### Responsibilities for treatment and care
In Denmark there is a distinguishment between which organization has the reponsibility for providing treatment to the patient, and which organization
has the responsibility for providing care to the patient.

* Treatment responsibility: this lies with the service provider organization
* Care responsibility: this lies with the organization where the patient has a stay (is hospitalized)

The current care responsibility is represented by the extension [CareProvider](./StructureDefinition-dk-core-care-provider.html).

### Handling future versions
In FHIR R5 and newer, there have been made significant changes to Encounter profile.

In order to be compatible with the changes to the value set bound to Encounter.class in FHIR R5 and newer, we recommend to restrict to using only the
values from the FHIR R5 value set [Encounter class](https://terminology.hl7.org/5.2.0/ValueSet-encounter-class.html), which is a subset of the
FHIR R4 value set [ActEncounterCode](https://hl7.org/fhir/R4/v3/ActEncounterCode/vs.html):

{:class="grid"}
| Code | Display | Use in Denmark |
| ---- | ------- | -------------- |

In order to support the addition of Encounter.plannedStartDate and Encounter.plannedEndDate in FHIR R5, the extensions
[PlannedStartDate](./StructureDefinition-dk-core-planned-start-date.html) and [PlannedEndDate](./StructureDefinition-dk-core-planned-end-date.html)
have been added to DkCore.
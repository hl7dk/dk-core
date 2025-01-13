### Scope and Usage
The Danish IPA Core Patient profile is intended to encapsulate the combined data model of a patient as used in a Danish context [DKCorePatient](./StructureDefinition-dk-core-patient.html) and as used in an international context [International Patient Access (IPA) specification](https://hl7.org/fhir/uv/ipa/StructureDefinition-ipa-patient.html). The profile does this by extending the definition for dk-core-patient and imposing the IPA-Patient profile.

### Compabability Considerations
Marital status in DKCorePatient is aligned with the Danish CPR registry definition and extends the official FHIR valueset with additional values (see valueset [DKCoreMaritalStatus](./ValueSet-dk-marital-status.html) for details).
These values are not expected to be understood outside Denmark and should be mapped to other values that match the use case at hand.


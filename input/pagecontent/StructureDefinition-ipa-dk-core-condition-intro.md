### Scope and Usage
The Danish IPA Core Condition profile is intended to encapsulate the combined data model of a condition as used in a Danish context [DKCoreCondition](./StructureDefinition-dk-core-condition.html) and as used in an international context [International Patient Access (IPA) specification](https://hl7.org/fhir/uv/ipa/StructureDefinition-ipa-condition.html). The profile does this by extending the definition for dk-core-condition and imposing the IPA-Condition profile.

#### Danish documentation practice

Danish EHR systems typically use active and inactive to represent the clinical status of a condition. This IPA Condition profile also allows recurrence, relapse, remission, and resolved.  

Danish EHR systems typically use confirmed and refuted to represent the verification status of a condition. The IPA Condition profile also allows unconfirmed, provisional, differential, and entered-in-error.

Please be aware of these difference before using this Condition profile in a Danish context.
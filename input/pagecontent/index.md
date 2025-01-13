### Introduction
This implementation guide is provided to support the use of FHIR<sup>&reg;&copy;</sup> in a Danish context.

This document is a working specification that is expected to be implemented and tested by FHIR<sup>&reg;&copy;</sup> system producers to enable feedback to improve the content of this guide. With this first Standard for Trial Use ballot version we are looking for feedback if the following goals are met:  
- provide guidance on core resources for identifiers, code system, value sets and naming systems in a Danish specific context.
- define extensions that are necessary for local use covering needed Danish concepts

**Note**: This implementation guide is not (yet) a FHIR API specification, this will be a goal for the next iteration.

For more information about the Danish HL7 affiliate (HL7-Denmark), please go to [hl7.dk](https://www.hl7.dk). Here can you also find procurement recommendation in regards to FHIR, and an overview of some FHIR implementations in Denmark.

### Scope
The target group of this specification is any party that wants to specify FHIR standards for use in the Danish Health Sector. As a core-specification, a party that wants to use the specification should inherit from dk-core and build use-case specific profiles on top. As such, dk-core does not provide profiles for specific use use cases out-of-the-box.

This document presents Danish use concepts defined via FHIR processable artifacts:

* [Profiles](profiles.html) - are useful constraints of core FHIR resources and datatype for Danish use
* [Extensions](extensions.html) - are FHIR extensions that are added for local use, covering needed Danish concepts
* [Terminologies](terminology.html) - are defined or referenced code systems and value sets for Danish context

dk-core is regularly approved by HL7 Denmark and added to the catalogue of approved standards governed by The Danish Health Data Authority, after consideration by RUSA (Rådgivende Udvalg for Standarder og Arkitektur). See the exact approvals for each version in the history page.

### Governance
FHIR profiles are managed under HL7 Denmark in the HL7 Danish FHIR working group:

* [Source](https://github.com/hl7dk/dk-core)
* [Wiki](https://github.com/hl7dk/dk-core)


### Collaboration
This guide is the product of collaborative work undertaken with participants from:

* [Danish FHIR Implementers Community](https://confluence.hl7.org/display/HD/DK+FHIR+SIG)
* [HL7 Denmark](https://www.hl7.dk)

#### Open an Issue in GitHub
The source code of this implementation guide is maintained in a
[publicly accessible repository](https://github.com/hl7dk/dk-core) in GitHub.
Issues opened in that GitHub repo are very welcome. They help the affiliate pick up any proposed changes or additions and to discuss them publicly.

#### Open a Pull Request in GitHub
Pull requests are even better. If you are in a position to suggest how exactly your proposal should be implemented in the specification, do it! It helps the team maintaining the implementation guide a great deal.

### Language
The main language of this implementation guide, and the profiles in it, is English. Content that does not have an official English term uses a Danish term instead. Sometimes terms are explained using both Danish and English. Danish terms and explanations are prefixed with 'Da'

### Connection between dk-core and common Danish architectures and standards
HL7 Denmark includes common Danish architectures and standards if relevant, when content is added to dk-core. This section provides information about principle decisions as well as more specific ones that require explanations.

#### Principle decisions
* HL7 Denmark considers Danish legislation as the first source of truth when designing models, HL7 Denmark seeks to represent known named entities relevant for health data interoperability truthfully.
* HL7 Denmark upholds the requirements of the FHIR standard whenever it is possible within the boundaries of the Danish legislation.
* Entities that are named both in the FHIR standard and Danish legislation, keeps FHIR naming and requirements, but should explain its relation to Danish names/requirements.
* Danish standards and architectures are considered when designing FHIR profiles. HL7 Denmark uses them when they are relevant for interoperability of health data, and when they are compatible with the FHIR standard. Often public information and data models used as basis of public registries are too detailed, to warrant replication in a FHIR standard. E.g. The Organization profile references organization registries such as SOR and FK-ORG rather than re-constructing each of their attributes in the FHIR-profile, only attributes relevant for interoperability is provided in the FHIR profiles.

#### Specific decisions
* Patient.maritalStatus uses the extendable ValueSet required by the FHIR standard. However, Danish legislation and registries have two additional statuses not covered by the international ValueSet, so these two codes are added in dk-core.
* Several basic resources such as Patient and Organization has an address. In dk-core these addresses use the [FHIR datatype](http://hl7.org/fhir/R4/datatypes.html#Address), which is very basic compared to the [Danish Address standard](https://arkitektur.digst.dk/adresse). However, addresses can be referred faithfully using the international standard e.g. Address.text can be mapped directly to the Danish 'adressebetegnelse'. If more details are needed than FHIR instances provide, the [Danish address registry](https://danmarksadresser.dk/om-adresser/danmarks-adresseregister-dar) can be used for look-up. 

### International Aspects
This implementation guide is refining the FHIR standard itself as well as using and depending on the FHIR Standard [International Patient Access (IPA) specification](https://hl7.org/fhir/uv/ipa/). IPA aims to "to help patients access their data through patient-facing applications". While this is not the only scope of this implementation guide - it is part of the goal. IPA outlines a few minimum expectations that are required when exchanging data with patient facing apps.

<style>
  @counter-style nosefi {
    system: cyclic;
    symbols: 🇳🇴 🇸🇪 🇫🇮;
    suffix: " ";
  }
  
</style>

Our main intent is to focus and limit profiling specific to Denmark. During the process, we actively monitor other national (base) profiles. We attempt to harmonize our base profiles with already published base profiles from other Nordic countries:
<ul style="list-style: nosefi">
    <li style="list-style-type='🇳🇴'"><a href="https://simplifier.net/HL7Norwayno-basis/">The Norwegian core profiles</a></li>
    <li style="list-style-type='🇸🇪'"><a href="https://hl7.se/fhir/ig/base/">The Swedish Base Profiles</a></li>
    <li style="list-style-type='🇫🇮'"><a href="https://hl7.fi/fhir/finnish-base-profiles/">The Finnish Base Profiles</a></li>
</ul>


The implementation guide defines IPA compliance bit differently than the corresponding Nordic imlementation guides where profiles extend the IPA profiles. DkCore instead introduces separate IPA DK versions of selected profiles that extend the dk-core profile and imposes the IPA equivalent. This makes it possible to choose whether to comply with the Danish requirements only, or to comply with both the Dansih profiles and the IPA equivalents. It is recommended to comply with the IPA DK profiles where possible and with the non-IPA versions for contexts where IPA does not apply.

Regarding international cooperation, please see also the [National IG Implementations](https://confluence.hl7.org/display/IC/National+IG+Implementations) page in HL7 International's Confluence.


### Safety Considerations
This implementation guide defines data elements, resources, formats, and methods for exchanging healthcare data between different participants in the healthcare process. As such, clinical safety is a key concern. Additional guidance regarding safety for the specification’s many and various implementations is available at: [https://www.hl7.org/FHIR/safety.html](https://www.hl7.org/FHIR/safety.html).

Although the present specification does gives users the opportunity to observe data protection and data security regulations, its use does not guarantee compliance with these regulations. Effective compliance must be ensured by appropriate measures during implementation projects and in daily operations. The corresponding implementation measures are explained in the standard. 
In addition, the present specification can only influence compliance with the security regulations in the technical area of standardization. It cannot influence organizational and contractual matters.

### License and Legal Terms 

This document is licensed under Creative Commons "No Rights Reserved" ([CC0](https://creativecommons.org/publicdomain/zero/1.0/)).

HL7®, HEALTH LEVEL SEVEN®, FHIR® and the FHIR <img src="icon-fhir-16.png" style="float: none; margin: 0px; padding: 0px; vertical-align: bottom"/>&reg; are trademarks owned by Health Level Seven International, registered with the United States Patent and Trademark Office.

This implementation guide contains and references intellectual property owned by third parties ("Third Party IP"). Acceptance of these License Terms does not grant any rights with respect to Third Party IP. The licensee alone is responsible for identifying and obtaining any necessary licenses or authorizations to utilize Third Party IP in connection with the specification or otherwise.

See also http://hl7.org/fhir/license.html

Following is a non-exhaustive list of third-party artifacts and terminologies that may require a separate license:

**SNOMED Clinical Terms® (SNOMED CT®)**
This material includes SNOMED Clinical Terms® (SNOMED CT®) which is used by permission of SNOMED International (former known as International Health Terminology Standards Development Organisation IHTSDO). All rights reserved. SNOMED CT®, was originally created by The College of American Pathologists. “SNOMED” and “SNOMED CT” are registered trademarks of SNOMED International.

**Logical Observation Identifiers Names and Codes LOINC**
This material contains content from LOINC® (http://loinc.org). The LOINC table, LOINC codes, and LOINC panels and forms file are copyright © 1995-2013, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and available at no cost under the license at http://loinc.org/terms-of-use.

### IP Statements

{% include ip-statements.xhtml %}

### Cross Version Analysis

{% include cross-version-analysis.xhtml %}

### Dependency Table

{% include dependency-table.xhtml %}

### Globals Table

{% include globals-table.xhtml %}
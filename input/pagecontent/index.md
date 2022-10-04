### Introduction
This implementation guide is provided to support the use of FHIR<sup>&reg;&copy;</sup> in a Danish context.

This document is a working specification that is expected to be implemented and tested by FHIR<sup>&reg;&copy;</sup> system producers to enable feedback to improve the content of this guide. With this first Standard for Trial Use ballot version we are looking for feedback if the following goals are met:  
- provide guidance on core resources for identifiers, code system, value sets and naming systems in a Danish specific context.
- define extensions that are necessary for local use covering needed Danish concepts

**Note**: This implementation guide is not (yet) a FHIR API specification, this will be a goal for the next iteration.

### Scope
The target group of this specification is any party that wants to specify FHIR standards for use in the Danish Health Sector. As a core-specification, a party that wants to use the specification should inherit from dk-core and build use-case specifc profiles on top. As such, dk-core does not provide profiles for specifc use use cases out-of-the-box. 

This document presents Danish use concepts defined via FHIR processable artefacts:

* [Profiles](profiles.html) - are useful constraints of core FHIR resources and datatype for Danish use
* [Extensions](extensions.html) - are FHIR extensions that are added for local use, covering needed Danish concepts
* [Terminologies](terminology.html) - are defined or referenced code systems and value sets for Danish context

dk-core is regularily approved by HL7 Denmark, and from version 2.0.0 added to the catalogue of approved standards governed by The Danish Health Data Authority, after consideration by RUSA (Rådgivende Udvalg for Standarder og Arkitektur).

### Governance

FHIR profiles are managed under HL7 Denmark in the HL7 Danish FHIR working group:

* [Source](https://github.com/hl7dk/dk-core)
* [Wiki](https://github.com/hl7dk/dk-core)


### Collaboration
This guide is the product of collaborative work undertaken with participants from:

* [Danish FHIR Implementers Community](https://confluence.hl7.org/display/HD/DK+FHIR+SIG)
* [HL7 Denmark](https://www.hl7.dk)

### Language
The main language of this implementation guide, and the profiles in it, is English. Content that does not have an official English term uses a Danish term instead. Sometimes terms are expalined using both Danish and Dnglish. Danish terms and explanaitions are prefixed with 'Da'
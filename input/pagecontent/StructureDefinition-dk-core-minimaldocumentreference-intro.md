### Scope and Usage

The Danish Core MinimalDocumentReference profile is intended to encapsulate the data model of a DocumentReference as used in a Danish context of Document sharing, whether it is FHIR or CDA Documents and whether it is native XDS infrastructure or used in an MHD context [IHE MHD DocumentReference Minimal specification 4.2.2](https://profiles.ihe.net/ITI/MHD/4.2.2/StructureDefinition-IHE.MHD.Minimal.DocumentReference.html). 

**Conformance to IHE and Danish XDS Context**

This profile inherits from an IHE profile, which have MustSupport assigned to quite a few elements. While this is not the behaviour we normally support in the Danish Core-IG, we accept it in this case, as we are not inheriting from a pure FHIR Core ressource, but an already profiled resource. Consequently, we comform to the approach of IHE and follow their direction of using a DocumentReference profile in a strict XDS/MHD context rather than in a general context. In doing so, we have also constrained this profile to the Danish XDS environment hosted by Sundhedsdatastyrelsen (soon Digital Sundhed Danmark). This means constraining the cardinality of both Author and Subject (Patient) to be required.

**Inheritance or imposing**

Normally, when a DK Core profile is deriving from a FHIR Core ressource, we would use derivation, and when "deriving" from another profiled FHIR ressource we would impose such a profile on our profile, but, in this case, we find it useful to derive from the IHE profile. That means that you'll need to consult the IHE documentation for their profiling of MinimalDocumentReference to know in depth, what our profile is about. Our profile is also an IHE MinimalDocumentReference profile. If our profile had imposed the IHE profile, we would have been obliged to document the reason for conforming in that way. Our profile is not also an IHE MinimalDocumentReference profile. Our profile just conforms to the IHE profile.
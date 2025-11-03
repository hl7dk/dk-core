### Scope and Usage

The Danish Core MinimalDocumentReference profile is intended to encapsulate the data model of a DocumentReference as used in a Danish context of Document sharing, whether it is FHIR or CDA Documents and whether it is native XDS infrastructure or used in an MHD context [IHE MHD DocumentReference Minimal specification 4.2.2](https://profiles.ihe.net/ITI/MHD/4.2.2/StructureDefinition-IHE.MHD.Minimal.DocumentReference.html). 

**MustSupport**

This profile inherits from an IHE profile, which have MustSupport assigned to quite a few elements. While this is not the behaviour we use to support in the Danish Core-IG, we accept it in this case, as we are not inheriting from a pure FHIR Core ressource, but an already profiled resource. As such we are comforming to the approach of IHE and follows their direction of using a DocumentReference profile in a strict Danish National XDS/MDH environment hosted by Sundhedsdatastyrelsen (soon Digital Sundhed Danmark). As we do this we have also constrained the cardinality of both Author and subject (Patient) to be required.

**Inheritance or imposing**

Normally, when a DK Core profile is derived from a FHIR Core resource, derivation is applied. When "deriving" from another profiled FHIR resource, the DK Core profile would normally impose that profile. In this case, the profile is derived directly from the IHE profile, as this approach better reflects the intended use. If the profile had instead imposed the IHE profile, it would have been necessary to document the justification for conforming in that manner. To fully understand the background and structure of this profile, readers should consult the IHE documentation for the MinimalDocumentReference profile. The profile conforms to the IHE MinimalDocumentReference profile but does  redefine it in terms of referring DK-Core profiles, where they exist and does extend it with an  .
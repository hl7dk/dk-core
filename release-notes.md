Dk-core version 3.2.0 has been approved by HL7 Denmark. 

The changes between 3.1.0 and 3.2.0 are: 
* Addition of the profile DkCoreRelatedPerson which includes
    * Associated documentation and examples, 
    * ValueSet named DK Related Person Relationship Types,
    * CodeSystem named DK Related Person Relationship Codes, and
    * CodeSystem supplement named DK Role Code.
* Updated references in existing DkCoreCondition, DkCoreObservation, DkCorePatient from RelatedPerson resource to DkCoreRelatedPerson.
* Updated the ValueSet on Patient.contact.relationship to be DK Related Person Relationship Types.
* Added description of how to handle CPR registry civilstand and status values in DkCorePatient.
* Added the identifier ProducentId, and included it as identifier in DkCoreOrganization. An example is included to support the usage.
* Updated link to dokumentation in SORIdentifier.
* Added an example for DkCoreCondition concerning regional problem-list-items.
* Minor linguistic adjustments
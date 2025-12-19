* Release Notes 3.5.0 (since 3.4.0)
  - Introduced DkCoreEncounter profile with planned start/end and care-provider extensions plus inpatient examples; encounter priority narrowed to new A/EL value set.
  - Added DkCoreMinimalDocumentReference derived from IHE MHD Minimal DocumentReference for Danish XDS use, requiring author/subject, plus version extension and sample instances.
  - New SorPracticeSettingCode value set and ActCode 3.0.0 bindings strengthen document metadata for facility type/practice setting in XDS contexts.
  - Added DkCoreDocumentReferenceVersionID extension and expanded guidance explaining LPR3 treatment/care responsibilities, priority use, and MHD alignment.
  - IPA dependency bumped to 1.1.0 with SNOMED designations enabled; added HL7 R5/UV extension packages and IHE MHD dependency support.
  - NPU terminology refreshed with correct canonical, identifiers, license, and case sensitivity; UCUM bindings on basic observations now bind on code and the NPU subset was tidied.
  - GLN identifier canonical fixed to http://www.gs1.org/gln and GLN-tagged organization examples added for serviceProvider/careProvider use.
  - Practitioner official health authorization slice now allows multiple registrations (e.g., multiple SST authorizations) and example data updated accordingly.


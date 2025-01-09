Profile: IPADkCorePatient
Parent: DkCorePatient
Title: "Danish IPA Core Patient Profile"
Description: "HL7 Denmark core profile for IPA and DK Core compliant patients"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-imposeProfile"
* ^extension[=].valueCanonical = "http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-patient"

Profile: IPADkCoreCondition
Parent: DkCoreCondition
Title: "Danish IPA Core Condition Profile"
Description: "HL7 Denmark core profile for IPA and DK Core compliant conditions"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-imposeProfile"
* ^extension[=].valueCanonical = "http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-condition"


Profile: IPADkCoreObservation
Parent: DkCoreObservation
Title: "Danish IPA Core Observation Profile"
Description: "HL7 Denmark core profile for IPA and DK Core compliant observations"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-imposeProfile"
* ^extension[=].valueCanonical = "http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-observation"
* subject only Reference(DkCorePatient)

Profile: IPADkCorePractitioner
Parent: DkCorePractitioner
Title: "Danish IPA Core Practitioner Profile"
Description: "HL7 Denmark core profile for IPA and DK Core compliant practitioners"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-imposeProfile"
* ^extension[=].valueCanonical = "http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-practitioner"

Profile: IPADkCorePractitionerRole
Parent: DkCorePractitionerRole
Title: "Danish IPA Core PractitionerRole Profile"
Description: "HL7 Denmark core profile for IPA and DK Core compliant practitionerroles"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-imposeProfile"
* ^extension[=].valueCanonical = "http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-practitionerrole"
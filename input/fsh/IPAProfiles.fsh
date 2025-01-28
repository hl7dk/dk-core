Instance: expParam
InstanceOf: Parameters
Description: "SNOMED CT expansion parameter"
Usage: #definition
* parameter[+].name = "system-version"
* parameter[=].valueCanonical = $sct-dk-version
//* parameter[+].name = "includeDesignations"
//* parameter[=].valueBoolean = true
//* parameter[+].name = "displayLanguage"
//* parameter[=].valueCode = urn:ietf:bcp:47#da

Profile: IpaDkCorePatient
Parent: DkCorePatient
Id: ipa-dk-core-patient
Title: "Danish IPA Core Patient Profile"
Description: "HL7 Denmark core profile for IPA and DK Core compliant patients"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-imposeProfile"
* ^extension[=].valueCanonical = "http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-patient"

Profile: IpaDkCoreCondition
Parent: DkCoreCondition
Id: ipa-dk-core-condition
Title: "Danish IPA Core Condition Profile"
Description: "HL7 Denmark core profile for IPA and DK Core compliant conditions"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-imposeProfile"
* ^extension[=].valueCanonical = "http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-condition"


Profile: IpaDkCoreObservation
Parent: DkCoreObservation
Id: ipa-dk-core-observation
Title: "Danish IPA Core Observation Profile"
Description: "HL7 Denmark core profile for IPA and DK Core compliant observations"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-imposeProfile"
* ^extension[=].valueCanonical = "http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-observation"
* subject only Reference(IpaDkCorePatient)

Profile: IpaDkCorePractitioner
Parent: DkCorePractitioner
Id: ipa-dk-core-practitioner
Title: "Danish IPA Core Practitioner Profile"
Description: "HL7 Denmark core profile for IPA and DK Core compliant practitioners"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-imposeProfile"
* ^extension[=].valueCanonical = "http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-practitioner"

Profile: IpaDkCorePractitionerRole
Parent: DkCorePractitionerRole
Id: ipa-dk-core-practitionerrole
Title: "Danish IPA Core PractitionerRole Profile"
Description: "HL7 Denmark core profile for IPA and DK Core compliant practitionerroles"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-imposeProfile"
* ^extension[=].valueCanonical = "http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-practitionerrole"
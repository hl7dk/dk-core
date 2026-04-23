Alias: $sct = http://snomed.info/sct|http://snomed.info/sct/554471000005108 // Danish version - append e.g. /version/20250930 to get a more specific version
Alias: $sct-int = http://snomed.info/sct // International version (no edition/version specified)
Alias: $sct-dk-version = http://snomed.info/sct|http://snomed.info/sct/554471000005108
Alias: $condition-clinical = http://terminology.hl7.org/CodeSystem/condition-clinical
Alias: $condition-category = http://terminology.hl7.org/CodeSystem/condition-category
Alias: $condition-ver-status = http://terminology.hl7.org/CodeSystem/condition-ver-status
Alias: $v2-0203 = http://terminology.hl7.org/CodeSystem/v2-0203
Alias: $dk-core-municipality-codes = http://hl7.dk/fhir/core/CodeSystem/dk-core-municipality-codes
Alias: $dk-core-regional-subdivision-codes = http://hl7.dk/fhir/core/CodeSystem/dk-core-regional-subdivision-codes
Alias: $iso3166-2 = urn:iso:std:iso:3166:-2
Alias: $v3-MaritalStatus = http://terminology.hl7.org/CodeSystem/v3-MaritalStatus
Alias: $dk-marital-status = http://hl7.dk/fhir/core/CodeSystem/dk-marital-status
Alias: $DkCoreProfessionGroupCodes = http://hl7.dk/fhir/core/CodeSystem/DkCoreProfessionGroupCodes
Alias: $condition-dueTo = http://hl7.org/fhir/StructureDefinition/condition-dueTo
Alias: $condition-code = http://hl7.org/fhir/ValueSet/condition-code
Alias: $sor-organization-type = http://hl7.dk/fhir/core/ValueSet/sor-organization-type
Alias: $dk-marital-status_1 = http://hl7.dk/fhir/core/ValueSet/dk-marital-status
Alias: $ucum = http://unitsofmeasure.org
Alias: $NPU = http://npu-terminology.org
Alias: $Medcom = http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-observation-codes
Alias: $SKS = urn:oid:1.2.208.176.2.4
Alias: $LOINC = http://loinc.org
Alias: $IEEEx73 = urn:iso:std:iso:11073:10101
Alias: $observation-category = http://terminology.hl7.org/CodeSystem/observation-category
Alias: $observation-vitalsigns = http://hl7.org/fhir/StructureDefinition/vitalsigns
Alias: $observation-bodyweight = http://hl7.org/fhir/StructureDefinition/bodyweight
Alias: $observation-heartrate = http://hl7.org/fhir/StructureDefinition/heartrate
Alias: $observation-bp = http://hl7.org/fhir/StructureDefinition/bp
Alias: $LOINC-vitalsigns = http://hl7.org/fhir/ValueSet/observation-vitalsignresult
Alias: $v3-Confidentiality = http://terminology.hl7.org/CodeSystem/v3-Confidentiality
Alias: $v3-RoleCode = http://terminology.hl7.org/CodeSystem/v3-RoleCode
Alias: $v3-ActPriority = http://terminology.hl7.org/CodeSystem/v3-ActPriority
Alias: $v3-ActCode3.0.0 = http://terminology.hl7.org/ValueSet/v3-ActCode|3.0.0
Alias: $atc = http://www.whocc.no/atc
// FMK schema namespace (see https://wiki.fmk-teknik.dk/fmk:extensions:e5). FMK's canonical
// identifier for an ordination is the DrugMedicationIdentifier (a long, paired with Version
// when a specific revision is meant); there is no separate "ordination" identifier.
Alias: $FmkDrugMedicationId = http://www.dkma.dk/medicinecard/xml.schema/2015/06/01/DrugMedicationIdentifier
Alias: $FmkDrugMedicationVersion = http://www.dkma.dk/medicinecard/xml.schema/2015/06/01/DrugMedicationVersion
// Varenummer from Medicinpriser (LMS01 field 1); 11-digit product identifier.
Alias: $FmkDrugId = http://www.dkma.dk/medicinecard/xml.schema/2015/06/01/DrugIdentifier
Alias: $FmkActiveSubstance = http://www.dkma.dk/medicinecard/xml.schema/2015/06/01/ActiveSubstance
Alias: $mr-effectiveDosePeriod = http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationRequest.effectiveDosePeriod
Alias: $mr-renderedDosageInstruction = http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationRequest.renderedDosageInstruction
Alias: $ms-adherence = http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationStatement.adherence
Alias: $ihe-prescribedQuantity = https://profiles.ihe.net/PHARM/MPD/StructureDefinition/ihe-ext-medicationrequest-prescribedQuantity
Alias: $imposeProfile = http://hl7.org/fhir/StructureDefinition/structuredefinition-imposeProfile
Alias: $eu-medicationRequest = http://hl7.eu/fhir/base/StructureDefinition/medicationRequest-eu-core
Alias: $eu-medicationStatement = http://hl7.eu/fhir/base/StructureDefinition/medicationStatement-eu-core
Alias: $eu-medication = http://hl7.eu/fhir/base/StructureDefinition/medication-eu-core
// DDV (Det Danske Vaccinationsregister) XML schema namespace, base interface 1.4.0 + E1.
// Source of truth: https://wiki.fmk-teknik.dk/fmk:ddv:extensions:e1
Alias: $DdvVaccinationId = http://vaccinationsregister.dk/schemas/2013/12/01/VaccinationIdentifier
Alias: $DdvVaccinationVersion = http://vaccinationsregister.dk/schemas/2013/12/01/VaccinationVersionIdentifier
Alias: $DdvVaccineId = http://vaccinationsregister.dk/schemas/2013/12/01/VaccineIdentifier
Alias: $DdvCredibility = http://vaccinationsregister.dk/schemas/2013/12/01/VaccinationCredibility
Alias: $DdvPatientId = https://www.sundhed.dk/patient
Alias: $DanishXdsOid = urn:oid:1.2.208.184.100.9
Alias: $MedComFormatOID = urn:oid:1.2.208.184.100.10
Alias: $IANALanguageOID = urn:oid:2.16.840.1.113883.6.121
Alias: $IANAMediaOID = urn:oid:2.16.840.1.113883.5.79

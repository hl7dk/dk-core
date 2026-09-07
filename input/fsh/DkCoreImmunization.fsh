Profile: DkCoreImmunization
Parent: Immunization
Id: dk-core-immunization
Title: "Danish Core Immunization Profile"
Description: "HL7 Denmark core profile for an administered vaccination, aligned with Det Danske Vaccinationsregister (DDV)"
* ^status = #active
* identifier ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
  * ^slicing.ordered = false
  * ^slicing.description = "Slice identifier by system to carry the DDV VaccinationIdentifier"
* identifier contains
    DdvVaccinationId 0..1
* identifier[DdvVaccinationId] ^short = "[DA] DDV vaccinationsid"
  * system 1..
  * system = $DdvVaccinationId (exactly)
  * value 1..
* meta.source ^short = "Register or system the vaccination was recorded in, where one can be identified"
* meta.security ^short = "[DA] Privatmarkering"
* status ^short = "Status of the vaccination - an administered vaccination is completed"
* statusReason ^short = "Reason the vaccination was not administered - not used by this profile"
* vaccineCode.coding ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
  * ^slicing.ordered = false
  * ^slicing.description = "Slice vaccineCode.coding by system to accommodate ATC or SNOMED CT coding alongside the DDV VaccineName free text"
* vaccineCode.coding contains
    ATC 0..1 and
    SCTVaccineCode 0..1 and
    DdvVaccine 0..1
* vaccineCode.coding[ATC] ^short = "WHO ATC code for the vaccine, descending from J07"
* vaccineCode.coding[ATC] from VaccineATCCodes (required)
  * system 1..
  * system = $atc (exactly)
  * code 1..
* vaccineCode.coding[SCTVaccineCode] ^short = "SNOMED CT code for the vaccine"
  * system 1..
  * system = "http://snomed.info/sct"
  * code 1..
* vaccineCode.coding[DdvVaccine] ^short = "[DA] DDV vaccineid"
  * system 1..
  * system = $DdvVaccineId (exactly)
  * code 1..
* patient only Reference(DkCorePatient)
* patient 1..
* primarySource ^short = "Whether the record was captured by the party that administered the vaccination"
* reportOrigin ^short = "Source of the record when it was not captured by the administering party"
* performer.actor only Reference(DkCorePractitioner or DkCorePractitionerRole or DkCoreOrganization)
* performer.actor ^short = "Who administered the vaccination - a structured reference is preferred over a free-text display"
* protocolApplied ^short = "Vaccination course or series that the administration is part of"
* note ^short = "Additional information about the vaccination without a dedicated element"
* note ^comment = "Do not use `note` for information that has a dedicated element. Provenance of the registration belongs in `primarySource` / `reportOrigin`, and a planned next dose belongs in a plan element referenced by this resource - see the profile documentation."


Mapping: DkCoreImmunizationToDdv
Source: DkCoreImmunization
Target: "https://wiki.fmk-teknik.dk/fmk:ddv:extensions:e1"
Title: "Det Danske Vaccinationsregister (DDV)"
Id: dk-core-immunization-ddv
* -> "Vaccination" "**DDV Vaccination (namespace `http://vaccinationsregister.dk/schemas/2013/12/01`).**"
* meta.source -> "Vaccination" "Fixed to the DDV schema namespace `http://vaccinationsregister.dk/schemas/2013/12/01` for records sourced from DDV."
* identifier[DdvVaccinationId] -> "Vaccination.VaccinationIdentifier" "Numeric DDV identifier of the vaccination (positive long)."
* meta.versionId -> "Vaccination.VaccinationVersionIdentifier" "Revision number of the vaccination."
* status -> "Vaccination.ActiveStatus" "`ActiveStatus = true` (Status=A) is `completed`; `ActiveStatus = false` (Status=D, deleted) is `entered-in-error`. DDV does not record refusals/omissions, so `not-done`/`statusReason` cannot be derived."
* meta.security -> "Vaccination.NegativeConsentIndicator" "`NegativeConsentIndicator = true` is a citizen private-marking (not a refusal); the vaccination is still effectuated. Carried as `meta.security = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#R`, mirroring DkCorePatient. Only visible via værdispring/consent."
* vaccineCode -> "Vaccination.Vaccine" "Structured DDV `Vaccine` (VaccineName + ATC + Disease[] + SSIDrug[] + …)."
* vaccineCode.coding[ATC] -> "Vaccination.Vaccine.ATC.Code / ATC.Text" "WHO ATC code, which must descend from J07 - see the profile documentation on vaccine coding."
* vaccineCode.coding[DdvVaccine] -> "Vaccination.Vaccine.VaccineIdentifier" "SSI numeric vaccine identifier."
* vaccineCode.text -> "Vaccination.Vaccine.VaccineName" "Free-text product name (≤100 chars)."
* patient -> "Patient" "Vaccinated patient (CPR reference in DDV)."
* occurrence[x] -> "Vaccination.EffectuatedDateTime / Vaccination.Effectuated.EffectuatedDateTime" "Time the vaccination was administered."
* recorded -> "Vaccination.Created.CreatedDateTime" "Time the vaccination record was created in DDV."
* primarySource -> "Vaccination.IsPrevious" "`IsPrevious = true` is `primarySource = false` - see the profile documentation on registration provenance."
* reportOrigin -> "Vaccination.VaccinationCredibility" "Credibility/origin of a secondarily reported registration. The `immunization-origin` code where one corresponds, with the DDV wording in `reportOrigin.text` - see the profile documentation on registration provenance for the value-by-value correspondence."
* performer.actor -> "Vaccination.Effectuated.EffectuatedByName / AuthorisationIdentifier / EffectuatedByOrganisationName / Number" "Who effectuated the vaccination. DDV often provides this as free text (EffectuatedByName); map to `actor.display` when no structured reference is available, or resolve `AuthorisationIdentifier` / organisation details to a DkCorePractitioner / DkCoreOrganization reference where possible."
* lotNumber -> "Vaccination.BatchNumber" "Lot / batch number. Always recorded in DDV, but not necessarily exposed to every consumer - see the profile documentation on batch numbers."
* protocolApplied.targetDisease -> "Vaccination.Vaccine.Disease[]" "Target disease(s) with optional DiseaseIdentifier + DiseaseName(DK) + ATC."
* protocolApplied -> "Vaccination.EffectuatedPlannedItem" "When the effectuation is part of a vaccination course/series, course information is usually found in the DDV `EffectuatedPlannedItem` element."
* note -> "Vaccination.CoverageDuration" "`CoverageDuration` is not a structured duration in the DDV interface and must not be parsed as a computable next-dose-due. `Vaccination.ConfirmedByPrescriptionServer` is deliberately not mapped - it is subsumed by `VaccinationCredibility`, which is carried in `reportOrigin`."


Instance: JohnImmunizationInfluvac
InstanceOf: DkCoreImmunization
Title: "John's Influvac vaccination"
Description: "Example DkCoreImmunization derived from a DDV Vaccination record for influenza (Influvac). The performer is only known as free text, so it is carried in performer.actor.display."
Usage: #example
* meta.source = $Ddv
* identifier[DdvVaccinationId].system = $DdvVaccinationId
* identifier[DdvVaccinationId].value = "32206056656"
* status = #completed
* vaccineCode.text = "Influvac mod Influenza"
* vaccineCode.coding[ATC] = $atc#J07BB02 "influenza, inactivated, split virus or surface antigen"
* patient = Reference(Patient/john)
* occurrenceDateTime = "2025-09-30T09:11:14+02:00"
* recorded = "2025-09-30T09:11:14+02:00"
* performer.actor.display = "Danske Lægers Vaccinations Service"
* lotNumber = "T-036021"
* primarySource = true
* note.text = "CoverageDuration: 1 year"


Instance: JohnImmunizationNegativeConsent
InstanceOf: DkCoreImmunization
Title: "John's privatmarkerede vaccination"
Description: "Example DkCoreImmunization for a DDV Vaccination where NegativeConsentIndicator = true. The vaccination is still effectuated (status = completed); the citizen has private-marked it, so it carries a Restricted confidentiality security label and is only visible via værdispring or consent. Private-marking does not reduce the data completeness of the record - it carries performer, lotNumber and notes on equal footing with every other registration - and the performer is here given as a structured reference rather than free text."
Usage: #example
* meta.source = $Ddv
* meta.security = $v3-Confidentiality#R "Restricted"
* identifier[DdvVaccinationId].system = $DdvVaccinationId
* identifier[DdvVaccinationId].value = "1"
* status = #completed
* vaccineCode.text = "Twinrix Voksen mod Hepatitis A og B"
* vaccineCode.coding[ATC] = $atc#J07BC20 "combinations"
* patient = Reference(Patient/john)
* occurrenceDateTime = "2025-09-30T14:22:07+02:00"
* recorded = "2025-09-30T14:22:07+02:00"
* performer.actor = Reference(LaegerneHasserisBymidte)
* lotNumber = "A21CB456A"
* primarySource = true
* note.text = "CoverageDuration: 6 months"


Instance: JohnImmunizationCitizenReported
InstanceOf: DkCoreImmunization
Title: "John's citizen-reported vaccination"
Description: "Example DkCoreImmunization for a vaccination administered abroad and subsequently reported by the citizen. In DDV this is IsPrevious = true with VaccinationCredibility = 'Oprettet af borger', which is carried as primarySource = false together with reportOrigin - not as a free-text note. Because the citizen is the source, no performer and no batch number are available."
Usage: #example
* meta.source = $Ddv
* identifier[DdvVaccinationId].system = $DdvVaccinationId
* identifier[DdvVaccinationId].value = "32206059912"
* status = #completed
* vaccineCode.text = "Havrix mod Hepatitis A"
* vaccineCode.coding[ATC] = $atc#J07BC02 "hepatitis A, inactivated, whole virus"
* patient = Reference(Patient/john)
* occurrenceDateTime = "2019-06-14"
* recorded = "2025-09-30T10:02:41+02:00"
* primarySource = false
* reportOrigin = $immunization-origin#recall "Parent/Guardian/Patient Recall"
* reportOrigin.text = "Oprettet af borger"

Profile: DkCoreImmunization
Parent: Immunization
Id: dk-core-immunization
Title: "Danish Core Immunization Profile"
Description: "HL7 Denmark core profile for an administered or refused vaccination, aligned with Det Danske Vaccinationsregister (DDV) interface 1.4.0 + E1. Authoritative DDV XML schemas are published at https://wiki.fmk-teknik.dk/fmk:ddv:extensions:e1 with target namespace `http://vaccinationsregister.dk/schemas/2013/12/01`. A DDV `Vaccination` carries a numeric `VaccinationIdentifier` (+ `VaccinationVersionIdentifier`), a structured `Vaccine` element (VaccineIdentifier + VaccineName + Disease[] + ATC + SSIDrug[]), an optional `Effectuated` structure (date, effectuator name, authorisation and organisation), `CoverageDuration`, `BatchNumber`, `ActiveStatus`, `NegativeConsentIndicator`, `VaccinationCredibility` (credibility enum whose values include `Oprettet af borger` / citizen-created), and flags such as `IsPrevious` and `ConfirmedByPrescriptionServer`."
* ^status = #active
* identifier ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
  * ^slicing.ordered = false
  * ^slicing.description = "Slice identifier by system to carry DDV VaccinationIdentifier (+ optional VaccinationVersionIdentifier)"
* identifier contains
    DdvVaccinationId 0..1 and
    DdvVaccinationVersion 0..1
* identifier[DdvVaccinationId] ^short = "[DA] DDV VaccinationIdentifier - unik identifikation af en vaccination (positiv long)."
  * system 1..
  * system = $DdvVaccinationId (exactly)
  * value 1..
* identifier[DdvVaccinationVersion] ^short = "[DA] DDV VaccinationVersionIdentifier - pairs with DdvVaccinationId to identify a specific revision."
  * system 1..
  * system = $DdvVaccinationVersion (exactly)
  * value 1..
* status ^short = "Status for vaccinationen. `completed` = effektueret (DDV Vaccination.ActiveStatus = true); `not-done` = aflyst/afvist, herunder DDV Vaccination.NegativeConsentIndicator = true eller ActiveStatus = false. `entered-in-error` bruges for fejlregistreringer."
* statusReason ^short = "Begrundelse når status = not-done, fx negativt samtykke (NegativeConsentIndicator = true) eller aflyst vaccination."
* vaccineCode ^short = "Vaccinen. DDV leverer strukturen DDV Vaccination.Vaccine som VaccineName (≤100 tegn fritekst), ATC (Code + Text), Disease[] (sygdom m. ATC), SSIDrug[] (SSI-lægemiddel) og DisplayMinimumVaccinationPlan[]. VaccineName mappes til vaccineCode.text; ATC til vaccineCode.coding[ATC]."
* vaccineCode.coding ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
  * ^slicing.ordered = false
  * ^slicing.description = "Slice vaccineCode.coding by system to accommodate ATC or SNOMED CT coding alongside the DDV VaccineName free text"
* vaccineCode.coding contains
    ATC 0..1 and
    SCTVaccineCode 0..1 and
    DdvVaccine 0..1
* vaccineCode.coding[ATC] ^short = "WHO ATC code for vaccinen (J07-gruppen). In DDV: Vaccination.Vaccine.ATC.Code / ATC.Text."
  * system 1..
  * system = $atc (exactly)
  * code 1..
* vaccineCode.coding[SCTVaccineCode] ^short = "SNOMED CT code for vaccinen."
  * system 1..
  * system = "http://snomed.info/sct"
  * code 1..
* vaccineCode.coding[DdvVaccine] ^short = "[DA] DDV VaccineIdentifier - SSI-numerisk identifikation af vaccinen (findes på Vaccination.Vaccine.VaccineIdentifier)."
  * system 1..
  * system = $DdvVaccineId (exactly)
  * code 1..
* patient only Reference(DkCorePatient)
* patient 1..
* occurrence[x] ^short = "Tidspunktet hvor vaccinationen blev givet. Mappes fra DDV Vaccination.EffectuatedDateTime (eller Vaccination.Effectuated.EffectuatedDateTime når effektueringen er leveret som struktureret element)."
* recorded ^short = "Tidspunkt hvor vaccinationen blev registreret i DDV. Mappes fra DDV Vaccination.Created.CreatedDateTime når det findes; falder tilbage til EffectuatedDateTime."
* performer.actor only Reference(DkCorePractitioner or DkCorePractitionerRole or DkCoreOrganization)
* performer.actor ^short = "Den der har effektueret vaccinationen. DDV Vaccination.Effectuated.EffectuatedByName er en fritekst (≤200 tegn) og placeres i actor.display når en egentlig reference ikke er tilgængelig. Strukturerede felter: Effectuated.AuthorisationIdentifier (yder-/autorisationsnummer), Effectuated.EffectuatedByOrganisationName / Number / Type, Effectuated.EffectuatedInCountryCode."
* lotNumber ^short = "Batchnummer. In DDV: Vaccination.BatchNumber."
* protocolApplied.targetDisease ^short = "Sygdom(me) vaccinationen beskytter imod. In DDV: Vaccination.Vaccine.Disease[] (DiseaseIdentifier + DiseaseName + DiseaseNameDK + ATC)."
* note ^short = "Fri tekst. Anvendes blandt andet til DDV CoverageDuration, VaccinationCredibility (fx \"Oprettet af borger\" svarer til borger-registreret / selfcreated), ConfirmedByPrescriptionServer, IsPrevious, og historikoplysninger der ikke har et dedikeret Immunization-element."


Mapping: DkCoreImmunizationToDdv
Source: DkCoreImmunization
Target: "https://wiki.fmk-teknik.dk/fmk:ddv:extensions:e1"
Title: "Det Danske Vaccinationsregister (DDV)"
Id: dk-core-immunization-ddv
* -> "Vaccination" "**DDV Vaccination (namespace `http://vaccinationsregister.dk/schemas/2013/12/01`).**"
* identifier[DdvVaccinationId] -> "Vaccination.VaccinationIdentifier" "Numeric DDV identifier of the vaccination (positive long)."
* identifier[DdvVaccinationVersion] -> "Vaccination.VaccinationVersionIdentifier" "Revision number - populate alongside the identifier when pointing to a specific version."
* status -> "Vaccination.ActiveStatus / Vaccination.NegativeConsentIndicator" "`completed` when `ActiveStatus = true` and `NegativeConsentIndicator` is false/absent; `not-done` when `NegativeConsentIndicator = true` or `ActiveStatus = false`."
* vaccineCode -> "Vaccination.Vaccine" "Structured DDV `Vaccine` (VaccineName + ATC + Disease[] + SSIDrug[] + …)."
* vaccineCode.coding[ATC] -> "Vaccination.Vaccine.ATC.Code / ATC.Text" "WHO ATC code - typically J07*."
* vaccineCode.coding[DdvVaccine] -> "Vaccination.Vaccine.VaccineIdentifier" "SSI numeric vaccine identifier."
* vaccineCode.text -> "Vaccination.Vaccine.VaccineName" "Free-text product name (≤100 chars)."
* patient -> "Patient" "Vaccinated patient (CPR reference in DDV)."
* occurrence[x] -> "Vaccination.EffectuatedDateTime / Vaccination.Effectuated.EffectuatedDateTime" "Time the vaccination was administered."
* recorded -> "Vaccination.Created.CreatedDateTime" "Time the vaccination record was created in DDV."
* performer.actor -> "Vaccination.Effectuated.EffectuatedByName / AuthorisationIdentifier / EffectuatedByOrganisationName / Number" "Who effectuated the vaccination. DDV often provides this as free text (EffectuatedByName); map to `actor.display` when no structured reference is available, or resolve `AuthorisationIdentifier` / organisation details to a DkCorePractitioner / DkCoreOrganization reference where possible."
* lotNumber -> "Vaccination.BatchNumber" "Lot / batch number."
* protocolApplied.targetDisease -> "Vaccination.Vaccine.Disease[]" "Target disease(s) with optional DiseaseIdentifier + DiseaseName(DK) + ATC."
* note -> "Vaccination.CoverageDuration / VaccinationCredibility / IsPrevious / ConfirmedByPrescriptionServer" "Free-text notes for DDV fields without a dedicated Immunization element. `VaccinationCredibility` enum: `Slettet`, `Oprettet af læge / medhjælp`, `Oprettet på baggrund af data fra Sygesikringsregisteret`, `Udleveret på apotek og godkendt af læge`, `Oprettet af læge eller oprettet af borger og godkendt af læge`, `Udleveret på apotek`, `Oprettet af borger`."


Instance: JohnImmunizationInfluvac
InstanceOf: DkCoreImmunization
Title: "John's Influvac vaccination"
Description: "Example DkCoreImmunization derived from a DDV Vaccination record for influenza (Influvac)."
Usage: #example
* identifier[DdvVaccinationId].system = $DdvVaccinationId
* identifier[DdvVaccinationId].value = "32206056656"
* status = #completed
* vaccineCode.text = "Influvac mod Influenza"
* vaccineCode.coding[ATC] = $atc#J07BB02 "Influenza, inactivated, split virus or surface antigen"
* patient = Reference(Patient/john)
* occurrenceDateTime = "2025-09-30T09:11:14+02:00"
* recorded = "2025-09-30T09:11:14+02:00"
* performer.actor.display = "Danske Lægers Vaccinations Service"
* note[+].text = "CoverageDuration: 1 year"
* note[+].text = "VaccinationCredibility: Oprettet af læge / medhjælp"


Instance: JohnImmunizationNegativeConsent
InstanceOf: DkCoreImmunization
Title: "John's afviste vaccination"
Description: "Example DkCoreImmunization for a DDV Vaccination where NegativeConsentIndicator = true, mapping to status = not-done."
Usage: #example
* identifier[DdvVaccinationId].system = $DdvVaccinationId
* identifier[DdvVaccinationId].value = "1"
* status = #not-done
* vaccineCode.text = "Example Vaccine"
* patient = Reference(Patient/john)
* occurrenceDateTime = "2025-09-30"
* note[+].text = "NegativeConsentIndicator = true"

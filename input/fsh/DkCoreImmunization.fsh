Profile: DkCoreImmunization
Parent: Immunization
Id: dk-core-immunization
Title: "Danish Core Immunization Profile"
Description: "HL7 Denmark core profile for an administered vaccination, aligned with Det Danske Vaccinationsregister (DDV) interface 1.4.0 + E1. A registered DDV `Vaccination` is **always** an administered/effectuated vaccination, so `status` is essentially always `completed`; `ActiveStatus` is only used to mark a deletion (a `Vaccination` may exist in several versions with `Status=A` (Active) and later be deleted, whereby the latest version gets `Status=D` (Deleted)) which maps to `entered-in-error`. Refusals/omissions are **not** recorded as DDV Vaccinations, so FHIR `status = not-done` / `statusReason` cannot be derived from DDV. Authoritative DDV XML schemas are published at https://wiki.fmk-teknik.dk/fmk:ddv:extensions:e1 with target namespace `http://vaccinationsregister.dk/schemas/2013/12/01`. A DDV `Vaccination` carries a numeric `VaccinationIdentifier` (with `VaccinationVersionIdentifier` as a revision/optimistic-locking token, mapped to `meta.versionId`), a structured `Vaccine` element (VaccineIdentifier + VaccineName + Disease[] + ATC + SSIDrug[]), an optional `Effectuated` structure (date, effectuator name, authorisation and organisation), an optional `EffectuatedPlannedItem` (course/series context), `CoverageDuration`, `BatchNumber`, `ActiveStatus`, `NegativeConsentIndicator` (citizen private-marking, not a refusal), `VaccinationCredibility` (credibility enum whose values include `Oprettet af borger` / citizen-created), and flags such as `IsPrevious` and `ConfirmedByPrescriptionServer`."
* ^status = #active
* identifier ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
  * ^slicing.ordered = false
  * ^slicing.description = "Slice identifier by system to carry the DDV VaccinationIdentifier"
* identifier contains
    DdvVaccinationId 0..1
* identifier[DdvVaccinationId] ^short = "[DA] DDV VaccinationIdentifier - unik identifikation af en vaccination (positiv long)."
  * system 1..
  * system = $DdvVaccinationId (exactly)
  * value 1..
* meta.versionId ^short = "[DA] DDV VaccinationVersionIdentifier - revisionsnummer for vaccinationen. Bruges internt i DDV til optimistic locking ved updates og svarer til FHIRs versionsmekanisme (meta.versionId / _history)."
* meta.security ^short = "[DA] Privatmarkering. Når DDV Vaccination.NegativeConsentIndicator = true har borgeren ønsket at privatmarkere vaccinationen. Den er stadig effektueret på lige fod med øvrige registreringer (status = completed), men må ikke synliggøres med mindre den sundhedsansvarlige anvender værdispring eller har samtykke. Markeres som dk-core gør på Patient: meta.security = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#R (Restricted)."
* status ^short = "Status for vaccinationen. En registreret DDV Vaccination er altid effektueret, så `completed` er den normale værdi (DDV Vaccination.ActiveStatus = true / Status=A). `entered-in-error` bruges når en vaccination er slettet i DDV (ActiveStatus = false / seneste version Status=D). DDV registrerer ikke afviste/undladte vaccinationer, så `not-done`/`statusReason` kan IKKE udledes af DDV. NegativeConsentIndicator er ikke en afvisning, men en privatmarkering - se meta.security."
* statusReason ^short = "Kan IKKE udledes af DDV Vaccination-registreringer. Afviste/undladte vaccinationer registreres ikke som DDV Vaccinations, og historiske PlannedVaccinations kan ikke hentes via snitfladen."
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
* protocolApplied ^short = "Vaccinationsforløb/-serie. Hvis effektueringen er sket som del af et vaccinationsforløb, findes oplysninger om forløbet typisk i DDV Vaccination.EffectuatedPlannedItem."
* note ^short = "Fri tekst. Anvendes blandt andet til DDV CoverageDuration og felter uden et dedikeret Immunization-element. `VaccinationCredibility` angiver troværdighed/oprindelse (fx \"Oprettet af borger\" = borger-registreret). `IsPrevious = true` angiver at selve effektueringen er sket på et andet tidspunkt, sted og/eller af en anden person end den der registrerer - fx vaccinationer modtaget i udlandet eller før registrering i DDV blev lovpligtig; sådanne tidligere vaccinationer kan oprettes af både sundhedsfaglige og borgeren selv (afspejles i VaccinationCredibility). `ConfirmedByPrescriptionServer` har kun historisk interesse og siger noget om datakvaliteten - tilsvarende kan aflæses i VaccinationCredibility."


Mapping: DkCoreImmunizationToDdv
Source: DkCoreImmunization
Target: "https://wiki.fmk-teknik.dk/fmk:ddv:extensions:e1"
Title: "Det Danske Vaccinationsregister (DDV)"
Id: dk-core-immunization-ddv
* -> "Vaccination" "**DDV Vaccination (namespace `http://vaccinationsregister.dk/schemas/2013/12/01`).**"
* identifier[DdvVaccinationId] -> "Vaccination.VaccinationIdentifier" "Numeric DDV identifier of the vaccination (positive long)."
* meta.versionId -> "Vaccination.VaccinationVersionIdentifier" "Revision number, used internally in DDV for optimistic locking on updates. Maps to FHIR's resource versioning mechanism (`meta.versionId` / `_history`)."
* status -> "Vaccination.ActiveStatus" "A registered DDV Vaccination is always effectuated, so `completed` is the normal value (ActiveStatus = true / Status=A). `entered-in-error` when the vaccination has been deleted (ActiveStatus = false / latest version Status=D). DDV does not record refusals/omissions, so `not-done`/`statusReason` cannot be derived."
* meta.security -> "Vaccination.NegativeConsentIndicator" "`NegativeConsentIndicator = true` is a citizen private-marking (not a refusal); the vaccination is still effectuated. Carried as `meta.security = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#R`, mirroring DkCorePatient. Only visible via værdispring/consent."
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
* protocolApplied -> "Vaccination.EffectuatedPlannedItem" "When the effectuation is part of a vaccination course/series, course information is usually found in the DDV `EffectuatedPlannedItem` element."
* note -> "Vaccination.CoverageDuration / VaccinationCredibility / IsPrevious / ConfirmedByPrescriptionServer" "Free-text notes for DDV fields without a dedicated Immunization element. `IsPrevious = true` = the effectuation happened at another time/place/person than the registrar (e.g. abroad or before DDV registration was mandatory; may be created by professionals or the citizen). `ConfirmedByPrescriptionServer` has historical interest only (data quality), mirrored by `VaccinationCredibility`. `VaccinationCredibility` enum: `Slettet`, `Oprettet af læge / medhjælp`, `Oprettet på baggrund af data fra Sygesikringsregisteret`, `Udleveret på apotek og godkendt af læge`, `Oprettet af læge eller oprettet af borger og godkendt af læge`, `Udleveret på apotek`, `Oprettet af borger`."


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
Title: "John's privatmarkerede vaccination"
Description: "Example DkCoreImmunization for a DDV Vaccination where NegativeConsentIndicator = true. The vaccination is still effectuated (status = completed); the citizen has private-marked it, so it carries a Restricted confidentiality security label and is only visible via værdispring or consent."
Usage: #example
* meta.security = $v3-Confidentiality#R "Restricted"
* identifier[DdvVaccinationId].system = $DdvVaccinationId
* identifier[DdvVaccinationId].value = "1"
* status = #completed
* vaccineCode.text = "Example Vaccine"
* patient = Reference(Patient/john)
* occurrenceDateTime = "2025-09-30"

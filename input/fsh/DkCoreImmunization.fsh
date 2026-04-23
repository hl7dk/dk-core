Profile: DkCoreImmunization
Parent: Immunization
Id: dk-core-immunization
Title: "Danish Core Immunization Profile"
Description: "HL7 Denmark core profile for an administered or refused vaccination, aligned with Det Danske Vaccinationsregister (DDV) as exposed via sundhed.dk. A DDV vaccination carries a numeric VaccinationIdentifier, a free-text Vaccine name, an optional coverage duration, an effectuator, an effectuation date/time, and flags for active status, negative consent and self-created entries. See https://www.nspop.dk/pages/releaseview.action?pageId=31798109 for the DDV service description."
* ^status = #active
* identifier ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
  * ^slicing.ordered = false
  * ^slicing.description = "Slice identifier by system to carry the DDV VaccinationIdentifier"
* identifier contains
    DdvVaccinationId 0..1
* identifier[DdvVaccinationId] ^short = "[DA] DDV VaccinationIdentifier - identificerer en vaccination i Det Danske Vaccinationsregister"
  * system 1..
  * system = $DdvVaccinationId (exactly)
  * value 1..
* status ^short = "Status for vaccinationen. completed = effektueret (ActiveStatus = true i DDV); not-done = aflyst/afvist, herunder HasNegativeConsent = true. entered-in-error bruges for fejlregistreringer."
* statusReason ^short = "Begrundelse når status = not-done, fx negativ samtykke eller aflyst vaccination."
* vaccineCode ^short = "Vaccinen. DDV leverer typisk navnet som fritekst (Vaccine-feltet). ATC J07* eller SNOMED CT codings kan tilføjes hvor det er kendt."
* vaccineCode.coding ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
  * ^slicing.ordered = false
  * ^slicing.description = "Slice vaccineCode.coding by system to accommodate ATC or SNOMED CT coding alongside the DDV free-text name"
* vaccineCode.coding contains
    ATC 0..1 and
    SCTVaccineCode 0..1
* vaccineCode.coding[ATC] ^short = "WHO ATC code for vaccinen (J07-gruppen)."
  * system 1..
  * system = $atc (exactly)
  * code 1..
* vaccineCode.coding[SCTVaccineCode] ^short = "SNOMED CT code for vaccinen."
  * system 1..
  * system = "http://snomed.info/sct"
  * code 1..
* patient only Reference(DkCorePatient)
* patient 1..
* occurrence[x] ^short = "Tidspunktet hvor vaccinationen blev givet. Mappes fra DDV EffectuatedDateTime."
* recorded ^short = "Tidspunkt hvor vaccinationen blev registreret i DDV. Når dette ikke er særskilt tilgængeligt, anvendes EffectuatedDateTime."
* performer.actor only Reference(DkCorePractitioner or DkCorePractitionerRole or DkCoreOrganization)
* performer.actor ^short = "Den der har effektueret vaccinationen. DDV EffectuatedBy leveres ofte som fritekst (fx 'Danske Lægers Vaccinations Service') og kan placeres i actor.display når en egentlig reference ikke er tilgængelig."
* note ^short = "Fri tekst. Anvendes blandt andet til DDV CoverageDuration, SelfCreated, NegativeConsent og historikoplysninger der ikke har et dedikeret Immunization-element."


Mapping: DkCoreImmunizationToDdv
Source: DkCoreImmunization
Target: "https://www.nspop.dk/pages/releaseview.action?pageId=31798109"
Title: "Det Danske Vaccinationsregister (DDV)"
Id: dk-core-immunization-ddv
* -> "VaccinationRecord" "**DDV vaccination record, as exposed via sundhed.dk's `/app/vaccination/api/v1/effectuatedvaccinations/` endpoint.**"
* identifier[DdvVaccinationId] -> "VaccinationIdentifier" "Numeric DDV identifier of the vaccination. Serialised as `identifier.value` under system `https://www.sundhed.dk/vaccination/id`."
* status -> "ActiveStatus / NegativeConsent" "Derived: `NegativeConsent = true` → `not-done`; else `ActiveStatus = true` → `completed`; `ActiveStatus = false` → `not-done`."
* vaccineCode -> "Vaccine" "DDV `Vaccine` is a free-text product name, carried in `vaccineCode.text`. Optional ATC J07 / SNOMED CT codings MAY be added."
* occurrence[x] -> "EffectuatedDateTime" "Time the vaccination was administered."
* recorded -> "EffectuatedDateTime" "Used in lieu of a separate registration timestamp when none is available."
* performer.actor -> "EffectuatedBy" "Who effectuated the vaccination. DDV often delivers this as free text; use `actor.display` when no structured reference is available."
* note -> "CoverageDuration / SelfCreated / NegativeConsent / history" "Free-text notes for DDV fields without a dedicated Immunization element (e.g. coverage duration, self-created flag, negative-consent marker, prior history entries)."


Instance: JohnImmunizationInfluvac
InstanceOf: DkCoreImmunization
Title: "John's Influvac vaccination"
Description: "Example DkCoreImmunization derived from a DDV vaccination record for influenza (Influvac)."
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
* note[+].text = "Coverage duration: 1 year"


Instance: JohnImmunizationNegativeConsent
InstanceOf: DkCoreImmunization
Title: "John's afviste vaccination"
Description: "Example DkCoreImmunization for a DDV entry where HasNegativeConsent = true, mapping to status = not-done."
Usage: #example
* identifier[DdvVaccinationId].system = $DdvVaccinationId
* identifier[DdvVaccinationId].value = "1"
* status = #not-done
* vaccineCode.text = "Example Vaccine"
* patient = Reference(Patient/john)
* occurrenceDateTime = "2025-09-30"
* note[+].text = "Negative consent recorded"

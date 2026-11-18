// =============================================================================
// Examples of vaccination plans around DkCoreImmunization.
//
// FHIR R4 Immunization records a dose that WAS given and has no element for pointing at a plan
// (basedOn only exists from R5). The plan is therefore a CarePlan that points at the doses
// via CarePlan.activity.outcomeReference, while doses still to come are CarePlan.activity.detail
// entries with status = scheduled. See "Vaccination courses and next dose" in the profile documentation.
//
// The programmes are modelled on the SSI descriptions of
//  - the Danish childhood vaccination programme: https://www.ssi.dk/vaccinationer/boernevaccination
//  - the seasonal offer to people aged 65+: https://www.ssi.dk/vaccinationer/vaccination-af-personer-paa-65-aar-og-derover
// In DDV each of these is ONE programme per person; DDV drives the reminders addressed to the parents / the citizen,
// and removes centrally assigned recommended vaccinations when they are no longer relevant.
// All identifiers, dates and the child below are fictional.
// =============================================================================

// -----------------------------------------------------------------------------
// Example 1: Childhood vaccination programme (one programme, scheduled over 12+ years)
// -----------------------------------------------------------------------------

Instance: ChildImmunizationPatient
InstanceOf: DkCorePatient
Title: "Fictional infant used in the childhood vaccination programme example"
Description: "Fictional infant (born 2026-04-15) used in the childhood vaccination programme example."
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "1504260005"
* name.use = #official
* name.family = "Berggren"
* name.given = "Sofie"
* gender = #female
* birthDate = "2026-04-15"

Instance: ChildImmunizationDiTeKiPolHib1
InstanceOf: DkCoreImmunization
Title: "Child's DiTeKiPol-Hib vaccination, 3 months (dose 1)"
Description: "Dose 1 of DiTeKiPol-Hib in the childhood vaccination programme, given at 3 months. Referenced from the programme CarePlan."
Usage: #example
* meta.source = $Ddv
* identifier[DdvVaccinationId].system = $DdvVaccinationId
* identifier[DdvVaccinationId].value = "32300000001"
* status = #completed
* vaccineCode.text = "DiTeKiPol-Hib"
* vaccineCode.coding[ATC] = $atc#J07CA06 "diphtheria-haemophilus influenzae B-pertussis-poliomyelitis-tetanus"
* patient = Reference(ChildImmunizationPatient)
* occurrenceDateTime = "2026-07-15T10:15:00+02:00"
* recorded = "2026-07-15T10:20:00+02:00"
* primarySource = true
* performer.actor = Reference(LaegerneHasserisBymidte)
* protocolApplied.doseNumberPositiveInt = 1

Instance: ChildImmunizationPneumococcal1
InstanceOf: DkCoreImmunization
Title: "Child's pneumococcal vaccination, 3 months (dose 1)"
Description: "Dose 1 of the pneumococcal conjugate vaccine in the childhood vaccination programme, given at 3 months. Referenced from the programme CarePlan."
Usage: #example
* meta.source = $Ddv
* identifier[DdvVaccinationId].system = $DdvVaccinationId
* identifier[DdvVaccinationId].value = "32300000002"
* status = #completed
* vaccineCode.text = "Pneumokok konjugeret vaccine"
* vaccineCode.coding[ATC] = $atc#J07AL02 "pneumococcus, purified polysaccharides antigen conjugated"
* patient = Reference(ChildImmunizationPatient)
* occurrenceDateTime = "2026-07-15T10:15:00+02:00"
* recorded = "2026-07-15T10:20:00+02:00"
* primarySource = true
* performer.actor = Reference(LaegerneHasserisBymidte)
* protocolApplied.doseNumberPositiveInt = 1

Instance: ChildImmunizationDiTeKiPolHib2
InstanceOf: DkCoreImmunization
Title: "Child's DiTeKiPol-Hib vaccination, 5 months (dose 2)"
Description: "Dose 2 of DiTeKiPol-Hib in the childhood vaccination programme, given at 5 months. Referenced from the programme CarePlan."
Usage: #example
* meta.source = $Ddv
* identifier[DdvVaccinationId].system = $DdvVaccinationId
* identifier[DdvVaccinationId].value = "32300000003"
* status = #completed
* vaccineCode.text = "DiTeKiPol-Hib"
* vaccineCode.coding[ATC] = $atc#J07CA06 "diphtheria-haemophilus influenzae B-pertussis-poliomyelitis-tetanus"
* patient = Reference(ChildImmunizationPatient)
* occurrenceDateTime = "2026-09-16T09:40:00+02:00"
* recorded = "2026-09-16T09:45:00+02:00"
* primarySource = true
* performer.actor = Reference(LaegerneHasserisBymidte)
* protocolApplied.doseNumberPositiveInt = 2

Instance: ChildImmunizationPneumococcal2
InstanceOf: DkCoreImmunization
Title: "Child's pneumococcal vaccination, 5 months (dose 2)"
Description: "Dose 2 of the pneumococcal conjugate vaccine in the childhood vaccination programme, given at 5 months. Referenced from the programme CarePlan."
Usage: #example
* meta.source = $Ddv
* identifier[DdvVaccinationId].system = $DdvVaccinationId
* identifier[DdvVaccinationId].value = "32300000004"
* status = #completed
* vaccineCode.text = "Pneumokok konjugeret vaccine"
* vaccineCode.coding[ATC] = $atc#J07AL02 "pneumococcus, purified polysaccharides antigen conjugated"
* patient = Reference(ChildImmunizationPatient)
* occurrenceDateTime = "2026-09-16T09:40:00+02:00"
* recorded = "2026-09-16T09:45:00+02:00"
* primarySource = true
* performer.actor = Reference(LaegerneHasserisBymidte)
* protocolApplied.doseNumberPositiveInt = 2

Instance: ChildhoodVaccinationProgramme
InstanceOf: CarePlan
Title: "Childhood vaccination programme for an infant"
Description: "One plan for the whole Danish childhood vaccination programme (3, 5, 12 and 15 months, 4, 5 and 12 years). The doses already given are referenced as Immunization resources through activity.outcomeReference; the doses still to come are activities with status = scheduled, which is the basis for the reminders sent to the parents. The plan is a single programme, not one plan per dose."
Usage: #example
* status = #active
* intent = #plan
* category.text = "Vaccination programme"
* title = "Børnevaccinationsprogrammet"
* description = "Danish childhood vaccination programme as described by Statens Serum Institut"
* subject = Reference(ChildImmunizationPatient)
* period.start = "2026-04-15"
* period.end = "2039-09-15"
* author.display = "Statens Serum Institut"
// --- given: 3 months
* activity[+].outcomeReference[+] = Reference(ChildImmunizationDiTeKiPolHib1)
* activity[=].outcomeReference[+] = Reference(ChildImmunizationPneumococcal1)
// --- given: 5 months
* activity[+].outcomeReference[+] = Reference(ChildImmunizationDiTeKiPolHib2)
* activity[=].outcomeReference[+] = Reference(ChildImmunizationPneumococcal2)
// --- planned: 12 months
* activity[+].detail.kind = #ServiceRequest
* activity[=].detail.code.text = "DiTeKiPol-Hib dose 3"
* activity[=].detail.status = #scheduled
* activity[=].detail.scheduledPeriod.start = "2027-04-15"
* activity[=].detail.productCodeableConcept = $atc#J07CA06 "diphtheria-haemophilus influenzae B-pertussis-poliomyelitis-tetanus"
* activity[+].detail.kind = #ServiceRequest
* activity[=].detail.code.text = "Pneumococcal conjugate vaccine dose 3"
* activity[=].detail.status = #scheduled
* activity[=].detail.scheduledPeriod.start = "2027-04-15"
* activity[=].detail.productCodeableConcept = $atc#J07AL02 "pneumococcus, purified polysaccharides antigen conjugated"
// --- planned: 15 months
* activity[+].detail.kind = #ServiceRequest
* activity[=].detail.code.text = "MFR dose 1 (measles, mumps, rubella)"
* activity[=].detail.status = #scheduled
* activity[=].detail.scheduledPeriod.start = "2027-07-15"
* activity[=].detail.productCodeableConcept = $atc#J07BD52 "measles, combinations with mumps and rubella, live attenuated"
// --- planned: 4 years
* activity[+].detail.kind = #ServiceRequest
* activity[=].detail.code.text = "MFR dose 2"
* activity[=].detail.status = #scheduled
* activity[=].detail.scheduledPeriod.start = "2030-04-15"
* activity[=].detail.productCodeableConcept = $atc#J07BD52 "measles, combinations with mumps and rubella, live attenuated"
// --- planned: 5 years
* activity[+].detail.kind = #ServiceRequest
* activity[=].detail.code.text = "DiTeKiPol revaccination"
* activity[=].detail.status = #scheduled
* activity[=].detail.scheduledPeriod.start = "2031-04-15"
* activity[=].detail.productCodeableConcept = $atc#J07CA02 "diphtheria-pertussis-poliomyelitis-tetanus"
// --- planned: 12 years (HPV dose 2 follows at least 5 and at most 13 months after dose 1)
* activity[+].detail.kind = #ServiceRequest
* activity[=].detail.code.text = "HPV dose 1"
* activity[=].detail.status = #scheduled
* activity[=].detail.scheduledPeriod.start = "2038-04-15"
* activity[=].detail.productCodeableConcept = $atc#J07BM03 "papillomavirus (human types 6, 11, 16, 18, 31, 33, 45, 52, 58)"
* activity[+].detail.kind = #ServiceRequest
* activity[=].detail.code.text = "HPV dose 2"
* activity[=].detail.status = #scheduled
* activity[=].detail.scheduledPeriod.start = "2038-09-15"
* activity[=].detail.scheduledPeriod.end = "2039-05-15"
* activity[=].detail.productCodeableConcept = $atc#J07BM03 "papillomavirus (human types 6, 11, 16, 18, 31, 33, 45, 52, 58)"

// -----------------------------------------------------------------------------
// Example 2: Seasonal vaccination offer to people aged 65+ (one short-lived programme per season)
// -----------------------------------------------------------------------------

Instance: SeasonalVaccinationProgramme65Plus
InstanceOf: CarePlan
Title: "Seasonal vaccination programme for a person aged 65+"
Description: "The seasonal offer (influenza and COVID-19) to people aged 65 and over, implemented as one programme with a short lifetime. Influenza has been given - it references the existing JohnImmunizationInfluvac example - while COVID-19 is still offered. The two vaccines may be given at the same visit, as two separate injections. When the season ends, or the recommendation is no longer relevant, the plan is closed (status = completed or revoked), which corresponds to centrally assigned recommended vaccinations being cleaned up. The season period is illustrative."
Usage: #example
* status = #active
* intent = #plan
* category.text = "Vaccination programme"
* title = "Sæsonvaccination af personer på 65 år og derover"
* description = "Seasonal influenza and COVID-19 vaccination offered to people aged 65 and over, as described by Statens Serum Institut"
* subject = Reference(john)
* period.start = "2025-09-01"
* period.end = "2026-03-31"
* author.display = "Statens Serum Institut"
* activity[+].outcomeReference[+] = Reference(JohnImmunizationInfluvac)
* activity[+].detail.kind = #ServiceRequest
* activity[=].detail.code.text = "COVID-19 seasonal vaccination"
* activity[=].detail.status = #scheduled
* activity[=].detail.scheduledPeriod.start = "2025-09-01"
* activity[=].detail.scheduledPeriod.end = "2026-03-31"
* activity[=].detail.productCodeableConcept = $atc#J07BN01 "covid-19, RNA-based vaccine"

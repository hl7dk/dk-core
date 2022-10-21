### Scope and usage
The Danish Core Condition profile is intended to encapsulate condition information, as used in the Danish health sector. In dk-core, conditions have been constrained to only containing conditions as stated by health or social sector practitioners This means that conditions, that patients or citizens assert themselves to have, should not be represented using this profile. Patients' own assessments can, in most cases, be represented as Observations or QuestionnaireResponses. However, in some use cases, where the patient asserts the problem, that leads to healthcare interventions or own interventions. It does make sense to represent these as Conditions. In this case, use the international standard [Condition](https://www.hl7.org/fhir/condition.html), not this dk-core Condition profile.

This way of constraining the Condition profile is within the boundaries of what the Danish Health Data Authority and Local Government Denmark define as a Condition.
* The Danish Health Data Authority, [Begrebsbasen](https://sundhedsdata.iterm.dk/): Helbredstilstand er en tilstand vedrørende helbred der aktuelt vurderes med henblik på sundhedsintervention
* Local Government Denmark, [Fælleskommunale rammearkitektur, FKI](http://info.rammearkitektur.dk/SocialOgSundhed/FKI/ClassDiagram/d2ca33a5-a53c-4f83-82e5-0f9f7ce7a325.htm): Fokustilstand er en borgers helbredsmæssige, funktionsmæssige og/eller sociale situation, på et givet tidspunkt, der er anledning til faglig bekymring, og vurderes mhp. indsats

We use the Condition profile for describing both conditions that are true for an encounter, and for conditions that are true for a periode of time. "In FHIR, we distinguish between the two using the Condition.category that can take the two values problem-list-item og encounter-diagnosis. In this list, examples of use is compiled:
* LPR3 conditions are encounter-diagnosis
* General practioners can code each encounter with an ICPC code. This is an encounter-diagnosis
* Municipality conditions i.e. FSIII-conditions and FFB-subthemes are problem-list-items
* General practitioners, in some cases, follow a patient condition for a longer periode of time (e.g. high blood pressure, high cholesterol, COPD), and some systems support care pathways for these conditions. These conditions may be categorized as problem-list-items.

Given that we have a condition, which is a problem-list-item, ending the condition have two meanings:
* The first is that the patient no longer has the condition e.g. a pressure ulcer has healed. In this case, Condition.clinicalStatus=inactive and Condition.abatementTime is the date where the condition was no longer a problem.
* The second meaning of "ended" is that the condition falls out of focus in a professional context e.g. if the patient moves, or another professional group takes over the care for the patient. A Condition no longer in focus can be represented in two ways:
 - The Condition.category looses its "problem-list-item" flag. The idea is to state that from a patient viewpoint the condition has not changed, but in this professional context it is no longer in focus.
 - The Condition.extension.NotFollowedAnymore is populated with the date that it lost focus in a specific professional context.

The Condition profile cover both primary sector, secondary sector (medical specialists ([DA] speciallæger) and hospitals) and municipality cases. As such the profile should be usable in most Danish contexts.

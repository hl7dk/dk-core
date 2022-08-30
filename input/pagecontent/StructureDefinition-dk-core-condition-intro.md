### Scope and usage
The Danish Core Condition profile is intended to encapsulate condition information, as used in the Danish health sector. In dk-core, the Condition have been constrained to only containing, focus conditions as stated by health or social setor practitioners. This means that conditions, that patients or citizens declare themselves to have, should not be represented using this model. Citizens own evaluations can in most cases be represented as Observations or QuestionnaireResponses. However, in some use cases, where the citizen defines the problem, that leads to healthcare interventions or own interventions, it does make sense to represent a Conditions. In this case, use the international standard condition resource, not this dk-core-condition.

This way of constraining the condition model, is within the bounderies of what that the Danish Health Data Authority and Local Government Denmark consideres a Condition.
* The Danish Health Data Authority: Helbredstilstand er en tilstand vedrørende helbred der aktuelt vurderes med henblik på sundhedsintervention
* Local Government Denmark: Fokustilstand er en borgers helbredsmæssige, funktionsmæssige og/eller sociale situation, på et givet tidspunkt, der er anledning til faglig bekymring, og vurderes mhp. indsats

We use conditions for describing both conditions that are true for an encounter, and for conditions that are true for a periode of time. In FHIR, we can distinguish between the two using Condition.category. In this list, examples of use is compiled:
* LPR3 conditions are encounter diagnosis
* General practioners can code each encounter with an ICPC code. This is an encounterdiagnosis
* Municipality conditions i.e. FSIII-conditions and FFB-subthemes are problem-list-items
* General practitioners, in some cases, follow a patient condition for a longer periode of time (e.g. high blood pressure, high cholesterol, COPD), and some systems support care pathways for these conditions. These conditions may be categorized as problem-list-items.

Given that we have a condition, which is a problem-list-item, ending a condition have two meanings. The first is that the citizen no longer has the condition e.g. a pressure ulcer has healed. In this case, Condition.clinicalStatus=inactive and Condition.abatementTime is the date where the condition was no longer a problem. The second meaning of "ended" is that the condition falls out of focus in a professional context e.g. if the citizen moves, or another professional group takes over the care for the citizen. This may be dealt with in two ways:
* The Condition.category looses its "problem-list-item" flag. The idea is to state that from a citizen viewpoint the condition has not changed, but in this professional context it is no longer in focus.
* The Condition.extension.NotFollowedAnymore is populated with the date that it lost focus in a specific professional context.

Condition.extension:conditionLastAssertedDate holds information about the last date a condition was confirmed valid in its current state. Eg. with its current clinical- and verification status, and severity.

The condition model cover both primary sector (GP's), secondary sector (specialty doctors and hospitals) and municipality cases. As such the profile should be usable in most Danish contexts.

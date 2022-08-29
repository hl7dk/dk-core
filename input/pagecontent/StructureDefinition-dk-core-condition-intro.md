### Scope and usage
The Danish Core Condition profile is intended to encapsulate condition information, as used in the Danish health sector. In dk-core, the Condition have been constrained to only containing, focus conditions as stated by health or social setor practitioners. This means that conditions, that patients or citizens declare themselves to have, should not be represented using this model. Citizens own evaluations can in most cases be represented as Observations or QuestionnaireResponses. However, in some use cases, where the citizen defines the problem, that leads to healthcare interventions or own interventions, it does make sense to represent a Conditions. **In this case, use the international Condition resource, not this dk-core-condition.** 

This definition of focus condition, defines this scope(in Danish):
Fokustilstand er en borgers helbredsmæssige, funktionsmæssige og/eller sociale situation, på et givet tidspunkt, der er anledning til faglig bekymring, og vurderes mhp. indsats


The condition model cover both primary sector (GP's), secondary sector (specialty doctors and hospitals) and municipality cases. As such the profile should be usable in most Danish contexts.

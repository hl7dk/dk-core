Dk-core version 3.0.0 has been approved by HL7 Denmark. This version is the result of external consultation of Dk-core v. 2.2.0. 

The changes between 2.2.0 and 3.0.0 are: 
* Update of the introduction of DkCoreCondition
* Addition of the DkCoreCondition instance JohnFracture which illustrates the use of SKS tillægskode. 
* Update of the introduction of DkCoreObservation, including information about which CodeSystems are recommended in the standard catalogue from the Danish Health Data Agency.
* Update of the Observation.code.coding:SNOMEDCT and Observation.component.code.coding:SNOMEDCT to http://snomed.info/sct 
* Update of the Observation.code.coding:MedCom and Observation.component.code.coding: MedCom to http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-observation-codes 
* Added context on extension ConditionLastAssertedDate and NotFollowedAnymore
* Bug update of invariants by changing constraint.requirements to requirements and removing of constraint.source where relevant. 
* Bug update of invariants by removing the ‘value.’ and ‘Observation.’ where relevant
* Bug update of ValueSet TechniquesSCTCodes due to misspelling
* Update of DkCoreObservations instances with a LOINC code corresponding to the codes in the international VitalSigns profile, due to update of FHIR validator. Missing effective timestamp were included.

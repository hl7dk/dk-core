ValueSet: DkCoreProfessionGroupValueSet
Id: DkCoreProfessionGroupValueSet
Title: "DK Profession Group"
Description: "DK Profession Group codes"
* ^experimental = false
* ^status = #active
* include codes from system DkCoreProfessionGroupCodes

ValueSet: MunicipalityCodes
Id: dk-core-MunicipalityCodes
Title: "DK Municipality Codes"
Description: "Municipality codes used in Denmark"
* ^experimental = false
* include codes from system MunicipalityCodes
* include codes from system GreenlandMunicipalityCodes

ValueSet: RegionalSubdivisionCodes
Id: dk-core-RegionalSubDivisionCodes
Title: "DK Regional Subdivision Codes"
Description: "Subdivision codes (Regional codes) used in Denmark"
* ^experimental = false
* include codes from system DKCoreRegionalSubdivisionCodes

ValueSet: LoincBasicObservation
Id: dk-core-LoincBasicObservation
Title: "DK Core LOINC Basic Observations"
Description: "LOINC codes describing Basic Observations usable in Denmark."
* ^experimental = false
* $LOINC#9279-1 //"Respiratory rate"
* $LOINC#8867-4 //"Heart rate"
* $LOINC#2708-6 //"Oxygen saturation in Arterial blood"
* $LOINC#8310-5 //"Body temperature"
* $LOINC#85353-1 //"Vital signs, weight, height, head circumference, oxygen saturation & BMI panel"
* $LOINC#8302-2 //"Body height"
* $LOINC#9843-4 //"Head Occipital-frontal circumference"
* $LOINC#29463-7 //"Body weight"
* $LOINC#39156-5 //"Body mass index (BMI) [Ratio]"
* $LOINC#85354-9 //"Blood pressure panel with all children optional"
* $LOINC#8480-6 //"Systolic blood pressure"
* $LOINC#8462-4 //"Diastolic blood pressure"
* $LOINC#8478-0 //"Mean blood pressure"
* $LOINC#59408-5 //"Oxygen saturation in Arterial blood by Pulse oximetry"

ValueSet: SCTBasicObservation
Id: dk-core-SCTBasicObservation
Title: "DK Core SNOMED CT Basic Observation"
Description: "SNOMED CT codes for Basic Observations usable in Denmark"
* ^experimental = false
//Vital signs
* $sct#446226005 //Diastolic blood pressure on admission 
* $sct#400975005 //Standing diastolic blood pressure 
* $sct#407557002 //Lying diastolic blood pressure    
* $sct#407555005 //Sitting diastolic blood pressure  
* $sct#271650006 //Diastolic blood pressure
* $sct#72313002  //Systolic arterial pressure
* $sct#400974009 //Standing systolic blood pressure  
* $sct#399304008 //Systolic blood pressure on admission  
* $sct#407556006 //Lying systolic blood pressure 
* $sct#407554009 //Sitting systolic blood pressure   
* $sct#271649006 //Systolic blood pressure
* codes from system $sct where concept is-a #431314004 //SpO2
* $sct#422119006 //Brachial pulse rate   
* $sct#429614003 //Posterior tibial pulse rate   
* $sct#429525003 //Dorsalis pedis pulse rate 
* $sct#399017001 //Heart rate on admission   
* $sct#78564009  //Pulse rate    
* $sct#444981005 //Resting heart rate    
* $sct#364075005 //Heart rate
* $sct#424927000 //Body weight with shoes  
* $sct#445541000 // Dry body weight  
* $sct#425024002 // Body weight without shoes    
* $sct#364589006 //Birth weight  
* $sct#27113001  //Body weight
* codes from system $sct where concept is-a #86290005 //(Respiratory rate)
* codes from system $sct where concept is-a #276885007 // Core Body temperature
* $sct#1153637007 //Body height (observable entity)|
* $sct#248333004 //|Standing height (observable entity)|
* $sct#1149101003 //|Recumbent body height|
* $sct#1162392001 //|Pre-amputation measured body height|


ValueSet: IEEEBasicObservation
Id: dk-core-IEEEBasicObservation
Title: "Dk Core IEEE Basic Observation"
Description: "IEEE MDC codes for Basic Observations usable in Denmark"
* ^experimental = false
* ^copyright = "IEEE"
* ^purpose = """
### Purpose of this ValueSet
This ValueSet comprises the most common IEEE MDC codes used to represent observations
that are considered "basic" by this profile. This ValueSet is **not** meant to be exhaustive!

The origin of an MDC code is usually the equipment used to perform the measurement,
and often the code carries supplemental information about how (or where on the body)
the observation was performed.
"""
* $IEEEx73#151562 "MDC_RESP_RATE"
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "Rate of breathing; method not specified."
* $IEEEx73#151570 "MDC_AWAY_RESP_RATE"
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "Rate of breathing; method: direct airway flow measurement."
* $IEEEx73#151578 "MDC_TTHOR_RESP_RATE"
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "Rate of breathing; method: transthoracic impedance variations."
* $IEEEx73#151594 "MDC_CO2_RESP_RATE"
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "Rate of breathing; method: carbon dioxide measurement."
* $IEEEx73#151602 "MDC_PRESS_RESP_RATE"
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "Rate of breathing; method: non-airway pressure measurement, e.g. central venous blood pressure (CVP)."
* $IEEEx73#151650 "MDC_ACOUSTIC_RESP_RATE"
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "Rate of breathing; method: acoustic."
* $IEEEx73#151658 "MDC_PULS_OXIM_PLETH_RESP_RATE"
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "Rate of breathing; method: SpO2 plethysmography."
* $IEEEx73#8410992 "MDC_SABTE_RESP_RATE"
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "Value of respiration rate. [measured by sleep apnoea breathing therapy equipment]"
* $IEEEx73#149514 "MDC_PULS_RATE"
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "Rate of blood pulse in an artery."
* $IEEEx73#149522 "MDC_BLD_PULS_RATE_INV"
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "Rate of blood pulse in an artery, measured invasively."
* $IEEEx73#149546 "MDC_PULS_RATE_NON_INV"
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "Rate of blood pulse in an artery, measured non-invasively."
* $IEEEx73#149530 "MDC_PULS_OXIM_PULS_RATE"
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "Rate of blood pulse as obtained by pulse oximetry."
* $IEEEx73#147842 "MDC_ECG_HEART_RATE" 
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "Rate of cardiac beats (ECG)."
* $IEEEx73#8410590 "MDC_ECG_HEART_RATE_INSTANT"
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "Instantaneous heart rate."
* $IEEEx73#149554 "MDC_TTHOR_HEART_RATE"
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "Heart rate obtained from the variation of transthoracic impedance."
* $IEEEx73#149562 "MDC_PALPATION_HEART_RATE"
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "Heart rate obtained from an artery that is close to the surface and a pulse can be felt."
* $IEEEx73#8454258 "MDC_HF_HR"
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "This is an object representing the heart rate over a period of time. [Exercise / fitness equipment]"
* $IEEEx73#150324 "MDC_SAT_O2_ART"
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "Arterial oxygen saturation. [no method]"
* $IEEEx73#150456 "MDC_PULS_OXIM_SAT_O2"
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "Oxygen saturation. [using pulse oximetry]"
* $IEEEx73#150364 "MDC_TEMP_BODY"
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "Body temperature. [unspecified]"
* $IEEEx73#150368 "MDC_TEMP_CORE"
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "Core temperature."
* $IEEEx73#150388 "MDC_TEMP_SKIN"
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "Skin temperature."
* $IEEEx73#150392 "MDC_TEMP_TYMP"
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "Tympanic temperature."
* $IEEEx73#188420 "MDC_TEMP_RECT" 
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "Rectal temperature."
* $IEEEx73#188424 "MDC_TEMP_ORAL"
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "Oral temperature."
* $IEEEx73#188428 "MDC_TEMP_EAR"
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "Ear temperature."
* $IEEEx73#188452 "MDC_TEMP_AXILLA" 
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "Axillary (armpit) temperature."
* $IEEEx73#188456 "MDC_TEMP_GIT"
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "Gastro-intestinal tract temperature."
* $IEEEx73#188740 "MDC_LEN_BODY_ACTUAL"
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "The actual height of the patient."
* $IEEEx73#153856 "MDC_CIRCUM_HEAD"
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "Circumference of the head."
* $IEEEx73#188736 "MDC_MASS_BODY_ACTUAL"
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "The measurement of the mass of patient."
* $IEEEx73#188752 "MDC_RATIO_MASS_BODY_LEN_SQ"
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "The individual's body weight, in kilograms, divided by the square of height, in meters."
* $IEEEx73#150020 "MDC_PRESS_BLD_NONINV" 
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "Pressure of the blood, obtained noninvasively."
* $IEEEx73#150021 "MDC_PRESS_BLD_NONINV_SYS"
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "Pressure of the blood, obtained noninvasively, at the systolic phase."
* $IEEEx73#150022 "MDC_PRESS_BLD_NONINV_DIA"
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "Pressure of the blood, obtained noninvasively, at the diastolic phase."
* $IEEEx73#150023 "MDC_PRESS_BLD_NONINV_MEAN"
  * ^designation.use = $sct#900000000000003001
  * ^designation.value = "Pressure of the blood, obtained noninvasively, as computed by averaging on one cycle."

ValueSet: NPUBasicObservation
Id: dk-core-NPUBasicObservation
Title: "DK Core NPU Basic Observation"
Description: "NPU codes for Basic Observations usable in Denmark"
* ^experimental = false
* $NPU#NPU03011
* $NPU#NPU27280
* $NPU#NPU04034
* $NPU#NPU08676
* $NPU#NPU58033
* $NPU#NPU57947
* $NPU#NPU58034
* $NPU#NPU57948
* $NPU#NPU21692
* $NPU#NPU03794
* $NPU#NPU03804
* $NPU#NPU27281

ValueSet: UCUMBasicUnits
Id: dk-core-UCUM-BasicUnits
Title: "DK Core UCUM Basic Units"
Description: "UCUM codes to represent units for basic Observations usable in Denmark"
* ^experimental = false
* $ucum#%
* $ucum#cm
* $ucum#[in_i]
* $ucum#kg
* $ucum#g
* $ucum#[lb_av]
* $ucum#Cel
* $ucum#[degF]
* $ucum#mm[Hg]
* $ucum#/min
* $ucum#kg/m2
* $ucum#m2
* $ucum#{fraction}

ValueSet: TechniquesSCTCodes
Id: dk-core-TechniquesSCTCodes
Title: "DK TechniquesSCTCodes"
Description: "SNOMED CT Codes for the technique used when obtaining an observation"
* ^experimental = false
* $sct#761996005 "Estimation technique (qualifier value)"
* $sct#733985002 "Reported (qualifier value)"
* $sct#272391002 "Measurement technique (qualifier value)"

ValueSet: DkCoreDeCPRValueSet
Id: DkCoreDeCPRValueSet
Title: "DK D-eCPR OID values"
Description: "DK D-eCPR OID values"
* ^experimental = false
* ^status = #active
* include codes from system DkCoreDeCPRCodes

ValueSet: RelatedPersonRelationshipTypes
Id: dk-core-RelatedPersonRelationshipTypes
Title: "DK Related Person Relationship Types"
Description: "DK Related Person Relationship Types"
* ^experimental = false
* ^status = #active
* $v3-RoleCode#FAMMEMB // "family member"
* $v3-RoleCode#CHILD // "child"
* $v3-RoleCode#DAUC // "daughter"
* $v3-RoleCode#SONC // "son"
* $v3-RoleCode#GRNDCHILD // "grandchild"
* $v3-RoleCode#CHLDINLAW // "child-in-law"
* $v3-RoleCode#PRN // "parent"
* $v3-RoleCode#FTH // "father"
* $v3-RoleCode#MTH // "mother"
* $v3-RoleCode#SIB // "sibling"
* $v3-RoleCode#DOMPART // "domestic partner"
* $v3-RoleCode#SPS // "spouse"
* $v3-RoleCode#FRND // "unrelated friend"
* $v3-RoleCode#NBOR // "neighbor"
* $v3-RoleCode#ROOM // "Roommate"
* $v3-RoleCode#GUARD // "guardian"
* $v3-RoleCode#NOK // "next of kin"
* $v3-RoleCode#POWATT // "power of attorney"
* include codes from system DkRelatedPersonRelationshipCodes

ValueSet: SorOrganizationType
Id: sor-organization-type
Title: "DK SOR Organization Type"
Description: "Value set used for indicating the organization type for organizations from SOR"
* ^experimental = false
* ^status = #active
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
*  $sct#554221000005108  
*  $sct#546821000005103  
*  $sct#547011000005103  
*  $sct#546811000005109  
*  $sct#550621000005101  
*  $sct#550631000005103  
*  $sct#550641000005106  
*  $sct#550651000005108  
*  $sct#550661000005105  
*  $sct#554211000005102  
*  $sct#550711000005101  
*  $sct#550671000005100  
*  $sct#554061000005105  
*  $sct#554041000005106  
*  $sct#554021000005101  
*  $sct#550681000005102  
*  $sct#550691000005104  
*  $sct#550701000005104  
*  $sct#554231000005106  
*  $sct#554051000005108  
*  $sct#550811000005108  
*  $sct#547211000005108  
*  $sct#550891000005100  
*  $sct#550881000005103  
*  $sct#550411000005105  
*  $sct#554851000005102  
*  $sct#550861000005106  
*  $sct#554881000005108  
*  $sct#554861000005100  
*  $sct#554821000005109  
*  $sct#554411000005101  
*  $sct#554871000005105  
*  $sct#550821000005102  
*  $sct#550871000005101  
*  $sct#554241000005103  
*  $sct#550841000005107  
*  $sct#550851000005109  
*  $sct#551611000005102  
*  $sct#554071000005100  
*  $sct#550831000005104  
*  $sct#554031000005103  
*  $sct#557511000005107  
*  $sct#557501000005109  
*  $sct#557531000005103  
*  $sct#557591000005104  
*  $sct#557521000005101  
*  $sct#557561000005105  
*  $sct#557541000005106  
*  $sct#557581000005102  
*  $sct#556841000005105  
*  $sct#557671000005101  
*  $sct#398070004  
*  $sct#394761003  
*  $sct#20078004  
*  $sct#722173008  
*  $sct#702871004  
*  $sct#276037005  
*  $sct#22232009  
*  $sct#702824005  
*  $sct#42665001  
*  $sct#264361005  
*  $sct#703069008  
*  $sct#309964003  
*  $sct#309904001  
*  $sct#309939001  
*  $sct#225728007  
*  $sct#255203001  
*  $sct#264372000  
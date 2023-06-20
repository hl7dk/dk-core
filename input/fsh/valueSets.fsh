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

ValueSet: LoincBasicParameter
Id: dk-core-LoincBasicParameter
Title: "DK Core LOINC Basic Parameters"
Description: "LOINC codes describing Basic parameters usable in Denmark."
* ^experimental = false
* $LOINC#9279-1 "Respiratory rate"
* $LOINC#8867-4 "Heart rate"
* $LOINC#2708-6 "Oxygen saturation in Arterial blood"
* $LOINC#8310-5 "Body temperature"
* $LOINC#85353-1 "Vital signs, weight, height, head circumference, oxygen saturation & BMI panel"
* $LOINC#8302-2 "Body height"
* $LOINC#9843-4 "Head Occipital-frontal circumference"
* $LOINC#29463-7 "Body weight"
* $LOINC#39156-5 "Body mass index (BMI) [Ratio]"
* $LOINC#85354-9 "Blood pressure panel with all children optional"
* $LOINC#8480-6 "Systolic blood pressure"
* $LOINC#8462-4 "Diastolic blood pressure"
* $LOINC#8478-0 "Mean blood pressure"
* $LOINC#21258-6 "Oxygen saturation"

ValueSet: SCTBasicParameter
Id: dk-core-SCTBasicParameter
Title: "Dk Core SNOMED CT Basic Parameter"
Description: "SNOMED CT codes for Basic parameters usable in Denmark"
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
* $sct#424927000 //  Body weight with shoes  
* $sct#445541000 // Dry body weight  
* $sct#425024002 // Body weight without shoes    
* $sct#364589006 //Birth weight  
* $sct#27113001  //Body weight
* codes from system $sct where concept is-a #86290005 //(Respiratory rate)
* codes from system $sct where concept is-a #276885007 // Core Body temperature
* $sct#248334005 //|Length of body (observable entity)|
* $sct#276351002 // |Infant length (observable entity)|
* $sct#276353004 //|Crown heel length (observable entity)|
* $sct#248333004 //|Standing height (observable entity)|

ValueSet: IEEEBasicParameter
Id: dk-core-IEEEBasicParameter
Title: "Dk Core IEEE Basic Parameter"
Description: "IEEE codes for Basic parameters usable in Denmark"
* ^experimental = false
* $IEEEx73#151562 "MDC_RESP_RATE"
* $IEEEx73#151570 "MDC_AWAY_RESP_RATE"
* $IEEEx73#151578 "MDC_TTHOR_RESP_RATE"
* $IEEEx73#151650 "MDC_ACOUSTIC_RESP_RATE"
* $IEEEx73#151658 "MDC_PULS_OXIM_PLETH_RESP_RATE"
* $IEEEx73#8410992 "MDC_SABTE_RESP_RATE"
* $IEEEx73#149514 "MDC_PULS_RATE"
* $IEEEx73#149546 "MDC_PULS_RATE_NON_INV"
* $IEEEx73#149530 "MDC_PULS_OXIM_PULS_RATE"
* $IEEEx73#147842 "MDC_ECG_HEART_RATE" 
* $IEEEx73#8410590 "MDC_ECG_HEART_RATE_INSTANT"
* $IEEEx73#149554 "MDC_TTHOR_HEART_RATE"
* $IEEEx73#149562 "MDC_PALPATION_HEART_RATE"
* $IEEEx73#8454258 "MDC_HF_HR"
* $IEEEx73#150324 "MDC_SAT_O2_ART"
* $IEEEx73#150456 "MDC_PULS_OXIM_SAT_O2"
* $IEEEx73#150588 "MDC_MODALITY_SPOT "
* $IEEEx73#150584 "MDC_MODALITY_SLOW"
* $IEEEx73#150580 "MDC_MODALITY_FAST"
* $IEEEx73#460500 "MDC_UPEXT_FINGER"
* $IEEEx73#460501 "MDC_UPEXT_FINGER_L" 
* $IEEEx73#460502 "MDC_UPEXT_FINGER_R"
* $IEEEx73#460536 "MDC_UPEXT_WRIST"
* $IEEEx73#460537 "MDC_UPEXT_WRIST_L"
* $IEEEx73#460538 "MDC_UPEXT_WRIST_R"
* $IEEEx73#460272 "MDC_HEAD_EAR"
* $IEEEx73#460041 "MDC_HEAD_EAR_L"
* $IEEEx73#460042 "MDC_HEAD_EAR_R"
* $IEEEx73#150364 "MDC_TEMP_BODY"
* $IEEEx73#150392 "MDC_TEMP_TYMP"
* $IEEEx73#188420 "MDC_TEMP_RECT" 
* $IEEEx73#188424 "MDC_TEMP_ORAL"
* $IEEEx73#188428 "MDC_TEMP_EAR"
* $IEEEx73#188432 "MDC_TEMP_FINGER"
* $IEEEx73#188448 "MDC_TEMP_TOE"
* $IEEEx73#188452 "MDC_TEMP_AXILLA" 
* $IEEEx73#188456 "MDC_TEMP_GIT"
* $IEEEx73#460292 "MDC_HEAD_MOUTH"
* $IEEEx73#460492 "MDC_UPEXT_AXILLA"
* $IEEEx73#460420 "MDC_TRUNK_BUTTOCK"
* $IEEEx73#188740 "MDC_LEN_BODY_ACTUAL"
* $IEEEx73#153856 "MDC_CIRCUM_HEAD"
* $IEEEx73#188736 "MDC_MASS_BODY_ACTUAL"
* $IEEEx73#188752 "MDC_RATIO_MASS_BODY_LEN_SQ"
* $IEEEx73#150020 "MDC_PRESS_BLD_NONINV" 
* $IEEEx73#460336 "MDC_LOEXT_ANKLE"
* $IEEEx73#460337 "MDC_LOEXT_ANKLE_L"
* $IEEEx73#460338 "MDC_LOEXT_ANKLE_R"
* $IEEEx73#460356 "MDC_LOEXT_LEG"
* $IEEEx73#460357 "MDC_LOEXT_LEG_L"
* $IEEEx73#460358 "MDC_LOEXT_LEG_R"
* $IEEEx73#460364 "MDC_LOEXT_THIGH" 
* $IEEEx73#460365 "MDC_LOEXT_THIGH_L" 
* $IEEEx73#460366 "MDC_LOEXT_THIGH_R" 
* $IEEEx73#460532 "MDC_UPEXT_ARM_UPPER"
* $IEEEx73#460533 "MDC_UPEXT_ARM_UPPER_L"
* $IEEEx73#460534 "MDC_UPEXT_ARM_UPPER_R"
* $IEEEx73#150021 "MDC_PRESS_BLD_NONINV_SYS"
* $IEEEx73#150022 "MDC_PRESS_BLD_NONINV_DIA"
* $IEEEx73#150023 "MDC_PRESS_BLD_NONINV_MEAN"

ValueSet: NPUBasicParameter
Id: dk-core-NPUBasicParameter
Title: "Dk Core NPU Basic Parameter"
Description: "NPU codes for Basic parameters usable in Denmark"
* ^experimental = false
* $NPU#NPU03011 "Hb(Fe; O<sub>2</sub>-bind.;aB)—Oxygen(O<sub>2</sub>); sat. = ?"
* $NPU#NPU27280 "Hb(Fe; O<sub>2</sub>-bind.;aB)—Oxygen(O<sub>2</sub>); sat.(Pulse oximetry) = ?"
* $NPU#NPU04034 "Pt(spec.)—Blood; temp. = ? °C"
* $NPU#NPU08676 "Pt—Body; temp. = ? °C"
* $NPU#NPU58033 "Artery(spec.)—Blood pressure(systolic); pr.(proc.) = ? mmHg"
* $NPU#NPU57947 "Artery(spec.)—Blood; pr.(systolic;proc.) = ? mmHg"
* $NPU#NPU58034 "Artery(spec.)—Blood pressure(diastolic); pr.(proc.) = ? mmHg"
* $NPU#NPU57948 "Artery(spec.)—Blood; pr.(diastolic;proc.) = ? mmHg"
* $NPU#NPU21692 "Heart—Systole; freq. = ? * 1/min"
* $NPU#NPU03794 "Pt—Body; height = ? m"
* $NPU#NPU03804 "Pt—Body; mass = ? kg"
* $NPU#NPU27281 "Pt—Body; mass coefficient(mass/squared height) = ? kg/m²"

ValueSet: UCUMBasicUnits
Id: dk-core-UCUM-BasicUnits
Title: "Dk Core UCUM Basic Units"
Description: "UCUM codes to represent units for basic parameters usable in Denmark"
* ^experimental = false
* $ucum#% "percent"
* $ucum#cm "centimeter"
* $ucum#[in_i] "inch (international)"
* $ucum#kg "kilogram"
* $ucum#g "gram"
* $ucum#[lb_av] "pound (US and British)"
* $ucum#Cel "degree Celsius"
* $ucum#[degF] "degree Fahrenheit"
* $ucum#mm[Hg] "millimeter of mercury"
* $ucum#/min "per minute"
* $ucum#kg/m2 "kilogram / (meter ^ 2)"
* $ucum#m2 "square meter"
* $ucum#{fraction} "fraction"


ValueSet: TechniqesSCTCodes
Title: "TechniqesSCTCodes"
Description: "SNOMED CT Codes for the techniqe used when obtaining an observation"
* ^experimental = false
* $sct#761996005 "Estimation technique (qualifier value)"
* $sct#733985002 "Reported (qualifier value)"
* $sct#272391002 "Measurement technique (qualifier value)"

Profile: IPADkCoreObservation
Parent: DkCoreObservation
Title: "Danish Core IPA Observation Profiles"
Description: "HL7 Denmark core profile for IPA compliant observations"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-imposeProfile"
* ^extension[=].valueCanonical = "http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-observation"
* subject only Reference(DkCorePatient)

Profile: DkCoreObservation
Parent: Observation
Id: dk-core-observation
Title: "Danish Core Observation Profiles"
Description: "HL7 Denmark core profile for observations"
* obeys dk-core-observation-mandatory-units
* code.coding ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
* code.coding contains
    LOINC 0..1 and
    SNOMEDCT 0..1 and
    NPU 0..1 and
    IEEE 0..1 and
    MedCom 0..1 and
    SKS 0..1
* code.coding[LOINC] 
  * ^short = "LOINC code for the observation"
  * system 1..
  * system = "http://loinc.org" (exactly)
  * code 1..
* code.coding[SNOMEDCT]
  * ^short = "SNOMED CT code for the observation"
  * system 1..
  * system = "http://snomed.info/sct" (exactly)
  * code 1..
* code.coding[NPU]
  * ^short = "NPU code for the observation. NPU codes are administred by the Danish Health Data Authority." 
  * system 1..
  * system = $NPU (exactly)
  * code 1..
* code.coding[MedCom] 
  * ^short = "MedCom code for the observation. MedCom codes are administred by the MedCom."
  * system 1..
  * system = $Medcom (exactly)
  * code 1..
* code.coding[IEEE] 
  * ^short = "IEEE code for the observation"
  * system 1..
  * system = $IEEEx73 (exactly)
  * code 1..
* code.coding[SKS] 
  * ^short = "SKS code for the observation"
  * system 1..
  * system = $SKS (exactly)
  * code 1..
* subject only Reference(DkCorePatient or Group or DkCoreLocation or Device)
* subject 1..
* performer only Reference(DkCorePractitioner or DkCoreOrganization or DkCorePatient or DkCorePractitionerRole or CareTeam or DkCoreRelatedPerson)
* device ^short = "The device used for the measurement. It is recommended that when information about the device is sent, it is contained in the same Bundle as the Observation the device measured."
* valueQuantity.system = $ucum
* component.code.coding ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
* component.code.coding contains
    LOINC 0..1 and
    SNOMEDCT 0..1 and
    NPU 0..1 and
    IEEE 0..1 and
    MedCom 0..1 and
    SKS 0..1
* component.code.coding[LOINC] 
  * ^short = "LOINC code for the observation"
  * system 1..
  * system = "http://loinc.org" (exactly)
  * code 1..
* component.code.coding[SNOMEDCT]
  * ^short = "SNOMED CT code for the observation"
  * system 1..
  * system = "http://snomed.info/sct" (exactly)
  * code 1..
* component.code.coding[NPU]
  * ^short = "NPU code for the observation. NPU codes are administred by the Danish Health Data Authority." 
  * system 1..
  * system = $NPU (exactly)
  * code 1..
* component.code.coding[MedCom] 
  * ^short = "MedCom code for the observation. MedCom codes are administred by the MedCom."
  * system 1..
  * system = $Medcom (exactly)
  * code 1..
* component.code.coding[IEEE] 
  * ^short = "IEEE code for the observation"
  * system 1..
  * system = $IEEEx73 (exactly)
  * code 1..
* component.code.coding[SKS] 
  * ^short = "SKS code for the observation."
  * system 1..
  * system = $SKS (exactly)
  * code 1..
* component.valueQuantity.system = $ucum
* method.coding ^slicing.discriminator.type = #value
* method.coding ^slicing.discriminator.path = "system"
* method.coding ^slicing.rules = #open
* method.coding contains
   SCTCode 0..1
* method.coding[SCTCode] from TechniquesSCTCodes (example)
* method.coding[SCTCode].system = $sct

Invariant: dk-core-observation-mandatory-units
Description: "If value is specified then unit and/or code must be specified"
Severity: #error
Expression: "value.ofType(Quantity).value.exists() implies value.ofType(Quantity).unit.exists() or value.ofType(Quantity).code.exists()"




/* Instance: ObservationBloodPressureNPU
InstanceOf: DkCoreObservationVitalSignsNPU
Title: "John's blood pressure measurement"
Description: "John, blood pressure measurement, NPU-code"
Usage: #example 
[Add content here]
*/

/*Instance: ObservationHeightNPU
InstanceOf: DkCoreObservation
 Title: "John's height measurement"
* status = #final
* code.coding[NPU] = $NPU#NPU03794 "Legeme højde;Pt"
* valueQuantity.value = 1.80
* valueQuantity.code = #m
* valueQuantity.system = $ucum
* valueQuantity.unit = "m" 
* subject = Reference(john)
* performer = Reference(AbrahamLaege)

Instance: ObservationBloodPressureNPU
InstanceOf: DkCoreObservation
Title: "John's blood pressure measurement"
Description: "John, blood pressure measurement, NPU-code"
* device = Reference(ObservingDevice)
* status = #registered
* code.coding[NPU]
  * system = "urn:oid:1.2.208.176.2.1"
  * code = #DNK05462
  * display = "Arm—Blodtryk(diastolisk); tryk(liggende) = ? mmHg"
* subject = Reference(john)
* performer = Reference(AbrahamLaege)

Instance: ObservingDevice
InstanceOf: Device
Title: "The device that performed the observation"
* deviceName.name = "Blood Pressure Device"
* deviceName.type = #user-friendly-name
* serialNumber = "74E8FFFEFF051C00.001C05FFE874" */

Instance: ElseUrinStix
InstanceOf: DkCoreObservation
Usage: #example
* status = #final
* code.coding[0] = $NPU#NPU03987 "U—Leukocytter; arb.k.(proc.) = ?"
* code.coding[+] = $sct#252385000 "Urine dipstick for leukocyte esterase (procedure)"
* subject = Reference(else)
* effectiveDateTime = "2023-09-12T17:45:00.000Z"
* valueString = "Påviselige leukocytter"
* method = $sct#272391002 "Measurement technique (qualifier value)"

Instance: ElsePainVRS
InstanceOf: dk-core-observation
Usage: #example
Title: "ElsePainVRS"
Description: "Elses smerte målt med VRS"
* subject = Reference(else)
* code.coding = $sct#1144798005 "Verbal Rating Scale pain intensity score"
* valueCodeableConcept.coding[0].system = "http://localSystem.dk"
* valueCodeableConcept.coding[0].code = #d253770d-ce0b-4320-9806-b8fbe9e5af8a "Kraftige/svære smerter (3)"
* valueCodeableConcept.coding[0].userSelected = true
* valueCodeableConcept.coding[1] = $sct#76948002 "Severe pain (finding)"
* status = #final
* effectiveDateTime = 2020-06-01

Instance: ObservationOxySat
InstanceOf: DkCoreObservation
Title: "John's oxygen saturation measurement"
Usage: #inline
* status = #final
* code.coding = $NPU#NPU03011 "Iltmætning"
* valueQuantity.value = 0.97
* valueQuantity.code = #1
* valueQuantity.system = $ucum
* effectiveDateTime = 2023-11-01T12:00:00+01:00
* subject = Reference(john)
* performer = Reference(AbrahamLaege)




/* **************
 *
 * Examples involving Continua compliant observations and exchanges
 *
 * ************** */


Alias: $PhdPatient = http://hl7.org/fhir/uv/phd/StructureDefinition/PhdPatient
Alias: $PhgDevice = http://hl7.org/fhir/uv/phd/StructureDefinition/PhgDevice
Alias: $PhdDevice = http://hl7.org/fhir/uv/phd/StructureDefinition/PhdDevice
Alias: $PhdNumericObservation = http://hl7.org/fhir/uv/phd/StructureDefinition/PhdNumericObservation
Alias: $PhdCompoundNumericObservation = http://hl7.org/fhir/uv/phd/StructureDefinition/PhdCompoundNumericObservation
Alias: $PhdBitsEnumerationObservation = http://hl7.org/fhir/uv/phd/StructureDefinition/PhdBitsEnumerationObservation
Alias: $PhdCoincidentTimeStampObservation = http://hl7.org/fhir/uv/phd/StructureDefinition/PhdCoincidentTimeStampObservation
Alias: $EUI64 = urn:oid:1.2.840.10004.1.1.1.0.0.1.0.0.1.2680
Alias: $BD_ADDR = http://hl7.org/fhir/sid/eui-48/bluetooth
Alias: $ContinuaDeviceIdentifiers = http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaDeviceIdentifiers
Alias: $ContinuaPHD = http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaPHD
Alias: $ContinuaHFS = http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaHFS
Alias: $observation-gatewayDevice = http://hl7.org/fhir/StructureDefinition/observation-gatewayDevice
Alias: $v2-0136 = http://terminology.hl7.org/CodeSystem/v2-0136
Alias: $v2-0203 = http://terminology.hl7.org/CodeSystem/v2-0203
Alias: $ASN1ToHL7 = http://hl7.org/fhir/uv/phd/CodeSystem/ASN1ToHL7


Instance: Poul
InstanceOf: DkCorePatient
Usage: #example
* meta.profile = $PhdPatient
* identifier[cpr].value = "3001749995"
* identifier[cpr].type = $v2-0203#NI
* name
  * family = "Hansen"
  * given[+] = "Poul"


Instance: WeightScale.606405FFFECFC604
InstanceOf: Device
Title: "Poul's A&D weight scale"
Description: """
  This device is Poul's personal weighing scale, which he keeps in the bathroom
  of his home, and uses for daily monitoring due to his CHF condition.
"""
Usage: #example
* meta.profile = $PhdDevice
* identifier[+]
  * system = $EUI64
  * type.coding[0] = $ContinuaDeviceIdentifiers#SYSID "IEEE 11073 System Identifier"
  * value = "60-64-05-FF-FE-CF-C6-04"
* identifier[+]
  * system = $BD_ADDR
  * type.coding[0] = $ContinuaDeviceIdentifiers#BTMAC "Bluetooth MAC address"
  * value = "60-64-05-CF-C6-04"
* manufacturer = "A&D Medical "
* modelNumber = "UC-352BLE "
* serialNumber = "5180400664"
* type
  * coding = $IEEEx73#65573 "MDC_MOC_VMS_MDS_SIMP"
  * text = "MDC_MOC_VMS_MDS_SIMP: Personal health device"
* specialization
  * systemType
    * coding = $IEEEx73#528399 "MDC_DEV_SPEC_PROFILE_SCALE"
    * text = "MDC_DEV_SPEC_PROFILE_SCALE: Weighing scale"
  * version = "1"
* version[+]
  * type[+].coding = $IEEEx73#532352 "MDC_REG_CERT_DATA_CONTINUA_VERSION"
  * type[=].text = "MDC_REG_CERT_DATA_CONTINUA_VERSION: Continua version"
  * value = "4.1"
* version[+]
  * type[+].coding = $IEEEx73#531974 "MDC_ID_PROD_SPEC_HW"
  * type[=].text = "MDC_ID_PROD_SPEC_HW: Hardware version"
  * value = "0.00"
* version[+]
  * type[+].coding = $IEEEx73#531975 "MDC_ID_PROD_SPEC_SW"
  * type[=].text = "MDC_ID_PROD_SPEC_SW: Software version"
  * value = "0.00"
* version[+]
  * type[+].coding = $IEEEx73#531976 "MDC_ID_PROD_SPEC_FW"
  * type[=].text = "MDC_ID_PROD_SPEC_FW: Firmware version"
  * value = "WSP002_208"
* property[+]
  * type.coding = $IEEEx73#532353 "MDC_REG_CERT_DATA_CONTINUA_CERT_DEV_LIST"
  * type.text = "MDC_REG_CERT_DATA_CONTINUA_CERT_DEV_LIST: Continua certified device list"
  * valueCode[+]
    * coding = $ContinuaPHD#32783
    * text = "BluetoothLE: Weighing scale"
* property[+]
  * type.coding = $IEEEx73#68220 "MDC_TIME_SYNC_PROTOCOL"
  * type.text = "MDC_TIME_SYNC_PROTOCOL: Time synchronization protocol"
  * valueCode
    * coding = $IEEEx73#532224 "MDC_TIME_SYNC_NONE"
    * text = "MDC_TIME_SYNC_NONE: No time synchronization"
* property[+]
  * type.coding = $ASN1ToHL7#532354.0
  * type.text = "regulation-status"
  * valueCode
    * coding = $v2-0136#N
    * text = "Device is regulated"
* property[+]
  * type.coding = $ASN1ToHL7#68219.0
  * type.text = "mds-time-capab-real-time-clock"
  * valueCode
    * coding = $v2-0136#Y
    * text = "Real time clock is supported"
* property[+]
  * type.coding = $ASN1ToHL7#68219.1
  * type.text = "mds-time-capab-set-clock"
  * valueCode
    * coding = $v2-0136#Y
    * text = "Setting the real time clock is supported"


Instance: Weight.Poul.230221
InstanceOf: DkCoreObservation
Title: "Poul's daily weighing on Feb. 21st"
Description: """
  Poul has been instructed to perform a daily weighing in the morning. This is his
  daily weighing from Feb. 21st 2023.
"""
Usage: #example
* identifier.value = "606405FFFECFC604-3001749995-urn:oid:1.2.208.176.1.2-188736-74.0-kg-20230221T083640.00"
* meta.profile[+] = $PhdNumericObservation
* meta.profile[+] = $observation-vitalsigns
* meta.profile[+] = $observation-bodyweight
* status = #final
* category.coding = $observation-category#vital-signs "Vital signs"
* code
  * coding[+] = $LOINC#29463-7 "Body weight"
  * coding[+] = $IEEEx73#188736 "MDC_MASS_BODY_ACTUAL"
  * coding[+] = $NPU#NPU03804 "Pt—Body; mass = ? kg"
  * text = "MDC_MASS_BODY_ACTUAL: Body weight"
* subject = Reference(http://example.org/fhir/Patient/Poul)
* performer = Reference(http://example.org/fhir/Patient/Poul)
* effectiveDateTime = "2023-02-21T08:36:40+01:00"
* valueQuantity = 74.0 'kg' "kg"
* device = Reference(WeightScale.606405FFFECFC604)
* extension
  * url = $observation-gatewayDevice
  * valueReference = Reference(http://example.org/fhir/Telma.FEEDDADADEADBEEF)
* derivedFrom = Reference(http://example.org/fhir/CoincidentTimeStamp.0123)



/*
 * A complex example involving a Continua-compliant observation reporting upload
 */



Instance: Telma.FEEDDADADEADBEEF
InstanceOf: Device
Usage: #example
* meta.profile = $PhgDevice
* identifier[+]
  * system = $EUI64
  * type.coding = $ContinuaDeviceIdentifiers#SYSID "IEEE 11073 System Identifier"
  * value = "FE-ED-DA-DA-DE-AD-BE-EF"
* manufacturer = "Trifork"
* modelNumber = "Telma (Android)"
* type
  * coding = $IEEEx73#531981 "MDC_MOC_VMS_MDS_AHD"
  * text = "MDC_MOC_VMS_MDS_AHD: Continua compliant gateway"
* version[+]
  * type
    * coding = $IEEEx73#532352 "MDC_REG_CERT_DATA_CONTINUA_VERSION"
    * text = "MDC_REG_CERT_DATA_CONTINUA_VERSION: Continua version"
  * value = "7.0"
* version[+]
  * type
    * coding = $IEEEx73#531974 "MDC_ID_PROD_SPEC_HW"
    * text = "MDC_ID_PROD_SPEC_HW: Hardware version"
  * value = "Samsung Tab S7+ (SM-T970)"
* version[+]
  * type
    * coding = $IEEEx73#531975 "MDC_ID_PROD_SPEC_SW"
    * text = "MDC_ID_PROD_SPEC_SW: Software version"
  * value = "1.2.0 (build 2662)"
* version[+]
  * type
    * coding = $IEEEx73#531976 "MDC_ID_PROD_SPEC_FW"
    * text = "MDC_ID_PROD_SPEC_FW: Firmware version"
  * value = "Android 12 (API 31)"
* property[+]
  * type
    * coding = $IEEEx73#532353 "MDC_REG_CERT_DATA_CONTINUA_CERT_DEV_LIST"
    * text = "MDC_REG_CERT_DATA_CONTINUA_CERT_DEV_LIST: Continua certified device list"
  * valueCode[+]
    * coding = $ContinuaPHD#32783
    * text = "BluetoothLE: Weighing scale"
  * valueCode[+]
    * coding = $ContinuaPHD#32775
    * text = "BluetoothLE: Blood pressure monitor"
  * valueCode[+]
    * coding = $ContinuaPHD#32772
    * text = "BluetoothLE: Pulse oximeter"
* property[+]
  * type
    * coding = $IEEEx73#532355 "MDC_REG_CERT_DATA_CONTINUA_AHD_CERT_LIST"
    * text = "MDC_REG_CERT_DATA_CONTINUA_AHD_CERT_LIST: Continua certified Health&Fitness interfaces list"
  * valueCode
    * coding = $ContinuaHFS#7 "observation-upload-fhir"
    * text = "observation-upload-fhir: FHIR resource upload"
* property[+]
  * type
    * coding = $IEEEx73#68220 "MDC_TIME_SYNC_PROTOCOL"
    * text = "MDC_TIME_SYNC_PROTOCOL: Time synchronization protocol"
  * valueCode
    * coding = $IEEEx73#532226 "MDC_TIME_SYNC_NTPV4"
    * text = "MDC_TIME_SYNC_NTPV4: NTPV4 time synchronization"
* property[+]
  * type
    * coding = $ASN1ToHL7#532354.0
    * text = "regulation-status"
  * valueCode
    * coding = $v2-0136#Y
    * text = "Device is NOT regulated"


Instance: BPMonitor.C4F312FFFE53F2C9
InstanceOf: Device
Usage: #example
* meta.profile = $PhdDevice
* identifier[+]
  * system = $EUI64
  * type.coding = $ContinuaDeviceIdentifiers#SYSID "Ieee 11073 System Identifier"
  * value = "C4-F3-12-FF-FE-53-F2-C9"
* identifier[+]
  * system = $BD_ADDR
  * type.coding = $ContinuaDeviceIdentifiers#BTMAC "Bluetooth MAC address"
  * value = "C4-F3-12-53-F2-C9"
* manufacturer = "A&D Medical "
* modelNumber = "UA-651BLE "
* serialNumber = "5181000124"
* type
  * coding = $IEEEx73#65573 "MDC_MOC_VMS_MDS_SIMP"
  * text = "MDC_MOC_VMS_MDS_SIMP: Personal health device"
* specialization
  * systemType
    * coding = $IEEEx73#528391 "MDC_DEV_SPEC_PROFILE_BP"
    * text = "MDC_DEV_SPEC_PROFILE_BP: Blood Pressure meter"
  * version = "1"
* version[+]
  * type
    * coding = $IEEEx73#532352 "MDC_REG_CERT_DATA_CONTINUA_VERSION"
    * text = "MDC_REG_CERT_DATA_CONTINUA_VERSION: Continua version"
  * value = "4.1"
* version[+]
  * type[+].coding = $IEEEx73#531974 "MDC_ID_PROD_SPEC_HW"
  * type[=].text = "MDC_ID_PROD_SPEC_HW: Hardware version"
  * value = "0.00"
* version[+]
  * type
    * coding = $IEEEx73#531975 "MDC_ID_PROD_SPEC_SW"
    * text = "MDC_ID_PROD_SPEC_SW: Software version"
  * value = "0.00"
* version[+]
  * type
    * coding = $IEEEx73#531976 "MDC_ID_PROD_SPEC_FW"
    * text = "MDC_ID_PROD_SPEC_FW: Firmware version"
  * value = "BLP009_02_005 "
* property[+]
  * type
    * coding = $IEEEx73#532353 "MDC_REG_CERT_DATA_CONTINUA_CERT_DEV_LIST"
    * text = "MDC_REG_CERT_DATA_CONTINUA_CERT_DEV_LIST: Continua certified device list"
  * valueCode
    * coding = $ContinuaPHD#32775
    * text = "BluetoothLE: Blood pressure monitor"
* property[+]
  * type
    * coding = $IEEEx73#68220 "MDC_TIME_SYNC_PROTOCOL"
    * text = "MDC_TIME_SYNC_PROTOCOL: Time synchronization protocol"
  * valueCode
    * coding = $IEEEx73#532224 "MDC_TIME_SYNC_NONE"
    * text = "MDC_TIME_SYNC_NONE: No time synchronization"
* property[+]
  * type
    * coding = $ASN1ToHL7#532354.0
    * text = "regulation-status"
  * valueCode
    * coding = $v2-0136#N
    * text = "Device is regulated"
* property[+]
  * type
    * coding = $ASN1ToHL7#68219.0
    * text = "mds-time-capab-real-time-clock"
  * valueCode
    * coding = $v2-0136#Y
    * text = "Real time clock is supported"
* property[+]
  * type
    * coding = $ASN1ToHL7#68219.1
    * text = "mds-time-capab-set-clock"
  * valueCode
    * coding = $v2-0136#Y
    * text = "Setting the real time clock is supported"


Instance: BatteryLevel.0944
InstanceOf: DkCoreObservation
Usage: #inline
* meta.profile[+] = $PhdNumericObservation
* status = #final
* code
  * coding[+] = $IEEEx73#67996 "MDC_ATTR_VAL_BATT_CHARGE"
  * text = "MDC_ATTR_VAL_BATT_CHARGE: Battery level"
* subject = Reference(Poul)
* performer = Reference(Poul)
* effectiveDateTime = "2023-02-23T10:24:34.563+01:00"
* valueQuantity = 95 '%'
* device = Reference(BPMonitor.C4F312FFFE53F2C9)
* extension
  * url = $observation-gatewayDevice
  * valueReference = Reference(Telma.FEEDDADADEADBEEF)


Instance: CoincidentTimeStamp.0222
InstanceOf: DkCoreObservation
Usage: #example
* meta.profile[+] = $PhdCoincidentTimeStampObservation
* status = #final
* code
  * coding[+] = $IEEEx73#67975 "MDC_ATTR_TIME_ABS"
  * text = "MDC_ATTR_TIME_ABS: Uses Absolute time clock"
* subject = Reference(Poul)
* performer = Reference(Poul)
* effectiveDateTime = "2023-02-23T10:24:34.467+01:00"
* valueDateTime = "2023-02-23T10:24:25+01:00"
* device = Reference(BPMonitor.C4F312FFFE53F2C9)
* extension
  * url = $observation-gatewayDevice
  * valueReference = Reference(Telma.FEEDDADADEADBEEF)


Instance: BloodPressure.Poul.643992
InstanceOf: DkCoreObservation
Usage: #inline
* identifier.value = "C4F312FFFE53F2C9-3001749995-urn:oid:1.2.208.176.1.2-150020-118-266016-87-266016-99-266016-20230223T102408.00"
* meta.profile[+] = $PhdCompoundNumericObservation
* meta.profile[+] = $observation-vitalsigns
* meta.profile[+] = $observation-bp
* status = #final
* category.coding = $observation-category#vital-signs "Vital signs"
* code
  * coding[+] = $LOINC#85354-9 "Blood pressure panel with all children optional"
  * coding[+] = $IEEEx73#150020 "MDC_PRESS_BLD_NONINV"
  * coding[+] = $SKS#ZZ3170 "Hjemmeblodtryksmåling udført af patienten"
  * text = "MDC_PRESS_BLD_NONINV: Blood Pressure"
* subject = Reference(Poul)
* performer = Reference(Poul)
* effectiveDateTime = "2023-02-23T10:24:08+01:00"
* component[+]
  * code
    * coding[+] = $LOINC#8480-6 "Systolic blood pressure"
    * coding[+] = $IEEEx73#150021 "MDC_PRESS_BLD_NONINV_SYS"
    * coding[+] = $Medcom#MCS88019 "Arm—Blodtryk(systolisk) hjemme; tryk = ? mmHg"
    * text = "MDC_PRESS_BLD_NONINV_SYS: Systolic Blood Pressure"
  * valueQuantity = 118 'mm[Hg]' "mmHg"
* component[+]
  * code
    * coding[+] = $LOINC#8462-4 "Diastolic blood pressure"
    * coding[+] = $IEEEx73#150022 "MDC_PRESS_BLD_NONINV_DIA"
    * coding[+] = $Medcom#MCS88020 "Arm—Blodtryk(diastolisk) hjemme; tryk = ? mmHg"
    * text = "MDC_PRESS_BLD_NONINV_DIA: Diastolic Blood Pressure"
  * valueQuantity = 87 'mm[Hg]' "mmHg"
* component[+]
  * code
    * coding[+] = $IEEEx73#150023 "MDC_PRESS_BLD_NONINV_MEAN"
    * text = "MDC_PRESS_BLD_NONINV_MEAN: Mean Blood Pressure"
  * valueQuantity = 99 'mm[Hg]' "mmHg"
* device = Reference(BPMonitor.C4F312FFFE53F2C9)
* extension
  * url = $observation-gatewayDevice
  * valueReference = Reference(Telma.FEEDDADADEADBEEF)
* derivedFrom = Reference(CoincidentTimeStamp.0222)


Instance: HeartRate.Poul.1974654
InstanceOf: DkCoreObservation
Usage: #example
* identifier.value = "C4F312FFFE53F2C9-3001749995-urn:oid:1.2.208.176.1.2-149546-93-{beat}/min-20230223T102408.00"
* meta.profile[+] = $PhdNumericObservation
* meta.profile[+] = $observation-vitalsigns
* meta.profile[+] = $observation-heartrate
* status = #final
* category.coding = $observation-category#vital-signs "Vital signs"
* code
  * coding[+] = $LOINC#8867-4 "Heart rate"
  * coding[+] = $IEEEx73#149546 "MDC_PULS_RATE_NON_INV"
  * coding[+] = $NPU#NPU21692 "Heart—Systole; frequency = ? × 1/min"
  * text = "MDC_PULS_RATE_NON_INV: Heart rate"
* subject = Reference(Poul)
* performer = Reference(Poul)
* effectiveDateTime = "2023-02-23T10:24:08+01:00"
* valueQuantity = 93 '/min' "bpm"
* device = Reference(BPMonitor.C4F312FFFE53F2C9)
* extension
  * url = $observation-gatewayDevice
  * valueReference = Reference(Telma.FEEDDADADEADBEEF)
* derivedFrom = Reference(CoincidentTimeStamp.0222)


Instance: BloodPressureStatus.Poul.133527
InstanceOf: DkCoreObservation
Usage: #inline
* identifier.value = "C4F312FFFE53F2C9-3001749995-urn:oid:1.2.208.176.1.2-8410608-8192-20230223T102408.00"
* meta.profile[+] = $PhdBitsEnumerationObservation
* status = #final
* code
  * coding = $IEEEx73#8410608 "MDC_BLOOD_PRESSURE_MEASUREMENT_STATUS"
  * text = "MDC_BLOOD_PRESSURE_MEASUREMENT_STATUS: Blood Pressure measurement problem"
* subject = Reference(Poul)
* performer = Reference(Poul)
* effectiveDateTime = "2023-02-23T10:24:08+01:00"
* component
  * code
    * coding = $ASN1ToHL7#8410608.2
    * text = "irregular-pulse"
  * valueCodeableConcept
    * coding = $v2-0136#Y
    * text = "Irregular pulse was detected"
* device = Reference(BPMonitor.C4F312FFFE53F2C9)
* extension
  * url = $observation-gatewayDevice
  * valueReference = Reference(Telma.FEEDDADADEADBEEF)
* derivedFrom[+] = Reference(CoincidentTimeStamp.0222)
* derivedFrom[+] = Reference(BloodPressure.Poul.643992)


Instance: ContinuaBundleWithDevice
InstanceOf: Bundle
Title: "Poul's home blood pressure measurement"
Description: """
  This example demonstrates a DkCoreObservation _and_ Continua-compliant
  bundle containing a home blood pressure measurement uploaded to a Continua-compliant
  _"FHIR Observation Reporting Server"._
"""
Usage: #example
* type = #transaction
* entry[+]
  * fullUrl = "http://hl7.dk/fhir/core/Patient/Poul"
  * request
    * method = #POST
    * url = "Patient"
    * ifNoneExist = "identifier=urn:oid:1.2.208.176.1.2|3001749995"
  * resource = Poul
* entry[+]
  * fullUrl = "http://hl7.dk/fhir/core/Device/Telma.FEEDDADADEADBEEF"
  * request
    * method = #POST
    * url = "Device"
    * ifNoneExist = "identifier=urn:oid:1.2.840.10004.1.1.1.0.0.1.0.0.1.2680|FE-ED-DA-DA-DE-AD-BE-EF"
  * resource = Telma.FEEDDADADEADBEEF
* entry[+]
  * fullUrl = "http://hl7.dk/fhir/core/Device/BPMonitor.C4F312FFFE53F2C9"
  * request
    * method = #POST
    * url = "Device"
    * ifNoneExist = "identifier=urn:oid:1.2.840.10004.1.1.1.0.0.1.0.0.1.2680|C4-F3-12-FF-FE-53-F2-C9"
  * resource = BPMonitor.C4F312FFFE53F2C9
* entry[+]
  * fullUrl = "http://hl7.dk/fhir/core/Observation/BatteryLevel.0944"
  * request
    * method = #POST
    * url = "Observation"
  * resource = BatteryLevel.0944
* entry[+]
  * fullUrl = "http://hl7.dk/fhir/core/Observation/CoincidentTimeStamp.0222"
  * request
    * method = #POST
    * url = "Observation"
  * resource = CoincidentTimeStamp.0222
* entry[+]
  * fullUrl = "http://hl7.dk/fhir/core/Observation/BloodPressure.Poul.643992"
  * request
    * method = #POST
    * url = "Observation"
    * ifNoneExist = "identifier=C4F312FFFE53F2C9-3001749995-urn:oid:1.2.208.176.1.2-150020-118-266016-87-266016-99-266016-20230223T102408.00"
  * resource = BloodPressure.Poul.643992
* entry[+]
  * fullUrl = "http://hl7.dk/fhir/core/Observation/HeartRate.Poul.1974654"
  * request
    * method = #POST
    * url = "Observation"
    * ifNoneExist = "identifier=C4F312FFFE53F2C9-3001749995-urn:oid:1.2.208.176.1.2-149546-93-{beat}/min-20230223T102408.00"
  * resource = HeartRate.Poul.1974654
* entry[+]
  * fullUrl = "http://hl7.dk/fhir/core/Observation/BloodPressureStatus.Poul.133527"
  * request
    * method = #POST
    * url = "Observation"
    * ifNoneExist = "identifier=C4F312FFFE53F2C9-3001749995-urn:oid:1.2.208.176.1.2-8410608-8192-20230223T102408.00"
  * resource = BloodPressureStatus.Poul.133527

// =============================================================================
// TestPatienter - MedCom Test Patients with Family Relationships
// Based on TestPatienter.xlsx from MedCom (revised 02/07-2024)
// =============================================================================

// =============================================================================
// FAMILIE 1: Lauridsen familien
// Einer (far) og Lonni (mor) med tvillinger Magnus & Rasmus og trillinger Else, Ellen & EK
// =============================================================================

Instance: Einer
InstanceOf: DkCorePatient
Title: "Einer Test Lauridsen - far i Lauridsen familien"
Description: "Einer Test Lauridsen - Gift med Lonni. Tvillinger Magnus & Rasmus, Trillinger Else & Ellen & EK"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0201609995"
* name.use = #official
* name.family = "Lauridsen"
* name.given[0] = "Einer"
* name.given[+] = "Test"
* gender = #male
* birthDate = "1960-01-02"
* address.line = "Testgrusgraven 3, 3.th"
* address.postalCode = "3400"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0219
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-84
* maritalStatus = $v3-MaritalStatus#M "Married"
* link[0].other = Reference(Lonni)
* link[=].type = #seealso

Instance: Lonni
InstanceOf: DkCorePatient
Title: "Lonni Test Lauridsen - mor i Lauridsen familien"
Description: "Lonni Test Lauridsen - Gift med Einer. Tvillinger Magnus & Rasmus, Trillinger Else & Ellen & EK"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0201609996"
* name.use = #official
* name.family = "Lauridsen"
* name.given[0] = "Lonni"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1960-01-02"
* address.line = "Testgrusgraven 3, 3.th"
* address.postalCode = "3400"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0219
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-84
* maritalStatus = $v3-MaritalStatus#M "Married"
* link[0].other = Reference(Einer)
* link[=].type = #seealso

Instance: Magnus
InstanceOf: DkCorePatient
Title: "Magnus Test Lauridsen - tvilling med Rasmus"
Description: "Magnus Test Lauridsen - Søn af Lonni & Einer Lauridsen. Tvilling med Rasmus"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0504909995"
* name.use = #official
* name.family = "Lauridsen"
* name.given[0] = "Magnus"
* name.given[+] = "Test"
* gender = #male
* birthDate = "1990-04-05"
* address.line = "Testgrusgraven 3, 10.th"
* address.postalCode = "3400"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0219
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-84
* multipleBirthBoolean = true
* link[0].other = Reference(Rasmus)
* link[=].type = #seealso

Instance: Rasmus
InstanceOf: DkCorePatient
Title: "Rasmus Test Lauridsen - tvilling med Magnus"
Description: "Rasmus Test Lauridsen - Søn af Lonni & Einer Lauridsen. Tvilling med Magnus"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0504909989"
* name.use = #official
* name.family = "Lauridsen"
* name.given[0] = "Rasmus"
* name.given[+] = "Test"
* gender = #male
* birthDate = "1990-04-05"
* address.line = "Testgrusgraven 3, 2.th"
* address.postalCode = "3400"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0219
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-84
* multipleBirthBoolean = true
* link[0].other = Reference(Magnus)
* link[=].type = #seealso

Instance: ElseLauridsen
InstanceOf: DkCorePatient
Title: "Else Test Lauridsen - trilling med EK & Ellen"
Description: "Else Test Lauridsen - Datter af Lonni & Einer Lauridsen. Trilling med EK & Ellen"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0201919990"
* name.use = #official
* name.family = "Lauridsen"
* name.given[0] = "Else"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1991-01-02"
* address.line = "Testgrusgraven 3, 1.th"
* address.postalCode = "3400"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0219
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-84
* multipleBirthBoolean = true
* link[0].other = Reference(EK)
* link[=].type = #seealso
* link[+].other = Reference(EllenLouise)
* link[=].type = #seealso

Instance: EllenLouise
InstanceOf: DkCorePatient
Title: "Ellen Louise Test Lauridsen - trilling med EK & Else"
Description: "Ellen Louise Test Lauridsen - Datter af Lonni & Einer Lauridsen. Trilling med EK & Else"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0201919996"
* name.use = #official
* name.family = "Lauridsen"
* name.given[0] = "Ellen"
* name.given[+] = "Louise"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1991-01-02"
* address.line = "Testgrusgraven 3, 5.th"
* address.postalCode = "3400"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0219
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-84
* multipleBirthBoolean = true
* link[0].other = Reference(EK)
* link[=].type = #seealso
* link[+].other = Reference(ElseLauridsen)
* link[=].type = #seealso

Instance: EK
InstanceOf: DkCorePatient
Title: "EK Test Lauridsen - trilling med Ellen & Else"
Description: "EK Test Lauridsen - Søn af Lonni & Einer Lauridsen. Trilling med Ellen & Else"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0201919995"
* name.use = #official
* name.family = "Lauridsen"
* name.given[0] = "EK"
* name.given[+] = "Test"
* gender = #male
* birthDate = "1991-01-02"
* address.line = "Testgrusgraven 3, 2.th"
* address.postalCode = "3400"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0219
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-84
* multipleBirthBoolean = true
* link[0].other = Reference(ElseLauridsen)
* link[=].type = #seealso
* link[+].other = Reference(EllenLouise)
* link[=].type = #seealso

// RelatedPerson for Lauridsen family relationships

Instance: LonniRelatedToEiner
InstanceOf: DkCoreRelatedPerson
Title: "Lonni som ægtefælle til Einer"
Description: "Lonni er gift med Einer"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0201609996"
* patient = Reference(Einer)
* relationship = $v3-RoleCode#SPS
* name.use = #official
* name.family = "Lauridsen"
* name.given[0] = "Lonni"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1960-01-02"

Instance: EinerRelatedToMagnus
InstanceOf: DkCoreRelatedPerson
Title: "Einer som far til Magnus"
Description: "Einer er far til Magnus"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0201609995"
* patient = Reference(Magnus)
* relationship = $v3-RoleCode#FTH
* name.use = #official
* name.family = "Lauridsen"
* name.given[0] = "Einer"
* name.given[+] = "Test"
* gender = #male
* birthDate = "1960-01-02"

Instance: LonniRelatedToMagnus
InstanceOf: DkCoreRelatedPerson
Title: "Lonni som mor til Magnus"
Description: "Lonni er mor til Magnus"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0201609996"
* patient = Reference(Magnus)
* relationship = $v3-RoleCode#MTH
* name.use = #official
* name.family = "Lauridsen"
* name.given[0] = "Lonni"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1960-01-02"

Instance: EinerRelatedToRasmus
InstanceOf: DkCoreRelatedPerson
Title: "Einer som far til Rasmus"
Description: "Einer er far til Rasmus"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0201609995"
* patient = Reference(Rasmus)
* relationship = $v3-RoleCode#FTH
* name.use = #official
* name.family = "Lauridsen"
* name.given[0] = "Einer"
* name.given[+] = "Test"
* gender = #male
* birthDate = "1960-01-02"

Instance: LonniRelatedToRasmus
InstanceOf: DkCoreRelatedPerson
Title: "Lonni som mor til Rasmus"
Description: "Lonni er mor til Rasmus"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0201609996"
* patient = Reference(Rasmus)
* relationship = $v3-RoleCode#MTH
* name.use = #official
* name.family = "Lauridsen"
* name.given[0] = "Lonni"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1960-01-02"

Instance: EinerRelatedToElse
InstanceOf: DkCoreRelatedPerson
Title: "Einer som far til Else"
Description: "Einer er far til Else"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0201609995"
* patient = Reference(ElseLauridsen)
* relationship = $v3-RoleCode#FTH
* name.use = #official
* name.family = "Lauridsen"
* name.given[0] = "Einer"
* name.given[+] = "Test"
* gender = #male
* birthDate = "1960-01-02"

Instance: LonniRelatedToElse
InstanceOf: DkCoreRelatedPerson
Title: "Lonni som mor til Else"
Description: "Lonni er mor til Else"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0201609996"
* patient = Reference(ElseLauridsen)
* relationship = $v3-RoleCode#MTH
* name.use = #official
* name.family = "Lauridsen"
* name.given[0] = "Lonni"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1960-01-02"

Instance: EinerRelatedToEllen
InstanceOf: DkCoreRelatedPerson
Title: "Einer som far til Ellen"
Description: "Einer er far til Ellen Louise"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0201609995"
* patient = Reference(EllenLouise)
* relationship = $v3-RoleCode#FTH
* name.use = #official
* name.family = "Lauridsen"
* name.given[0] = "Einer"
* name.given[+] = "Test"
* gender = #male
* birthDate = "1960-01-02"

Instance: LonniRelatedToEllen
InstanceOf: DkCoreRelatedPerson
Title: "Lonni som mor til Ellen"
Description: "Lonni er mor til Ellen Louise"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0201609996"
* patient = Reference(EllenLouise)
* relationship = $v3-RoleCode#MTH
* name.use = #official
* name.family = "Lauridsen"
* name.given[0] = "Lonni"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1960-01-02"

Instance: EinerRelatedToEK
InstanceOf: DkCoreRelatedPerson
Title: "Einer som far til EK"
Description: "Einer er far til EK"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0201609995"
* patient = Reference(EK)
* relationship = $v3-RoleCode#FTH
* name.use = #official
* name.family = "Lauridsen"
* name.given[0] = "Einer"
* name.given[+] = "Test"
* gender = #male
* birthDate = "1960-01-02"

Instance: LonniRelatedToEK
InstanceOf: DkCoreRelatedPerson
Title: "Lonni som mor til EK"
Description: "Lonni er mor til EK"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0201609996"
* patient = Reference(EK)
* relationship = $v3-RoleCode#MTH
* name.use = #official
* name.family = "Lauridsen"
* name.given[0] = "Lonni"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1960-01-02"

// =============================================================================
// FAMILIE 2: Mosebryggersen familien
// Schwendlund (far) og May June (mor) med børnene Odd, Knut, Sille og tvillinger Sverre & Torre
// =============================================================================

Instance: Schwendlund
InstanceOf: DkCorePatient
Title: "Schwendlund Test Mosebryggersen - far i Mosebryggersen familien"
Description: "Schwendlund Test Mosebryggersen - Gift med May June Moberg. Sønnerne Odd & Knut, Datteren Sille, Tvillingerne Sverre & Torre"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0108589995"
* name.use = #official
* name.family = "Mosebryggersen"
* name.given[0] = "Schwendlund"
* name.given[+] = "Test"
* gender = #male
* birthDate = "1958-08-01"
* address.line = "Testgrusgraven 3, 3.tv"
* address.postalCode = "3400"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0219
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-84
* maritalStatus = $v3-MaritalStatus#M "Married"
* link[0].other = Reference(MayJune)
* link[=].type = #seealso

Instance: MayJune
InstanceOf: DkCorePatient
Title: "May June Test Moberg - mor i Mosebryggersen familien"
Description: "May June Test Moberg - Gift med Schwendlund Mosebryggersen. Sønnerne Odd & Knut, Datteren Sille, Tvillingerne Sverre & Torre"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0108629996"
* name.use = #official
* name.family = "Moberg"
* name.given[0] = "May"
* name.given[+] = "June"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1962-08-01"
* address.line = "Testgrusgraven 3, 3.tv"
* address.postalCode = "3400"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0219
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-84
* maritalStatus = $v3-MaritalStatus#M "Married"
* link[0].other = Reference(Schwendlund)
* link[=].type = #seealso

Instance: Sverre
InstanceOf: DkCorePatient
Title: "Sverre Test Mosebryggersen - tvilling med Torre"
Description: "Sverre Test Mosebryggersen - Søn af May June Moberg & Schwendlund Mosebryggersen. Tvilling med Torre. Værge: May June"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0104909995"
* name.use = #official
* name.family = "Mosebryggersen"
* name.given[0] = "Sverre"
* name.given[+] = "Test"
* gender = #male
* birthDate = "1990-04-01"
* address.line = "Testgrusgraven 3, 3.tv"
* address.postalCode = "3400"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0219
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-84
* multipleBirthBoolean = true
* link[0].other = Reference(Torre)
* link[=].type = #seealso

Instance: Torre
InstanceOf: DkCorePatient
Title: "Torre Test Mosebryggersen - tvilling med Sverre"
Description: "Torre Test Mosebryggersen - Søn af May June Moberg & Schwendlund Mosebryggersen. Tvilling med Sverre. Værge: May June"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0104909989"
* name.use = #official
* name.family = "Mosebryggersen"
* name.given[0] = "Torre"
* name.given[+] = "Test"
* gender = #male
* birthDate = "1990-04-01"
* address.line = "Testgrusgraven 3, 3.tv"
* address.postalCode = "3400"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0219
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-84
* multipleBirthBoolean = true
* link[0].other = Reference(Sverre)
* link[=].type = #seealso

Instance: OddHaugen
InstanceOf: DkCorePatient
Title: "Odd Haugen Test Mosebryggersen"
Description: "Odd Haugen Test Mosebryggersen - Søn af May June Moberg & Schwendlund Mosebryggersen"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "1502799995"
* name.use = #official
* name.family = "Mosebryggersen"
* name.given[0] = "Odd"
* name.given[+] = "Haugen"
* name.given[+] = "Test"
* gender = #male
* birthDate = "1979-02-15"
* address.line = "Testgrusgraven 3, 3.tv"
* address.postalCode = "3400"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0219
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-84

Instance: KnutOdvar
InstanceOf: DkCorePatient
Title: "Knut Odvar Test Mosebryggersen"
Description: "Knut Odvar Test Mosebryggersen - Søn af May June Moberg & Schwendlund Mosebryggersen"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "1502829995"
* name.use = #official
* name.family = "Mosebryggersen"
* name.given[0] = "Knut"
* name.given[+] = "Odvar"
* name.given[+] = "Test"
* gender = #male
* birthDate = "1982-02-15"
* address.line = "Testgrusgraven 3, 3.tv"
* address.postalCode = "3400"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0219
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-84

Instance: SilleJune
InstanceOf: DkCorePatient
Title: "Sille June Test Mosebrygersen"
Description: "Sille June Test Mosebrygersen - Datter af May June Moberg & Schwendlund Mosebryggersen"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0506889996"
* name.use = #official
* name.family = "Mosebrygersen"
* name.given[0] = "Sille"
* name.given[+] = "June"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1988-06-05"
* address.line = "Testgrusgraven 3, 3.tv"
* address.postalCode = "3400"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0219
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-84

// RelatedPerson for Mosebryggersen family - guardian relationships

Instance: MayJuneGuardianOfSverre
InstanceOf: DkCoreRelatedPerson
Title: "May June som værge for Sverre"
Description: "May June er værge for Sverre"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0108629996"
* patient = Reference(Sverre)
* relationship = $v3-RoleCode#GUARD
* name.use = #official
* name.family = "Moberg"
* name.given[0] = "May"
* name.given[+] = "June"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1962-08-01"

Instance: MayJuneGuardianOfTorre
InstanceOf: DkCoreRelatedPerson
Title: "May June som værge for Torre"
Description: "May June er værge for Torre"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0108629996"
* patient = Reference(Torre)
* relationship = $v3-RoleCode#GUARD
* name.use = #official
* name.family = "Moberg"
* name.given[0] = "May"
* name.given[+] = "June"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1962-08-01"

Instance: MayJuneRelatedToSchwendlund
InstanceOf: DkCoreRelatedPerson
Title: "May June som ægtefælle til Schwendlund"
Description: "May June er gift med Schwendlund"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0108629996"
* patient = Reference(Schwendlund)
* relationship = $v3-RoleCode#SPS
* name.use = #official
* name.family = "Moberg"
* name.given[0] = "May"
* name.given[+] = "June"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1962-08-01"

Instance: SchwendlundRelatedToSverre
InstanceOf: DkCoreRelatedPerson
Title: "Schwendlund som far til Sverre"
Description: "Schwendlund er far til Sverre"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0108589995"
* patient = Reference(Sverre)
* relationship = $v3-RoleCode#FTH
* name.use = #official
* name.family = "Mosebryggersen"
* name.given[0] = "Schwendlund"
* name.given[+] = "Test"
* gender = #male
* birthDate = "1958-08-01"

Instance: MayJuneRelatedToSverre
InstanceOf: DkCoreRelatedPerson
Title: "May June som mor til Sverre"
Description: "May June er mor til Sverre"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0108629996"
* patient = Reference(Sverre)
* relationship = $v3-RoleCode#MTH
* name.use = #official
* name.family = "Moberg"
* name.given[0] = "May"
* name.given[+] = "June"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1962-08-01"

Instance: SchwendlundRelatedToTorre
InstanceOf: DkCoreRelatedPerson
Title: "Schwendlund som far til Torre"
Description: "Schwendlund er far til Torre"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0108589995"
* patient = Reference(Torre)
* relationship = $v3-RoleCode#FTH
* name.use = #official
* name.family = "Mosebryggersen"
* name.given[0] = "Schwendlund"
* name.given[+] = "Test"
* gender = #male
* birthDate = "1958-08-01"

Instance: MayJuneRelatedToTorre
InstanceOf: DkCoreRelatedPerson
Title: "May June som mor til Torre"
Description: "May June er mor til Torre"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0108629996"
* patient = Reference(Torre)
* relationship = $v3-RoleCode#MTH
* name.use = #official
* name.family = "Moberg"
* name.given[0] = "May"
* name.given[+] = "June"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1962-08-01"

Instance: SchwendlundRelatedToOdd
InstanceOf: DkCoreRelatedPerson
Title: "Schwendlund som far til Odd"
Description: "Schwendlund er far til Odd Haugen"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0108589995"
* patient = Reference(OddHaugen)
* relationship = $v3-RoleCode#FTH
* name.use = #official
* name.family = "Mosebryggersen"
* name.given[0] = "Schwendlund"
* name.given[+] = "Test"
* gender = #male
* birthDate = "1958-08-01"

Instance: MayJuneRelatedToOdd
InstanceOf: DkCoreRelatedPerson
Title: "May June som mor til Odd"
Description: "May June er mor til Odd Haugen"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0108629996"
* patient = Reference(OddHaugen)
* relationship = $v3-RoleCode#MTH
* name.use = #official
* name.family = "Moberg"
* name.given[0] = "May"
* name.given[+] = "June"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1962-08-01"

Instance: SchwendlundRelatedToKnut
InstanceOf: DkCoreRelatedPerson
Title: "Schwendlund som far til Knut"
Description: "Schwendlund er far til Knut Odvar"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0108589995"
* patient = Reference(KnutOdvar)
* relationship = $v3-RoleCode#FTH
* name.use = #official
* name.family = "Mosebryggersen"
* name.given[0] = "Schwendlund"
* name.given[+] = "Test"
* gender = #male
* birthDate = "1958-08-01"

Instance: MayJuneRelatedToKnut
InstanceOf: DkCoreRelatedPerson
Title: "May June som mor til Knut"
Description: "May June er mor til Knut Odvar"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0108629996"
* patient = Reference(KnutOdvar)
* relationship = $v3-RoleCode#MTH
* name.use = #official
* name.family = "Moberg"
* name.given[0] = "May"
* name.given[+] = "June"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1962-08-01"

Instance: SchwendlundRelatedToSille
InstanceOf: DkCoreRelatedPerson
Title: "Schwendlund som far til Sille"
Description: "Schwendlund er far til Sille June"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0108589995"
* patient = Reference(SilleJune)
* relationship = $v3-RoleCode#FTH
* name.use = #official
* name.family = "Mosebryggersen"
* name.given[0] = "Schwendlund"
* name.given[+] = "Test"
* gender = #male
* birthDate = "1958-08-01"

Instance: MayJuneRelatedToSille
InstanceOf: DkCoreRelatedPerson
Title: "May June som mor til Sille"
Description: "May June er mor til Sille June"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0108629996"
* patient = Reference(SilleJune)
* relationship = $v3-RoleCode#MTH
* name.use = #official
* name.family = "Moberg"
* name.given[0] = "May"
* name.given[+] = "June"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1962-08-01"

// =============================================================================
// FAMILIE 3: Berggren familien
// Nancy (bedstemor) med børnene Max, Ruddi, Kirsten og Britta
// Kirstens børn: Pia, Gitte, Lars, Rikke, Aya
// Bruno er Nancys bror, Åge er Nancys far
// =============================================================================

Instance: NancyAnn
InstanceOf: DkCorePatient
Title: "Nancy Ann Test Berggren - bedstemor i Berggren familien"
Description: "Nancy Ann Test Berggren - Sønnerne Max og Ruddi. Døtrene Kirsten og Britta."
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "2512489996"
* name.use = #official
* name.family = "Berggren"
* name.given[0] = "Nancy"
* name.given[+] = "Ann"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1948-12-25"
* address.line = "Testpark Allé 48"
* address.postalCode = "3400"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0219
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-84

Instance: Aage
InstanceOf: DkCorePatient
Title: "Åge Test Berggren - far til Nancy"
Description: "Åge Test Berggren - Far til Nancy. Værge: Nancy"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0211223989"
* name.use = #official
* name.family = "Berggren"
* name.given[0] = "Åge"
* name.given[+] = "Test"
* gender = #male
* birthDate = "1922-11-02"
* address.line = "Testvænget 1"
* address.postalCode = "8000"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0751
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-82

Instance: Bruno
InstanceOf: DkCorePatient
Title: "Bruno Test Elmer - bror til Nancy"
Description: "Bruno Test Elmer - Bror til Nancy"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "2509479989"
* name.use = #official
* name.family = "Elmer"
* name.given[0] = "Bruno"
* name.given[+] = "Test"
* gender = #male
* birthDate = "1947-09-25"
* address.line = "Testdrømmehaven 48"
* address.postalCode = "3400"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0219
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-84

Instance: MaxBerggren
InstanceOf: DkCorePatient
Title: "Max Test Berggren - søn af Nancy"
Description: "Max Test Berggren - Søn af Nancy"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0107729995"
* name.use = #official
* name.family = "Berggren"
* name.given[0] = "Max"
* name.given[+] = "Test"
* gender = #male
* birthDate = "1972-07-01"
* address.line = "Testervej 18"
* address.postalCode = "6200"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0580
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-83

Instance: RuddiBerggren
InstanceOf: DkCorePatient
Title: "Ruddi Test Berggren - søn af Nancy"
Description: "Ruddi Test Berggren - Søn af Nancy"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "1502779995"
* name.use = #official
* name.family = "Berggren"
* name.given[0] = "Ruddi"
* name.given[+] = "Test"
* gender = #male
* birthDate = "1977-02-15"
* address.line = "Testjulianevej 3"
* address.postalCode = "8000"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0751
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-82

Instance: KirstenBerggren
InstanceOf: DkCorePatient
Title: "Kirsten Test Berggren - datter af Nancy"
Description: "Kirsten Test Berggren - Datter af Nancy. Datter Aya."
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "2911829996"
* name.use = #official
* name.family = "Berggren"
* name.given[0] = "Kirsten"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1982-11-29"
* address.line = "Testpark Allé 48"
* address.postalCode = "3400"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0219
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-84

Instance: BritaBerggren
InstanceOf: DkCorePatient
Title: "Brita Test Berggren - datter af Nancy"
Description: "Brita Test Berggren - Datter af Nancy. Værge: Nancy"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "1509819996"
* name.use = #official
* name.family = "Berggren"
* name.given[0] = "Brita"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1981-09-15"
* address.line = "Testpark Allé 48"
* address.postalCode = "3400"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0219
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-84

// Kirstens børn

Instance: PiaBerggren
InstanceOf: DkCorePatient
Title: "Pia Test Berggren - datter af Kirsten"
Description: "Pia Test Berggren - Datter af Kirsten Berggren"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0505059996"
* name.use = #official
* name.family = "Berggren"
* name.given[0] = "Pia"
* name.given[+] = "Test"
* gender = #female
* birthDate = "2005-05-05"
* address.line = "Testgaden 1"
* address.postalCode = "5230"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0461
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-83

Instance: GitteNancy
InstanceOf: DkCorePatient
Title: "Gitte Nancy Test Berggren - datter af Kirsten"
Description: "Gitte Nancy Test Berggren - Datter af Kirsten Berggren, Nancys yndlingsbarnebarn"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0505109990"
* name.use = #official
* name.family = "Berggren"
* name.given[0] = "Gitte"
* name.given[+] = "Nancy"
* name.given[+] = "Test"
* gender = #female
* birthDate = "2010-05-05"
* address.line = "Testpark Allé 48"
* address.postalCode = "3400"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0219
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-84

Instance: LarsBerggren
InstanceOf: DkCorePatient
Title: "Lars Test Berggren - søn af Kirsten"
Description: "Lars Test Berggren - Søn af Kirsten Berggren"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0505159995"
* name.use = #official
* name.family = "Berggren"
* name.given[0] = "Lars"
* name.given[+] = "Test"
* gender = #male
* birthDate = "2015-05-05"
* address.line = "Testpark Allé 48"
* address.postalCode = "3400"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0219
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-84

Instance: RikkeBerggren
InstanceOf: DkCorePatient
Title: "Rikke Test Berggren - datter af Kirsten"
Description: "Rikke Test Berggren - Datter af Kirsten Berggren, Ruddi er værge for Rikke"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0505209996"
* name.use = #official
* name.family = "Berggren"
* name.given[0] = "Rikke"
* name.given[+] = "Test"
* gender = #female
* birthDate = "2020-05-05"
* address.line = "Testjulianevej 3"
* address.postalCode = "8000"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0751
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-82

Instance: AyaBerggren
InstanceOf: DkCorePatient
Title: "Aya Test Berggren - datter af Kirsten"
Description: "Aya Test Berggren - Datter af Kirsten Berggren"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0505239996"
* name.use = #official
* name.family = "Berggren"
* name.given[0] = "Aya"
* name.given[+] = "Test"
* gender = #female
* birthDate = "2023-05-05"
* address.line = "Testpark Allé 48"
* address.postalCode = "3400"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0219
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-84

// RelatedPerson for Berggren family relationships

Instance: NancyGuardianOfAage
InstanceOf: DkCoreRelatedPerson
Title: "Nancy som værge for Åge"
Description: "Nancy er værge for Åge"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "2512489996"
* patient = Reference(Aage)
* relationship = $v3-RoleCode#GUARD
* name.use = #official
* name.family = "Berggren"
* name.given[0] = "Nancy"
* name.given[+] = "Ann"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1948-12-25"

Instance: AageRelatedToNancy
InstanceOf: DkCoreRelatedPerson
Title: "Åge som far til Nancy"
Description: "Åge er far til Nancy"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0211223989"
* patient = Reference(NancyAnn)
* relationship = $v3-RoleCode#FTH
* name.use = #official
* name.family = "Berggren"
* name.given[0] = "Åge"
* name.given[+] = "Test"
* gender = #male
* birthDate = "1922-11-02"

Instance: BrunoRelatedToNancy
InstanceOf: DkCoreRelatedPerson
Title: "Bruno som bror til Nancy"
Description: "Bruno er bror til Nancy"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "2509479989"
* patient = Reference(NancyAnn)
* relationship = $v3-RoleCode#SIB
* name.use = #official
* name.family = "Elmer"
* name.given[0] = "Bruno"
* name.given[+] = "Test"
* gender = #male
* birthDate = "1947-09-25"

Instance: NancyGuardianOfBrita
InstanceOf: DkCoreRelatedPerson
Title: "Nancy som værge for Brita"
Description: "Nancy er værge for Brita"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "2512489996"
* patient = Reference(BritaBerggren)
* relationship = $v3-RoleCode#GUARD
* name.use = #official
* name.family = "Berggren"
* name.given[0] = "Nancy"
* name.given[+] = "Ann"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1948-12-25"

Instance: NancyRelatedToMax
InstanceOf: DkCoreRelatedPerson
Title: "Nancy som mor til Max"
Description: "Nancy er mor til Max"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "2512489996"
* patient = Reference(MaxBerggren)
* relationship = $v3-RoleCode#MTH
* name.use = #official
* name.family = "Berggren"
* name.given[0] = "Nancy"
* name.given[+] = "Ann"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1948-12-25"

Instance: NancyRelatedToRuddi
InstanceOf: DkCoreRelatedPerson
Title: "Nancy som mor til Ruddi"
Description: "Nancy er mor til Ruddi"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "2512489996"
* patient = Reference(RuddiBerggren)
* relationship = $v3-RoleCode#MTH
* name.use = #official
* name.family = "Berggren"
* name.given[0] = "Nancy"
* name.given[+] = "Ann"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1948-12-25"

Instance: NancyRelatedToKirsten
InstanceOf: DkCoreRelatedPerson
Title: "Nancy som mor til Kirsten"
Description: "Nancy er mor til Kirsten"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "2512489996"
* patient = Reference(KirstenBerggren)
* relationship = $v3-RoleCode#MTH
* name.use = #official
* name.family = "Berggren"
* name.given[0] = "Nancy"
* name.given[+] = "Ann"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1948-12-25"

Instance: NancyRelatedToBrita
InstanceOf: DkCoreRelatedPerson
Title: "Nancy som mor til Brita"
Description: "Nancy er mor til Brita"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "2512489996"
* patient = Reference(BritaBerggren)
* relationship = $v3-RoleCode#MTH
* name.use = #official
* name.family = "Berggren"
* name.given[0] = "Nancy"
* name.given[+] = "Ann"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1948-12-25"

Instance: RuddiGuardianOfRikke
InstanceOf: DkCoreRelatedPerson
Title: "Ruddi som værge for Rikke"
Description: "Ruddi er værge for Rikke"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "1502779995"
* patient = Reference(RikkeBerggren)
* relationship = $v3-RoleCode#GUARD
* name.use = #official
* name.family = "Berggren"
* name.given[0] = "Ruddi"
* name.given[+] = "Test"
* gender = #male
* birthDate = "1977-02-15"

Instance: KirstenRelatedToPia
InstanceOf: DkCoreRelatedPerson
Title: "Kirsten som mor til Pia"
Description: "Kirsten er mor til Pia"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "2911829996"
* patient = Reference(PiaBerggren)
* relationship = $v3-RoleCode#MTH
* name.use = #official
* name.family = "Berggren"
* name.given[0] = "Kirsten"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1982-11-29"

Instance: KirstenRelatedToGitte
InstanceOf: DkCoreRelatedPerson
Title: "Kirsten som mor til Gitte"
Description: "Kirsten er mor til Gitte Nancy"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "2911829996"
* patient = Reference(GitteNancy)
* relationship = $v3-RoleCode#MTH
* name.use = #official
* name.family = "Berggren"
* name.given[0] = "Kirsten"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1982-11-29"

Instance: KirstenRelatedToLars
InstanceOf: DkCoreRelatedPerson
Title: "Kirsten som mor til Lars"
Description: "Kirsten er mor til Lars"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "2911829996"
* patient = Reference(LarsBerggren)
* relationship = $v3-RoleCode#MTH
* name.use = #official
* name.family = "Berggren"
* name.given[0] = "Kirsten"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1982-11-29"

Instance: KirstenRelatedToRikke
InstanceOf: DkCoreRelatedPerson
Title: "Kirsten som mor til Rikke"
Description: "Kirsten er mor til Rikke"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "2911829996"
* patient = Reference(RikkeBerggren)
* relationship = $v3-RoleCode#MTH
* name.use = #official
* name.family = "Berggren"
* name.given[0] = "Kirsten"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1982-11-29"

Instance: KirstenRelatedToAya
InstanceOf: DkCoreRelatedPerson
Title: "Kirsten som mor til Aya"
Description: "Kirsten er mor til Aya"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "2911829996"
* patient = Reference(AyaBerggren)
* relationship = $v3-RoleCode#MTH
* name.use = #official
* name.family = "Berggren"
* name.given[0] = "Kirsten"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1982-11-29"

Instance: NancyRelatedToGitte
InstanceOf: DkCoreRelatedPerson
Title: "Nancy som bedstemor til Gitte"
Description: "Nancy er bedstemor til Gitte (Nancys yndlingsbarnebarn)"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "2512489996"
* patient = Reference(GitteNancy)
* relationship = $v3-RoleCode#GRPRN
* name.use = #official
* name.family = "Berggren"
* name.given[0] = "Nancy"
* name.given[+] = "Ann"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1948-12-25"

// =============================================================================
// FAMILIE 4: Jensen familien
// Anders (far) og Ali (søn)
// =============================================================================

Instance: AndersJensen
InstanceOf: DkCorePatient
Title: "Anders Test Jensen - far til Ali"
Description: "Anders Test Jensen - Far til Ali Jensen"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "3103979995"
* name.use = #official
* name.family = "Jensen"
* name.given[0] = "Anders"
* name.given[+] = "Test"
* gender = #male
* birthDate = "1997-03-31"
* address.line = "Testtorvet 7"
* address.postalCode = "4700"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0370
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-85

Instance: AliJensen
InstanceOf: DkCorePatient
Title: "Ali Test Jensen - søn af Anders"
Description: "Ali Test Jensen - Søn af Anders Jensen"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "3101229995"
* name.use = #official
* name.family = "Jensen"
* name.given[0] = "Ali"
* name.given[+] = "Test"
* gender = #male
* birthDate = "2022-01-31"
* address.line = "Testtorvet 7"
* address.postalCode = "4700"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0370
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-85

Instance: AndersRelatedToAli
InstanceOf: DkCoreRelatedPerson
Title: "Anders som far til Ali"
Description: "Anders er far til Ali"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "3103979995"
* patient = Reference(AliJensen)
* relationship = $v3-RoleCode#FTH
* name.use = #official
* name.family = "Jensen"
* name.given[0] = "Anders"
* name.given[+] = "Test"
* gender = #male
* birthDate = "1997-03-31"

// =============================================================================
// TVILLINGER: Levendefødte tvillinger uden adresse
// =============================================================================

Instance: DrengLevendefodt2016
InstanceOf: DkCorePatient
Title: "Dreng Test Levendefødt (2016) - tvilling"
Description: "Dreng Test Levendefødt født 2016 - Tvilling"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "1310169995"
* name.use = #official
* name.family = "Levendefødt"
* name.given[0] = "Dreng"
* name.given[+] = "Test"
* gender = #male
* birthDate = "2016-10-13"
* multipleBirthBoolean = true
* link[0].other = Reference(PigeLevendefodt2016)
* link[=].type = #seealso

Instance: PigeLevendefodt2016
InstanceOf: DkCorePatient
Title: "Pige Test Levendefødt (2016) - tvilling"
Description: "Pige Test Levendefødt født 2016 - Tvilling"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "1310169996"
* name.use = #official
* name.family = "Levendefødt"
* name.given[0] = "Pige"
* name.given[+] = "Test"
* gender = #female
* birthDate = "2016-10-13"
* multipleBirthBoolean = true
* link[0].other = Reference(DrengLevendefodt2016)
* link[=].type = #seealso

Instance: DrengLevendefodt2024
InstanceOf: DkCorePatient
Title: "Dreng Test Levendefødt (2024) - tvilling"
Description: "Dreng Test Levendefødt født 2024 - Tvilling"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "1306249995"
* name.use = #official
* name.family = "Levendefødt"
* name.given[0] = "Dreng"
* name.given[+] = "Test"
* gender = #male
* birthDate = "2024-06-13"
* multipleBirthBoolean = true
* link[0].other = Reference(PigeLevendefodt2024)
* link[=].type = #seealso

Instance: PigeLevendefodt2024
InstanceOf: DkCorePatient
Title: "Pige Test Levendefødt (2024) - tvilling"
Description: "Pige Test Levendefødt født 2024 - Tvilling"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "1306249996"
* name.use = #official
* name.family = "Levendefødt"
* name.given[0] = "Pige"
* name.given[+] = "Test"
* gender = #female
* birthDate = "2024-06-13"
* multipleBirthBoolean = true
* link[0].other = Reference(DrengLevendefodt2024)
* link[=].type = #seealso

// =============================================================================
// ANDRE TESTPATIENTER: Uden familierelationer
// =============================================================================

Instance: BoVestergaard
InstanceOf: DkCorePatient
Title: "Bo Test Vestergaard"
Description: "Bo Test Vestergaard - testpatient"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0212159995"
* name.use = #official
* name.family = "Vestergaard"
* name.given[0] = "Bo"
* name.given[+] = "Test"
* gender = #male
* birthDate = "2015-12-02"
* address.line = "Testvejen 251"
* address.postalCode = "9970"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0813
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-81

Instance: MuhammedAbdul
InstanceOf: DkCorePatient
Title: "Muhammed Test Abdul"
Description: "Muhammed Test Abdul - testpatient"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "1007059995"
* name.use = #official
* name.family = "Abdul"
* name.given[0] = "Muhammed"
* name.given[+] = "Test"
* gender = #male
* birthDate = "2005-07-10"
* address.line = "TestHøjen 5"
* address.postalCode = "5900"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0482
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-83

Instance: JulianeJoergensen
InstanceOf: DkCorePatient
Title: "Juliane Test Jørgensen"
Description: "Juliane Test Jørgensen - testpatient"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "1110109996"
* name.use = #official
* name.family = "Jørgensen"
* name.given[0] = "Juliane"
* name.given[+] = "Test"
* gender = #female
* birthDate = "2010-10-11"
* address.line = "TestVardevej 350"
* address.postalCode = "6800"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0573
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-83

Instance: NielsVendelboe
InstanceOf: DkCorePatient
Title: "Niels Test Vendelboe"
Description: "Niels Test Vendelboe - testpatient"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "3001749995"
* name.use = #official
* name.family = "Vendelboe"
* name.given[0] = "Niels"
* name.given[+] = "Test"
* gender = #male
* birthDate = "1974-01-30"
* address.line = "Testkajen 2"
* address.postalCode = "9210"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0851
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-81

Instance: KajaHansen
InstanceOf: DkCorePatient
Title: "Kaja Test Hansen"
Description: "Kaja Test Hansen - testpatient"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "2103009996"
* name.use = #official
* name.family = "Hansen"
* name.given[0] = "Kaja"
* name.given[+] = "Test"
* gender = #female
* birthDate = "2000-03-21"
* address.line = "Testsøjlerne 4"
* address.postalCode = "6200"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0580
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-83

Instance: CaesarOestergaard
InstanceOf: DkCorePatient
Title: "Cæsar Test Østergård - markeret som afdød"
Description: "Cæsar Test Østergård - Markeret som 'Afdød' på nspop DTG service"
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "2311143995"
* name.use = #official
* name.family = "Østergård"
* name.given[0] = "Cæsar"
* name.given[+] = "Test"
* gender = #male
* birthDate = "1914-11-23"
* deceasedBoolean = true
* address.line = "Testhjemmet 1"
* address.postalCode = "5230"
* address.extension[municipalityCode].valueCodeableConcept = $dk-core-municipality-codes#0461
* address.extension[regionalSubDivisionCodes].valueCodeableConcept = $dk-core-regional-subdivision-codes#DK-83

// =============================================================================
// FAMILIEGRUPPER - Group resources til at samle familiemedlemmer
// =============================================================================

Instance: LauridsenFamily
InstanceOf: Group
Title: "Lauridsen familien"
Description: "Familiegruppe: Einer og Lonni Lauridsen med deres børn - tvillingerne Magnus & Rasmus og trillingerne Else, Ellen & EK"
Usage: #example
* type = #person
* actual = true
* name = "Lauridsen familien"
* quantity = 7
* member[0].entity = Reference(Einer)
* member[=].entity.display = "Einer Test Lauridsen (far)"
* member[+].entity = Reference(Lonni)
* member[=].entity.display = "Lonni Test Lauridsen (mor)"
* member[+].entity = Reference(Magnus)
* member[=].entity.display = "Magnus Test Lauridsen (søn, tvilling)"
* member[+].entity = Reference(Rasmus)
* member[=].entity.display = "Rasmus Test Lauridsen (søn, tvilling)"
* member[+].entity = Reference(ElseLauridsen)
* member[=].entity.display = "Else Test Lauridsen (datter, trilling)"
* member[+].entity = Reference(EllenLouise)
* member[=].entity.display = "Ellen Louise Test Lauridsen (datter, trilling)"
* member[+].entity = Reference(EK)
* member[=].entity.display = "EK Test Lauridsen (søn, trilling)"

Instance: MosebryggerssenFamily
InstanceOf: Group
Title: "Mosebryggersen familien"
Description: "Familiegruppe: Schwendlund og May June med deres børn - Odd, Knut, Sille og tvillingerne Sverre & Torre"
Usage: #example
* type = #person
* actual = true
* name = "Mosebryggersen familien"
* quantity = 7
* member[0].entity = Reference(Schwendlund)
* member[=].entity.display = "Schwendlund Test Mosebryggersen (far)"
* member[+].entity = Reference(MayJune)
* member[=].entity.display = "May June Test Moberg (mor)"
* member[+].entity = Reference(OddHaugen)
* member[=].entity.display = "Odd Haugen Test Mosebryggersen (søn)"
* member[+].entity = Reference(KnutOdvar)
* member[=].entity.display = "Knut Odvar Test Mosebryggersen (søn)"
* member[+].entity = Reference(SilleJune)
* member[=].entity.display = "Sille June Test Mosebrygersen (datter)"
* member[+].entity = Reference(Sverre)
* member[=].entity.display = "Sverre Test Mosebryggersen (søn, tvilling)"
* member[+].entity = Reference(Torre)
* member[=].entity.display = "Torre Test Mosebryggersen (søn, tvilling)"

Instance: BerggrenFamily
InstanceOf: Group
Title: "Berggren familien"
Description: "Familiegruppe: Nancy Ann Berggren med far Åge, bror Bruno, børn Max, Ruddi, Kirsten, Brita og børnebørn Pia, Gitte, Lars, Rikke, Aya"
Usage: #example
* type = #person
* actual = true
* name = "Berggren familien"
* quantity = 12
* member[0].entity = Reference(Aage)
* member[=].entity.display = "Åge Test Berggren (bedstefar/oldefar)"
* member[+].entity = Reference(NancyAnn)
* member[=].entity.display = "Nancy Ann Test Berggren (bedstemor)"
* member[+].entity = Reference(Bruno)
* member[=].entity.display = "Bruno Test Elmer (Nancys bror)"
* member[+].entity = Reference(MaxBerggren)
* member[=].entity.display = "Max Test Berggren (Nancys søn)"
* member[+].entity = Reference(RuddiBerggren)
* member[=].entity.display = "Ruddi Test Berggren (Nancys søn)"
* member[+].entity = Reference(KirstenBerggren)
* member[=].entity.display = "Kirsten Test Berggren (Nancys datter)"
* member[+].entity = Reference(BritaBerggren)
* member[=].entity.display = "Brita Test Berggren (Nancys datter)"
* member[+].entity = Reference(PiaBerggren)
* member[=].entity.display = "Pia Test Berggren (Kirstens datter)"
* member[+].entity = Reference(GitteNancy)
* member[=].entity.display = "Gitte Nancy Test Berggren (Kirstens datter)"
* member[+].entity = Reference(LarsBerggren)
* member[=].entity.display = "Lars Test Berggren (Kirstens søn)"
* member[+].entity = Reference(RikkeBerggren)
* member[=].entity.display = "Rikke Test Berggren (Kirstens datter)"
* member[+].entity = Reference(AyaBerggren)
* member[=].entity.display = "Aya Test Berggren (Kirstens datter)"

Instance: JensenFamily
InstanceOf: Group
Title: "Jensen familien"
Description: "Familiegruppe: Anders Jensen og hans søn Ali"
Usage: #example
* type = #person
* actual = true
* name = "Jensen familien"
* quantity = 2
* member[0].entity = Reference(AndersJensen)
* member[=].entity.display = "Anders Test Jensen (far)"
* member[+].entity = Reference(AliJensen)
* member[=].entity.display = "Ali Test Jensen (søn)"

Instance: LevendefodtTwins2016
InstanceOf: Group
Title: "Levendefødt tvillinger 2016"
Description: "Familiegruppe: Tvillinger født 2016"
Usage: #example
* type = #person
* actual = true
* name = "Levendefødt tvillinger 2016"
* quantity = 2
* member[0].entity = Reference(DrengLevendefodt2016)
* member[=].entity.display = "Dreng Test Levendefødt (tvilling)"
* member[+].entity = Reference(PigeLevendefodt2016)
* member[=].entity.display = "Pige Test Levendefødt (tvilling)"

Instance: LevendefodtTwins2024
InstanceOf: Group
Title: "Levendefødt tvillinger 2024"
Description: "Familiegruppe: Tvillinger født 2024"
Usage: #example
* type = #person
* actual = true
* name = "Levendefødt tvillinger 2024"
* quantity = 2
* member[0].entity = Reference(DrengLevendefodt2024)
* member[=].entity.display = "Dreng Test Levendefødt (tvilling)"
* member[+].entity = Reference(PigeLevendefodt2024)
* member[=].entity.display = "Pige Test Levendefødt (tvilling)"

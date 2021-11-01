Instance: cpr
InstanceOf: NamingSystem
Description: "The Danish civil registration system (\"CPR\") encompasses basic personal data about anyone with a civil registration number. A civil registration number shall be allocated to anyone who: 1) is registered in the national register in Denmark on the grounds of birth or relocation from abroad; 2) is included under Arbejdsmarkedets TillægsPension (ATP); 3) according to the tax authorities, is required to have a civil registration number for the purpose of tax processing in Denmark."
Usage: #definition
* name = "DkCoreDanishCivilRegistrationSystem"
* status = #active
* kind = #identifier
* date = "1968-04-02"
* publisher = "HL7 Denmark"
* contact[0].name = "HL7 Denmark"
* contact[0].telecom[0].system = #url
* contact[0].telecom[0].value = "https://www.hl7.dk/"
* responsible = "CPR-kontoret, Økonomi- og Indenrigsministeriets departement"
//* type = $v2-0203#NNDNK "National Person Identifier where the xxx is the ISO table 3166 3-character (alphabetic) country code"
* description = "The Danish civil registration system (\"CPR\") encompasses basic personal data about anyone with a civil registration number. A civil registration number shall be allocated to anyone who: 1) is registered in the national register in Denmark on the grounds of birth or relocation from abroad; 2) is included under Arbejdsmarkedets TillægsPension (ATP); 3) according to the tax authorities, is required to have a civil registration number for the purpose of tax processing in Denmark."
* jurisdiction[0] = urn:iso:std:iso:3166#DK
* uniqueId[0].type = #oid
* uniqueId[0].value = "1.2.208.176.1.2"
* uniqueId[1].type = #uri
* uniqueId[1].value = "http://www.cpr.dk/cpr-systemet"
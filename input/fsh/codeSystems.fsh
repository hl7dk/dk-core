CodeSystem: DkCoreProfessionGroupCodes
Id: DkCoreProfessionGroupCodes
Title: "DK Profession Group Codes"
Description: "DK health ProfessionGroup codes as defined by https://www.retsinformation.dk/eli/lta/2019/731, and derived from http://autregwebservice.sst.dk/autregservice.asmx/GetAllProfessionGroups. Code (5176) was not uniqe, and have been converted to 5176a and 5176b"
* ^experimental = false
* ^status = #active
* ^content = #complete
* ^caseSensitive = false
* ^count = 21
* #C511 "Ambulancebehandler"
* #9495 "Bandagist"
* #B511 "Behandlerfarmaceut"
* #5159 "Bioanalytiker"
* #5153 "Ergoterapeut"
* #5155 "Fodterapeut"
* #5151 "Fysioterapeut"
* #5175 "Jordemoder"
* #5265 "Kiropraktor"
* #5451 "Klinisk diætist"
* #5432 "Klinisk tandtekniker"
* #5176a "Kontaktlinseoptiker"
* #7170 "Læge"
* #4498 "Optiker"
* #5176b "Optometrist"
* #A511 "Osteopat"
* #5158 "Radiograf"
* #5152 "Social- og sundhedsassistent"
* #5166 "Sygeplejerske"
* #5433 "Tandlæge"
* #5431 "Tandplejer"

CodeSystem: AdministrativeGenderDkSupplement
Id: administrative-gender-supplement
Title: "DK Administrative Gender Supplement"
Description: "CodeSystem supplement with danish translations for administrative gender"
* ^experimental = false
* ^content = #supplement
* ^supplements = "http://hl7.org/fhir/administrative-gender"
* #male
  * ^designation.language = #da
  * ^designation.value = "Mand"
* #female
  * ^designation.language = #da
  * ^designation.value = "Kvinde"
* #other
  * ^designation.language = #da
  * ^designation.value = "Andet"
* #unknown
  * ^designation.language = #da
  * ^designation.value = "Ukendt"

CodeSystem: GreenlandMunicipalityCodes
Id: dk-core-municipality-codes-greenland
Title: "DK Greenland Municipality Codes"
Description: "Greenland municipality codes as defined by https://www.iso.org/obp/ui/#iso:code:3166:GL and https://cpr.dk/cpr-systemet/kommunesammenlaegninger-opdeling/groenland-2018/"
* ^experimental = false
* ^status = #active
* ^caseSensitive = true
* ^content = #complete
* #0955 "Kujalleq"
  * ^designation.language = #da
  * ^designation.value = "Kujalleq"
* #0956 "Sermersooq"
  * ^designation.language = #da
  * ^designation.value = "Sermersooq"
* #0957 "Qeqqata"
  * ^designation.language = #da
  * ^designation.value = "Qeqqata"
* #0959 "Qeqertalik"
  * ^designation.language = #da
  * ^designation.value = "Qeqertalik"
* #0960 "Avannaata"
  * ^designation.language = #da
  * ^designation.value = "Avannaata"

CodeSystem: MunicipalityCodes
Id: dk-core-municipality-codes
Title: "DK Municipality Codes"
Description: "Municipality codes as defined by https://danmarksadresser.dk/adressedata/kodelister/kommunekodeliste/ and https://sundhedsdatastyrelsen.dk/-/media/sds/filer/rammer-og-retningslinjer/patientregistrering/relaterede/kommuneklassifikation.pdf"
* ^experimental = false
* ^status = #active
* ^caseSensitive = true
* ^content = #complete
* #0740 "Silkeborg"
  * ^designation.language = #da
  * ^designation.value = "Silkeborg"
* #0741 "Samsø"
  * ^designation.language = #da
  * ^designation.value = "Samsø"
* #0851 "Aalborg"
  * ^designation.language = #da
  * ^designation.value = "Aalborg"
* #0746 "Skanderborg"
  * ^designation.language = #da
  * ^designation.value = "Skanderborg"
* #0151 "Ballerup"
  * ^designation.language = #da
  * ^designation.value = "Ballerup"
* #0260 "Halsnæs"
  * ^designation.language = #da
  * ^designation.value = "Halsnæs"
* #0153 "Brøndby"
  * ^designation.language = #da
  * ^designation.value = "Brøndby"
* #0370 "Næstved"
  * ^designation.language = #da
  * ^designation.value = "Næstved"
* #0155 "Dragør"
  * ^designation.language = #da
  * ^designation.value = "Dragør"
* #0480 "Nordfyns"
  * ^designation.language = #da
  * ^designation.value = "Nordfyns"
* #0157 "Gentofte"
  * ^designation.language = #da
  * ^designation.value = "Gentofte"
* #0265 "Roskilde"
  * ^designation.language = #da
  * ^designation.value = "Roskilde"
* #0159 "Gladsaxe"
  * ^designation.language = #da
  * ^designation.value = "Gladsaxe"
* #0376 "Guldborgsund"
  * ^designation.language = #da
  * ^designation.value = "Guldborgsund"
* #0269 "Solrød"
  * ^designation.language = #da
  * ^designation.value = "Solrød"
* #0482 "Langeland"
  * ^designation.language = #da
  * ^designation.value = "Langeland"
* #0201 "Allerød"
  * ^designation.language = #da
  * ^designation.value = "Allerød"
* #0420 "Assens"
  * ^designation.language = #da
  * ^designation.value = "Assens"
* #0530 "Billund"
  * ^designation.language = #da
  * ^designation.value = "Billund"
* #0316 "Holbæk"
  * ^designation.language = #da
  * ^designation.value = "Holbæk"
* #0751 "Aarhus"
  * ^designation.language = #da
  * ^designation.value = "Aarhus"
* #0860 "Hjørring"
  * ^designation.language = #da
  * ^designation.value = "Hjørring"
* #0756 "Ikast-Brande"
  * ^designation.language = #da
  * ^designation.value = "Ikast-Brande"
* #0161 "Glostrup"
  * ^designation.language = #da
  * ^designation.value = "Glostrup"
* #0270 "Gribskov"
  * ^designation.language = #da
  * ^designation.value = "Gribskov"
* #0163 "Herlev"
  * ^designation.language = #da
  * ^designation.value = "Herlev"
* #0165 "Albertslund"
  * ^designation.language = #da
  * ^designation.value = "Albertslund"
* #0167 "Hvidovre"
  * ^designation.language = #da
  * ^designation.value = "Hvidovre"
* #0492 "Ærø"
  * ^designation.language = #da
  * ^designation.value = "Ærø"
* #0169 "Høje-Taastrup"
  * ^designation.language = #da
  * ^designation.value = "Høje-Taastrup"
* #0101 "København"
  * ^designation.language = #da
  * ^designation.value = "København"
* #0210 "Fredensborg"
  * ^designation.language = #da
  * ^designation.value = "Fredensborg"
* #0320 "Faxe"
  * ^designation.language = #da
  * ^designation.value = "Faxe"
* #0430 "Faaborg-Midtfyn"
  * ^designation.language = #da
  * ^designation.value = "Faaborg-Midtfyn"
* #0540 "Sønderborg"
  * ^designation.language = #da
  * ^designation.value = "Sønderborg"
* #0217 "Helsingør"
  * ^designation.language = #da
  * ^designation.value = "Helsingør"
* #0326 "Kalundborg"
  * ^designation.language = #da
  * ^designation.value = "Kalundborg"
* #0219 "Hillerød"
  * ^designation.language = #da
  * ^designation.value = "Hillerød"
* #0760 "Ringkøbing-Skjern"
  * ^designation.language = #da
  * ^designation.value = "Ringkøbing-Skjern"
* #0329 "Ringsted"
  * ^designation.language = #da
  * ^designation.value = "Ringsted"
* #0657 "Herning"
  * ^designation.language = #da
  * ^designation.value = "Herning"
* #0766 "Hedensted"
  * ^designation.language = #da
  * ^designation.value = "Hedensted"
* #0173 "Lyngby-Taarbæk"
  * ^designation.language = #da
  * ^designation.value = "Lyngby-Taarbæk"
* #0390 "Vordingborg"
  * ^designation.language = #da
  * ^designation.value = "Vordingborg"
* #0175 "Rødovre"
  * ^designation.language = #da
  * ^designation.value = "Rødovre"
* #0810 "Brønderslev"
  * ^designation.language = #da
  * ^designation.value = "Brønderslev"
* #0813 "Frederikshavn"
  * ^designation.language = #da
  * ^designation.value = "Frederikshavn"
* #0706 "Syddjurs"
  * ^designation.language = #da
  * ^designation.value = "Syddjurs"
* #0707 "Norddjurs"
  * ^designation.language = #da
  * ^designation.value = "Norddjurs"
* #0330 "Slagelse"
  * ^designation.language = #da
  * ^designation.value = "Slagelse"
* #0223 "Hørsholm"
  * ^designation.language = #da
  * ^designation.value = "Hørsholm"
* #0440 "Kerteminde"
  * ^designation.language = #da
  * ^designation.value = "Kerteminde"
* #0550 "Tønder"
  * ^designation.language = #da
  * ^designation.value = "Tønder"
* #0336 "Stevns"
  * ^designation.language = #da
  * ^designation.value = "Stevns"
* #0661 "Holstebro"
  * ^designation.language = #da
  * ^designation.value = "Holstebro"
* #0665 "Lemvig"
  * ^designation.language = #da
  * ^designation.value = "Lemvig"
* #0773 "Morsø"
  * ^designation.language = #da
  * ^designation.value = "Morsø"
* #0779 "Skive"
  * ^designation.language = #da
  * ^designation.value = "Skive"
* #0183 "Ishøj"
  * ^designation.language = #da
  * ^designation.value = "Ishøj"
* #0185 "Tårnby"
  * ^designation.language = #da
  * ^designation.value = "Tårnby"
* #0710 "Favrskov"
  * ^designation.language = #da
  * ^designation.value = "Favrskov"
* #0187 "Vallensbæk"
  * ^designation.language = #da
  * ^designation.value = "Vallensbæk"
* #0820 "Vesthimmerland"
  * ^designation.language = #da
  * ^designation.value = "Vesthimmerland"
* #0607 "Fredericia"
  * ^designation.language = #da
  * ^designation.value = "Fredericia"
* #0825 "Læsø"
  * ^designation.language = #da
  * ^designation.value = "Læsø"
* #0230 "Rudersdal"
  * ^designation.language = #da
  * ^designation.value = "Rudersdal"
* #0340 "Sorø"
  * ^designation.language = #da
  * ^designation.value = "Sorø"
* #0450 "Nyborg"
  * ^designation.language = #da
  * ^designation.value = "Nyborg"
* #0561 "Esbjerg"
  * ^designation.language = #da
  * ^designation.value = "Esbjerg"
* #0563 "Fanø"
  * ^designation.language = #da
  * ^designation.value = "Fanø"
* #0671 "Struer"
  * ^designation.language = #da
  * ^designation.value = "Struer"
* #0190 "Furesø"
  * ^designation.language = #da
  * ^designation.value = "Furesø"
* #0787 "Thisted"
  * ^designation.language = #da
  * ^designation.value = "Thisted"
* #0615 "Horsens"
  * ^designation.language = #da
  * ^designation.value = "Horsens"
* #0727 "Odder"
  * ^designation.language = #da
  * ^designation.value = "Odder"
* #0240 "Egedal"
  * ^designation.language = #da
  * ^designation.value = "Egedal"
* #0350 "Lejre"
  * ^designation.language = #da
  * ^designation.value = "Lejre"
* #0461 "Odense"
  * ^designation.language = #da
  * ^designation.value = "Odense"
* #0573 "Varde"
  * ^designation.language = #da
  * ^designation.value = "Varde"
* #0575 "Vejen"
  * ^designation.language = #da
  * ^designation.value = "Vejen"
* #0791 "Viborg"
  * ^designation.language = #da
  * ^designation.value = "Viborg"
* #0400 "Bornholm"
  * ^designation.language = #da
  * ^designation.value = "Bornholm"
* #0510 "Haderslev"
  * ^designation.language = #da
  * ^designation.value = "Haderslev"
* #0621 "Kolding"
  * ^designation.language = #da
  * ^designation.value = "Kolding"
* #0730 "Randers"
  * ^designation.language = #da
  * ^designation.value = "Randers"
* #0840 "Rebild"
  * ^designation.language = #da
  * ^designation.value = "Rebild"
* #0846 "Mariagerfjord"
  * ^designation.language = #da
  * ^designation.value = "Mariagerfjord"
* #0250 "Frederikssund"
  * ^designation.language = #da
  * ^designation.value = "Frederikssund"
* #0360 "Lolland"
  * ^designation.language = #da
  * ^designation.value = "Lolland"
* #0253 "Greve"
  * ^designation.language = #da
  * ^designation.value = "Greve"
* #0849 "Jammerbugt"
  * ^designation.language = #da
  * ^designation.value = "Jammerbugt"
* #0147 "Frederiksberg"
  * ^designation.language = #da
  * ^designation.value = "Frederiksberg"
* #0580 "Aabenraa"
  * ^designation.language = #da
  * ^designation.value = "Aabenraa"
* #0259 "Køge"
  * ^designation.language = #da
  * ^designation.value = "Køge"
* #0479 "Svendborg"
  * ^designation.language = #da
  * ^designation.value = "Svendborg"
* #0410 "Middelfart"
  * ^designation.language = #da
  * ^designation.value = "Middelfart"
* #0411 "Christiansø"
  * ^designation.language = #da
  * ^designation.value = "Christiansø"
* #0306 "Odsherred"
  * ^designation.language = #da
  * ^designation.value = "Odsherred"
* #0630 "Vejle"
  * ^designation.language = #da
  * ^designation.value = "Vejle"

CodeSystem: DKCoreRegionalSubdivisionCodes
Title: "DK Regional Subdivision Codes"
Id: dk-core-regional-subdivision-codes
Description: "Subdivision codes (Regional codes) used in Denmark as found on https://www.iso.org/obp/ui/#iso:code:3166:DK"
* ^experimental = false
* ^caseSensitive = false
* ^content = #complete
* #DK-84 "Capital Region of Denmark"
  * ^designation.language = #da
  * ^designation.value = "Hovedstaden"
* #DK-82 "Central Denmark Region"
  * ^designation.language = #da
  * ^designation.value = "Midtjylland"
* #DK-81 "Nord Denmark Region"
  * ^designation.language = #da
  * ^designation.value = "Nordjylland"
* #DK-85 "Region Zealand"
  * ^designation.language = #da
  * ^designation.value = "Sjælland"
* #DK-83 "Region of Southern Denmark"
  * ^designation.language = #da
  * ^designation.value = "Syddanmark"

CodeSystem: DK_Marital_Status_Codes
Id: dk-marital-status
Title: "DK Marital Statuses"
Description: "DK marital statuses"
* ^experimental = false
* ^url = "http://hl7.dk/fhir/core/CodeSystem/dk-marital-status"
* ^name = "DkMaritalStatus"
* ^caseSensitive = false
* ^status = #active
* ^content = #complete
* #P "Registered partnership"
  * ^designation.language = #da
  * ^designation.value = "Registreret partnerskab"
* #O "Dissolved partnership"
  * ^designation.language = #da
  * ^designation.value = "Ophævet partnerskab"

CodeSystem: AddressType
Id: address-type-dk-supplement
Title: "DK Address Type"
Description: "The type of an address (physical / postal)"
* ^experimental = false
* ^content = #supplement
* ^supplements = "http://hl7.org/fhir/address-type"
* #postal
  * ^designation.language = #da
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Post"
* #physical
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Fysisk"
* #both
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Post & fysisk"

CodeSystem: AddressUse
Id: address-use-dk-supplement
Title: "DK Address Use"
Description: "The use of an address"
* ^experimental = false
* ^content = #supplement
* ^supplements = "http://hl7.org/fhir/address-use"
* #home
  * ^designation.language = #da
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Hjem"
* #work
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Arbejde"
* #temp
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Midlertidig"
* #old
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Gammel / forkert"

CodeSystem: CareTeamStatus
Title: "DK CareTeam Status"
Id: care-team-status-dk-supplement
Description: "Indicates the status of the care team."
* ^experimental = false
* ^content = #supplement
* ^supplements = "http://hl7.org/fhir/care-team-status"
* #proposed
  * ^designation.language = #da
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Forslag"
* #active
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Aktiv"
* #suspended
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Suspenderet"
* #inactive
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Inaktiv"
* #entered-in-error
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Fejlindtastning"

CodeSystem: ConsentState
Title: "DK Consent State"
Id: consent-state-codes-dk-supplement
Description: "Indicates the state of the consent"
* ^experimental = false
* ^content = #supplement
* ^supplements = "http://hl7.org/fhir/consent-state-codes"
* #draft
  * ^designation.language = #da
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Under udarbejdelse"
* #proposed
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Forslag"
* #active
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Aktiv"
* #rejected
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Afvist"
* #inactive
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Inaktiv"
* #entered-in-error
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Fejlindtastning"

CodeSystem: DaysOfWeek
Title: "DK Days Of Week"
Id: days-of-week-dk-supplement
Description: "The days of the week."
* ^experimental = false
* ^content = #supplement
* ^supplements = "http://hl7.org/fhir/days-of-week"
* #mon
  * ^designation.language = #da
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Mandag"
* #tue
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Tirsdag"
* #wed
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Onsdag"
* #thu
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Torsdag"
* #fri
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Fredag"
* #sat
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Lørdag"
* #sun
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Søndag"

CodeSystem: EpisodeOfCareStatus
Title: "DK Episode Of Care Status"
Id: episode-of-care-status-dk-supplement
Description: "The status of the episode of care."
* ^experimental = false
* ^publisher = "HL7 DK"
* ^content = #supplement
* ^supplements = "http://hl7.org/fhir/episode-of-care-status"
* #planned
  * ^designation.language = #da
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Planlagt"
* #waitlist
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Venteliste"
* #active
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Aktiv"
* #onhold
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Pauseret"
* #finished
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Færdig"
* #cancelled
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Annulleret"
* #entered-in-error
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Fejlindtastning"

CodeSystem: PublicationStatus
Id: publication-status-dk-supplement
Description: "The lifecycle status of a Value Set or Concept Map."
Title: "DK Publication Status"
* ^experimental = false
* ^content = #supplement
* ^supplements = "http://hl7.org/fhir/publication-status"
* #draft
  * ^designation[0].language = #ru
  * ^designation[=].value = "черновик"
  * ^designation[+].language = #nl
  * ^designation[=].value = "ontwerp"
  * ^designation[+].language = #da
  * ^designation[=].use = $sct#900000000000013009
  * ^designation[=].value = "Udkast"
* #active
  * ^designation[0].language = #ru
  * ^designation[=].value = "активный"
  * ^designation[+].language = #nl
  * ^designation[=].value = "actief"
  * ^designation[+].language = #da
  * ^designation[=].use.system = "http://snomed.info/sct"
  * ^designation[=].use = $sct#900000000000013009
  * ^designation[=].value = "Aktiv"
* #retired
  * ^designation[0].language = #ru
  * ^designation[=].value = "удалён"
  * ^designation[+].language = #nl
  * ^designation[=].value = "verouderd"
  * ^designation[+].language = #da
  * ^designation[=].use.system = "http://snomed.info/sct"
  * ^designation[=].use = $sct#900000000000013009
  * ^designation[=].value = "Udgået"
* #unknown
  * ^designation[0].language = #da
  * ^designation[=].use = $sct#900000000000013009
  * ^designation[=].value = "Ukendt"

CodeSystem: RequestStatus
Id: request-status-dk-supplement
Description: "Codes identifying the stage lifecycle stage of a request"
Title: "DK Request Status"
* ^experimental = false
* ^content = #supplement
* ^supplements = "http://hl7.org/fhir/request-status"
* #draft
  * ^designation.language = #da
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Udkast"
* #active
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Aktiv"
* #on-hold
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Suspenderet"
* #revoked
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Annulleret"
* #completed
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Afsluttet"
* #entered-in-error
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Fejlindtastning"
* #unknown
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Ukendt"


CodeSystem: DkCoreDeCPRCodes
Id: dk-core-d-ecpr-codes
Title: "DK Decentralised eCPR Systems"
Description: "DK "
* ^experimental = false
* ^status = #active
* ^content = #complete
* ^caseSensitive = false
* #urn:oid:1.2.208.176.1.6.1.3 "D-eCPR"
* #urn:oid:1.2.208.176.1.6.1.3.177 "D-eCPR fra Region Sjælland"
* #urn:oid:1.2.208.176.1.6.1.3.179 "D-eCPR fra Region Nordjylland"
* #urn:oid:1.2.208.176.1.6.1.3.181 "D-eCPR fra Region Midtjylland"
* #urn:oid:1.2.208.176.1.6.1.3.183 "D-eCPR fra Region Syddanmark"
* #urn:oid:1.2.208.176.1.6.1.3.187 "D-eCPR fra Region Hovedstaden"

CodeSystem: RoleCodeDkSupplement
Id: role-code-dk-supplement
Description: "CodeSystem supplement with danish translations for RoleCode"
Title: "DK Role Code"
* ^experimental = false
* ^content = #supplement
* ^supplements = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
* #FAMMEMB
  * ^designation.language = #da
  * ^designation.value = "Familiemedlem"
* #CHILD
  * ^designation.language = #da
  * ^designation.value = "Barn"
* #DAUC
  * ^designation.language = #da
  * ^designation.value = "Datter"
* #SONC
  * ^designation.language = #da
  * ^designation.value = "Søn"
* #GRNDCHILD
  * ^designation.language = #da
  * ^designation.value = "Barnebarn"
* #CHLDINLAW
  * ^designation.language = #da
  * ^designation.value = "Svigerbarn"
* #PRN
  * ^designation.language = #da
  * ^designation.value = "Forælder"
* #FTH
  * ^designation.language = #da
  * ^designation.value = "Far"
* #MTH
  * ^designation.language = #da
  * ^designation.value = "Mor"
* #SIB
  * ^designation.language = #da
  * ^designation.value = "Søskende"
* #DOMPART
  * ^designation.language = #da
  * ^designation.value = "Registreret partner"
* #SPS
  * ^designation.language = #da
  * ^designation.value = "Ægtefælle"
* #FRND
  * ^designation.language = #da
  * ^designation.value = "Ven (ikke-beslægtet)"
* #NBOR
  * ^designation.language = #da
  * ^designation.value = "Nabo"
* #ROOM
  * ^designation.language = #da
  * ^designation.value = "Samboende"
* #GUARD
  * ^designation.language = #da
  * ^designation.value = "Værge"
* #NOK
  * ^designation.language = #da
  * ^designation.value = "Pårørende"
* #POWATT
  * ^designation.language = #da
  * ^designation.value = "Fuldmagtshaver"

CodeSystem: DkRelatedPersonRelationshipCodes
Id: dk-relatedperson-relationshipcodes
Title: "DK Related Person Relationship Codes"
Description: "DK Related Person Relationship Codes"
* ^experimental = false
* ^url = "http://hl7.dk/fhir/core/CodeSystem/dk-relatedperson-relationshipcodes"
* ^name = "DkRelatedPersonRelationshipCodes"
* ^caseSensitive = false
* ^status = #active
* ^content = #complete
* #PARAUTH "Parental authority"
  * ^definition = "The player of the role holds parental authority over the scoping person."
  * ^designation.language = #da
  * ^designation.value = "Forældremyndighedsindehaver"
* #PRICARE "Primary caretaker"
  * ^definition = "The player of the role is the primary caretaker of the scoping person."
  * ^designation.language = #da
  * ^designation.value = "Primær omsorgsperson"


CodeSystem: NPU
Id: dk-npu-fragment
Title: "DK NPU Subset"
Description: "DK NPU Subsetted code system used in DK Core. The full version of NPU can be found at http://labterm.dk"
* ^content = #fragment
* ^status = #active
* ^experimental = false
* ^caseSensitive = false
* ^url = $NPU
* ^version = "EN211028"
* ^copyright = "The International Union of Pure and Applied Chemistry (IUPAC) and the International Federation of Clinical Chemistry and laboratory medicine (IFCC)"
* #NPU03011 "Hb(Fe; O\u2082-bind.; aB)\u2014Oxygen(O\u2082); sat. = ?"
* #NPU03011 ^designation.language = #da
* #NPU03011 ^designation.value = "Hb(Fe; O\u2082-bind.;aB)\u2014Oxygen(O\u2082); mætn. = ?"
* #NPU03011 ^property[0].code = #ChangeDate
* #NPU03011 ^property[=].valueDateTime = "2000-12-20T00:00:00+01:00"
* #NPU03011 ^property[+].code = #ChangeComment
* #NPU03011 ^property[=].valueString = "Name changed"
* #NPU03011 ^property[+].code = #CreatedDate
* #NPU03011 ^property[=].valueDateTime = "1996-12-24T00:00:00+01:00"
* #NPU03011 ^property[+].code = #System
* #NPU03011 ^property[=].valueString = "Hb"
* #NPU03011 ^property[+].code = #SysSpec
* #NPU03011 ^property[=].valueString = "Fe; O\u2082-bind.;aB"
* #NPU03011 ^property[+].code = #Component
* #NPU03011 ^property[=].valueString = "Oxygen"
* #NPU03011 ^property[+].code = #CompSpec
* #NPU03011 ^property[=].valueString = "O\u2082"
* #NPU03011 ^property[+].code = #Kind-of-property
* #NPU03011 ^property[=].valueString = "sat."
* #NPU03011 ^property[+].code = #Speciality
* #NPU03011 ^property[=].valueString = "CLC"
* #NPU03011 ^property[+].code = #"Code value"
* #NPU03011 ^property[=].valueString = "3011"
* #NPU03011 ^property[+].code = #"Scale type"
* #NPU03011 ^property[=].valueString = "Ratio"
* #NPU03011 ^property[+].code = #STATUS
* #NPU03011 ^property[=].valueString = "ACTIVE"
* #NPU27280 "Hb(Fe; O\u2082-bind.; aB)\u2014Oxygen(O\u2082); sat.(Pulse oximetry) = ?"
* #NPU27280 ^designation.language = #da
* #NPU27280 ^designation.value = "Hb(Fe; O\u2082-bind.;aB)—Oxygen(O\u2082); mætn.(pulsoximetri) = ?"
* #NPU27280 ^property[0].code = #CreatedDate
* #NPU27280 ^property[=].valueDateTime = "2007-11-23T00:00:00+01:00"
* #NPU27280 ^property[+].code = #System
* #NPU27280 ^property[=].valueString = "Hb"
* #NPU27280 ^property[+].code = #SysSpec
* #NPU27280 ^property[=].valueString = "Fe; O\u2082-bind.;aB"
* #NPU27280 ^property[+].code = #Component
* #NPU27280 ^property[=].valueString = "Oxygen"
* #NPU27280 ^property[+].code = #CompSpec
* #NPU27280 ^property[=].valueString = "O\u2082"
* #NPU27280 ^property[+].code = #Kind-of-property
* #NPU27280 ^property[=].valueString = "sat."
* #NPU27280 ^property[+].code = #Proc
* #NPU27280 ^property[=].valueString = "Pulse oximetry"
* #NPU27280 ^property[+].code = #Speciality
* #NPU27280 ^property[=].valueString = "CLC"
* #NPU27280 ^property[+].code = #"Code value"
* #NPU27280 ^property[=].valueString = "27280"
* #NPU27280 ^property[+].code = #"Scale type"
* #NPU27280 ^property[=].valueString = "Ratio"
* #NPU27280 ^property[+].code = #STATUS
* #NPU27280 ^property[=].valueString = "ACTIVE"
* #NPU04034 "Pt(spec.)\u2014Blood; temp. = ? \u00b0C"
* #NPU04034 ^designation.language = #da
* #NPU04034 ^designation.value = "Pt(spec.)—Blod; temp. = ? °C"
* #NPU04034 ^property[0].code = #CreatedDate
* #NPU04034 ^property[=].valueDateTime = "1996-05-08T00:00:00+02:00"
* #NPU04034 ^property[+].code = #System
* #NPU04034 ^property[=].valueString = "Pt"
* #NPU04034 ^property[+].code = #SysSpec
* #NPU04034 ^property[=].valueString = "spec."
* #NPU04034 ^property[+].code = #Component
* #NPU04034 ^property[=].valueString = "Blood"
* #NPU04034 ^property[+].code = #Kind-of-property
* #NPU04034 ^property[=].valueString = "temp."
* #NPU04034 ^property[+].code = #Unit
* #NPU04034 ^property[=].valueString = "°C"
* #NPU04034 ^property[+].code = #Speciality
* #NPU04034 ^property[=].valueString = "CLC"
* #NPU04034 ^property[+].code = #"Code value"
* #NPU04034 ^property[=].valueString = "4034"
* #NPU04034 ^property[+].code = #"Scale type"
* #NPU04034 ^property[=].valueString = "Differential"
* #NPU04034 ^property[+].code = #STATUS
* #NPU04034 ^property[=].valueString = "ACTIVE"
* #NPU08676 "Pt\u2014Body; temp. = ? \u00b0C"
* #NPU08676 ^designation.language = #da
* #NPU08676 ^designation.value = "Pt—Legeme; temp. = ? °C"
* #NPU08676 ^property[0].code = #CreatedDate
* #NPU08676 ^property[=].valueDateTime = "1997-04-15T00:00:00+02:00"
* #NPU08676 ^property[+].code = #System
* #NPU08676 ^property[=].valueString = "Pt"
* #NPU08676 ^property[+].code = #Component
* #NPU08676 ^property[=].valueString = "Body"
* #NPU08676 ^property[+].code = #Kind-of-property
* #NPU08676 ^property[=].valueString = "temp."
* #NPU08676 ^property[+].code = #Unit
* #NPU08676 ^property[=].valueString = "°C"
* #NPU08676 ^property[+].code = #Speciality
* #NPU08676 ^property[=].valueString = "CLC"
* #NPU08676 ^property[+].code = #"Code value"
* #NPU08676 ^property[=].valueString = "8676"
* #NPU08676 ^property[+].code = #"Scale type"
* #NPU08676 ^property[=].valueString = "Differential"
* #NPU08676 ^property[+].code = #STATUS
* #NPU08676 ^property[=].valueString = "ACTIVE"
* #NPU58033 "Artery(spec.)\u2014Blood pressure(systolic); pr.(proc.) = ? mmHg"
* #NPU58033 ^designation.language = #da
* #NPU58033 ^designation.value = "Arterie(spec.)—Blodtryk(systolisk); tryk(proc.) = ? mmHg"
* #NPU58033 ^property[0].code = #ChangeDate
* #NPU58033 ^property[=].valueDateTime = "2021-03-19T00:00:00+01:00"
* #NPU58033 ^property[+].code = #ChangeComment
* #NPU58033 ^property[=].valueString = "Specification changed"
* #NPU58033 ^property[+].code = #CreatedDate
* #NPU58033 ^property[=].valueDateTime = "2017-12-18T00:00:00+01:00"
* #NPU58033 ^property[+].code = #System
* #NPU58033 ^property[=].valueString = "Artery"
* #NPU58033 ^property[+].code = #SysSpec
* #NPU58033 ^property[=].valueString = "spec."
* #NPU58033 ^property[+].code = #Component
* #NPU58033 ^property[=].valueString = "Blood pressure"
* #NPU58033 ^property[+].code = #CompSpec
* #NPU58033 ^property[=].valueString = "systolic"
* #NPU58033 ^property[+].code = #Kind-of-property
* #NPU58033 ^property[=].valueString = "pr."
* #NPU58033 ^property[+].code = #Proc
* #NPU58033 ^property[=].valueString = "proc."
* #NPU58033 ^property[+].code = #Unit
* #NPU58033 ^property[=].valueString = "mmHg"
* #NPU58033 ^property[+].code = #Speciality
* #NPU58033 ^property[=].valueString = "CLC"
* #NPU58033 ^property[+].code = #"Code value"
* #NPU58033 ^property[=].valueString = "58033"
* #NPU58033 ^property[+].code = #"Scale type"
* #NPU58033 ^property[=].valueString = "Ratio"
* #NPU58033 ^property[+].code = #STATUS
* #NPU58033 ^property[=].valueString = "ACTIVE"
* #NPU57947 "Artery(spec.)\u2014Blood; pr.(systolic; proc.) = ? mmHg"
* #NPU57947 ^designation.language = #da
* #NPU57947 ^designation.value = "Arterie(spec.)—Blod; tryk(systolisk;proc.) = ? mmHg"
* #NPU57947 ^property[0].code = #CreatedDate
* #NPU57947 ^property[=].valueDateTime = "2017-12-05T00:00:00+01:00"
* #NPU57947 ^property[+].code = #System
* #NPU57947 ^property[=].valueString = "Artery"
* #NPU57947 ^property[+].code = #SysSpec
* #NPU57947 ^property[=].valueString = "spec."
* #NPU57947 ^property[+].code = #Component
* #NPU57947 ^property[=].valueString = "Blood"
* #NPU57947 ^property[+].code = #Kind-of-property
* #NPU57947 ^property[=].valueString = "pr."
* #NPU57947 ^property[+].code = #Proc
* #NPU57947 ^property[=].valueString = "systolic;proc."
* #NPU57947 ^property[+].code = #Unit
* #NPU57947 ^property[=].valueString = "mmHg"
* #NPU57947 ^property[+].code = #Speciality
* #NPU57947 ^property[=].valueString = "CLC"
* #NPU57947 ^property[+].code = #"Code value"
* #NPU57947 ^property[=].valueString = "57947"
* #NPU57947 ^property[+].code = #"Scale type"
* #NPU57947 ^property[=].valueString = "Ratio"
* #NPU57947 ^property[+].code = #STATUS
* #NPU57947 ^property[=].valueString = "ACTIVE"
* #NPU58034 "Artery(spec.)\u2014Blood pressure(diastolic); pr.(proc.) = ? mmHg"
* #NPU58034 ^designation.language = #da
* #NPU58034 ^designation.value = "Arterie(spec.)—Blodtryk(diastolisk); tryk(proc.) = ? mmHg"
* #NPU58034 ^property[0].code = #CreatedDate
* #NPU58034 ^property[=].valueDateTime = "2017-12-18T00:00:00+01:00"
* #NPU58034 ^property[+].code = #System
* #NPU58034 ^property[=].valueString = "Artery"
* #NPU58034 ^property[+].code = #SysSpec
* #NPU58034 ^property[=].valueString = "spec."
* #NPU58034 ^property[+].code = #Component
* #NPU58034 ^property[=].valueString = "Blood pressure"
* #NPU58034 ^property[+].code = #CompSpec
* #NPU58034 ^property[=].valueString = "diastolic"
* #NPU58034 ^property[+].code = #Kind-of-property
* #NPU58034 ^property[=].valueString = "pr."
* #NPU58034 ^property[+].code = #Proc
* #NPU58034 ^property[=].valueString = "proc."
* #NPU58034 ^property[+].code = #Unit
* #NPU58034 ^property[=].valueString = "mmHg"
* #NPU58034 ^property[+].code = #Speciality
* #NPU58034 ^property[=].valueString = "CLC"
* #NPU58034 ^property[+].code = #"Code value"
* #NPU58034 ^property[=].valueString = "58034"
* #NPU58034 ^property[+].code = #"Scale type"
* #NPU58034 ^property[=].valueString = "Ratio"
* #NPU58034 ^property[+].code = #STATUS
* #NPU58034 ^property[=].valueString = "ACTIVE"
* #NPU57948 "Artery(spec.)\u2014Blood; pr.(diastolic; proc.) = ? mmHg"
* #NPU57948 ^designation.language = #da
* #NPU57948 ^designation.value = "Arterie(spec.)—Blod; tryk(diastolisk;proc.) = ? mmHg"
* #NPU57948 ^property[0].code = #CreatedDate
* #NPU57948 ^property[=].valueDateTime = "2017-12-05T00:00:00+01:00"
* #NPU57948 ^property[+].code = #System
* #NPU57948 ^property[=].valueString = "Artery"
* #NPU57948 ^property[+].code = #SysSpec
* #NPU57948 ^property[=].valueString = "spec."
* #NPU57948 ^property[+].code = #Component
* #NPU57948 ^property[=].valueString = "Blood"
* #NPU57948 ^property[+].code = #Kind-of-property
* #NPU57948 ^property[=].valueString = "pr."
* #NPU57948 ^property[+].code = #Proc
* #NPU57948 ^property[=].valueString = "diastolic;proc."
* #NPU57948 ^property[+].code = #Unit
* #NPU57948 ^property[=].valueString = "mmHg"
* #NPU57948 ^property[+].code = #Speciality
* #NPU57948 ^property[=].valueString = "CLC"
* #NPU57948 ^property[+].code = #"Code value"
* #NPU57948 ^property[=].valueString = "57948"
* #NPU57948 ^property[+].code = #"Scale type"
* #NPU57948 ^property[=].valueString = "Ratio"
* #NPU57948 ^property[+].code = #STATUS
* #NPU57948 ^property[=].valueString = "ACTIVE"
* #NPU21692 "Heart\u2014Systole; frequency = ? \u00d7 1/min"
* #NPU21692 ^designation.language = #da
* #NPU21692 ^designation.value = "Hjerte—Systole; frekv. = ? × 1/min"
* #NPU21692 ^property[0].code = #CreatedDate
* #NPU21692 ^property[=].valueDateTime = "2004-09-29T00:00:00+02:00"
* #NPU21692 ^property[+].code = #System
* #NPU21692 ^property[=].valueString = "Heart"
* #NPU21692 ^property[+].code = #Component
* #NPU21692 ^property[=].valueString = "Systole"
* #NPU21692 ^property[+].code = #Kind-of-property
* #NPU21692 ^property[=].valueString = "frequency"
* #NPU21692 ^property[+].code = #Unit
* #NPU21692 ^property[=].valueString = "× 1/min"
* #NPU21692 ^property[+].code = #Speciality
* #NPU21692 ^property[=].valueString = "FUN"
* #NPU21692 ^property[+].code = #"Code value"
* #NPU21692 ^property[=].valueString = "21692"
* #NPU21692 ^property[+].code = #"Scale type"
* #NPU21692 ^property[=].valueString = "Ratio"
* #NPU21692 ^property[+].code = #STATUS
* #NPU21692 ^property[=].valueString = "ACTIVE"
* #NPU03794 "Pt\u2014Body; height = ? m"
* #NPU03794 ^designation.language = #da
* #NPU03794 ^designation.value = "Pt—Legeme; højde = ? m"
* #NPU03794 ^property[0].code = #CreatedDate
* #NPU03794 ^property[=].valueDateTime = "1997-04-15T00:00:00+02:00"
* #NPU03794 ^property[+].code = #System
* #NPU03794 ^property[=].valueString = "Pt"
* #NPU03794 ^property[+].code = #Component
* #NPU03794 ^property[=].valueString = "Body"
* #NPU03794 ^property[+].code = #Kind-of-property
* #NPU03794 ^property[=].valueString = "height"
* #NPU03794 ^property[+].code = #Unit
* #NPU03794 ^property[=].valueString = "m"
* #NPU03794 ^property[+].code = #Speciality
* #NPU03794 ^property[=].valueString = "CLC"
* #NPU03794 ^property[+].code = #"Code value"
* #NPU03794 ^property[=].valueString = "3794"
* #NPU03794 ^property[+].code = #"Scale type"
* #NPU03794 ^property[=].valueString = "Ratio"
* #NPU03794 ^property[+].code = #STATUS
* #NPU03794 ^property[=].valueString = "ACTIVE"
* #NPU03804 "Pt\u2014Body; mass = ? kg"
* #NPU03804 ^designation.language = #da
* #NPU03804 ^designation.value = "Pt—Legeme; masse = ? kg"
* #NPU03804 ^property[0].code = #CreatedDate
* #NPU03804 ^property[=].valueDateTime = "1996-01-01T00:00:00+01:00"
* #NPU03804 ^property[+].code = #System
* #NPU03804 ^property[=].valueString = "Pt"
* #NPU03804 ^property[+].code = #Component
* #NPU03804 ^property[=].valueString = "Body"
* #NPU03804 ^property[+].code = #Kind-of-property
* #NPU03804 ^property[=].valueString = "mass"
* #NPU03804 ^property[+].code = #Unit
* #NPU03804 ^property[=].valueString = "kg"
* #NPU03804 ^property[+].code = #Speciality
* #NPU03804 ^property[=].valueString = "CLC"
* #NPU03804 ^property[+].code = #"Code value"
* #NPU03804 ^property[=].valueString = "3804"
* #NPU03804 ^property[+].code = #"Scale type"
* #NPU03804 ^property[=].valueString = "Ratio"
* #NPU03804 ^property[+].code = #STATUS
* #NPU03804 ^property[=].valueString = "ACTIVE"
* #NPU27281 "Pt\u2014Body; mass coefficient(mass/squared height) = ? kg/m\u00b2"
* #NPU27281 ^designation.language = #da
* #NPU27281 ^designation.value = "Pt—Legeme; massekoefficient(masse/kvadreret højde) = ? kg/m²"
* #NPU27281 ^property[0].code = #ChangeDate
* #NPU27281 ^property[=].valueDateTime = "2007-12-06T00:00:00+01:00"
* #NPU27281 ^property[+].code = #ChangeComment
* #NPU27281 ^property[=].valueString = "Unit defined"
* #NPU27281 ^property[+].code = #CreatedDate
* #NPU27281 ^property[=].valueDateTime = "2007-11-23T00:00:00+01:00"
* #NPU27281 ^property[+].code = #System
* #NPU27281 ^property[=].valueString = "Pt"
* #NPU27281 ^property[+].code = #Component
* #NPU27281 ^property[=].valueString = "Body"
* #NPU27281 ^property[+].code = #Kind-of-property
* #NPU27281 ^property[=].valueString = "mass coefficient"
* #NPU27281 ^property[+].code = #Proc
* #NPU27281 ^property[=].valueString = "mass/squared height"
* #NPU27281 ^property[+].code = #Unit
* #NPU27281 ^property[=].valueString = "kg/m²"
* #NPU27281 ^property[+].code = #Speciality
* #NPU27281 ^property[=].valueString = "CLC"
* #NPU27281 ^property[+].code = #"Code value"
* #NPU27281 ^property[=].valueString = "27281"
* #NPU27281 ^property[+].code = #"Scale type"
* #NPU27281 ^property[=].valueString = "Ratio"
* #NPU27281 ^property[+].code = #STATUS
* #NPU27281 ^property[=].valueString = "ACTIVE"
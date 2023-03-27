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
* #postal "Postal" "Mailing addresses - PO Boxes and care-of addresses."
  * ^designation.language = #da
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Post"
* #physical "Physical" "A physical address that can be visited."
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Fysisk"
* #both "Postal & Physical" "An address that is both physical and postal."
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
* #home "Home" "A communication address at a home."
  * ^designation.language = #da
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Hjem"
* #work "Work" "An office address. First choice for business related contacts during business hours."
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Arbejde"
* #temp "Temporary" "A temporary address. The period can provide more detailed information."
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Midlertidig"
* #old "Old / Incorrect" "This address is no longer in use (or was never correct, but retained for records)."
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
* #proposed "Proposed" "The care team has been drafted and proposed, but not yet participating in the coordination and delivery of care."
  * ^designation.language = #da
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Forslag"
* #active "Active" "The care team is currently participating in the coordination and delivery of care."
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Aktiv"
* #suspended "Suspended" "The care team is temporarily on hold or suspended and not participating in the coordination and delivery of care."
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Suspenderet"
* #inactive "Inactive" "The care team was, but is no longer, participating in the coordination and delivery of care."
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Inaktiv"
* #entered-in-error "Entered In Error" "The care team should have never existed."
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
* #draft "Pending" "The consent is in development or awaiting use but is not yet intended to be acted upon."
  * ^designation.language = #da
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Under udarbejdelse"
* #proposed "Proposed" "The consent has been proposed but not yet agreed to by all parties. The negotiation stage."
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Forslag"
* #active "Active" "The consent is to be followed and enforced."
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Aktiv"
* #rejected "Rejected" "The consent has been rejected by one or more of the parties."
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Afvist"
* #inactive "Inactive" "The consent is terminated or replaced."
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Inaktiv"
* #entered-in-error "Entered in Error" "The consent was created wrongly (e.g. wrong patient) and should be ignored"
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
* #mon "Monday" "Monday"
  * ^designation.language = #da
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Mandag"
* #tue "Tuesday" "Tuesday"
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Tirsdag"
* #wed "Wednesday" "Wednesday"
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Onsdag"
* #thu "Thursday" "Thursday"
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Torsdag"
* #fri "Friday" "Friday"
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Fredag"
* #sat "Saturday" "Saturday"
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Lørdag"
* #sun "Sunday" "Sunday"
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
* #planned "Planned" "This episode of care is planned to start at the date specified in the period.start. During this status, an organization may perform assessments to determine if the patient is eligible to receive services, or be organizing to make resources available to provide care services."
  * ^designation.language = #da
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Planlagt"
* #waitlist "Waitlist" "This episode has been placed on a waitlist, pending the episode being made active (or cancelled)."
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Venteliste"
* #active "Active" "This episode of care is current."
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Aktiv"
* #onhold "On Hold" "This episode of care is on hold, the organization has limited responsibility for the patient (such as while on respite)."
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Pauseret"
* #finished "Finished" "This episode of care is finished and the organization is not expecting to be providing further care to the patient. Can also be known as \"closed\", \"completed\" or other similar terms."
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Færdig"
* #cancelled "Cancelled" "The episode of care was cancelled, or withdrawn from service, often selected during the planned stage as the patient may have gone elsewhere, or the circumstances have changed and the organization is unable to provide the care. It indicates that services terminated outside the planned/expected workflow."
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Annulleret"
* #entered-in-error "Entered in Error" "This instance should not have been part of this patient's medical record."
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
* #draft "Draft" "This resource is still under development and is not yet considered to be ready for normal use."
  * ^designation[0].language = #ru
  * ^designation[=].value = "черновик"
  * ^designation[+].language = #nl
  * ^designation[=].value = "ontwerp"
  * ^designation[+].language = #da
  * ^designation[=].use = $sct#900000000000013009
  * ^designation[=].value = "Udkast"
* #active "Active" "This resource is ready for normal use."
  * ^designation[0].language = #ru
  * ^designation[=].value = "активный"
  * ^designation[+].language = #nl
  * ^designation[=].value = "actief"
  * ^designation[+].language = #da
  * ^designation[=].use.system = "http://snomed.info/sct"
  * ^designation[=].use = $sct#900000000000013009
  * ^designation[=].value = "Aktiv"
* #retired "Retired" "This resource has been withdrawn or superseded and should no longer be used."
  * ^designation[0].language = #ru
  * ^designation[=].value = "удалён"
  * ^designation[+].language = #nl
  * ^designation[=].value = "verouderd"
  * ^designation[+].language = #da
  * ^designation[=].use.system = "http://snomed.info/sct"
  * ^designation[=].use = $sct#900000000000013009
  * ^designation[=].value = "Udgået"
* #unknown "Unknown" "The authoring system does not know which of the status values currently applies for this resource.  Note: This concept is not to be used for \"other\" - one of the listed statuses is presumed to apply, it's just not known which one."
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
* #draft "Draft" "The request has been created but is not yet complete or ready for action."
  * ^designation.language = #da
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Udkast"
* #active "Active" "The request is in force and ready to be acted upon."
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Aktiv"
* #on-hold "On Hold" "The request (and any implicit authorization to act) has been temporarily withdrawn but is expected to resume in the future."
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Suspenderet"
* #revoked "Revoked" "The request (and any implicit authorization to act) has been terminated prior to the known full completion of the intended actions. No further activity should occur."
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Annulleret"
* #completed "Completed" "The activity described by the request has been fully performed. No further activity will occur."
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Afsluttet"
* #entered-in-error "Entered in Error" "This request should never have existed and should be considered 'void'. (It is possible that real-world decisions were based on it. If real-world activity has occurred, the status should be \"revoked\" rather than \"entered-in-error\".)."
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Fejlindtastning"
* #unknown "Unknown" "The authoring system does not know which of the status values currently applies for this request.  Note: This concept is not to be used for \"other\"  - one of the listed statuses is presumed to apply, but the authoring/source system does not know which."
  * ^designation.language = #da
  * ^designation.use.system = "http://snomed.info/sct"
  * ^designation.use = $sct#900000000000013009
  * ^designation.value = "Ukendt"
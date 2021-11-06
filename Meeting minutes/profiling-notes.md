# Comments on current profile and notes
* Social security number should follow the format from https://cpr.dk/cpr-systemet/opbygning-af-cpr-nummeret/ meaning that '-' is omitted. Can we all agree to that?
* What are the official OID's for replacement CRNs?
* Should OID or URL's be used for system id?
* Should Civil Registration Number be abbrevated CRN or CPR (https://cpr.dk/english/moving-to-denmark/)
* Should middleName extension be abandoned or not. HumanName on Patient emcompasses middle names http://hl7.org/fhir/r4/datatypes.html#HumanName - revisit https://github.com/HL7/dk-core-r4/blob/master/Meeting%20minutes/2019-10-09.md#diskussion-af-patientname
 * The standard puts given and middle name in the same elements. As such the profile is easier consumable if not extended. Furhtermore, if more names are needed, HumanName is a list element, and 'use' can be used for nicknames and such
* Marital status extensions is not needed. Instead invariants will be provided
 * https://www.borger.dk/familie-og-boern/Aegteskab-og-parforhold/Registreret-partnerskab
 * Man kan ikke blive registreret partner længere. Man bliver istedet gift. Derfor er det ikke nødvendigt at lave tilføjelsere til maritalStatus.


http://hl7.org/fhir/R4/valueset-encounter-diet.html


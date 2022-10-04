## Introduction
The Danish Core Patient profile is intended to encapsulate the most common and basic data model of patients in danish healthcare systems covering both primary sector, secondary sector (specialty doctors and hospitals) and municipality cases. As such the profile should be usable in most danish contexts.

## Patient identifiers
This patient profile currently only reflects the use of the established national danish patient identifiers called [CPR](https://cpr.dk/). More official identifiers are expected to be used and profiled in the future, eg:

 * [eID](https://ec.europa.eu/digital-single-market/en/trust-services-and-eid)
 * [Official replacement CPR numbers](https://cpr.dk/cpr-systemet/erstatningspersonnummer-i-eksterne-systemer/)
 * **catastrophe** CPR numbers.

### DkCoreCprIdentifier

The element identifier.type describe the specific purpose of an identifier. It is desired to use the code 'NNDNK' from the CodeSystem [IdentifierType](https://terminology.hl7.org/4.0.0/CodeSystem-v2-0203.html) as the type for [DkCoreCprIdentifier](https://hl7.dk/fhir/core/StructureDefinition-dk-core-cpr-identifier.html). However, it is currently not recommended to use this code, due to known problems with the validation tool when validating the code 'NNDNK'.

## Use of security label on patients
 Danish citizens that have requested name and address protection ([Navne- og adressebeskyttelse](https://www.retsinformation.dk/eli/lta/2017/646#idee1fb7b6-c7e7-429d-a738-881c5e486fa6)) should be labeled with the security label as follows:
 
 ```
 <Patient xmlns="http://hl7.org/fhir">
  <meta>
    <security>
      <system value="http://terminology.hl7.org/CodeSystem/v3-Confidentiality"/>
      <code value="R"/>
      <display value="Restricted"/>
    </security>
  </meta>
...  [snip] ...
</Patient>
 ```

 Use of this label should be interpreted according to the law, rouhgly meaning that only personnel using systems in public/official affairs are allowed to see name and address for the patient/citizen.
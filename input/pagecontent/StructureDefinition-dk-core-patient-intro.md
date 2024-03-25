### Scope and usage
The Danish Core Patient profile is intended to encapsulate the most common and basic data model of patients in Danish healthcare systems covering both primary sector, secondary sector (specialty doctors and hospitals) and municipality cases. As such the profile should be usable in most Danish contexts. Note that the profile is usable for those that recieve health and social care in municipalities, even in contexts where they are more commonly known as citizens ([DA] borgere).

### Patient identifiers
This patient profile currently only reflects the use of the established national danish patient identifiers called [CPR](https://cpr.dk/) and (for patients without or with unknown CPR number) the use of replacement CPR numbers ([DA] Erstatnings-CPR-numre eller eCPR). Both national [X-eCPR](https://sundhedsdatastyrelsen.dk/da/registre-og-services/ecpr) numbers issued by the Danish Health Data Authority ([DA] Sundhedsdatastyrelsen) and [D-eCPR](https://sundhedsdatastyrelsen.dk/da/rammer-og-retningslinjer/om-patientregistrering/patientregistrering-feallesindhold) numbers primarily issued locally by one of the five danish regions are supported by this profile. More official identifiers are expected to be used and profiled in the future, eg:

 * [eID](https://ec.europa.eu/digital-single-market/en/trust-services-and-eid)
 * **catastrophe** CPR numbers.

#### CPR-identifier

The element identifier.type describes the specific purpose of an identifier. It is desired to use the code 'NNDNK' from the CodeSystem [IdentifierType](https://terminology.hl7.org/4.0.0/CodeSystem-v2-0203.html) as the type for [DkCoreCprIdentifier](https://hl7.dk/fhir/core/StructureDefinition-dk-core-cpr-identifier.html). However, it is currently not recommended to use this code, due to known problems with the validation tool when validating the code 'NNDNK'.

#### eCPR-identifier

The element Patient.identifier includes two slices to represent eCPR. Each slice includes an identifier with requirements for the specific eCPR:
* For X-eCPR, the [DkCoreXeCprIdentifier](./StructureDefinition-dk-core-x-ecpr-identifier.html) must be use, which includes an OID as system and an invariant describing the requirements for the structure of the identifier, [based on guidelines from Danish Health Data Authority](https://www.nspop.dk/pages/viewpage.action?pageId=226757583#eCPRFormater(XeCPRogDeCPR)-Formatetfornationaleerstatningspersonnumre-X-eCPR). An example of usage can be seen in [here](./Patient-ukendt-X-eCPR.html).
* For D-eCPR, the [DkCoreDeCprIdentifier](./StructureDefinition-dk-core-d-ecpr-identifier.html) must be used, which includes a ValueSet of OID's that may be used as system. The OIDs represent the D-eCPR in general and D-eCPR for each of the five regions. Further, the identifier includes an invariant describing the requirements for the structure of the identifier, [based on guidelines from Danish Health Data Authority](https://www.nspop.dk/pages/viewpage.action?pageId=226757583#eCPRFormater(XeCPRogDeCPR)-Formatetfordecentraleerstatningspersonnumre-D-eCPR). An example of usage can be seen in [here](./Patient-ukendt-D-eCPR.html). 

In case it is necessary to include an eCPR which is not an X-eCPR or a D-eCPR, it is recommended to add a new slice with the relevant other system and the eCPR identifier from that system. This may be necessary for small practices or due to legacy reasons. An example of this can be seen [here](./Patient-ukendt.html).


### Use of security label on patients
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

Use of this label should be interpreted according to the law, roughly meaning that only personnel using systems in public/official affairs are allowed to see name and address for the patient/citizen.

### Unknown values or Absent values
There may be scenarios where it is not possible to supply all values as required by this profile. For such cases it is possible to specify a Data Absent Reason ([DAR](https://hl7.org/fhir/R4/extension-data-absent-reason.html)) extension which enables data fields to be supplied where data is not available. An example of this can be seen [here](./Patient-ukendt.html). The use of DAR is not restricted to the patient profile.
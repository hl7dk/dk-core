### Scope and usage
The Danish Core Related Person profile is intended to encapsulate the most common and basic data model of persons related to patients/persons in Danish healthcare systems covering both primary sector, secondary sector (specialty doctors and hospitals) and municipality cases. As such the profile should be usable in most Danish contexts. Note that the profile is usable for related persons to those that receive health and social care in municipalities, even in contexts where receivers of care are more commonly known as citizens ([DA] borgere).

### Identifiers for related persons
This related person profile currently reflects the use of the established national Danish citizen identifiers called [CPR](https://cpr.dk/) and (where relevant) the use of replacement CPR numbers ([DA] Erstatnings-CPR-numre eller eCPR).

#### CPR-identifier

The element identifier.type describes the specific purpose of an identifier. It is desired to use the code 'NNDNK' from the CodeSystem [IdentifierType](https://terminology.hl7.org/4.0.0/CodeSystem-v2-0203.html) as the type for [DkCoreCprIdentifier](https://hl7.dk/fhir/core/StructureDefinition-dk-core-cpr-identifier.html). However, it is currently not recommended to use this code, due to known problems with the validation tool when validating the code 'NNDNK'.

#### eCPR-identifier

The element RelatedPerson.identifier includes two slices to represent eCPR. Each slice includes an identifier with requirements for the specific eCPR:
* For X-eCPR, the [DkCoreXeCprIdentifier](./StructureDefinition-dk-core-x-ecpr-identifier.html) must be used, which includes an OID as system and an invariant describing the requirements for the structure of the identifier, [based on guidelines from Danish Health Data Authority](https://www.nspop.dk/pages/viewpage.action?pageId=226757583#eCPRFormater(XeCPRogDeCPR)-Formatetfornationaleerstatningspersonnumre-X-eCPR).
* For D-eCPR, the [DkCoreDeCprIdentifier](./StructureDefinition-dk-core-d-ecpr-identifier.html) must be used, which includes a ValueSet of OID's that may be used as system. The OIDs represent the D-eCPR in general and D-eCPR for each of the five regions. Further, the identifier includes an invariant describing the requirements for the structure of the identifier, [based on guidelines from Danish Health Data Authority](https://www.nspop.dk/pages/viewpage.action?pageId=226757583#eCPRFormater(XeCPRogDeCPR)-Formatetfordecentraleerstatningspersonnumre-D-eCPR).

### Relationship codes
The relationships in [DK Related Person Relationship Types](.ValueSet-dk-core-RelatedPersonRelationshipTypes.html) are intended to cover the most common use cases within the Danish healthcare sector. In cases when other relationships need to be expressed, codes from the general [Related Person Relationship Type](http://hl7.org/fhir/R4/valueset-relatedperson-relationshiptype.html) should be used when possible.  

### Use of security label on related persons
Danish citizens that have requested name and address protection ([Navne- og adressebeskyttelse](https://www.retsinformation.dk/eli/lta/2017/646#idee1fb7b6-c7e7-429d-a738-881c5e486fa6)) should be labeled with the security label as follows:

 ```
 <RelatedPerson xmlns="http://hl7.org/fhir">
  <meta>
    <security>
      <system value="http://terminology.hl7.org/CodeSystem/v3-Confidentiality"/>
      <code value="R"/>
      <display value="Restricted"/>
    </security>
  </meta>
...  [snip] ...
</RelatedPerson>
 ```

Use of this label should be interpreted according to the law, roughly meaning that only personnel using systems in public/official affairs are allowed to see name and address for the related person/citizen.


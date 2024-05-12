### Scope and usage
The Danish Core Organization profile is intended to encapsulate the most common and basic data model of organizations in Danish healthcare system, covering both primary sector, secondary sector (medical specialists ([DA] speciallæger) and hospitals) and municipality cases. As such the profile should be usable in most Danish contexts. Organization is broardly defined (just as it is in the original FHIR ressource) and may be used to define all organizations directly or indirectly involved in citizen and patient care. 

Please notice, that an organization shall always have at least one identifier. Some identifiers are common in a Danish context, why they are included in the profile, see the list below. However, it is allowed to add a new identifier for a special usage. 
- *EAN identifier*: this specifically, refers to what is commonly known as the **EAN** number - which in fact is a [Global Location Number](https://www.gs1.org/standards/id-keys/gln).
- *SOR identifier*: a register for Danish health care organizations which contains information about organizations and their location. 
- *KOMBIT organization identifier*: holding the organization code. This is issued by KOMBIT.
- *Ydernummer identifier*: an identifier for private health professionals like general practitioners or physiotherapists. 
- *CVR identifier*: an official company identifier for Danish companies.
- *Kommunal identifier*: the official identifier for a Danish municipality.
- *Regional identifier*: the official organization identifier for a Danish region.
- *Producent identifier*: the identifier used for the producer of laboratory result, maintained by MedCom. 

#### Representing a general practitioner

When using the Danish Core Organization profile for representing a general practitioner, it is recommended to use both a [SOR identifier](https://hl7.dk/fhir/core/StructureDefinition-dk-core-organization-definitions.html#Organization.identifier:SOR-ID) and an [ydernummer identifier](https://hl7.dk/fhir/core/StructureDefinition-dk-core-organization-definitions.html#Organization.identifier:Ydernummer.id). It is recommended that the SOR identifier is on the ‘sundhedsinstitution’ level from the SOR hierarchy. The same SOR identifier can be used for multiple Organization instances of different general practitioner’s practices, and therefore the ydernummer identifier will be the unique identifier for a Danish GP. 
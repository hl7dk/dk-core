### Scope and usage
The Danish Core Organization profile is intended to encapsulate the most common and basic data model of organizations in Danish healthcare system, covering both primary sector (GP's), secondary sector (specialty doctors and hospitals) and municipality cases. As such the profile should be usable in most Danish contexts. Organization is broardly defined (just as it is in the original FHIR ressource) and may be used to define all organizations directly or indirectly involved in citizen and patient care. 

Please notice, that an organization shall always have at least one identifier. Some identifiers are common in a Danish context, why they are included in the profile, see the list below. However, it is allowed to add a new identifier for a special usage. 
- *EAN identifier*: this specifically, refers to what is commonly known as the **EAN** number - which in fact is a [GTIN-13 number](https://en.wikipedia.org/wiki/Global_Trade_Item_Number).
- *SOR identifier*: a register for Danish health care organizations which contains information about organizations and their location. 
- *KOMBIT STS organization identifier*: holding the organization code. This is issued by KOMBIT.
- *Ydernummer identifier*: an identifier for private health professionals like general practitioners or physiotherapists. 
- *CVR identifier*: an official company identifier for Danish companies.
- *Kommunal identifier*: the official identifier for a Danish municipality.
- *Regional identifier*: the official organization identifier for a Danish region.
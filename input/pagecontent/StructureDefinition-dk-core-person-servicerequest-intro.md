### Scope and usage

The Danish Core ServiceRequest profile is intended to support requests for services within the health sector, e.g. cross sector. In dk-core, the ServiceRequest resource have been constrained to only contain [DkCorePatient](StructureDefinition-dk-core-patient.html) and Group as subject of the request. This is chosen to ensure a focused and relevant ValueSet for the ServiceRequest.code.

Notice that the international ValueSet for priority have been reduced to contain only two values i.e. 'routine' and 'asap' because only these two concepts are of widespread use in Denmark. 'routine' is the same as the Danish 'elektiv'. 'asap' is the same as the danish 'akut'.

The datatype for reason is different between R4 and R5. The element reason is in R5 a CodeableReference, which has been sliced and refers to different recommended systems. These are the same as in the [DkCoreCondition](./StructureDefinition-dk-core-condition.html) profile. Read the documentation there, before using the reason in this profile.

#### Category, code and orderDetail

In the ServiceRequest resource there are three levels of categorization. 

**Category:**
The top level is the ServiceRequest.category, which classifies the services on a high level. Category is for finding the different kinds of ServiceRequests in a consistent way, and can contain more than one code, and relate to different aspects. In Denmark, it is recommended to include one of the NSP/SOR Practice setting codes, as one of the category codes. The codes are included in this implementation guide as an example binding. The official source for NSP/SOR Practice setting codes is the SNOMED CT codes presented [here](https://svn.medcom.dk/svn/releases/Standarder/IHE/OID/DK-IHE_Metadata-Common_Code_systems-Value_sets.xlsx).

Another example of the use of category, related to a different aspect, could be to categorize the ServiceRequest into 'virtual' or 'in-person'.

**Code:** 
The middle level is ServiceRequest.code, which identifies the service being requested. This is the most important code, and it is recommended to populate this attribute whenever possible. The service request code should semantically be a procedure code. However, be aware that this does not nessesarily mean that it has to be populated with a very specific code. In cross-sector use cases, it is often the case that the requesting organization does not nessesarily know the exact procedure - but they know the kind of procedure or where to start. For example, a general practitioner could use the code 284394000 'Examination of spine' when having a patient with back pain that needs to be examined at the hospital. It would not be expected that the general practitioner would detail a final procedure actually performed in the hospital such as 178625001 'Primary lumbar microdiscectomy'. A good example of SNOMED CT procedure codes, can be found in the international patient summary see the [IPS implementation guide](https://build.fhir.org/ig/HL7/fhir-ips/ValueSet-procedures-uv-ips.html)

**OrderDetail:**
The most detailed level is ServiceRequest.orderDetail.parameter, which may include additional detail or instruction concerning how the service should be delivered. This can be specific to each organization and does not necessary have to be included when sending a ServiceRequest, but can be enriched by the performer of the service. In R5, both a code and a value is required for orderDetail.


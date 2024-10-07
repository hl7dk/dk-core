### Scope and usage

> Work in progress

The Danish Core ServiceRequest profile is intended to support cross sector requests for services within the health sector. In dk-core, the ServiceRequest resource have been constrained to only contain DkCorePatient and Group as subject of the request. This is choosen to ensure a focused and relevant ValueSet for the ServiceRequest.code.

Notice that the international ValeSet for priority have been reduced to only two values i.e. 'routine' and 'asap' because only these two concepts are of widespread use in Denmark. 'routine' is the same as the danish 'elektiv'. 'asap' is the same as the danish 'akut'.

The reasonCode has been sliced and refers to different recommended systems. These are the same as in the condition-profile. Read the documentation there, before using the reasonCode in this profile.

#### Category, code and orderDetail

In the ServiceRequest resource there are three levels of categorization. 

**Category:**
The top level is the ServiceRequest.category, which classifies the services on a high level. Category is for finding the kinds of ServiceRequests reliably, and can contain more than one code, and relate to different aspects. In Denmark, it is recommended to include one of the NSP/SOR Practice setting codes, as one of the category-codes. The codes are included in this implementation guide as an example binding. The official source of the codes is [here](https://svn.medcom.dk/svn/releases/Standarder/IHE/OID/DKIHE_Metadata-Common_Code_systems-Value_sets.xlsx)

Another example of the use of category, related to a different aspect, could be to categorize the ServiceRequest into `virtual` or `in-person`.

**Code:** 
The middle level is ServiceRequest.code, which identifies the service being requested. This is actually the most important code, and it is recommended to populate this attribute whenever possible. The service request code should semantically be a procedure-code. However, be aware that this does not nessesarily mean that it has to be populated with a very specific code. In cross-sector use cases, it is often the case that the sender-organization does not nessesarily know the exact procedure - but they know the kind of procedure or where to start. For example, a general practitioner could use the code 284394000 'Examination of spine' when having a patient with back pain that needs to be examined at the hospital. It would not be expected that the general practitioner would detail a final procedure actually performed in the hospital such as 178625001 'Primary lumbar microdiscectomy'. A good example of SNOMED CT procedure codes, can be found in the international patient summary see the [IPS implementation guide](https://build.fhir.org/ig/HL7/fhir-ips/ValueSet-procedures-uv-ips.html)

**OrderDetail:**
The most detailed level is at ServiceRequest.orderDetail, which included additional detail or instruction concerning how the service should be delivered. This can be specific to each organization and does not nessecary have to be included when sending a ServiceRequest, but can be enriched by the performer of the service.

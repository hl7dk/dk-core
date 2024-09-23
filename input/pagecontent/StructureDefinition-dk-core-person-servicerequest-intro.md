### Scope and usage

> Work in progress

The Danish Core ServiceRequest profile is intended to support cross sector requests for services within the health sector. In dk-core, the ServiceRequest resource have been constrained to only contain DkCorePatient and Group as subject of the request. This is choosen to ensure a focused and relevant ValueSet for the ServiceRequest.code. 

#### Category, code and orderDetail

In the ServiceRequest resource there are three levels of categorization. 

**Category:**
The top level is the ServiceRequest.category, which classifies the services on a high level. In the resource, the examples are `laboratory procedure` or `counseling`, but another example could be to categorize the ServiceRequest into `virtual` or `in-person`. No profiling has been performed for this element.

**Code:** 
The middle level is ServiceRequest.code, which identifies the service that is being requested. This could be SNOMED CT concepts for `Home nursing care services` or `Mental health counseling service`. In this profile, a preferred ValueSet binding is included which contains all children of the SNOMED CT `224891009 Healthcare services`. This is chosen as these children are used to define the services a healthcare unit provides in SOR, a register for Danish health care organizations. The included SNOMED CT concepts is already associated with a sector, for example primary care or nursing care. To avoid redundant information in an instances it is recommended not to populate the ServiceRequest.categoy element to include a code that defines the sector in which the service is provided. However, if it is relevant to categorize the ServiceRequest into `virtual` or `in-person`, this can be done.
Since the ValueSet has the binding 'preferred', it is allowed to include other codes for this element.

**OrderDetail:**
The most detailed level is at ServiceRequest.orderDetail, which included additional detail or instruction concerning how the service should be delivered. This can be specific to each organization and does not nessecary have to be included when sending a ServiceRequest, but can be enriched by the performer of the service.



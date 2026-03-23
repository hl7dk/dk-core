### Scope and Usage 
The DkCoreLaboratoryReport profile is used to convey the laboratory’s response to a request for one or more analyses. It represents the report at a specific point in time and provides the overall context for the results produced. The report contains information about the report itself, the subject, and the specimen(s) on which the analyses are based.

The LaboratoryReport serves as the primary structure that links the requested analyses, the underlying specimens, and the resulting observations into a coherent laboratory response.

#### Identifier
The identifier may contain a analysisnumber equivalent to the Danish 'RekvNrLab' from MedComs RPT01. It may correspond to the Danish requisitionnumber (NPN), but could be re-assigned at the laboratory. For correctly referencing the requsition see the DiagnosticReport.basedOn instead.

#### Status Codes
The DiagnosisReport resource must contain the status of the report and uses the required FHIR ValueSet as appropriate. 

All codes in the ValueSet may be used, but if mapping to and from MedCom standard for laboratory results (RPT01/XRPT01), the following codes should be considered equivalent:

The DiagnosticReport progresses through well-defined status values throughout its lifecycle.
* registered: As soon as the specimen is received by the laboratory, a DiagnosticReport is created with the status 'registered'. This reflects that the order has entered the laboratory workflow and initial processing has begun.  This corresponds to MedComs's 'modtaget'
* partial: The status 'partial' is used when some, but not all, Observations within the DiagnosticReport have been finalised. At least one Observation result must still be pending for the status to remain 'partial'. This corresponds to MedComs's 'delsvar'
* final: When all observations included in the DiagnosticReport have completed processing and all results are available, the status is set to 'final'.
This represents the finalisation of the entire laboratory response, corresponding to MedCom’s 'komplet_svar'.
* amended: If a previously finalised DiagnosticReport is updated because one or more referenced results have been corrected, the status becomes 'amended'. This ensures that receivers are aware that a new version replaces an earlier final report. There is no one corresponding code MedCom, but several ways of showing that a reports have corrected results. To ensure FHIR compliance, the 'amended' code should be used ad described here.

#### Category
The category is used to classify the report. It is divided into two distinct categories: studyType and specialty. These categories offer different ways to describe the context and nature of the laboratory report. 

* studyType: is a classification of the type of tests or services performed, grouped into clinically meaningful categories. It represents a typology of test results rather than the laboratory itself. 
* specialty: describes the clinical or professional domain of the laboratory that produced the results. It reflects the specific area of laboratory expertise that executed the tests for example, microbiology, chemistry, or hematology.

The categories are derived directly from the specification of laboratory reports fra European Health Data Space.

#### Other documentation about attributes
DiagnosticReport.code always holds the value 'laboratory report' in this profile. Other codes may be used e.g. for home monitoring reports.

Note that diffent timestamps are allowed and match them to your use case. MedCom's laboratory report uses 'brevDannetTid' here DiagnosticReport.issued is recommended as equivalent. For MedCom's 'svarTid' using DiagnosticReport.effectiveDateTime is recommended.

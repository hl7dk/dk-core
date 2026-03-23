### Scope and Usage 
The DkCoreDiagnosticReport profile is used for diagnostic reports and notes communicated within the Danish healthcare sector. Several use cases exist:

* Laboratory reports
* Personal health monitoring reports
* Other reports conveying observations between healthcare providers

The most typical is the laboratory report used to convey the laboratory’s response to a request for one or more analyses. It represents the report at a specific point in time and provides the overall context for the results produced. The report contains information about the report itself, the subject, and the specimen(s) on which the analyses are based.

In this case, a DiagnosticReport serves as the primary structure that links the requested analyses, the underlying specimens, and the resulting observations into a coherent laboratory response.

In other use cases, the DiagnosticReport is still a coherent report of resulting observations. These use cases are typically characterized by more relaxed requirements than within laboratory medicine.

#### Code
DiagnosticReport.code may hold different values and LOINC document codes are recommended. In the EHDS laboratory standard, the code 'laboratory report' is always used. A few other example codes are included in the value set to make it easier to support common Danish use cases:

* 'personal health monitoring report' for collections of data produced by the patients themselves, typically in telehealth projects.
* 'progress note' for clinical situations where a collection of observation results originates from an encounter and needs to be communicated to other actors in the health sector. Examples could be acute nursing encounters where measurements are shared with the general practitioner. It could also be a general practitioner visit or hospital encounter where a number of different observations are made and need to be shared afterwards.

Note that if a general practitioner visit originates in a report containing only laboratory results, it is recommended to use the code 'laboratory-report'. To differentiate from laboratory reports made in laboratories, use an appropriate category instead.

#### Identifier
The identifier may contain an analysis number equivalent to the Danish 'RekvNrLab' from MedCom's RPT01. It may correspond to the Danish requisition number (NPN), but could be re-assigned at the laboratory. For correctly referencing the requisition, see DiagnosticReport.basedOn instead.

#### Status Codes
The DiagnosticReport resource must contain the status of the report and uses the required FHIR ValueSet as appropriate. 

All codes in the ValueSet may be used, but if mapping to and from the MedCom standard for laboratory results (RPT01/XRPT01), the following codes should be considered equivalent:

The DiagnosticReport progresses through well-defined status values throughout its lifecycle.

* registered: As soon as the specimen is received by the laboratory, a DiagnosticReport is created with the status 'registered'. This reflects that the order has entered the laboratory workflow and initial processing has begun. This corresponds to MedCom's 'modtaget'.
* partial: The status 'partial' is used when some, but not all, Observations within the DiagnosticReport have been finalized. At least one Observation result must still be pending for the status to remain 'partial'. This corresponds to MedCom's 'delsvar'.
* final: When all observations included in the DiagnosticReport have completed processing and all results are available, the status is set to 'final'. This represents the finalization of the entire laboratory response, corresponding to MedCom’s 'komplet_svar'.
* amended: If a previously finalized DiagnosticReport is updated because one or more referenced results have been corrected, the status becomes 'amended'. This ensures that receivers are aware that a new version replaces an earlier final report. There is no single corresponding code in MedCom. Nevertheless, to ensure FHIR compliance, the 'amended' code should be used as described here.

In a MedCom context, there are several ways of showing that a report has corrected results—but only at the result level. In FHIR, these results are Observations that may be referred to in DiagnosticReport.result.

#### Category
The category is used to classify the report. It is divided into three distinct slices: studyType, specialty, and danishSpecialty. The first two are derived directly from the specification of laboratory reports from the European Health Data Space (EHDS), and they should only be used for laboratory reports: 

* studyType: A classification of the type of tests or services performed, grouped into clinically meaningful categories. It represents a typology of test results rather than the laboratory itself. 
* specialty: Describes the clinical or professional domain of the laboratory that produced the results. It reflects the specific area of laboratory expertise that executed the tests (e.g., microbiology, chemistry, or hematology).

The third category is Danish Specialties as expressed in Clinical Speciality in SOR (Sundhedsvæsenets Organisationsregister) excluding the Laboratory specialities since they are already expressed in the speciality-slice. These may be used for non-laboratory use cases as needed.

#### Other documentation about attributes
Note that different timestamps are allowed. Match them to your specific use case. MedCom's laboratory report uses 'brevDannetTid'. In this case, DiagnosticReport.issued is recommended as the equivalent. For MedCom's 'svarTid', using DiagnosticReport.effectiveDateTime is recommended.

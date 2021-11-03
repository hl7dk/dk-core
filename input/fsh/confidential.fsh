Instance: Confidential
InstanceOf: DkCorePatient
Title: "Example of a patient with confidential adress and name"
Description: "Example of a patient with confidential adress and name"
Usage: #example
* meta.security.system = "http://terminology.hl7.org/CodeSystem/v3-Confidentiality"
* meta.security.code = #R 
* meta.security.display = "restricted"
* identifier[0].system = "urn:oid:1.2.208.176.1.2"
* identifier[0].value = "0908760405"
* name[0].use = #official
* name[0].family = "Hansen"
* name[0].given = "Hans"
* gender = #male
* birthDate = "1976-08-09"
* address[0].use = #home
* address[0].line = "Julianevej 22"
* address[0].city = "6000 Kolding"
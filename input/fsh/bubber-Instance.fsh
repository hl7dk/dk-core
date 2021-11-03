Instance: john
InstanceOf: DkCorePatient
Title: "Example of valid patient with multiple names"
Description: "Example of valid patient with multiple names"
Usage: #example
* identifier[0].system = "urn:oid:1.2.208.176.1.2"
* identifier[0].value = "1112640001"
* name[0].use = #official
* name[0].family = "Meyerhofen"
* name[0].given[0] = "John"
* name[0].given[1] = "Christian"
* name[0].prefix[0] = "Mr"
* name[1].use = #usual
* name[1].given[0] = "Johnny"
* gender = #male
* birthDate = "1964-12-11"
* generalPractitioner[0].identifier.system = "urn:oid:1.2.208.176.1.1"
* generalPractitioner[0].identifier.value = "487341000016005"
* generalPractitioner[0].display = "Charlottenlund Lægehus"
Instance: Confidential
InstanceOf: DkCorePatient
Title: "Example of a patient with confidential adress and name"
Description: "Example of a patient with confidential adress and name"
Usage: #example
* text[0].div = """<div xmlns="http://www.w3.org/1999/xhtml">

This instance is an example of a Danish citizen who has requested name and address protection (Navne- og adressebeskyttelse), why the instance is marked with a security label. 
Only personnel using systems in public/official affairs are allowed to see name and address for the citizen, why these information are included in the profile.

<p></p><div style="display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%"><p style="margin-bottom: 0px">Resource "Confidential" </p><p style="margin-bottom: 0px">Profile: <a href="StructureDefinition-dk-core-patient.html">Danish Core Patient Profile</a></p><p style="margin-bottom: 0px">Security Labels: <span title="{http://terminology.hl7.org/CodeSystem/v3-Confidentiality http://terminology.hl7.org/CodeSystem/v3-Confidentiality}">http://terminology.hl7.org/CodeSystem/v3-Confidentiality</span></p></div><p><b>identifier</b>: id: 0908760405</p><p><b>name</b>: Hans Hansen (OFFICIAL)</p><p><b>gender</b>: male</p><p><b>birthDate</b>: 1976-08-09</p><p><b>address</b>: Julianevej 22 6000 Kolding (HOME)</p>
</div>
"""
* text[0].status = #additional
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
# Central vendor neutral repository for FHIR profiles to be used in Denmark
This repo hosts a set of profiles that are intended to be reviewed and refactored by the DK FHIR SIG. Depending on the feedback recieved in form of PR's and issues, this repo is to be the primary place to store profiles.

# Meetings
Meetings are every odd week on mondays 15:00 - 16:00, be sharp or not. Meeting minutes can be found at https://confluence.hl7.org/pages/viewpage.action?pageId=81026436

# Governance
Artifacts found in this repository should be treated as unstable, under continous evaluation, as propsal and not part of the danish national standards unless stated explicitly. Any artifacts that have been found mature enough are submitted to HL7 DK for further approval.

# TL;DR
```every odd week on mondays 15:00 - 16:00 @```

# Webhooks
Webhook has been set up as specified on https://github.com/FHIR/auto-ig-builder


## Building the Implementation Guide

you can build the Implementation Guide (IG) with the [ig publisher](https://confluence.hl7.org/display/FHIR/IG+Publisher+Documentation)

```
wget https://fhir.github.io/latest-ig-publisher/org.hl7.fhir.publisher.jar -O org.hl7.fhir.igpublisher.jar
java -Xms3550m -Xmx3550m -jar org.hl7.fhir.igpublisher.jar -ig ig.ini
```


Current version of the IG is located at http://build.fhir.org/ig/hl7dk/dk-core (HL7 FHIR infrastructure build) and on https://hl7dk.github.io/dk-core/index.html (Github Action triggered build)


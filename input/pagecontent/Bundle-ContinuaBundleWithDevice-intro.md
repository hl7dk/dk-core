The following example shows a real-life recording of a home monitoring blood pressure measurement. Due to the
size and complexity of this example, a bit of background and guidance on the contents will be provided

## Background

In many situations citizens may use personal equipment (their own property or borrowed from a healthcare
provider) to automatically capture and record medical observations. This class of equipment is known by the
term "Personal Health Devices" (PHDs). A number of challenges arise from the complexity of dealing with
diverse consumer-grade Internet-connected equipment used under no clinical supervision:

 - Type, quality, accuracy and provenance of the observations?
 - Systematically recording the state of sensors and relevant events detected during the measurement.
 - Meta information regarding the equipment, the observation, or the context.
 - What is the identity of the patient/citizen/user? Authorization, authentication, etc...
 - Accuracy of timestamps, consistency of timelines etc. In particular when the PHD is used by someone
   traveling around the globe.

### Standardization and Interoperability

In order to deal with these challenges and coordinate the effort across many different standardization bodies,
the [Continua Design Guidelines (CDG)](https://www.pchalliance.org/continua-design-guidelines) has been
created, and the coordination effort continues under the [IHE Personal Connected Health
(PCH)](https://wiki.ihe.net/index.php/Personal_Connected_Health) program. In 2013, Denmark adopted the CDG
as a [reference
architecture](https://sundhedsdatastyrelsen.dk/-/media/sds/filer/rammer-og-retningslinjer/referenceaktitektur-og-it-standarder/referencearkitektur/referencearchitecture-collecting-health-data-citizens.pdf).

The CDG offers guidance to implementors of PHD equipment and related applications, providing a single data
model that may be expressed and exchanged using (and translated back and forth between) many different
container formats and transports:

 - [IEEE 11073 PHD](http://11073.org/)
 - [HL7 FHIR PHD IG](http://hl7.org/fhir/uv/phd/)
 - [HL7 CDA PHMR](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=33)
 - HL7 v2 Messaging

With transports ranging from [Bluetooth Low
Energy](https://www.bluetooth.com/bluetooth-resources/personal-health-devices-transcoding/), NFC, USB,
Internet, to [XDS.b and XDR exchange of PHMR
documents](https://www.itu.int/rec/dologin_pub.asp?lang=e&id=T-REC-H.813-201911-I!!PDF-E&type=items)



## Bundle Overview and Reader's Guide

The example provided here is the data payload transferred from the home of the user over the Internet to a
central collection server at a tele-monitoring service provider. This bundle is a single self-contained
message, demonstrating how a blood pressure measurement is encoded using a FHIR Bundle compliant to *both* the
[HL7 FHIR PHD IG](http://hl7.org/fhir/uv/phd/) *and* the `DkCoreObservation` profiles.

### Bundle Structure and Content

The Bundle contains the following entries:

 - **The Patient** As the bundle must be self-contained, a Patient resource must be included. This is of
   course a `DkCorePatient`.
 - **The Gateway Device** The blood pressure monitor device used in this case is not aware of the identity of
   its user. It will just send the measurement using Bluetooth Low Energy to a compliant gateway. The
   gateway - in this case an Android app - is responsible for adding the identity of the patient, and also for
   checking (and correcting if necessary) the blood pressure monitor's built-in clock, which is used to create
   the observation timestamps.
 - **The PHD** In this case, a blood pressure monitor from A&D was used to create a blood pressure
   measurement.
 - **Battery Level Observation** The A&D blood pressure monitor gauges its own battery every time it is used.
 - **Coincident Timestamp Observation** The Gateway Device reads the clock of the PHD and creates this
   observation of the *current time* of the PHD timestamped using the Gateway's clock (which is supposed to be
   synchronized with a time service). This is a way to detect (and possibly correct) breaches in the timeline.
 - **Blood Pressure Observation** This is a `DkCoreObservation`
 - **Heart Rate Observation** Also a `DkCoreObservation`
 - **Blood Pressure Status Observation** This observation type can be used to report a number of conditions
   during the measurement. In this case, an irregular pulse was detected during the measurement. Some PHDs may
   be able to report different conditions - e.g. that the blood pressure cuff was too loose.
   
 You may also notice that the type of the Bundle is a transaction bundle and that all the entries in the
 bundle are conditional creates using a funny-looking identifier, which is actually the result of a calculated
 function that summarises the resource into a short form (hash), in order to prevent duplicates.


## Narrative Content


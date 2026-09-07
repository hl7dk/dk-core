### Scope and usage

The Danish Core Immunization profile represents an **administered** vaccination. The profile is aligned with Det Danske Vaccinationsregister (DDV), which is the authoritative national register of vaccinations in Denmark, but it is not restricted to DDV: a vaccination administered and recorded in any other Danish context can be exchanged with this profile as well. When the vaccination does originate from DDV, the mapping on the [Mappings](StructureDefinition-dk-core-immunization-mappings.html) tab of this profile is normative for how the DDV elements are carried.

Authoritative DDV XML schemas are published at [wiki.fmk-teknik.dk/fmk:ddv:extensions:e1](https://wiki.fmk-teknik.dk/fmk:ddv:extensions:e1) with target namespace `http://vaccinationsregister.dk/schemas/2013/12/01` (interface 1.4.0 + extension E1). Service delivery is described at [nspop.dk](https://www.nspop.dk/pages/releaseview.action?pageId=31798109).

In dk-core the `patient` element has been constrained to [DkCorePatient](StructureDefinition-dk-core-patient.html) and `performer.actor` to the Danish core profiles for Practitioner, PractitionerRole or Organization.

#### Planned vaccinations are out of scope

DDV exposes recommended/planned vaccinations (`PlannedVaccinations`) alongside administered ones (`Vaccinations`). Only administered vaccinations are in scope for this profile; **planned vaccinations are outside the scope of the Danish Core Immunization profile** and are not represented by it. See [Vaccination courses and next dose](#vaccination-courses-and-next-dose) below for how a planned next dose is expected to be modelled.

#### Status semantics

A registered DDV `Vaccination` is **always** an administered/effectuated vaccination. `ActiveStatus` is **not** a clinical status — it is only used to indicate deletion: a `Vaccination` may exist in several versions with `Status=A` (Active), and when it is deleted the latest version gets `Status=D` (Deleted). The mapping is therefore:

- `ActiveStatus = true` (Status=A) → `status = #completed`. This represents that a vaccination is administered/effectuated.
- `ActiveStatus = false` (Status=D, deleted) → `status = #entered-in-error`. This represents that a vaccination is deleted. Records whose `VaccinationCredibility` is `Slettet` ("deleted") likewise map here.

`status = #not-done` and `statusReason` are **not derivable from DDV** and are not used by this profile. A citizen who declines or omits a planned/recommended vaccination leaves no `Vaccination` record — a refusal is never recorded there — and because the history of `PlannedVaccinations` cannot be retrieved via the interface, a refusal cannot be inferred from the planned side either. Consumers must therefore not infer a refusal from the absence of a record.

#### Private-marking (NegativeConsentIndicator)

`NegativeConsentIndicator = true` is **not** a refusal and does **not** change `status` — the vaccination is still effectuated on equal footing with every other registration. The flag indicates that the citizen has chosen to **private-mark** the specific vaccination: it must not be made visible unless the responsible health professional invokes *værdispring* (break-glass) or holds the citizen's consent.

This is modelled the same way dk-core marks confidential data on [DkCorePatient](StructureDefinition-dk-core-patient.html): a security label

```
meta.security = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#R   // "Restricted"
```

A private-marked vaccination is a **complete** registration. It carries the same elements — `performer`, `lotNumber`, notes — as any other vaccination; only its visibility differs. Implementers must not treat private-marking as a reason to strip data from the resource.

Two points are deliberately left to the implementer, because a profile cannot express them:

- **Consuming-application behaviour.** Systems consuming dk-core Immunization resources are expected to treat a `#R` (Restricted) security label as a private-mark: signal to the clinician that something is hidden, suppress it from normal display, and release it only under *værdispring* or consent. The profile can label the data, but it cannot enforce this behaviour in the consuming application.
- **The access threshold itself.** This profile intentionally does not — and cannot — define when *værdispring* is legitimate. That threshold follows from Sundhedsloven and the guidance of the responsible authorities, not from the profile. Nobody should assume the profile covers it.

A private-marked vaccination still counts fully in vaccination coverage statistics; it is hidden from the individual clinician, not from the register.

#### Batch numbers

`lotNumber` carries the batch number of the administered product (DDV `Vaccination.BatchNumber`). Batch numbers matter for tracing adverse events and product defects, but that traceability does **not** rest on the consumer of a dk-core Immunization resource: DDV is the centrally governed system of record for vaccinations, all batch numbers and all other registration data reside there, and DDV is responsible for notifying and carrying out any investigation should it come to that.

Whether the batch number is exposed to a given consumer is a separate question from whether it is recorded. It is therefore safe for this profile not to require `lotNumber` to be present at all times, and the element is left optional. Note that `MustSupport` is deliberately **not** used here: correct use of `MustSupport` requires a more specific use context than dk-core provides, and it is not used anywhere in dk-core. An implementation guide deriving from dk-core for a concrete use case is the right place to raise expectations on `lotNumber`.

The same reasoning applies to `performer`. A structured reference (resolved from the DDV `AuthorisationIdentifier` or the effectuating organisation) is preferred over a free-text `performer.actor.display`. The treating clinic itself rarely needs to know who administered a dose, but a structured, resolvable performer is what makes it possible to identify the administering party in the event of an adverse event or death — which is exactly what Styrelsen for Patientsikkerhed would need. Use `actor.display` only when no structured reference is obtainable.

#### Vaccination courses and next dose

`protocolApplied` carries the vaccination course or series that an administration is part of. For a DDV-sourced vaccination this information is found in `Vaccination.EffectuatedPlannedItem`, which maps to `protocolApplied` in this profile.

A **computable "next dose due"** is not part of this profile, and it should not be added as an extension — for interval or multi-dose vaccines such as Twinrix that information is clinically important, but modelling it on the Immunization resource is not compliant FHIR design. `Immunization` records a dose that *was* given; a dose that is *due* is a plan. The recommended design is:

- organise the vaccination treatment as a whole in a plan element — a `ServiceRequest` or a `CarePlan`;
- have each `Immunization` (the doses actually given) reference that plan;
- have an `Encounter` or `Appointment` (the next dose) reference the same plan.

DDV's `CoverageDuration` is not a structured duration in the interface and is carried as free text in `note`; it is not a substitute for a plan element and must not be parsed as one.

#### IsPrevious, ConfirmedByPrescriptionServer and credibility

DDV carries three registration-quality flags that have no dedicated element on `Immunization`. All three are carried in `note`:

- **`IsPrevious = true`** → `note`. Indicates that the actual effectuation happened at a different time, place and/or by a different person than the one performing the registration — e.g. vaccinations received abroad or before registration in DDV became legally required. Such previous vaccinations may be created by health professionals as well as by the citizen themselves; this is reflected in `VaccinationCredibility`.
- **`ConfirmedByPrescriptionServer`** → `note`. Has only historical interest and primarily reflects the data quality of the registration. Comparable information can be read from `VaccinationCredibility`.
- **`VaccinationCredibility`** → `note`. The credibility/origin of the record, e.g. `Oprettet af borger` (created by the citizen).

Many of the non-mandatory data elements inherited from the generic profile do exist in DDV, but remain optional here and will only be populated in certain cases.

#### Vaccine coding

The vaccine is carried as free text in `vaccineCode.text` (DDV `VaccineName`) together with up to three codings, sliced on `vaccineCode.coding`:

- **`ATC`** — the WHO ATC code. The ATC code must descend from J07, given that J07 functions as the root supertype concept for vaccines in the [ATC classification](https://www.who.int/tools/atc-ddd-toolkit/atc-classification).
- **`SCTVaccineCode`** — a SNOMED CT code for the vaccine, which MAY be added where known.
- **`DdvVaccine`** — the SSI numeric vaccine identifier from DDV.

Target diseases are carried in `protocolApplied.targetDisease`, each with its own coding.

#### Mapping from DDV

The complete field-by-field mapping from the DDV `Vaccination` structure to this profile is published on the [Mappings](StructureDefinition-dk-core-immunization-mappings.html) tab of this profile, so that there is a single source of truth for it.

#### Identifier namespace note

Earlier drafts of this profile used `https://www.sundhed.dk/vaccination/...` URLs deduced from the sundhed.dk JSON proxy. Those URLs are not registered anywhere and have been replaced with URIs rooted at the authoritative DDV XML schema namespace (`http://vaccinationsregister.dk/schemas/2013/12/01`). Consumers proxying DDV via sundhed.dk should normalise their identifier systems to these authoritative URIs when producing dk-core resources.

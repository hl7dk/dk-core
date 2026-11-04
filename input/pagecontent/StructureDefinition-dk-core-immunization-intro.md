### Scope and usage

The Danish Core Immunization profile represents an **administered** vaccination — a dose that was actually given. Like the other dk-core profiles it is not bound to a particular source system: any Danish system that records an administered vaccination can exchange it with this profile.

Det Danske Vaccinationsregister (DDV) is the central, authoritative register of vaccinations in Denmark, and in practice most vaccination data exchanged in a Danish context either originates from or is reported to DDV. Everything that follows specifically from that — how the DDV elements are carried, and which parts of the DDV data model cannot be represented at all — is collected in [Det Danske Vaccinationsregister (DDV)](#det-danske-vaccinationsregister-ddv) at the bottom of this page, so that the general documentation of the profile stays system-independent.

#### Status

The profile represents administered vaccinations, so in practice only two of the `status` values occur:

- `completed` — the vaccination was administered.
- `entered-in-error` — the registration has been retracted or deleted.

`status = #not-done` together with `statusReason` is how FHIR expresses that a vaccination was *not* given. A source system that only records administered vaccinations cannot produce that combination, and it cannot be derived after the fact. Consumers must therefore not infer a refusal or an omission from the absence of an `Immunization` resource.

#### Confidentiality and private-marking

In Denmark, a citizen may choose to **private-mark** a specific vaccination. A private-marked vaccination is administered on equal footing with every other registration — private-marking is **not** a refusal and does **not** change `status`. It means only that the record must not be made visible unless the responsible health professional invokes *værdispring* (break-the-glass) or holds the citizen's consent.

This is modelled the same way dk-core marks confidential data on [DkCorePatient](StructureDefinition-dk-core-patient.html): a security label

```
meta.security = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#R   // "Restricted"
```

A private-marked vaccination is a **complete** registration. It carries the same elements — `performer`, `lotNumber`, notes — as any other vaccination; only its visibility differs. Implementers must not treat private-marking as a reason to strip data from the resource.

Two points are deliberately left to the implementer, because a profile cannot express them:

- **Consuming-application behaviour.** Systems consuming dk-core Immunization resources are expected to treat a `#R` (Restricted) security label as a private-mark: signal to the clinician that something is hidden, suppress it from normal display, and release it only under *værdispring* or consent. The profile can label the data, but it cannot enforce this behaviour in the consuming application.
- **The access threshold itself.** This profile intentionally does not — and cannot — define when *værdispring* is legitimate. That threshold follows from Sundhedsloven and the guidance of the responsible authorities, not from the profile. Nobody should assume the profile covers it.

Private-marking affects what an individual clinician sees, not what the register knows: a private-marked vaccination still counts fully in vaccination coverage statistics.

#### Vaccination courses and next dose

`protocolApplied` carries the vaccination course or series that an administration is part of.

A **computable "next dose due"** is not part of this profile, and it should not be added as an extension — for interval or multi-dose vaccines such as Twinrix that information is clinically important, but modelling it on the `Immunization` resource is not compliant FHIR design. `Immunization` records a dose that *was* given; a dose that is *due* is a plan. The recommended design is:

- organise the vaccination treatment as a whole in a plan element — a `ServiceRequest` or a `CarePlan`;
- link each `Immunization` (the doses actually given) to that plan. FHIR R4 `Immunization` has no element for referencing a plan (`basedOn` only exists from R5), so the link is made from the plan side, e.g. `CarePlan.activity.outcomeReference` pointing to the `Immunization`;
- have an `Encounter` or `Appointment` (the next dose) reference the same plan.

This is an implementation concern rather than a profile concern, and it is documented here so that implementers do not reach for an extension on `Immunization` instead.

#### Vaccine coding

The vaccine is carried as free text in `vaccineCode.text` together with up to three codings, sliced on `vaccineCode.coding`:

- **`ATC`** — the WHO ATC code. The ATC code must descend from J07, given that J07 functions as the root supertype concept for vaccines in the [ATC classification](https://www.who.int/tools/atc-ddd-toolkit/atc-classification). This is enforced, not merely stated: the slice carries a *required* binding to [VaccineATCCodes](ValueSet-dk-core-vaccine-atc-codes.html), which is the intensional expansion of everything under J07, so a non-vaccine ATC code fails validation.
- **`SCTVaccineCode`** — a SNOMED CT code for the vaccine, which MAY be added where known.
- **`DdvVaccine`** — the numeric vaccine identifier assigned by SSI and used in DDV; see the [Mappings](StructureDefinition-dk-core-immunization-mappings.html) tab.

Target diseases are carried in `protocolApplied.targetDisease`, each with its own coding.

Many of the non-mandatory data elements inherited from the generic FHIR Immunization resource remain optional here and will only be populated in certain cases.

---

### Det Danske Vaccinationsregister (DDV)

This section is **DDV-specific**. It documents how the Danish national vaccination register maps onto the profile, and is relevant only when the vaccination originates from — or is reported to — DDV. Nothing in this section constrains an implementation that does not use DDV.

Authoritative DDV XML schemas are published at [wiki.fmk-teknik.dk/fmk:ddv:extensions:e1](https://wiki.fmk-teknik.dk/fmk:ddv:extensions:e1) with target namespace `http://vaccinationsregister.dk/schemas/2013/12/01` (interface 1.4.0 + extension E1). Service delivery is described at [nspop.dk](https://www.nspop.dk/pages/releaseview.action?pageId=31798109). The complete field-by-field mapping is published on the [Mappings](StructureDefinition-dk-core-immunization-mappings.html) tab of this profile, which is the single source of truth for it; this section only covers the points where the DDV data model has a consequence for the profile.

#### Administered vaccinations, and why planned ones are out of scope

DDV exposes administered vaccinations (`Vaccinations`) and recommended/planned vaccinations (`PlannedVaccinations`) through separate services. Only administered vaccinations are in scope for this profile; **planned vaccinations are outside the scope of the Danish Core Immunization profile**.

This is also what makes `status = #not-done` / `statusReason` underivable in a DDV context: a citizen who declines or omits a recommended vaccination leaves no `Vaccination` record — a refusal is never written there — and the history of `PlannedVaccinations` cannot be retrieved via the interface, so the refusal cannot be inferred from the planned side either.

#### Where the field-level mapping lives

The element-by-element correspondence — `ActiveStatus` as a deletion marker (and `Slettet` credibility), `VaccinationVersionIdentifier` and `meta.versionId`, `NegativeConsentIndicator` as private-marking, `BatchNumber`, the effectuator fields, `EffectuatedPlannedItem` and `CoverageDuration`, `IsPrevious` / `VaccinationCredibility` / `ConfirmedByPrescriptionServer`, and the unmapped `SSIDrug` — is documented on the [Mappings](StructureDefinition-dk-core-immunization-mappings.html) tab and is not repeated here. Note that:

- A DDV `Vaccination` is **always** an administered vaccination, and a private-marked one is not a refusal and does not change `status` — see [Confidentiality and private-marking](#confidentiality-and-private-marking).
- DDV, as the centrally governed system of record, carries responsibility for traceability of adverse events and product defects.
- `CoverageDuration` is not a substitute for a plan element and must not be parsed as a computable "next dose due" — see [Vaccination courses and next dose](#vaccination-courses-and-next-dose).

#### Identifying DDV as the source system

A registration sourced from DDV should carry

```
meta.source = http://vaccinationsregister.dk/schemas/2013/12/01
```

the authoritative DDV XML schema namespace. DDV does not publish a separate canonical URI for the register as a system, so the schema namespace serves as its identifier; this is the same root the DDV identifier and coding systems are built on.

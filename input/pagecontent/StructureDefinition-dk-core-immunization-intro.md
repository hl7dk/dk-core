### Scope and usage

The Danish Core Immunization profile represents an **administered** vaccination — a dose that was actually given. Like the other dk-core profiles it is not bound to a particular source system: any Danish system that records an administered vaccination can exchange it with this profile.

Det Danske Vaccinationsregister (DDV) is the central, authoritative register of vaccinations in Denmark, and in practice most vaccination data exchanged in a Danish context either originates from or is reported to DDV. Everything that follows specifically from that — how the DDV elements are carried, and which parts of the DDV data model cannot be represented at all — is collected in [Det Danske Vaccinationsregister (DDV)](#det-danske-vaccinationsregister-ddv) at the bottom of this page, so that the general documentation of the profile stays system-independent.

In dk-core the `patient` element has been constrained to [DkCorePatient](StructureDefinition-dk-core-patient.html) and `performer.actor` to the Danish core profiles for Practitioner, PractitionerRole or Organization.

#### Status

The profile represents administered vaccinations, so in practice only two of the `status` values occur:

- `completed` — the vaccination was administered.
- `entered-in-error` — the registration has been retracted or deleted.

`status = #not-done` together with `statusReason` is how FHIR expresses that a vaccination was *not* given. A source system that only records administered vaccinations cannot produce that combination, and it cannot be derived after the fact. Consumers must therefore not infer a refusal or an omission from the absence of an `Immunization` resource.

#### Provenance of the registration

Who reported a vaccination matters clinically — a dose recorded by the clinician who gave it does not carry the same weight as one a citizen recalls having received abroad years earlier. FHIR R4 has dedicated elements for this, and this profile uses them rather than free text:

- `primarySource` (boolean) — whether the record was captured by the party that administered the dose.
- `reportOrigin` (CodeableConcept) — where the information came from when it was not. Per base FHIR this should not be populated when `primarySource = true`. The base binding to [`immunization-origin`](http://hl7.org/fhir/R4/valueset-immunization-origin.html) is *example* strength, so a source-specific origin code may be carried alongside or the source's own wording placed in `reportOrigin.text`.

Note that FHIR R5 replaced `reportOrigin` with a `CodeableReference`-typed `informationSource`. Because dk-core publishes against R4, the native R4 elements are used; a cross-version backport extension for `informationSource` is deliberately **not** introduced, since it would add nothing that `reportOrigin` cannot express for Danish sources.

`meta.source` identifies the system a registration originates from, which lets a consumer distinguish a nationally registered vaccination from a locally captured one.

#### Confidentiality and private-marking

A citizen may choose to **private-mark** a specific vaccination. A private-marked vaccination is administered on equal footing with every other registration — private-marking is **not** a refusal and does **not** change `status`. It means only that the record must not be made visible unless the responsible health professional invokes *værdispring* (break-glass) or holds the citizen's consent.

This is modelled the same way dk-core marks confidential data on [DkCorePatient](StructureDefinition-dk-core-patient.html): a security label

```
meta.security = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#R   // "Restricted"
```

A private-marked vaccination is a **complete** registration. It carries the same elements — `performer`, `lotNumber`, notes — as any other vaccination; only its visibility differs. Implementers must not treat private-marking as a reason to strip data from the resource.

Two points are deliberately left to the implementer, because a profile cannot express them:

- **Consuming-application behaviour.** Systems consuming dk-core Immunization resources are expected to treat a `#R` (Restricted) security label as a private-mark: signal to the clinician that something is hidden, suppress it from normal display, and release it only under *værdispring* or consent. The profile can label the data, but it cannot enforce this behaviour in the consuming application.
- **The access threshold itself.** This profile intentionally does not — and cannot — define when *værdispring* is legitimate. That threshold follows from Sundhedsloven and the guidance of the responsible authorities, not from the profile. Nobody should assume the profile covers it.

Private-marking affects what an individual clinician sees, not what the register knows: a private-marked vaccination still counts fully in vaccination coverage statistics.

#### Batch number

`lotNumber` carries the batch number of the administered product. Batch numbers are clinically important for tracing adverse events and product defects, and the batch number is normally physically available on the vaccine at the time of administration.

The element is nevertheless **optional** in this profile, and `MustSupport` is deliberately **not** used on it. Two reasons:

- Correct use of `MustSupport` requires a more specific use context than dk-core provides, and it is consequently not used anywhere in dk-core. An implementation guide deriving from dk-core for a concrete use case is the right place to raise expectations on `lotNumber`.
- Whether the batch number is exposed to a given consumer is a separate question from whether it is recorded at the source. Where a centrally governed register stands behind the registration, traceability is that register's responsibility rather than the individual resource consumer's — that is the case for DDV, see [batch numbers and traceability](#batch-numbers-and-traceability) below. Sources with no such register behind them should not read this as licence to drop the batch number.

#### Performer

`performer.actor` is constrained to the Danish core Practitioner, PractitionerRole and Organization profiles. A **structured reference is preferred** over a free-text `performer.actor.display`; use `display` only when no resolvable reference is obtainable.

The reason is worth stating explicitly, because it is not the treating clinic's own need: a clinic rarely cares who administered a previous dose. A structured, resolvable performer is what makes it possible to identify the administering party in the event of an adverse event or a death — which is exactly what Styrelsen for Patientsikkerhed would need.

Both forms are illustrated in the examples: `JohnImmunizationInfluvac` carries a free-text `display`, `JohnImmunizationNegativeConsent` a structured `Reference`.

#### Vaccination courses and next dose

`protocolApplied` carries the vaccination course or series that an administration is part of.

A **computable "next dose due"** is not part of this profile, and it should not be added as an extension — for interval or multi-dose vaccines such as Twinrix that information is clinically important, but modelling it on the `Immunization` resource is not compliant FHIR design. `Immunization` records a dose that *was* given; a dose that is *due* is a plan. The recommended design is:

- organise the vaccination treatment as a whole in a plan element — a `ServiceRequest` or a `CarePlan`;
- have each `Immunization` (the doses actually given) reference that plan;
- have an `Encounter` or `Appointment` (the next dose) reference the same plan.

This is an implementation concern rather than a profile concern, and it is documented here so that implementers do not reach for an extension on `Immunization` instead.

#### Vaccine coding

The vaccine is carried as free text in `vaccineCode.text` together with up to three codings, sliced on `vaccineCode.coding`:

- **`ATC`** — the WHO ATC code. The ATC code must descend from J07, given that J07 functions as the root supertype concept for vaccines in the [ATC classification](https://www.who.int/tools/atc-ddd-toolkit/atc-classification). This is enforced, not merely stated: the slice carries a *required* binding to [VaccineATCCodes](ValueSet-dk-core-vaccine-atc-codes.html), which is the intensional expansion of everything under J07, so a non-vaccine ATC code fails validation.
- **`SCTVaccineCode`** — a SNOMED CT code for the vaccine, which MAY be added where known.
- **`DdvVaccine`** — the numeric vaccine identifier assigned by SSI and used in DDV; see below.

Target diseases are carried in `protocolApplied.targetDisease`, each with its own coding.

Many of the non-mandatory data elements inherited from the generic FHIR Immunization resource remain optional here and will only be populated in certain cases.

---

### Det Danske Vaccinationsregister (DDV)

This section is **DDV-specific**. It documents how the Danish national vaccination register maps onto the profile, and is relevant only when the vaccination originates from — or is reported to — DDV. Nothing in this section constrains an implementation that does not use DDV.

Authoritative DDV XML schemas are published at [wiki.fmk-teknik.dk/fmk:ddv:extensions:e1](https://wiki.fmk-teknik.dk/fmk:ddv:extensions:e1) with target namespace `http://vaccinationsregister.dk/schemas/2013/12/01` (interface 1.4.0 + extension E1). Service delivery is described at [nspop.dk](https://www.nspop.dk/pages/releaseview.action?pageId=31798109). The complete field-by-field mapping is published on the [Mappings](StructureDefinition-dk-core-immunization-mappings.html) tab of this profile, which is the single source of truth for it; this section only covers the points where the DDV data model has a consequence for the profile.

#### Administered vaccinations, and why planned ones are out of scope

DDV exposes administered vaccinations (`Vaccinations`) and recommended/planned vaccinations (`PlannedVaccinations`) through separate services. Only administered vaccinations are in scope for this profile; **planned vaccinations are outside the scope of the Danish Core Immunization profile**.

This is also what makes `status = #not-done` / `statusReason` underivable in a DDV context: a citizen who declines or omits a recommended vaccination leaves no `Vaccination` record — a refusal is never written there — and the history of `PlannedVaccinations` cannot be retrieved via the interface, so the refusal cannot be inferred from the planned side either.

#### ActiveStatus is a deletion marker, not a clinical status

A registered DDV `Vaccination` is **always** an administered/effectuated vaccination. `ActiveStatus` is not a clinical status: a `Vaccination` may exist in several versions with `Status=A` (Active), and when it is deleted the latest version gets `Status=D` (Deleted). Hence:

- `ActiveStatus = true` (Status=A) → `status = #completed`. This represents that a vaccination is administered/effectuated.
- `ActiveStatus = false` (Status=D, deleted) → `status = #entered-in-error`. This represents that a vaccination is deleted. Records whose `VaccinationCredibility` is `Slettet` ("deleted") likewise map here.

`Vaccination.VaccinationVersionIdentifier` is the revision number of the record, carried in `meta.versionId`. DDV uses it to detect that a record has been changed by someone else since it was read and to reject the update if so; this corresponds to FHIR's own versioning mechanism, see [Managing Resource Contention](https://hl7.org/fhir/R4/http.html#concurrency).

#### NegativeConsentIndicator is the private-marking

`Vaccination.NegativeConsentIndicator = true` is the DDV representation of the citizen private-marking described under [Confidentiality and private-marking](#confidentiality-and-private-marking). It is **not** a refusal and does not change `status`; it maps to `meta.security = v3-Confidentiality#R` (Restricted).

#### Batch numbers and traceability

`Vaccination.BatchNumber` maps to `lotNumber`. The batch number is always recorded in DDV, regardless of what a given exchange exposes, and DDV — as the centrally governed system of record — carries the responsibility for tracing adverse events and product defects and for any resulting investigation. This is the register that the general reasoning under [Batch number](#batch-number) refers to.

#### Effectuator

`Vaccination.Effectuated.EffectuatedByName` is a free text of at most 200 characters and maps to `performer.actor.display`. Where the structured fields are available — `Effectuated.AuthorisationIdentifier` (autorisationsnummer), `Effectuated.EffectuatedByOrganisationName` / `Number` / `Type` — they should be resolved to a `Reference` to DkCorePractitioner, DkCorePractitionerRole or DkCoreOrganization instead.

#### Course context and CoverageDuration

`Vaccination.EffectuatedPlannedItem` carries course/series context when the effectuation was part of a planned vaccination course, and maps to `protocolApplied` in this profile.

`Vaccination.CoverageDuration` is not a structured duration in the DDV interface and is carried as free text in `note`. It is not a substitute for a plan element and must not be parsed as a computable "next dose due" — see [Vaccination courses and next dose](#vaccination-courses-and-next-dose).

#### Registration provenance and quality flags

DDV's `IsPrevious` and `VaccinationCredibility` express exactly what `primarySource` and `reportOrigin` are for, so they are carried there rather than in `note`:

- **`IsPrevious = true`** → `primarySource = false`. It indicates that the actual effectuation happened at a different time, place and/or by a different person than the one performing the registration — e.g. vaccinations received abroad or before registration in DDV became legally required. Such previous vaccinations may be created by health professionals as well as by the citizen themselves; which of the two is reflected in `VaccinationCredibility`. A registration made by the party that administered the dose is `primarySource = true`.
- **`VaccinationCredibility`** → `reportOrigin` when `primarySource = false`. The enum values are `Oprettet af læge / medhjælp`, `Oprettet af borger`, `Udleveret på apotek`, `Udleveret på apotek og godkendt af læge`, `Oprettet af læge eller oprettet af borger og godkendt af læge`, `Oprettet på baggrund af data fra Sygesikringsregisteret` and `Slettet`. Code with an `immunization-origin` concept where one corresponds — `Oprettet af borger` is `recall`, `Oprettet på baggrund af data fra Sygesikringsregisteret` is `jurisdiction` — and carry the DDV wording in `reportOrigin.text`. `Slettet` is a deletion, not an origin, and maps to `status = #entered-in-error` as described above.
- **`ConfirmedByPrescriptionServer`** is deliberately **not** mapped. It has only historical interest, reflects the data quality of the registration, and says nothing that `VaccinationCredibility` does not already say through `reportOrigin` — so it is dropped rather than parked in `note`.

`JohnImmunizationCitizenReported` illustrates a citizen-reported previous vaccination.

#### Identifying DDV as the source system

A registration sourced from DDV should carry

```
meta.source = http://vaccinationsregister.dk/schemas/2013/12/01
```

the authoritative DDV XML schema namespace. DDV does not publish a separate canonical URI for the register as a system, so the schema namespace serves as its identifier; this is the same root the DDV identifier and coding systems are built on.

#### Vaccine element

DDV delivers the vaccine as a structured `Vaccine` element, which is what the three `vaccineCode.coding` slices described under [Vaccine coding](#vaccine-coding) exist to carry. Its `SSIDrug` list — SSI-defined medicinal products — has no home on the R4 `Immunization` resource and is not mapped.

#### Identifier namespaces

Earlier drafts of this profile used `https://www.sundhed.dk/vaccination/...` URLs deduced from the sundhed.dk JSON proxy. Those URLs are not registered anywhere and have been replaced with URIs rooted at the authoritative DDV XML schema namespace (`http://vaccinationsregister.dk/schemas/2013/12/01`). Consumers proxying DDV via sundhed.dk should normalise their identifier systems to these authoritative URIs when producing dk-core resources.

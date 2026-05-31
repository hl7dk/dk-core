### Scope and usage

The Danish Core Medication profile describes a medicinal product, in particular as it appears in the Danish Shared Medication Record (Fælles Medicinkort, FMK). It is used when a MedicationRequest or MedicationStatement needs to reference a reusable, structured drug representation — for example, an FMK `DrugMedication.Drug` with form, strength and active-substance information.

Most Danish systems today will be able to inline the drug as a `CodeableConcept` on [DkCoreMedicationRequest](StructureDefinition-dk-core-medicationrequest.html) / [DkCoreMedicationStatement](StructureDefinition-dk-core-medicationstatement.html). This profile is offered for the cases where structured data about the product itself (ingredients, strength, form, manufacturer) is valuable, or where the same product is referenced from multiple requests/statements.

#### Mapping from FMK

In FMK, a `DrugMedication` (lægemiddelordination) contains exactly one `Drug` element, and the drug's attributes (ATC, form, strength, substances, varenummer) are children of `Drug`:

| FMK field | FHIR target |
| --- | --- |
| `DrugMedication.Drug.ATC.Code` / `ATC.Text` | `code.coding[ATC]` (`http://www.whocc.no/atc`) |
| `DrugMedication.Drug.Substances.ActiveSubstance` | `code.coding[ActiveSubstance]` + `ingredient.itemCodeableConcept` |
| `DrugMedication.Drug.Identifier` (varenummer, LMS01 field 1, 11-digit) | `code.coding[Varenummer]` |
| `DrugMedication.Drug.Name` (with Form and Strength) | `code.text` |
| `DrugMedication.Drug.Form` (Code + Text) | `form` |
| `DrugMedication.Drug.Strength` (Value + UnitCode + UnitText, or Text) | `ingredient.strength` |

The authoritative FMK schemas are published at [wiki.fmk-teknik.dk](https://wiki.fmk-teknik.dk/fmk:extensions:e5) (XML namespace `http://www.dkma.dk/medicinecard/xml.schema/2015/06/01`).

#### Relationship to HL7 Europe Base
This profile is deliberately compatible with [Medication (EU core)](https://build.fhir.org/ig/hl7-eu/base/StructureDefinition-medication-eu-core.html) — it uses the same general shape (ATC as a sliced coding, ingredient-based strength) so that Danish content can be promoted to EU-wide exchanges without restructuring.

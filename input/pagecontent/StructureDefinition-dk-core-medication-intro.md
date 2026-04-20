### Scope and usage

The Danish Core Medication profile describes a medicinal product, in particular as it appears in the Danish Shared Medication Record (Fælles Medicinkort, FMK). It is used when a MedicationRequest or MedicationStatement needs to reference a reusable, structured drug representation — for example, an FMK `DrugMedication` with form, strength and active substance information.

Most Danish systems today will be able to inline the drug as a `CodeableConcept` on [DkCoreMedicationRequest](StructureDefinition-dk-core-medicationrequest.html) / [DkCoreMedicationStatement](StructureDefinition-dk-core-medicationstatement.html). This profile is offered for the cases where structured data about the product itself (ingredients, strength, form, manufacturer) is valuable, or where the same product is referenced from multiple requests/statements.

#### Mapping from FMK

| FMK field | FHIR target |
| --- | --- |
| `DrugMedication.AtcCode` / `AtcText` | `code.coding[ATC]` (`http://www.whocc.no/atc`) |
| `DrugMedication.ActiveSubstance` | `code.coding[ActiveSubstance]` + `ingredient.itemCodeableConcept` |
| `DrugMedication` (name with form and strength) | `code.text` |
| `DrugMedication.Form` | `form` (free text allowed) |
| `DrugMedication.Strength` | `ingredient.strength` |

#### Relationship to HL7 Europe Base
This profile is deliberately compatible with [Medication (EU core)](https://build.fhir.org/ig/hl7-eu/base/StructureDefinition-medication-eu-core.html) — it uses the same general shape (ATC as a sliced coding, ingredient-based strength) so that Danish content can be promoted to EU-wide exchanges without restructuring.

# Access Type - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Access Type**

## Extension: Access Type 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/access-type | *Version*:0.2.0 |
| Draft as of 2025-12-03 | *Computable Name*:AccessType |

| | | |
| :--- | :--- | :--- |
| Access type code associated with downloads affected by this Access Policy ( open | registered | controlled ) |

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [NCPI Research Access Policy](StructureDefinition-ncpi-research-access-policy.md)
* Examples for this Extension: [Consent/gregor-gru-consent](Consent-gregor-gru-consent.md), [Consent/kf-gru-dac-consent](Consent-kf-gru-dac-consent.md), [Consent/kf-gru-dbgap-consent](Consent-kf-gru-dbgap-consent.md), [Consent/kf-gsr-allowed-access](Consent-kf-gsr-allowed-access.md) and [Consent/kf-registered-allowed-access](Consent-kf-registered-allowed-access.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/access-type)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-access-type.csv), [Excel](StructureDefinition-access-type.xlsx), [Schematron](StructureDefinition-access-type.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "access-type",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/access-type",
  "version" : "0.2.0",
  "name" : "AccessType",
  "title" : "Access Type",
  "status" : "draft",
  "date" : "2025-12-03T22:26:51+00:00",
  "publisher" : "NCPI FHIR Working Group",
  "contact" : [
    {
      "name" : "NCPI FHIR Working Group",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://www.ncpi-acc.org/about/working-groups"
        },
        {
          "system" : "email",
          "value" : "ncpi-fhir-ig@googlegroups.com"
        }
      ]
    }
  ],
  "description" : "Access type code associated with downloads affected by this Access Policy ( open | registered | controlled )",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    }
  ],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [
    {
      "type" : "element",
      "expression" : "Consent"
    }
  ],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Extension",
        "path" : "Extension",
        "short" : "Access Type",
        "definition" : "Access type code associated with downloads affected by this Access Policy ( open | registered | controlled )"
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/access-type"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ],
        "binding" : {
          "strength" : "required",
          "valueSet" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/research-data-access-type-vs"
        }
      }
    ]
  }
}

```

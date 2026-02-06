# Any additional modifiers for this condition, such as severity. - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Any additional modifiers for this condition, such as severity.**

## Extension: Any additional modifiers for this condition, such as severity. 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/other-condition-modifiers | *Version*:0.2.0 |
| Draft as of 2026-02-06 | *Computable Name*:OtherConditionModifiers |

Any additional modifiers for this condition, such as severity.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [NCPI Conditon Summary](StructureDefinition-ncpi-condition-summary.md)
* Examples for this Extension: [Condition/GSS123456-condition-summary](Condition-GSS123456-condition-summary.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/other-condition-modifiers)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-other-condition-modifiers.csv), [Excel](StructureDefinition-other-condition-modifiers.xlsx), [Schematron](StructureDefinition-other-condition-modifiers.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "other-condition-modifiers",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/other-condition-modifiers",
  "version" : "0.2.0",
  "name" : "OtherConditionModifiers",
  "title" : "Any additional modifiers for this condition, such as severity.",
  "status" : "draft",
  "date" : "2026-02-06T18:07:39+00:00",
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
  "description" : "Any additional modifiers for this condition, such as severity.",
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
      "expression" : "Condition"
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
        "short" : "Any additional modifiers for this condition, such as severity.",
        "definition" : "Any additional modifiers for this condition, such as severity."
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/other-condition-modifiers"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "short" : "Any additional modifiers for this condition, such as severity.",
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ]
      }
    ]
  }
}

```

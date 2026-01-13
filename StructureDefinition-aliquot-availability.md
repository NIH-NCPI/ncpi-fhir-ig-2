# Availability Status of Aliquot - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Availability Status of Aliquot**

## Extension: Availability Status of Aliquot 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/aliquot-availability | *Version*:0.2.0 |
| Draft as of 2026-01-13 | *Computable Name*:AliquotAvailability |

Availability Status of Aliquot

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [NCPI Sample](StructureDefinition-ncpi-sample.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/aliquot-availability)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-aliquot-availability.csv), [Excel](StructureDefinition-aliquot-availability.xlsx), [Schematron](StructureDefinition-aliquot-availability.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "aliquot-availability",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/aliquot-availability",
  "version" : "0.2.0",
  "name" : "AliquotAvailability",
  "title" : "Availability Status of Aliquot",
  "status" : "draft",
  "date" : "2026-01-13T18:03:13+00:00",
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
  "description" : "Availability Status of Aliquot",
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
      "expression" : "Specimen.container"
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
        "short" : "Availability Status of Aliquot",
        "definition" : "Availability Status of Aliquot"
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/aliquot-availability"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "short" : "Can this Sample be requested for further analysis?",
        "type" : [
          {
            "code" : "code"
          }
        ]
      }
    ]
  }
}

```

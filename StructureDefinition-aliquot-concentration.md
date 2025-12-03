# Concentration of the Aliquot - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Concentration of the Aliquot**

## Extension: Concentration of the Aliquot 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/aliquot-concentration | *Version*:0.2.0 |
| Draft as of 2025-12-03 | *Computable Name*:AliquotConcentration |

Concentration of the Aliquot

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [NCPI Sample](StructureDefinition-ncpi-sample.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/aliquot-concentration)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-aliquot-concentration.csv), [Excel](StructureDefinition-aliquot-concentration.xlsx), [Schematron](StructureDefinition-aliquot-concentration.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "aliquot-concentration",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/aliquot-concentration",
  "version" : "0.2.0",
  "name" : "AliquotConcentration",
  "title" : "Concentration of the Aliquot",
  "status" : "draft",
  "date" : "2025-12-03T18:37:31+00:00",
  "publisher" : "NCPI FHIR Working Group",
  "contact" : [
    {
      "name" : "NCPI FHIR Working Group",
      "telecom" : [
        {
          "system" : "url",
          "value" : "http://example.org/example-publisher"
        },
        {
          "system" : "email",
          "value" : "ncpi-fhir-ig@googlegroups.com"
        }
      ]
    }
  ],
  "description" : "Concentration of the Aliquot",
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
        "short" : "Concentration of the Aliquot",
        "definition" : "Concentration of the Aliquot"
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/aliquot-concentration"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "short" : "Specify the concentration of the aliquot",
        "type" : [
          {
            "code" : "Quantity"
          }
        ]
      }
    ]
  }
}

```

# Research Population - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Research Population**

## Extension: Research Population 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-population | *Version*:0.2.0 |
| Draft as of 2025-12-03 | *Computable Name*:ResearchPopulation |

Code describing the population (CDC)

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [NCPI Participant](StructureDefinition-ncpi-participant.md)
* Examples for this Extension: [Patient/GSS123456](Patient-GSS123456.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/research-population)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-research-population.csv), [Excel](StructureDefinition-research-population.xlsx), [Schematron](StructureDefinition-research-population.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "research-population",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-population",
  "version" : "0.2.0",
  "name" : "ResearchPopulation",
  "title" : "Research Population",
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
  "description" : "Code describing the population (CDC)",
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
      "expression" : "Patient"
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
        "short" : "Research Population",
        "definition" : "Code describing the population (CDC)"
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-population"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "type" : [
          {
            "code" : "string"
          },
          {
            "code" : "CodeableConcept"
          }
        ]
      }
    ]
  }
}

```

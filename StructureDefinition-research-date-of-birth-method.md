# Research Date of Birth Method - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Research Date of Birth Method**

## Extension: Research Date of Birth Method 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-date-of-birth-method | *Version*:0.2.0 |
| Draft as of 2026-02-06 | *Computable Name*:ResearchDateOfBirthMethod |

Code indicating method of the DOB construction

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [NCPI Participant](StructureDefinition-ncpi-participant.md)
* Examples for this Extension: [Patient/PT-006SP660](Patient-PT-006SP660.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/research-date-of-birth-method)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-research-date-of-birth-method.csv), [Excel](StructureDefinition-research-date-of-birth-method.xlsx), [Schematron](StructureDefinition-research-date-of-birth-method.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "research-date-of-birth-method",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-date-of-birth-method",
  "version" : "0.2.0",
  "name" : "ResearchDateOfBirthMethod",
  "title" : "Research Date of Birth Method",
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
  "description" : "Code indicating method of the DOB construction",
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
        "short" : "Research Date of Birth Method",
        "definition" : "Code indicating method of the DOB construction"
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-date-of-birth-method"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "type" : [
          {
            "code" : "Coding"
          }
        ],
        "binding" : {
          "strength" : "extensible",
          "valueSet" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/research-data-date-of-birth-method-vs"
        }
      }
    ]
  }
}

```

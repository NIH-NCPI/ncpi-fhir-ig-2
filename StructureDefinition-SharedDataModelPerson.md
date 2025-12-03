# Shared Data Model for Research Persons - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Shared Data Model for Research Persons**

## Logical Model: Shared Data Model for Research Persons 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelPerson | *Version*:0.2.0 |
| Draft as of 2025-12-03 | *Computable Name*:CdmPerson |

 
The**Shared data model for Person** 

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/SharedDataModelPerson)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-SharedDataModelPerson.csv), [Excel](StructureDefinition-SharedDataModelPerson.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "SharedDataModelPerson",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelPerson",
  "version" : "0.2.0",
  "name" : "CdmPerson",
  "title" : "Shared Data Model for Research Persons",
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
  "description" : "The **Shared data model for Person**",
  "fhirVersion" : "4.0.1",
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelPerson",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [
      {
        "id" : "SharedDataModelPerson",
        "path" : "SharedDataModelPerson",
        "short" : "Shared Data Model for Research Persons",
        "definition" : "The **Shared data model for Person**"
      },
      {
        "id" : "SharedDataModelPerson.identifier",
        "path" : "SharedDataModelPerson.identifier",
        "short" : "Unique Person identifier.",
        "definition" : "Unique Person identifier.",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "string"
          }
        ]
      },
      {
        "id" : "SharedDataModelPerson.participant",
        "path" : "SharedDataModelPerson.participant",
        "short" : "The participant we are describing",
        "definition" : "The participant we are describing",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : ["http://hl7.org/fhir/StructureDefinition/valueset-reference"]
          }
        ]
      }
    ]
  }
}

```

# Shared Data Model for Family Role - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Shared Data Model for Family Role**

## Logical Model: Shared Data Model for Family Role 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelFamilyRole | *Version*:0.2.0 |
| Draft as of 2025-12-03 | *Computable Name*:CdmFamilyRole |

 
The**Shared Data Model for Family Role** 

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/SharedDataModelFamilyRole)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-SharedDataModelFamilyRole.csv), [Excel](StructureDefinition-SharedDataModelFamilyRole.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "SharedDataModelFamilyRole",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelFamilyRole",
  "version" : "0.2.0",
  "name" : "CdmFamilyRole",
  "title" : "Shared Data Model for Family Role",
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
  "description" : "The **Shared Data Model for Family Role**",
  "fhirVersion" : "4.0.1",
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelFamilyRole",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [
      {
        "id" : "SharedDataModelFamilyRole",
        "path" : "SharedDataModelFamilyRole",
        "short" : "Shared Data Model for Family Role",
        "definition" : "The **Shared Data Model for Family Role**"
      },
      {
        "id" : "SharedDataModelFamilyRole.participant",
        "path" : "SharedDataModelFamilyRole.participant",
        "short" : "The participant we are describing",
        "definition" : "The participant we are describing",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Reference"
          }
        ]
      },
      {
        "id" : "SharedDataModelFamilyRole.studyFamily",
        "path" : "SharedDataModelFamilyRole.studyFamily",
        "short" : "The study family this participant is part of",
        "definition" : "The study family this participant is part of",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Reference"
          }
        ]
      },
      {
        "id" : "SharedDataModelFamilyRole.familyRole",
        "path" : "SharedDataModelFamilyRole.familyRole",
        "short" : "The role this individual has in the family, specifically with respect to a proband or index participant",
        "definition" : "The role this individual has in the family, specifically with respect to a proband or index participant",
        "min" : 0,
        "max" : "1",
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

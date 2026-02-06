# Shared Data Model for Study Family - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Shared Data Model for Study Family**

## Logical Model: Shared Data Model for Study Family 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelStudyFamily | *Version*:0.2.0 |
| Draft as of 2026-02-06 | *Computable Name*:CdmStudyFamily |

 
The **Shared Data Model for Study Family** 

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/SharedDataModelStudyFamily)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-SharedDataModelStudyFamily.csv), [Excel](StructureDefinition-SharedDataModelStudyFamily.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "SharedDataModelStudyFamily",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelStudyFamily",
  "version" : "0.2.0",
  "name" : "CdmStudyFamily",
  "title" : "Shared Data Model for Study Family",
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
  "description" : "The **Shared Data Model for Study Family**",
  "fhirVersion" : "4.0.1",
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelStudyFamily",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [
      {
        "id" : "SharedDataModelStudyFamily",
        "path" : "SharedDataModelStudyFamily",
        "short" : "Shared Data Model for Study Family",
        "definition" : "The **Shared Data Model for Study Family**"
      },
      {
        "id" : "SharedDataModelStudyFamily.familyID",
        "path" : "SharedDataModelStudyFamily.familyID",
        "short" : "Unique study family identifier. System identifier used for internal references.",
        "definition" : "Unique study family identifier. System identifier used for internal references.",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "string"
          }
        ]
      },
      {
        "id" : "SharedDataModelStudyFamily.externalID",
        "path" : "SharedDataModelStudyFamily.externalID",
        "short" : "Study family identifier. System identifier used for external references.",
        "definition" : "Study family identifier. System identifier used for external references.",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "string"
          }
        ]
      },
      {
        "id" : "SharedDataModelStudyFamily.familyType",
        "path" : "SharedDataModelStudyFamily.familyType",
        "short" : "Describes the 'type' of study family, eg, trio.",
        "definition" : "Describes the 'type' of study family, eg, trio.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "code"
          }
        ]
      },
      {
        "id" : "SharedDataModelStudyFamily.description",
        "path" : "SharedDataModelStudyFamily.description",
        "short" : "Free text describing the study family, such as potential inheritance or details about consanguinity",
        "definition" : "Free text describing the study family, such as potential inheritance or details about consanguinity",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "string"
          }
        ]
      },
      {
        "id" : "SharedDataModelStudyFamily.consanguinity",
        "path" : "SharedDataModelStudyFamily.consanguinity",
        "short" : "Is there known or suspected consanguinity in this study family?",
        "definition" : "Is there known or suspected consanguinity in this study family?",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "code"
          }
        ]
      },
      {
        "id" : "SharedDataModelStudyFamily.studyFamilyFocus",
        "path" : "SharedDataModelStudyFamily.studyFamilyFocus",
        "short" : "What is this study family investigating? EG, a specific condition",
        "definition" : "What is this study family investigating? EG, a specific condition",
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

# Shared Data Model for Family Relationship - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Shared Data Model for Family Relationship**

## Logical Model: Shared Data Model for Family Relationship 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelFamilyRelationship | *Version*:0.2.0 |
| Draft as of 2026-03-09 | *Computable Name*:CdmFamilyRelationship |

 
The **Shared Data Model for Family Relationship** 

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/SharedDataModelFamilyRelationship)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-SharedDataModelFamilyRelationship.csv), [Excel](StructureDefinition-SharedDataModelFamilyRelationship.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "SharedDataModelFamilyRelationship",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelFamilyRelationship",
  "version" : "0.2.0",
  "name" : "CdmFamilyRelationship",
  "title" : "Shared Data Model for Family Relationship",
  "status" : "draft",
  "date" : "2026-03-09T20:11:59+00:00",
  "publisher" : "NCPI FHIR Working Group",
  "contact" : [{
    "name" : "NCPI FHIR Working Group",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.ncpi-acc.org/about/working-groups"
    },
    {
      "system" : "email",
      "value" : "ncpi-fhir-ig@googlegroups.com"
    }]
  }],
  "description" : "The **Shared Data Model for Family Relationship**",
  "fhirVersion" : "4.0.1",
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelFamilyRelationship",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "SharedDataModelFamilyRelationship",
      "path" : "SharedDataModelFamilyRelationship",
      "short" : "Shared Data Model for Family Relationship",
      "definition" : "The **Shared Data Model for Family Relationship**"
    },
    {
      "id" : "SharedDataModelFamilyRelationship.subject",
      "path" : "SharedDataModelFamilyRelationship.subject",
      "short" : "The participant we are describing",
      "definition" : "The participant we are describing",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Reference"
      }]
    },
    {
      "id" : "SharedDataModelFamilyRelationship.target",
      "path" : "SharedDataModelFamilyRelationship.target",
      "short" : "The participant the subject has a relationship to, eg, 'Subject is Relationship to Target' or 'Subject is Mother of Target'",
      "definition" : "The participant the subject has a relationship to, eg, 'Subject is Relationship to Target' or 'Subject is Mother of Target'",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Reference"
      }]
    },
    {
      "id" : "SharedDataModelFamilyRelationship.relationship",
      "path" : "SharedDataModelFamilyRelationship.relationship",
      "short" : "The relationship between the subject and the target.",
      "definition" : "The relationship between the subject and the target.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    }]
  }
}

```

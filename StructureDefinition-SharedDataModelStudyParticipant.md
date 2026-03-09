# Shared Data Model for Research Participant and Study Mapping - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Shared Data Model for Research Participant and Study Mapping**

## Logical Model: Shared Data Model for Research Participant and Study Mapping 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelStudyParticipant | *Version*:0.2.0 |
| Draft as of 2026-03-09 | *Computable Name*:CdmStudyParticipant |

 
The **Shared data model for StudyParticipant** 

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/SharedDataModelStudyParticipant)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-SharedDataModelStudyParticipant.csv), [Excel](StructureDefinition-SharedDataModelStudyParticipant.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "SharedDataModelStudyParticipant",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelStudyParticipant",
  "version" : "0.2.0",
  "name" : "CdmStudyParticipant",
  "title" : "Shared Data Model for Research Participant and Study Mapping",
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
  "description" : "The **Shared data model for StudyParticipant**",
  "fhirVersion" : "4.0.1",
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelStudyParticipant",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "SharedDataModelStudyParticipant",
      "path" : "SharedDataModelStudyParticipant",
      "short" : "Shared Data Model for Research Participant and Study Mapping",
      "definition" : "The **Shared data model for StudyParticipant**"
    },
    {
      "id" : "SharedDataModelStudyParticipant.participant",
      "path" : "SharedDataModelStudyParticipant.participant",
      "short" : "The participant we are describing",
      "definition" : "The participant we are describing",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/valueset-reference"]
      }]
    },
    {
      "id" : "SharedDataModelStudyParticipant.researchStudy",
      "path" : "SharedDataModelStudyParticipant.researchStudy",
      "short" : "The Research Study this participant has a relationship with",
      "definition" : "The Research Study this participant has a relationship with",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/valueset-reference"]
      }]
    },
    {
      "id" : "SharedDataModelStudyParticipant.accessPolicy",
      "path" : "SharedDataModelStudyParticipant.accessPolicy",
      "short" : "The Access Policy that may apply to this participant's data from this study. Not canonical, ie, one must rely on the row level AP.",
      "definition" : "The Access Policy that may apply to this participant's data from this study. Not canonical, ie, one must rely on the row level AP.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/valueset-reference"]
      }]
    }]
  }
}

```

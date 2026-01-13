# Shared Data Model for Research Participants - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Shared Data Model for Research Participants**

## Logical Model: Shared Data Model for Research Participants 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelResearchParticipant | *Version*:0.2.0 |
| Draft as of 2026-01-13 | *Computable Name*:CdmResearchParticipant |

 
The**Shared Data Model for Research Participants** 

### NCPI Participant

#### Participant

Participants are a scoped entity that represents the anchor for all data for a specific real-world entity. Typically, this is a person involved in a research study and all of their data collected for that study (or set of studies). This entity has direct attributes (eg, demographics), so if two studies that share an identifier space present conflicting information, it may be necessary to have multiple participants.

Participants (ie, data about an entity that is scope constrained) can be linked with a Person. Participants can be associated with different substudies (and with different data sharing restrictions) via Study Participation.

#### Person

In situations where a person participates in multiple studies that have participant data scoped in an exclusive way within one or more projects, we have a Person entity. It is functionally a “group” of Participants that are all describing one “actual” person. This is especially to support situations where access policies about that participant might be conflicting and cases where the data itself about the participant might conflict but cannot be adjudicated by the repository.

### Study Participation

Study Participation (ResearchSubject) describes the relationship between a specific Participant and a Research Study that collects and is sharing data on that Participant. A single Participant may have this “Study Participation” relationship with multiple Research Studies, and each relationship may have a different sharing restriction. These relationships are primarily illustrative, as the Access Policy details of any given element are documented within that element.

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/SharedDataModelResearchParticipant)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-SharedDataModelResearchParticipant.csv), [Excel](StructureDefinition-SharedDataModelResearchParticipant.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "SharedDataModelResearchParticipant",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelResearchParticipant",
  "version" : "0.2.0",
  "name" : "CdmResearchParticipant",
  "title" : "Shared Data Model for Research Participants",
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
  "description" : "The **Shared Data Model for Research Participants**",
  "fhirVersion" : "4.0.1",
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelResearchParticipant",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [
      {
        "id" : "SharedDataModelResearchParticipant",
        "path" : "SharedDataModelResearchParticipant",
        "short" : "Shared Data Model for Research Participants",
        "definition" : "The **Shared Data Model for Research Participants**"
      },
      {
        "id" : "SharedDataModelResearchParticipant.participantID",
        "path" : "SharedDataModelResearchParticipant.participantID",
        "short" : "Unique participant identifier. System identifier used for internal references.",
        "definition" : "Unique participant identifier. System identifier used for internal references.",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "string"
          }
        ]
      },
      {
        "id" : "SharedDataModelResearchParticipant.externalID",
        "path" : "SharedDataModelResearchParticipant.externalID",
        "short" : "Unique participant identifier. System identifier used for internal references.",
        "definition" : "Unique participant identifier. System identifier used for internal references.",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "code"
          }
        ]
      },
      {
        "id" : "SharedDataModelResearchParticipant.population",
        "path" : "SharedDataModelResearchParticipant.population",
        "short" : "Population, Race, and/or Ethnicity information.",
        "definition" : "Population, Race, and/or Ethnicity information.",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "code"
          }
        ]
      },
      {
        "id" : "SharedDataModelResearchParticipant.ombRace",
        "path" : "SharedDataModelResearchParticipant.ombRace",
        "short" : "OMB coded Race for backwards compatibility",
        "definition" : "OMB coded Race for backwards compatibility",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "code"
          }
        ]
      },
      {
        "id" : "SharedDataModelResearchParticipant.ombEth",
        "path" : "SharedDataModelResearchParticipant.ombEth",
        "short" : "OMB coded Ethnicity for backwards compatibility",
        "definition" : "OMB coded Ethnicity for backwards compatibility",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "code"
          }
        ]
      },
      {
        "id" : "SharedDataModelResearchParticipant.sex",
        "path" : "SharedDataModelResearchParticipant.sex",
        "short" : "Sex assigned at birth (or pre-natal observed sex)",
        "definition" : "Sex assigned at birth (or pre-natal observed sex)",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "code"
          }
        ]
      },
      {
        "id" : "SharedDataModelResearchParticipant.dateOfBirth",
        "path" : "SharedDataModelResearchParticipant.dateOfBirth",
        "short" : "Date of Birth of the participant. Details of privacy method should be included in DOBMethod",
        "definition" : "Date of Birth of the participant. Details of privacy method should be included in DOBMethod",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "date"
          }
        ]
      },
      {
        "id" : "SharedDataModelResearchParticipant.dobMethod",
        "path" : "SharedDataModelResearchParticipant.dobMethod",
        "short" : "Specifies method used to alter DOB for research sharing. Details should be available in the study protocols.",
        "definition" : "Specifies method used to alter DOB for research sharing. Details should be available in the study protocols.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "code"
          }
        ]
      },
      {
        "id" : "SharedDataModelResearchParticipant.ageAtLastVitalStatus",
        "path" : "SharedDataModelResearchParticipant.ageAtLastVitalStatus",
        "short" : "Age at last vital status",
        "definition" : "Age at last vital status",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "date"
          }
        ]
      },
      {
        "id" : "SharedDataModelResearchParticipant.vitalStatus",
        "path" : "SharedDataModelResearchParticipant.vitalStatus",
        "short" : "Vital Status",
        "definition" : "Vital Status",
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

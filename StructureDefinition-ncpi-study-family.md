# NCPI Study Family - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NCPI Study Family**

## Resource Profile: NCPI Study Family 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-study-family | *Version*:0.2.0 |
| Draft as of 2025-12-03 | *Computable Name*:NcpiStudyFamily |

 
Study Family 

#### Key Guidelines

Study Family describes a group of Participants that are related. This is not an expression of all individuals in a “family”, but a tool to identify “family members of interest” that were studied. For example, a family trio in a rare disease study does not exclude the existence of other siblings. Family Studies do not require much detail, but there are often attributes of those families that may be of use to researchers.

##### Added Profile Restrictions

In order to ensure that our resources are interoperable across studies, we have employed a number of restrictions that should make consuming Patient resources more consistent.

* ID **should** be a globally unique identifier associated with the family.

#### Recommended Practices

TODO: Write Recommended Practices

##### FHIR Mappings

The following fields from the shared data model are to be mapped into the NCPI Participant as shown below:

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| **Logical Model Property** | **Cardinality** | **NCPI Study Family Mapping** | **Usage Guidance** | **Notes** |
| FamilyID | 1..1 | id | Required | It is strongly recommended for the Person ID to be a unique identifier with an appropriate system |
| externalID | 0..* | identifier |   |   |
| FamilyType | 0..1 | extension[FamilyType](StructureDefinition-family-type.md) |   |   |
| Description | 0..1 | extension[Description](StructureDefinition-description.md) |   |   |
| Consanguinity | 0..1 | extension[Consanguinity](StructureDefinition-consanguinity.md) |   |   |
| StudyFamilyFocus | 0..1 | extension[StudyFamilyFocus](StructureDefinition-study-family-focus.md) |   |   |

**Usages:**

* Examples for this Profile: [Group/cbtn-study-family](Group-cbtn-study-family.md) and [Group/gregor-study-family](Group-gregor-study-family.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/ncpi-study-family)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ncpi-study-family.csv), [Excel](StructureDefinition-ncpi-study-family.xlsx), [Schematron](StructureDefinition-ncpi-study-family.sch) 

### Notes:



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ncpi-study-family",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-study-family",
  "version" : "0.2.0",
  "name" : "NcpiStudyFamily",
  "title" : "NCPI Study Family",
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
  "description" : "Study Family",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Group",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Group",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Group",
        "path" : "Group"
      },
      {
        "id" : "Group.id",
        "path" : "Group.id",
        "short" : "ParticipantID - Unique participant identifier. System identifier used for internal references."
      },
      {
        "id" : "Group.extension",
        "path" : "Group.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        }
      },
      {
        "id" : "Group.extension:familyType",
        "path" : "Group.extension",
        "sliceName" : "familyType",
        "short" : "Describes the 'type' of study family, eg, trio.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/family-type"
            ]
          }
        ]
      },
      {
        "id" : "Group.extension:description",
        "path" : "Group.extension",
        "sliceName" : "description",
        "short" : "Free text describing the study family, such as potential inheritance or details about consanguinity",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/description"
            ]
          }
        ]
      },
      {
        "id" : "Group.extension:consanguinity",
        "path" : "Group.extension",
        "sliceName" : "consanguinity",
        "short" : "Is there known or suspected consanguinity in this study family?",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/consanguinity"
            ]
          }
        ]
      },
      {
        "id" : "Group.extension:studyFamilyFocus",
        "path" : "Group.extension",
        "sliceName" : "studyFamilyFocus",
        "short" : "What is this study family investigating? EG, a specific condition",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/study-family-focus"
            ]
          }
        ]
      },
      {
        "id" : "Group.identifier",
        "path" : "Group.identifier",
        "short" : "External IDs for this participant. Requires scoping."
      },
      {
        "id" : "Group.member",
        "path" : "Group.member",
        "min" : 1
      },
      {
        "id" : "Group.member.entity",
        "path" : "Group.member.entity",
        "short" : "The participant described by this member.",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-participant"
            ]
          }
        ]
      },
      {
        "id" : "Group.member.entity.extension:familyRole",
        "path" : "Group.member.entity.extension",
        "sliceName" : "familyRole",
        "short" : "The role this individual has in the family, specifically with respect to a proband or index participant",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/family-role"
            ]
          }
        ]
      }
    ]
  }
}

```

# Shared Data Model for Participant Assertion - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Shared Data Model for Participant Assertion**

## Logical Model: Shared Data Model for Participant Assertion 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelParticipantAssertion | *Version*:0.2.0 |
| Draft as of 2025-12-03 | *Computable Name*:CdmParticipantAssertion |

 
The Shared Data Model for**Participant Assertion** 

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/SharedDataModelParticipantAssertion)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-SharedDataModelParticipantAssertion.csv), [Excel](StructureDefinition-SharedDataModelParticipantAssertion.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "SharedDataModelParticipantAssertion",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelParticipantAssertion",
  "version" : "0.2.0",
  "name" : "CdmParticipantAssertion",
  "title" : "Shared Data Model for Participant Assertion",
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
  "description" : "The Shared Data Model for **Participant Assertion**",
  "fhirVersion" : "4.0.1",
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelParticipantAssertion",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [
      {
        "id" : "SharedDataModelParticipantAssertion",
        "path" : "SharedDataModelParticipantAssertion",
        "short" : "Shared Data Model for Participant Assertion",
        "definition" : "The Shared Data Model for **Participant Assertion**"
      },
      {
        "id" : "SharedDataModelParticipantAssertion.participant",
        "path" : "SharedDataModelParticipantAssertion.participant",
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
      },
      {
        "id" : "SharedDataModelParticipantAssertion.assertionCode",
        "path" : "SharedDataModelParticipantAssertion.assertionCode",
        "short" : "The code associated with the measurement, procedure or other assertion being made about the user.",
        "definition" : "The code associated with the measurement, procedure or other assertion being made about the user.",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "code"
          }
        ]
      },
      {
        "id" : "SharedDataModelParticipantAssertion.assertionText",
        "path" : "SharedDataModelParticipantAssertion.assertionText",
        "short" : "Detailed description / free text about this assertion.",
        "definition" : "Detailed description / free text about this assertion.",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "string"
          }
        ]
      },
      {
        "id" : "SharedDataModelParticipantAssertion.ageAtAssertion",
        "path" : "SharedDataModelParticipantAssertion.ageAtAssertion",
        "short" : "The date or age at which this information is being asserted.",
        "definition" : "The date or age at which this information is being asserted.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Quantity"
          }
        ]
      },
      {
        "id" : "SharedDataModelParticipantAssertion.assertion",
        "path" : "SharedDataModelParticipantAssertion.assertion",
        "short" : "For assertions relating to a true/false status of a particular concept, is that value true or false?",
        "definition" : "For assertions relating to a true/false status of a particular concept, is that value true or false?",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "code"
          }
        ]
      },
      {
        "id" : "SharedDataModelParticipantAssertion.AssertionType",
        "path" : "SharedDataModelParticipantAssertion.AssertionType",
        "short" : "The semantic type of the resource, eg, Condition.",
        "definition" : "The semantic type of the resource, eg, Condition.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "code"
          }
        ]
      },
      {
        "id" : "SharedDataModelParticipantAssertion.ageAtEvent",
        "path" : "SharedDataModelParticipantAssertion.ageAtEvent",
        "short" : "The age in decimal years of the Subject at the time point which the assertion...",
        "definition" : "The age in decimal years of the Subject at the time point which the assertion...",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "code"
          }
        ]
      },
      {
        "id" : "SharedDataModelParticipantAssertion.otherModifiers",
        "path" : "SharedDataModelParticipantAssertion.otherModifiers",
        "short" : "Any additional modifiers for this condition, such as severity.",
        "definition" : "Any additional modifiers for this condition, such as severity.",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "code"
          }
        ]
      },
      {
        "id" : "SharedDataModelParticipantAssertion.assertionSource",
        "path" : "SharedDataModelParticipantAssertion.assertionSource",
        "short" : "Where or how was this this assertion about the Participant recorded? This can support understanding the differences between surveys, automated EHR extraction, manual chart abstraction, etc.",
        "definition" : "Where or how was this this assertion about the Participant recorded? This can support understanding the differences between surveys, automated EHR extraction, manual chart abstraction, etc.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "code"
          }
        ]
      },
      {
        "id" : "SharedDataModelParticipantAssertion.asserter",
        "path" : "SharedDataModelParticipantAssertion.asserter",
        "short" : "Who recorded this assertion about the Participant? This can support understanding the differences between self-report, doctor, trained research staff.",
        "definition" : "Who recorded this assertion about the Participant? This can support understanding the differences between self-report, doctor, trained research staff.",
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

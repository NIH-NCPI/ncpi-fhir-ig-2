# Shared Data Model for Condition Assertions - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Shared Data Model for Condition Assertions**

## Logical Model: Shared Data Model for Condition Assertions 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelCondition | *Version*:0.2.0 |
| Draft as of 2026-01-13 | *Computable Name*:CdmConditionAssertion |

 
The Shared Data Model for**Condition Assertions** 

### NCPI Condition

#### Conditions / Phenotypes / Diseases

These entities describe phenotypes or diseases of Participants. The distinction is one of “record of asserted status” and “Details of positively asserted status”. We make these distinctions to support general use cases of “longitudinal, catch all records” and “curated summaries of features”. This distinction is focused on the interoperability utility over the “direct representation of reality”. There is overlap in these data; many assertions about status and onset might be coalesced into a single description of an affected status. In other studies, the “summary” may be derived from a single “assertion” and appear mostly duplicative.

This distinction is similar to those in OMOP and FHIR, though it does not map precisely. Critically in OMOP and FHIR, Condition_occurrence and Condition are ALWAYS a positive assertion (though they may be wrong). “Assertions of history of disease” are observations in OMOP, eg, ICD9CM V-codes like “Personal history of malignant neoplasm of breast” go in Observation.

We do not set a distinction in entities here about “Phenotypes” vs “Diseases” as often used in a rare disease setting (eg, in Phenopackets). There is utility in indicating the intent of the submitter where possible, but this is not represented as separate entities.

#### Condition Assertion

Condition Assertions are records of a present or absent condition status for a participant. They reflect support for ongoing longitudinal records, and enable the ability to make explicit whether a feature was recorded or not for a participant. The assertion may carry with it additional data, such as age of onset, but it’s not required. Condition Assertions may be contradictory over time- the goal is to represent faithfully what was reported by the study. Consumers of this data should expect to need to aggregate this longitudinal record or reconcile data captured at different granularity. For example, it’s common to capture broad negative categories (No Heart Conditions) but also specific positive assertions (Atrial Septal Defect).

#### Condition Summary

Condition Summaries are intended to present users / consumers with an integrated summary view of condition data. This is a “higher level” product that may not be available in all circumstances, but provides a convenient way for users to understand what conditions might affect participants.

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/SharedDataModelCondition)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-SharedDataModelCondition.csv), [Excel](StructureDefinition-SharedDataModelCondition.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "SharedDataModelCondition",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelCondition",
  "version" : "0.2.0",
  "name" : "CdmConditionAssertion",
  "title" : "Shared Data Model for Condition Assertions",
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
  "description" : "The Shared Data Model for **Condition Assertions**",
  "fhirVersion" : "4.0.1",
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelCondition",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [
      {
        "id" : "SharedDataModelCondition",
        "path" : "SharedDataModelCondition",
        "short" : "Shared Data Model for Condition Assertions",
        "definition" : "The Shared Data Model for **Condition Assertions**"
      },
      {
        "id" : "SharedDataModelCondition.participant",
        "path" : "SharedDataModelCondition.participant",
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
        "id" : "SharedDataModelCondition.condition",
        "path" : "SharedDataModelCondition.condition",
        "short" : "The condition, disease, phenotypic feature, etc that this participant may have.",
        "definition" : "The condition, disease, phenotypic feature, etc that this participant may have.",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "code"
          }
        ]
      },
      {
        "id" : "SharedDataModelCondition.conditonText",
        "path" : "SharedDataModelCondition.conditonText",
        "short" : "Detailed description / free text about this condition.",
        "definition" : "Detailed description / free text about this condition.",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "string"
          }
        ]
      },
      {
        "id" : "SharedDataModelCondition.ageAtAssertion",
        "path" : "SharedDataModelCondition.ageAtAssertion",
        "short" : "The date or age at which this condition is being asserted.",
        "definition" : "The date or age at which this condition is being asserted.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Quantity"
          }
        ]
      },
      {
        "id" : "SharedDataModelCondition.assertion",
        "path" : "SharedDataModelCondition.assertion",
        "short" : "Does the participant have this condition?",
        "definition" : "Does the participant have this condition?",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "code"
          }
        ]
      },
      {
        "id" : "SharedDataModelCondition.conditionType",
        "path" : "SharedDataModelCondition.conditionType",
        "short" : "Does this condition represent a specific \"type\" of condition, such as \"Phenotypic Feature\" vs \"Disease\" in a rare disease setting.",
        "definition" : "Does this condition represent a specific \"type\" of condition, such as \"Phenotypic Feature\" vs \"Disease\" in a rare disease setting.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "code"
          }
        ]
      },
      {
        "id" : "SharedDataModelCondition.ageAtOnset",
        "path" : "SharedDataModelCondition.ageAtOnset",
        "short" : "The age of onset for this condition. Could be expressed with a term, an age, or an age range.",
        "definition" : "The age of onset for this condition. Could be expressed with a term, an age, or an age range.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "code"
          }
        ]
      },
      {
        "id" : "SharedDataModelCondition.ageAtResolution",
        "path" : "SharedDataModelCondition.ageAtResolution",
        "short" : "The age at which this condition was resolved, abated, or cured. Should be left empty in cases of current active status. Could be expressed with a term, an age, or an age range.",
        "definition" : "The age at which this condition was resolved, abated, or cured. Should be left empty in cases of current active status. Could be expressed with a term, an age, or an age range.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "date"
          }
        ]
      },
      {
        "id" : "SharedDataModelCondition.otherModifiers",
        "path" : "SharedDataModelCondition.otherModifiers",
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
        "id" : "SharedDataModelCondition.stage",
        "path" : "SharedDataModelCondition.stage",
        "short" : "Cancer staging information",
        "definition" : "Cancer staging information",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "code"
          }
        ]
      },
      {
        "id" : "SharedDataModelCondition.location",
        "path" : "SharedDataModelCondition.location",
        "short" : "Location information, such as site and/or laterality, of the condition. Multiple values should be interpreted cumulatively, so complex location information, such as \"right lung\" and \"left kidney\" may require multiple condition rows.",
        "definition" : "Location information, such as site and/or laterality, of the condition. Multiple values should be interpreted cumulatively, so complex location information, such as \"right lung\" and \"left kidney\" may require multiple condition rows.",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "code"
          }
        ]
      },
      {
        "id" : "SharedDataModelCondition.locationQualifier",
        "path" : "SharedDataModelCondition.locationQualifier",
        "short" : "Any spatial/location qualifiers",
        "definition" : "Any spatial/location qualifiers",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "code"
          }
        ]
      },
      {
        "id" : "SharedDataModelCondition.lateralityQualifier",
        "path" : "SharedDataModelCondition.lateralityQualifier",
        "short" : "Any laterality qualifiers",
        "definition" : "Any laterality qualifiers",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "code"
          }
        ]
      },
      {
        "id" : "SharedDataModelCondition.assertionSource",
        "path" : "SharedDataModelCondition.assertionSource",
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
        "id" : "SharedDataModelCondition.asserter",
        "path" : "SharedDataModelCondition.asserter",
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

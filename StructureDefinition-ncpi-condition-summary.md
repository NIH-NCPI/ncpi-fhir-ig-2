# NCPI Conditon Summary - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NCPI Conditon Summary**

## Resource Profile: NCPI Conditon Summary 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-condition-summary | *Version*:0.2.0 |
| Draft as of 2026-02-06 | *Computable Name*:NcpiConditionSummary |

 
Information about a condition related to a research participant 

#### Key Guidelines

The NCPI Condition profile is based on the standard resource type, [Observation](https://hl7.org/fhir/r4/observation.html) and is intended to represent a condition or phenotype associated with a participant in a research study.

#### Added Profile Restrictions

In order to ensure that our resources are interoperable across studies, we have employed a number of restrictions that should make consuming Patient resources more consistent.

* participantID **should** be a globally unique identifier associated with the patient. This practice is intended to make constructing queries for the same patient compatible across different servers (such as QA vs PROD) but also to make the resource URLs more meaningful.

#### Recommended Practices

NCPI Condition requests codes for conditions and condition information where possible rather than the use of free text; However, providing free text is an option in the `conditionText` field of the profile.

#### NCPI FHIR Mappings

The following fields from the shared data model are to be mapped into the NCPI Condition as shown below:

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| [participant](StructureDefinition-SharedDataModelCondition-definitions.md#diff_SharedDataModelCondition.participant) | 1..1 | subject | The participant we are describing |   |
| [condition](StructureDefinition-SharedDataModelCondition-definitions.md#diff_SharedDataModelCondition.condition) | 0..* | code.coding | The condition, disease, phenotypic feature, etc that this participant may have. |   |
| [conditonText](StructureDefinition-SharedDataModelCondition-definitions.md#diff_SharedDataModelCondition.conditonText) | 1..1 | code.text | Detailed description / free text about this condition. |   |
| [ageAtAssertion](StructureDefinition-SharedDataModelCondition-definitions.md#diff_SharedDataModelCondition.ageAtAssertion) | 0..1 | effectiveDateTime | The date or age at which this condition is being asserted. |   |
| [assertion](StructureDefinition-SharedDataModelCondition-definitions.md#diff_SharedDataModelCondition.assertion) | 1..1 | valueCodeableConcept | Does the participant have this condition? |   |
| [conditionType](StructureDefinition-SharedDataModelCondition-definitions.md#diff_SharedDataModelCondition.conditionType) | 0..1 | Category | Does this condition represent a specific "type" of condition, such as "Phenotypic Feature" vs "Disease" in a rare disease setting. |   |
| [ageAtOnset](StructureDefinition-SharedDataModelCondition-definitions.md#diff_SharedDataModelCondition.ageAtOnset) | 0..1 | component[ageAtOnset] | The age of onset for this condition. Could be expressed with a term, an age, or an age range. |   |
| [ageAtResolution](StructureDefinition-SharedDataModelCondition-definitions.md#diff_SharedDataModelCondition.ageAtResolution) | 0..1 | component[ageAtResolution] | The age at which this condition was resolved, abated, or cured. Should be left empty in cases of current active status. Could be expressed with a term, an age, or an age range. |   |
| [otherModifiers](StructureDefinition-SharedDataModelCondition-definitions.md#diff_SharedDataModelCondition.otherModifiers) | 0..* | component[otherModifiers] | Any additional modifiers for this condition, such as severity. |   |
| [stage](StructureDefinition-SharedDataModelCondition-definitions.md#diff_SharedDataModelCondition.stage) | 0..1 | component[stage] | Cancer staging information |   |
| [location](StructureDefinition-SharedDataModelCondition-definitions.md#diff_SharedDataModelCondition.location) | 0..* | bodySite | Location information, such as site and/or laterality, of the condition. Multiple values should be interpreted cumulatively, so complex location information, such as "right lung" and "left kidney" may require multiple condition rows. |   |
| [locationQualifier](StructureDefinition-SharedDataModelCondition-definitions.md#diff_SharedDataModelCondition.locationQualifier) | 0..1 | extension[codeableConcept] | Any spatial/location qualifiers |   |
| [lateralityQualifier](StructureDefinition-SharedDataModelCondition-definitions.md#diff_SharedDataModelCondition.lateralityQualifier) | 0..1 | extension[codeableConcept] | Any laterality qualifiers |   |
| [assertionSource](StructureDefinition-SharedDataModelCondition-definitions.md#diff_SharedDataModelCondition.assertionSource) | 0..1 | method | Where or how was this this assertion about the Participant recorded? This can support understanding the differences between surveys, automated EHR extraction, manual chart abstraction, etc. |   |
| [asserter](StructureDefinition-SharedDataModelCondition-definitions.md#diff_SharedDataModelCondition.asserter) | 0..1 | extension[codeableConcept] | Who recorded this assertion about the Participant? This can support understanding the differences between self-report, doctor, trained research staff. |   |

**Usages:**

* Examples for this Profile: [Condition/GSS123456-condition-summary](Condition-GSS123456-condition-summary.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/ncpi-condition-summary)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ncpi-condition-summary.csv), [Excel](StructureDefinition-ncpi-condition-summary.xlsx), [Schematron](StructureDefinition-ncpi-condition-summary.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ncpi-condition-summary",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-condition-summary",
  "version" : "0.2.0",
  "name" : "NcpiConditionSummary",
  "title" : "NCPI Conditon Summary",
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
  "description" : "Information about a condition related to a research participant",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "workflow",
      "uri" : "http://hl7.org/fhir/workflow",
      "name" : "Workflow Pattern"
    },
    {
      "identity" : "sct-concept",
      "uri" : "http://snomed.info/conceptdomain",
      "name" : "SNOMED CT Concept Domain Binding"
    },
    {
      "identity" : "v2",
      "uri" : "http://hl7.org/v2",
      "name" : "HL7 v2 Mapping"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "sct-attr",
      "uri" : "http://snomed.org/attributebinding",
      "name" : "SNOMED CT Attribute Binding"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Condition",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Condition",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Condition",
        "path" : "Condition"
      },
      {
        "id" : "Condition.extension",
        "path" : "Condition.extension",
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
        "id" : "Condition.extension:ageAtAssertion",
        "path" : "Condition.extension",
        "sliceName" : "ageAtAssertion",
        "short" : "The age in decimal years of the Subject at the time point which the assertion.  Could be expressed with a term, an age, or an age range. (for ages use http://hl7.org/fhir/StructureDefinition/cqf-relativeDateTime)",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/age-at-event"
            ]
          }
        ]
      },
      {
        "id" : "Condition.extension:entityAsserter",
        "path" : "Condition.extension",
        "sliceName" : "entityAsserter",
        "short" : "Who recorded this assertion about the Participant? This can support understanding the differences between self-report, doctor, trained research staff.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/entity-asserter"
            ]
          }
        ]
      },
      {
        "id" : "Condition.extension:otherConditionModifiers",
        "path" : "Condition.extension",
        "sliceName" : "otherConditionModifiers",
        "short" : "Any additional modifiers for this condition, such as severity.",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/other-condition-modifiers"
            ]
          }
        ]
      },
      {
        "id" : "Condition.category",
        "path" : "Condition.category",
        "short" : "Does this condition represent a specific \"type\" of condition, such as \"Phenotypic Feature\" vs \"Disease\" in a rare disease setting."
      },
      {
        "id" : "Condition.code.coding",
        "path" : "Condition.code.coding",
        "short" : "The condition, disease, phenotypic feature, etc that this participant may have."
      },
      {
        "id" : "Condition.code.text",
        "path" : "Condition.code.text",
        "short" : "Detailed description / free text about this condition."
      },
      {
        "id" : "Condition.bodySite",
        "path" : "Condition.bodySite",
        "short" : "Location information for the condition, including site, laterality, and other qualifiers as appropriate."
      },
      {
        "id" : "Condition.bodySite.extension:mcodeBodyLocationQualifier",
        "path" : "Condition.bodySite.extension",
        "sliceName" : "mcodeBodyLocationQualifier",
        "short" : "Any location qualifiers",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-body-location-qualifier"
            ]
          }
        ]
      },
      {
        "id" : "Condition.bodySite.extension:mcodeLateralityQualifier",
        "path" : "Condition.bodySite.extension",
        "sliceName" : "mcodeLateralityQualifier",
        "short" : "Laterality information for the condition site",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-laterality-qualifier"
            ]
          }
        ]
      },
      {
        "id" : "Condition.subject",
        "path" : "Condition.subject",
        "short" : "The participant we are describing"
      },
      {
        "id" : "Condition.onset[x]",
        "path" : "Condition.onset[x]",
        "short" : "The age of onset for this condition. Could be expressed with a term, an age, or an age range. (for ages use http://hl7.org/fhir/StructureDefinition/cqf-relativeDateTime)"
      },
      {
        "id" : "Condition.abatement[x]",
        "path" : "Condition.abatement[x]",
        "short" : "The age at which this condition was resolved, abated, or cured. Should be left empty in cases of current active status. Could be expressed with a term, an age, or an age range."
      },
      {
        "id" : "Condition.asserter",
        "path" : "Condition.asserter",
        "short" : "Reference to the individual responsible for the assertion, if this information is known (participant's Patient resource, if it is self reported, etc.)"
      },
      {
        "id" : "Condition.stage.summary",
        "path" : "Condition.stage.summary",
        "short" : "Cancer staging information. Example ValueSet, [condition-stage](https://hl7.org/fhir/R4/valueset-condition-stage.html)"
      }
    ]
  }
}

```

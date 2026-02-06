# NCPI Participant Assertion - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NCPI Participant Assertion**

## Resource Profile: NCPI Participant Assertion 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-participant-assertion | *Version*:0.2.0 |
| Draft as of 2026-02-06 | *Computable Name*:NcpiParticipantAssertion |

 
Assertion about a particular Participant. May include Conditions, Measurements, etc. 

#### Key Guidelines

The NCPI Participant Assertion profile is based on the standard resource type, [Observation](https://hl7.org/fhir/r4/observation.html) and is intended to represent a condition or phenotype associated with a participant in a research study.

#### Added Profile Restrictions

In order to ensure that our resources are interoperable across studies, we have employed a number of restrictions that should make consuming Patient resources more consistent.

* participantID **should** be a globally unique identifier associated with the patient. This practice is intended to make constructing queries for the same patient compatible across different servers (such as QA vs PROD) but also to make the resource URLs more meaningful.

#### Recommended Practices

NCPI Subject Assertion requests codes relevant for the domain associated for the assertion itself, such as LOINC or SNOMED for a measurement where possible rather than the use of free text; However, providing free text is an option in the `assertionText/code.text` field of the profile.

#### NCPI FHIR Mappings

The following fields from the shared data model are to be mapped into the NCPI Condition as shown below:

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| [participant](StructureDefinition-SharedDataModelParticipantAssertion-definitions.md#key_SharedDataModelParticipantAssertion.asserter) | 1..1 | subject | The participant we are describing |   |
| [assertionCode](StructureDefinition-ncpi-participant-assertion-definitions.md#key_Observation.component:ageAtAssertion) | 0..* | code.coding | The measurement, procedure, etc being reported in relation to this participant. |   |
| [assertionText](StructureDefinition-SharedDataModelParticipantAssertion-definitions.md#key_SharedDataModelParticipantAssertion.assertionText) | 1..1 | code.text | Detailed description / free text about this assertion. |   |
| [ageAtAssertion](StructureDefinition-SharedDataModelParticipantAssertion-definitions.md#key_SharedDataModelParticipantAssertion.ageAtAssertion) | 0..1 | effectiveDateTime | The date or age at which this information is being asserted. |   |
| [assertion](StructureDefinition-SharedDataModelParticipantAssertion-definitions.md#key_SharedDataModelParticipantAssertion.assertion) | 1..1 | valueCodeableConcept | Does the participant have this procedure or other true false assertion? |   |
| [AssertionType](StructureDefinition-SharedDataModelParticipantAssertion-definitions.md#key_SharedDataModelParticipantAssertion.AssertionType) | 0..1 | Category | Describe the type of assertion being made. |   |
| [ageAtAssertion](StructureDefinition-SharedDataModelParticipantAssertion-definitions.md#key_SharedDataModelParticipantAssertion.ageAtAssertion) | 0..1 | component[ageAtAssertion] | The age of at which this assertion was being made. Could be expressed with a term, an age, or an age range. |   |
| [otherModifiers](StructureDefinition-SharedDataModelParticipantAssertion-definitions.md#key_SharedDataModelParticipantAssertion.otherModifiers) | 0..* | component[otherModifiers] | Any additional modifiers for this assertion, such as severity. |   |
| [assertionSource](StructureDefinition-SharedDataModelParticipantAssertion-definitions.md#key_SharedDataModelParticipantAssertion.assertionSource) | 0..1 | method | Where or how was this this assertion about the Participant recorded? This can support understanding the differences between surveys, automated EHR extraction, manual chart abstraction, etc. |   |
| [asserter](StructureDefinition-SharedDataModelParticipantAssertion-definitions.md#key_SharedDataModelParticipantAssertion.asserter) | 0..1 | extension[codeableConcept] | Who recorded this assertion about the Participant? This can support understanding the differences between self-report, doctor, trained research staff. |   |

**Usages:**

* Derived from this Profile: [NCPI Phenotypic Feature Assertion](StructureDefinition-ncpi-phenotypic-feature-assertion.md)
* Examples for this Profile: [Observation/GSS123456-assertion](Observation-GSS123456-assertion.md), [Observation/GSS123456-condition-assertion](Observation-GSS123456-condition-assertion.md) and [Observation/PT-006SP660-condition](Observation-PT-006SP660-condition.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/ncpi-participant-assertion)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ncpi-participant-assertion.csv), [Excel](StructureDefinition-ncpi-participant-assertion.xlsx), [Schematron](StructureDefinition-ncpi-participant-assertion.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ncpi-participant-assertion",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-participant-assertion",
  "version" : "0.2.0",
  "name" : "NcpiParticipantAssertion",
  "title" : "NCPI Participant Assertion",
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
  "description" : "Assertion about a particular Participant. May include Conditions, Measurements, etc.",
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
  "type" : "Observation",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Observation",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Observation",
        "path" : "Observation"
      },
      {
        "id" : "Observation.extension",
        "path" : "Observation.extension",
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
        "id" : "Observation.extension:entityAsserter",
        "path" : "Observation.extension",
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
        "id" : "Observation.category",
        "path" : "Observation.category",
        "short" : "The semantic type of the resource, eg, Condition"
      },
      {
        "id" : "Observation.code.coding",
        "path" : "Observation.code.coding",
        "short" : "The structured term defining the meaning of the assertion"
      },
      {
        "id" : "Observation.code.text",
        "path" : "Observation.code.text",
        "short" : "Detailed description / free text about this assertion."
      },
      {
        "id" : "Observation.subject",
        "path" : "Observation.subject",
        "short" : "The participant we are describing",
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
        "id" : "Observation.effective[x]",
        "path" : "Observation.effective[x]",
        "short" : "The date or age at which this assertion is being made.  Could be expressed with a term, an age, or an age range. (for ages use http://hl7.org/fhir/StructureDefinition/cqf-relativeDateTime)",
        "type" : [
          {
            "code" : "dateTime"
          }
        ]
      },
      {
        "id" : "Observation.value[x]",
        "path" : "Observation.value[x]",
        "short" : "The value of the assertion such as a numeric value, or structured term representing the assertion itself (such as true or false)",
        "type" : [
          {
            "code" : "Quantity"
          },
          {
            "code" : "CodeableConcept"
          },
          {
            "code" : "string"
          },
          {
            "code" : "boolean"
          },
          {
            "code" : "integer"
          },
          {
            "code" : "Range"
          },
          {
            "code" : "time"
          },
          {
            "code" : "dateTime"
          },
          {
            "code" : "Period"
          }
        ]
      },
      {
        "id" : "Observation.bodySite",
        "path" : "Observation.bodySite",
        "short" : "Location information for the observation, including site, laterality, and other qualifiers as appropriate. Multiple observations may be required if the same assertion is made in many locations, or complete location details can be provided in an NCPI Condition Summary."
      },
      {
        "id" : "Observation.bodySite.extension:mcodeBodyLocationQualifier",
        "path" : "Observation.bodySite.extension",
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
        "id" : "Observation.bodySite.extension:mcodeLateralityQualifier",
        "path" : "Observation.bodySite.extension",
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
        "id" : "Observation.method",
        "path" : "Observation.method",
        "short" : "Where or how was this this assertion about the Participant recorded? This can support understanding the differences between surveys, automated EHR extraction, manual chart abstraction, etc."
      },
      {
        "id" : "Observation.component",
        "path" : "Observation.component",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "description" : "Slicing logic for observation component",
          "ordered" : false,
          "rules" : "open"
        }
      },
      {
        "id" : "Observation.component:ageAtEvent",
        "path" : "Observation.component",
        "sliceName" : "ageAtEvent",
        "short" : "The age of the Subject when the assertion was made.  Could be expressed with a term, an age, or an age range. (for ages use http://hl7.org/fhir/StructureDefinition/cqf-relativeDateTime)",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Observation.component:ageAtEvent.code",
        "path" : "Observation.component.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "code" : "ageAtEvent"
            }
          ]
        }
      },
      {
        "id" : "Observation.component:ageAtEvent.value[x]",
        "path" : "Observation.component.value[x]",
        "type" : [
          {
            "code" : "Quantity"
          },
          {
            "code" : "CodeableConcept"
          },
          {
            "code" : "Range"
          },
          {
            "code" : "dateTime"
          }
        ]
      },
      {
        "id" : "Observation.component:ageAtAssertion",
        "path" : "Observation.component",
        "sliceName" : "ageAtAssertion",
        "short" : "The age in decimal years of the Subject at the time point which the assertion.  Could be expressed with a term, an age, or an age range. (for ages use http://hl7.org/fhir/StructureDefinition/cqf-relativeDateTime)",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Observation.component:ageAtAssertion.code",
        "path" : "Observation.component.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "code" : "ageAtAssertion"
            }
          ]
        }
      },
      {
        "id" : "Observation.component:ageAtAssertion.value[x]",
        "path" : "Observation.component.value[x]",
        "type" : [
          {
            "code" : "Quantity"
          },
          {
            "code" : "CodeableConcept"
          },
          {
            "code" : "Range"
          },
          {
            "code" : "dateTime"
          }
        ]
      },
      {
        "id" : "Observation.component:ageAtOnset",
        "path" : "Observation.component",
        "sliceName" : "ageAtOnset",
        "short" : "The age of onset for this condition. Could be expressed with a term, an age, or an age range.",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Observation.component:ageAtOnset.code",
        "path" : "Observation.component.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "code" : "ageAtOnset"
            }
          ]
        }
      },
      {
        "id" : "Observation.component:ageAtOnset.value[x]",
        "path" : "Observation.component.value[x]",
        "type" : [
          {
            "code" : "Quantity"
          },
          {
            "code" : "CodeableConcept"
          },
          {
            "code" : "Range"
          },
          {
            "code" : "dateTime"
          }
        ]
      },
      {
        "id" : "Observation.component:ageAtResolution",
        "path" : "Observation.component",
        "sliceName" : "ageAtResolution",
        "short" : "The age at which this condition was resolved, abated, or cured. Should be left empty in cases of current active status. Could be expressed with a term, an age, or an age range.",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Observation.component:ageAtResolution.code",
        "path" : "Observation.component.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "code" : "ageAtResolution"
            }
          ]
        }
      },
      {
        "id" : "Observation.component:ageAtResolution.value[x]",
        "path" : "Observation.component.value[x]",
        "type" : [
          {
            "code" : "Quantity"
          },
          {
            "code" : "CodeableConcept"
          },
          {
            "code" : "Range"
          },
          {
            "code" : "dateTime"
          }
        ]
      },
      {
        "id" : "Observation.component:stage",
        "path" : "Observation.component",
        "sliceName" : "stage",
        "short" : "Cancer staging information",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Observation.component:stage.code",
        "path" : "Observation.component.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "code" : "stage"
            }
          ]
        }
      },
      {
        "id" : "Observation.component:stage.value[x]",
        "path" : "Observation.component.value[x]",
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ]
      },
      {
        "id" : "Observation.component:otherModifiers",
        "path" : "Observation.component",
        "sliceName" : "otherModifiers",
        "short" : "Any additional modifiers for this condition, such as severity.",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Observation.component:otherModifiers.code",
        "path" : "Observation.component.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "code" : "otherModifiers"
            }
          ]
        }
      },
      {
        "id" : "Observation.component:otherModifiers.value[x]",
        "path" : "Observation.component.value[x]",
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ]
      }
    ]
  }
}

```

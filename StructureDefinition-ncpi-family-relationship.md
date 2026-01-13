# Family Relationship - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Family Relationship**

## Resource Profile: Family Relationship 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-family-relationship | *Version*:0.2.0 |
| Draft as of 2026-01-13 | *Computable Name*:NcpiFamilyRelationship |

 
Family Relationship 

#### Key Guidelines

Family Relationships describe the relationship between two Participants. The core use case is to present biological parentage of a participant to support family / pedigree analyses. In this spirit, platforms should seek to provide minimally the information in a “ped” file: if known, a Participant should have a Family Relationship to their biological mother and father. Twins are also a high priority item for reporting. Further extended relationships can be made available using Family Relationship, but may not be as widely supported as they are harder to interpret.

#### Recommended Practices

Family relationship profiles can be constructed for each individual to reflect the different directions of relationships. For example, if we have a mother and son enrolled in a given research study, NCPI Family Relationship can be used to define how mother (`subject`) relates to son (`focus`) and what kind of code describes their relationship (`relationship`), in this case, the code "MTH" for mother. Use of multiple NCPI Family Relationship profiles to define relevant parties will as a whole describe interrelationships.

##### FHIR Mappings

The following fields from the shared data model are to be mapped into the NCPI Participant as shown below:

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| **Logical Model Property** | **Cardinality** | **NCPI Person Mapping** | **Usage Guidance** | **Notes** |
| [subject](StructureDefinition-SharedDataModelFamilyRelationship-definitions.md#diff_SharedDataModelFamilyRelationship.subject) | 1..1 | subject | Required |   |
| [target](StructureDefinition-SharedDataModelFamilyRelationship-definitions.md#diff_SharedDataModelFamilyRelationship.target) | 1..1 | focus |   |   |
| [relationship](StructureDefinition-SharedDataModelFamilyRelationship-definitions.md#diff_SharedDataModelFamilyRelationship.relationship) | 1..1 | code |   |   |

**Usages:**

* Examples for this Profile: [Observation/cbtn-family-relationship-mother](Observation-cbtn-family-relationship-mother.md), [Observation/cbtn-family-relationship-son](Observation-cbtn-family-relationship-son.md) and [Observation/gregor-family-relationship-mother](Observation-gregor-family-relationship-mother.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/ncpi-family-relationship)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ncpi-family-relationship.csv), [Excel](StructureDefinition-ncpi-family-relationship.xlsx), [Schematron](StructureDefinition-ncpi-family-relationship.sch) 

### Notes:



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ncpi-family-relationship",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-family-relationship",
  "version" : "0.2.0",
  "name" : "NcpiFamilyRelationship",
  "title" : "Family Relationship",
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
  "description" : "Family Relationship",
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
        "id" : "Observation.code",
        "path" : "Observation.code",
        "short" : "The relationship between the subject and the target.",
        "binding" : {
          "strength" : "extensible",
          "valueSet" : "http://terminology.hl7.org/ValueSet/v3-FamilyMember"
        }
      },
      {
        "id" : "Observation.subject",
        "path" : "Observation.subject",
        "short" : "The participant we are describing",
        "min" : 1,
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
        "id" : "Observation.focus",
        "path" : "Observation.focus",
        "short" : "The participant the subject has a relationship to, eg, 'Subject is Relationship to Target' or 'Subject is Mother of Target'",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-participant"
            ]
          }
        ]
      }
    ]
  }
}

```

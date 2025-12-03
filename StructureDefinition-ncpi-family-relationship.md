# Family Relationship - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Family Relationship**

## Resource Profile: Family Relationship 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-family-relationship | *Version*:0.2.0 |
| Draft as of 2025-12-03 | *Computable Name*:NcpiFamilyRelationship |

 
A relationship between individuals in a pedigree or family. 

We chose the direction of the relationship to match PED files ([plink Harvard Medical School definition](https://zzz.bwh.harvard.edu/plink/data.shtml#ped), [Broad Institute definition](https://gatk.broadinstitute.org/hc/en-us/articles/360035531972-PED-Pedigree-format)), which go from the individual to the mother and father.

#### Key Guidelines

Family Relationships describe the relationship between two Participants. The core use case is to present biological parentage of a participant to support family / pedigree analyses. In this spirit, platforms should seek to provide minimally the information in a [PED file](https://gatk.broadinstitute.org/hc/en-us/articles/360035531972-PED-Pedigree-format):

* If known, a Participant should have a Family Relationship to their biological mother and father.
* Twins and other multiples are also a high-priority item for reporting.

Further extended relationships can be made available using Family Relationship, but may not be as widely supported as they are harder to interpret.

#### Recommended Practices

To ensure an unambiguous representation of family relationships, we recommend that the following guidelines be followed:

* For each parent-child relationship, create a `FamilyRelationship` resource with the child as the `patient` and the parent as the `relative`.
* For all identical-sibling relationships, create two `FamilyRelationship` resources. That is, if three participants are triplets, create six `FamilyRelationship` resources. One with the `patient` as the first participant and the `relative` as the second participant, and one with the `patient` as the second participant and the `relative` as the first participant, one with the `patient` as the second participant and the `relative` as the third participant, and so on.
* For other genetic relationships, (like grandparents), create `FamilyRelationship` resources for each parent-child relationship. 
* This may require inferred individuals to be created to fill in gaps.
* Use the [Patient Knowledge Source Extension](StructureDefinition-patient-knowledge-source.md) to mark the inferred individuals as such.
 
* For non-genetic relationships, such as a spouse, an adoptive parent, or a surrogate mother, create one `FamilyRelationship` with each participant as the `patient` and the other as the `relative`. So, "spouse" would require two `FamilyRelationship` resources. Prefer non-gendered and sexless codes for the relationship because gender and sex are properties of the individual. For example, prefer "spouse" over "husband" or "wife."
* It is acceptable to create several `FamilyRelationship` resources for the same `patient` and `relative` pair. For example, two participants may be spouses but also third cousins. That would require four `FamilyRelationship` resources.

#### Relationship to other implementation guides

##### GA4GH Family Relationships

GA4GH Family Relationships are defined in the [GA4GH Family Relationships](https://ga4gh.github.io/pedigree-fhir-ig/index.html) specification.

This `FamilyRelationship` resource is almost compatible with the GA4GH Family Relationships specification. However, we cannot include it in the profile because the GA4GH specification restricts relationships to the [codes defined in that standard](https://ga4gh.github.io/pedigree-fhir-ig/ValueSet-PedigreeRelationshipTypes.html). Unfortunately, that set of codes does not meet our use cases or interoperability requirements. If the binding had been extensible, we could have inherited from the GA4GH Family Relationships profile and encouraged the use of better codes. However, software written for that profile might be able to read our `FamilyRelationship` resources as long as it does not rely on the "required" binding.

##### FHIR Mappings

The following fields from [the shared data model](StructureDefinition-SharedDataModelFamilyRelationship.md) map into the NCPI Participant as shown below:

| | |
| :--- | :--- |
| [subject](StructureDefinition-SharedDataModelFamilyRelationship-definitions.md#key_SharedDataModelFamilyRelationship.subject) | [patient](StructureDefinition-ncpi-family-relationship-definitions.md#key_FamilyMemberHistory.patient) |
| [target](StructureDefinition-SharedDataModelFamilyRelationship-definitions.md#key_SharedDataModelFamilyRelationship.target) | [extension[relative]](StructureDefinition-ncpi-family-relationship-definitions.md#key_FamilyMemberHistory.extension:relative) |
| [relationship](StructureDefinition-SharedDataModelFamilyRelationship-definitions.md#key_SharedDataModelFamilyRelationship.relationship) | [relationship](StructureDefinition-ncpi-family-relationship-definitions.md#key_FamilyMemberHistory.relationship) |

**Usages:**

* Examples for this Profile: [FamilyMemberHistory/cbtn-family-relationship-daughter](FamilyMemberHistory-cbtn-family-relationship-daughter.md), [FamilyMemberHistory/cbtn-family-relationship-mother](FamilyMemberHistory-cbtn-family-relationship-mother.md) and [FamilyMemberHistory/gregor-family-relationship-mother](FamilyMemberHistory-gregor-family-relationship-mother.md)

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
  "description" : "A relationship between individuals in a pedigree or family.",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "workflow",
      "uri" : "http://hl7.org/fhir/workflow",
      "name" : "Workflow Pattern"
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
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "FamilyMemberHistory",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/FamilyMemberHistory",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "FamilyMemberHistory",
        "path" : "FamilyMemberHistory"
      },
      {
        "id" : "FamilyMemberHistory.extension",
        "path" : "FamilyMemberHistory.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "FamilyMemberHistory.extension:relative",
        "path" : "FamilyMemberHistory.extension",
        "sliceName" : "relative",
        "short" : "The participant in the relationship who plays the role named by the relationship.",
        "definition" : "The participant in the relationship who plays the role named by the relationship.\n\nThat is, if the relationship is `C96572` (**\\\"Biological Father\\\"**), the\n`relative` is the father and the `patient` is the child.\n\nThis uses [the standard Patient Record extension](http://hl7.org/fhir/StructureDefinition/familymemberhistory-patient-record)\nfor compatibility with the [GA4GH PedigreeRelationship profile](https://ga4gh.github.io/pedigree-fhir-ig/StructureDefinition-PedigreeRelationship.html)",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://hl7.org/fhir/StructureDefinition/familymemberhistory-patient-record|4.0.1"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "FamilyMemberHistory.patient",
        "path" : "FamilyMemberHistory.patient",
        "short" : "The participant we are describing.",
        "definition" : "The participant we are describing.\n\nThat is, if the relationship is `C96572` (**\\\"Biological Father\\\"**), the `patient` is the child\nand the `relative` is the father.",
        "mustSupport" : true
      },
      {
        "id" : "FamilyMemberHistory.name",
        "path" : "FamilyMemberHistory.name",
        "max" : "0"
      },
      {
        "id" : "FamilyMemberHistory.relationship",
        "path" : "FamilyMemberHistory.relationship",
        "short" : "The role the relative fills with respect to the patient for this relationship.",
        "definition" : "The role the relative fills with respect to the patient for this relationship.\n\n`relative` is `relationship` to `patient`. For the sake of users,\nprefer to exclusively use `C96572`, `C96580`, and `ITWIN` for genetic relationships.\nAll other genetic relationships can be expressed with these and inferred individuals.\n\n`ITWIN` should be used for all monozygotic multiples (triplets, quadruplets, etc.)\nand should be present for all the directions of the relationship.\n\nThis provides an unambiguous representation of the genetic relationship\nthat is easily convertable to and from\n[PED files](https://gatk.broadinstitute.org/hc/en-us/articles/360035531972-PED-Pedigree-format)",
        "comment" : "# Examples\n\n## Example 1 (triplets):\n\nA,B,C are triplets. You need six `NcpiFamilyRelationship`\nresources:\n- A→B\n- B→A\n- A→C\n- C→A\n- B→C\n- C→B.\n\n## Example 2 (twins):\nIf X and Y are twins, you need two `NcpiFamilyRelationship`\nresources:\n- X→Y\n- Y→X.\n\n## Example 3 (maternal grandchild):\nIf Q is the maternal grandchild of the female R but Q's parent\nis outside the dataset, then you need to make an inferred Patient\nresource D and make two `NcpiFamilyRelationship` resources:\n- D-(Biological Mother)→Q\n- R-(Biological Mother)→D.",
        "mustSupport" : true,
        "binding" : {
          "strength" : "extensible",
          "valueSet" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/family-biological-relationship-vs"
        }
      },
      {
        "id" : "FamilyMemberHistory.sex",
        "path" : "FamilyMemberHistory.sex",
        "max" : "0"
      },
      {
        "id" : "FamilyMemberHistory.born[x]",
        "path" : "FamilyMemberHistory.born[x]",
        "max" : "0"
      },
      {
        "id" : "FamilyMemberHistory.age[x]",
        "path" : "FamilyMemberHistory.age[x]",
        "max" : "0"
      },
      {
        "id" : "FamilyMemberHistory.estimatedAge",
        "path" : "FamilyMemberHistory.estimatedAge",
        "max" : "0"
      },
      {
        "id" : "FamilyMemberHistory.deceased[x]",
        "path" : "FamilyMemberHistory.deceased[x]",
        "max" : "0"
      },
      {
        "id" : "FamilyMemberHistory.reasonCode",
        "path" : "FamilyMemberHistory.reasonCode",
        "max" : "0"
      },
      {
        "id" : "FamilyMemberHistory.reasonReference",
        "path" : "FamilyMemberHistory.reasonReference",
        "max" : "0"
      },
      {
        "id" : "FamilyMemberHistory.condition",
        "path" : "FamilyMemberHistory.condition",
        "max" : "0"
      }
    ]
  }
}

```

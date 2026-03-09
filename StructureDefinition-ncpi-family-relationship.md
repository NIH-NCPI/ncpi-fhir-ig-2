# Family Relationship - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Family Relationship**

## Resource Profile: Family Relationship 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-family-relationship | *Version*:0.2.0 |
| Draft as of 2026-03-09 | *Computable Name*:NcpiFamilyRelationship |

 
A relationship between individuals in a pedigree or family. 

We chose the direction of the relationship to match PED files ([plink Harvard Medical School definition](https://zzz.bwh.harvard.edu/plink/data.shtml#ped), [Broad Institute definition](https://gatk.broadinstitute.org/hc/en-us/articles/360035531972-PED-Pedigree-format)), which go from the individual to the mother and father.

#### Key Guidelines

Family Relationships describe the relationship between two Participants. The core use case is to present biological parentage of a participant to support family / pedigree analyses. In this spirit, platforms should seek to provide minimally the information in a [PED file](https://gatk.broadinstitute.org/hc/en-us/articles/360035531972-PED-Pedigree-format):

* If known, a Participant should have a Family Relationship to their biological mother and father using `KIN:027` (`isBiologicalMotherOf`) and `KIN:028` (`isBiologicalFatherOf`).
* Monozygotic twins and other multiples are also a high-priority item for reporting using `KIN:010` (`isMonozygoticMultipleBirthSiblingOf`).

Further extended relationships can be made available using Family Relationship, but may not be as widely supported as they are harder to interpret.

#### Recommended Practices

To ensure an unambiguous representation of family relationships, we recommend that the following guidelines be followed:

* For each parent-child relationship, create a `FamilyRelationship` resource with the child as the `patient` and the parent as the `relative`.
* Treat rarer genetic relationships (for example, `isMitochondrialDonor` or `isOvumDonor`) like the parent-child relationship. The receiver of the genetic or cellular material is the `patient` and the donor is the `relative`.
* For all monozygotic sibling relationships, create pairwise `FamilyRelationship` resources using `KIN:010` (`isMonozygoticMultipleBirthSiblingOf`). For triplets, create six `FamilyRelationship` resources (one for each direction of each pair: A→B, B→A, A→C, C→A, B→C, C→B). For quadruplets, create twelve resources, and so on.
* For other genetic relationships, (like grandparents), create `FamilyRelationship` resources for each parent-child relationship. 
* This may require inferred individuals to be created to fill in gaps.
* Use the [Patient Knowledge Source Extension](StructureDefinition-patient-knowledge-source.md) to mark the inferred individuals as such.
 
* For non-genetic relationships, such as a partner, an adoptive parent, or a surrogate mother, create one `FamilyRelationship` with each participant as the `patient` and the other as the `relative`. So, "partner" would require two `FamilyRelationship` resources. Prefer non-gendered and sexless codes for the relationship because gender and sex are properties of the individual. For example, prefer "partner" over "husband" or "wife." The KIN ontology lacks many terms for precise inverse relationships, so one direction may be `isAdoptiveParentOf` (KIN:022) and the other `isSocialLegalRelativeOf` (KIN:019).
* It is acceptable to create several `FamilyRelationship` resources for the same `patient` and `relative` pair. For example, two participants may be spouses but also third cousins. That would require two `FamilyRelationship` resources for the mutual isPartner relationships and several more to map back to their common great-great-grandparent. In this case, you may not know the sex of the inferred figures, so you'd use KIN:003, `isBiologicalParentOf` for the ancestors of unknown sex.

#### Relationship to other implementation guides

##### GA4GH Family Relationships

GA4GH Family Relationships are defined in the [GA4GH Pedigree FHIR IG](https://ga4gh.github.io/pedigree-fhir-ig/index.html) specification.

This `NcpiFamilyRelationship` profile **derives from** the [GA4GH PedigreeRelationship](https://ga4gh.github.io/pedigree-fhir-ig/StructureDefinition-PedigreeRelationship.html) profile and uses codes from the [GA4GH KIN ontology](https://ga4gh.github.io/pedigree-fhir-ig/CodeSystem-kin.html). The profile includes all 55 KIN codes in its ValueSet and maintains the parent's required binding for full GA4GH compatibility.

NCPI recommends using a canonical approach with three core codes (`KIN:027` (`isBiologicalMother`), `KIN:028` (`isBiologicalFatherOf`), `KIN:010` (`isMonozygoticMultipleBirthSiblingOf`)) plus inferred individuals to express all pedigree relationships. This provides a complete, unambiguous representation that eases data consumption. While all KIN codes remain available for use when needed, we cannot machine-encode the preference for these three codes due to the required binding strength — doing so would require extensible binding restricted to the KIN ontology, a constraint not expressible in FHIR R4. If future FHIR versions (R5/R6) provide mechanisms to express "extensible within a required parent set," we would adopt that approach. For now, this canonical approach is documented as guidance in the profile definition and ValueSet description.

##### FHIR Mappings

The following fields from [the shared data model](StructureDefinition-SharedDataModelFamilyRelationship.md) map into the NCPI Participant as shown below:

| | |
| :--- | :--- |
| [subject](StructureDefinition-SharedDataModelFamilyRelationship-definitions.md#key_SharedDataModelFamilyRelationship.subject) | [patient](StructureDefinition-ncpi-family-relationship-definitions.md#key_FamilyMemberHistory.patient) |
| [target](StructureDefinition-SharedDataModelFamilyRelationship-definitions.md#key_SharedDataModelFamilyRelationship.target) | [extension[relative]](StructureDefinition-ncpi-family-relationship-definitions.md#key_FamilyMemberHistory.extension:relative) |
| [relationship](StructureDefinition-SharedDataModelFamilyRelationship-definitions.md#key_SharedDataModelFamilyRelationship.relationship) | [relationship](StructureDefinition-ncpi-family-relationship-definitions.md#key_FamilyMemberHistory.relationship) |

Please note that the original GA4GH profiles were built using older tooling that wasn't intended for being published 'as is'. As a result, some of the links below will be invalid. Please use the
[GA4GH PedigreeRelationship](https://ga4gh.github.io/pedigree-fhir-ig/StructureDefinition-PedigreeRelationship.html)instead.

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
  "description" : "A relationship between individuals in a pedigree or family.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
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
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "FamilyMemberHistory",
  "baseDefinition" : "http://purl.org/ga4gh/pedigree-fhir-ig/StructureDefinition/PedigreeRelationship",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "FamilyMemberHistory",
      "path" : "FamilyMemberHistory"
    },
    {
      "id" : "FamilyMemberHistory.extension:relative",
      "path" : "FamilyMemberHistory.extension",
      "sliceName" : "relative",
      "short" : "The participant in the relationship who plays the role named by the relationship.",
      "definition" : "The participant in the relationship who plays the role named by the relationship.\n\nThat is, if the relationship is `KIN:028` (**\\\"isBiologicalFatherOf\\\"**), the\n`relative` is the father and the `patient` is the child.\n\nThis uses [the standard Patient Record extension](http://hl7.org/fhir/StructureDefinition/familymemberhistory-patient-record)\ninherited from the [GA4GH PedigreeRelationship profile](https://ga4gh.github.io/pedigree-fhir-ig/StructureDefinition-PedigreeRelationship.html)"
    },
    {
      "id" : "FamilyMemberHistory.patient",
      "path" : "FamilyMemberHistory.patient",
      "short" : "The participant we are describing.",
      "definition" : "The participant we are describing.\n\nThat is, if the relationship is `KIN:028` (**\\\"isBiologicalFatherOf\\\"**), the `patient` is the child\nand the `relative` is the father."
    },
    {
      "id" : "FamilyMemberHistory.relationship",
      "path" : "FamilyMemberHistory.relationship",
      "short" : "The role the relative fills with respect to the patient for this relationship.",
      "definition" : "The role the relative fills with respect to the patient for this relationship.\n\n`relative` is `relationship` to `patient`.\n\n# NCPI-Recommended Codes\n\nFor maximum interoperability with other NCPI systems, prefer these three codes for\ngenetic relationships in [PED files](https://gatk.broadinstitute.org/hc/en-us/articles/360035531972-PED-Pedigree-format):\n\n- `KIN:027` (`isBiologicalMotherOf`): The relative is the biological mother of the patient.\n- `KIN:028` (`isBiologicalFatherOf`): The relative is the biological father of the patient.\n- `KIN:010` (`isMonozygoticMultipleBirthSiblingOf`): The relative and patient are monozygotic twins. For\n  higher-order multiples (triplets, quadruplets, etc.), create pairwise `KIN:010`\n  relationships between every pair with bidirectional relationships (both A→B and B→A).\n\nAll other genetic relationships (grandparents, aunts, uncles, cousins, etc.) can be\nexpressed using these three codes with inferred individuals to represent the relationship\nchain. This provides a canonical way to express all pedigree relationships, which will ease\nconsuming the data.\n\n# Additional KIN Codes\n\nWhile all 55 codes from the [GA4GH KIN ontology](https://ga4gh.github.io/pedigree-fhir-ig/CodeSystem-kin.html)\nare available, NCPI systems may not fully support relationships beyond the three core codes above.",
      "comment" : "# Examples\n\n## Example 1 (triplets):\n\nA,B,C are triplets. You need six `NcpiFamilyRelationship`\nresources with `KIN:010` (`isMonozygoticMultipleBirthSiblingOf`):\n- A→B\n- B→A\n- A→C\n- C→A\n- B→C\n- C→B.\n\n## Example 2 (twins):\nIf X and Y are twins, you need two `NcpiFamilyRelationship`\nresources with `KIN:010` (`isMonozygoticMultipleBirthSiblingOf`):\n- X→Y\n- Y→X.\n\n## Example 3 (maternal grandchild):\nIf Q is the maternal grandchild of the female R but Q's parent\nis outside the dataset, then you need to make an inferred Patient\nresource D and make two `NcpiFamilyRelationship` resources:\n- D-(KIN:027, `isBiologicalMotherOf`)→Q\n- R-(KIN:027, `isBiologicalMotherOf`)→D.",
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/family-biological-relationship-vs"
      }
    }]
  }
}

```

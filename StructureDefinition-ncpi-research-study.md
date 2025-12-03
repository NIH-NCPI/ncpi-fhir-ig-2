# NCPI Research Study - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NCPI Research Study**

## Resource Profile: NCPI Research Study 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-research-study | *Version*:0.2.0 |
| Draft as of 2025-12-03 | *Computable Name*:NcpiResearchStudy |

 
The NCPI Research Study FHIR resource represents an individual research effort and acts as a grouper or “container” for that effort’s study participants and their related data files. 

**Usages:**

* Refer to this Profile: [Part of Study](StructureDefinition-part-of-study.md)
* Examples for this Profile: [ResearchStudy/kf-research-study-cbtn](ResearchStudy-kf-research-study-cbtn.md) and [ResearchStudy/research-study-gregor](ResearchStudy-research-study-gregor.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/ncpi-research-study)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ncpi-research-study.csv), [Excel](StructureDefinition-ncpi-research-study.xlsx), [Schematron](StructureDefinition-ncpi-research-study.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ncpi-research-study",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-research-study",
  "version" : "0.2.0",
  "name" : "NcpiResearchStudy",
  "title" : "NCPI Research Study",
  "status" : "draft",
  "date" : "2025-12-03T18:37:31+00:00",
  "publisher" : "NCPI FHIR Working Group",
  "contact" : [
    {
      "name" : "NCPI FHIR Working Group",
      "telecom" : [
        {
          "system" : "url",
          "value" : "http://example.org/example-publisher"
        },
        {
          "system" : "email",
          "value" : "ncpi-fhir-ig@googlegroups.com"
        }
      ]
    }
  ],
  "description" : "The NCPI Research Study FHIR resource represents an individual research effort and acts as a grouper or “container” for that effort’s study participants and their related data files.",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "BRIDG5.1",
      "uri" : "https://bridgmodel.nci.nih.gov",
      "name" : "BRIDG 5.1 Mapping"
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
      "identity" : "clinicaltrials-gov",
      "uri" : "http://clinicaltrials.gov",
      "name" : "ClinicalTrials.gov Mapping"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "ResearchStudy",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/ResearchStudy",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "ResearchStudy",
        "path" : "ResearchStudy"
      },
      {
        "id" : "ResearchStudy.extension",
        "path" : "ResearchStudy.extension",
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
        "id" : "ResearchStudy.extension:studyDesign",
        "path" : "ResearchStudy.extension",
        "sliceName" : "studyDesign",
        "short" : "Study Design and Study Type",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-study-design"
            ]
          }
        ]
      },
      {
        "id" : "ResearchStudy.extension:associatedParty",
        "path" : "ResearchStudy.extension",
        "sliceName" : "associatedParty",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-study-associated-party"
            ]
          }
        ]
      },
      {
        "id" : "ResearchStudy.extension:acknowledgement",
        "path" : "ResearchStudy.extension",
        "sliceName" : "acknowledgement",
        "short" : "Statement investigators should include to acknowledge use data from this study. This can include, but is not limited to, funding sources, organizational affiliations, or sponsors.",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-study-acknowledgement"
            ]
          }
        ]
      },
      {
        "id" : "ResearchStudy.identifier",
        "path" : "ResearchStudy.identifier",
        "short" : "External facing, globally unique identifiers. When providing more than one identifier, researchers should indicate the 'official' identifier by assigning 'official' to that identifier's use property.",
        "min" : 1
      },
      {
        "id" : "ResearchStudy.title",
        "path" : "ResearchStudy.title",
        "short" : "Study's formal title."
      },
      {
        "id" : "ResearchStudy.category.coding",
        "path" : "ResearchStudy.category.coding",
        "short" : "Indicate this is an NCPI Research Study",
        "patternCoding" : {
          "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/ncpi",
          "code" : "StudyCohort",
          "display" : "Study Cohort"
        }
      },
      {
        "id" : "ResearchStudy.focus",
        "path" : "ResearchStudy.focus",
        "short" : "The primary, non-disease focus(es) of the study. This can include terms related to intervention, drug, device, or other focus.",
        "comment" : "Researcher specified foci that are not specific to disease/phenotype codes."
      },
      {
        "id" : "ResearchStudy.condition",
        "path" : "ResearchStudy.condition",
        "short" : "The primary focus(es) of the study. This is specific to the disease. MeSH terms are preferred.",
        "comment" : "Disease and phenotype codes identified in the CDM study's 'focus'."
      },
      {
        "id" : "ResearchStudy.relatedArtifact",
        "path" : "ResearchStudy.relatedArtifact",
        "short" : "Attribution, Study Weblinks, Citation, Study Documents, etc."
      },
      {
        "id" : "ResearchStudy.description",
        "path" : "ResearchStudy.description",
        "short" : "Study Description (Recommended)"
      }
    ]
  }
}

```

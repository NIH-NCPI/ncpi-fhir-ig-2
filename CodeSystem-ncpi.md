# NCPI FHIR Codes - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NCPI FHIR Codes**

## CodeSystem: NCPI FHIR Codes 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/ncpi | *Version*:0.2.0 |
| Active as of 2026-02-06 | *Computable Name*:Ncpi |

 
Codes that would apply to NCPI projects 

 This Code system is referenced in the content logical definition of the following value sets: 

* This CodeSystem is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "ncpi",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/ncpi",
  "version" : "0.2.0",
  "name" : "Ncpi",
  "title" : "NCPI FHIR Codes",
  "status" : "active",
  "experimental" : false,
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
  "description" : "Codes that would apply to NCPI projects",
  "caseSensitive" : true,
  "content" : "fragment",
  "concept" : [
    {
      "code" : "Consortium",
      "display" : "Study Consortium"
    },
    {
      "code" : "StudyCohort",
      "display" : "Study Cohort"
    },
    {
      "code" : "ConsentGroup",
      "display" : "Study Consent Group"
    },
    {
      "code" : "Summary",
      "display" : "Summary Data"
    },
    {
      "code" : "CohortCount",
      "display" : "Number of cohorts that are part of this study"
    },
    {
      "code" : "SubStudyCount",
      "display" : "Number of sub-studies that are part of this study"
    },
    {
      "code" : "SampleCount",
      "display" : "Number of samples that are part of this study"
    },
    {
      "code" : "Participant",
      "display" : "Number of participants that are part of this study"
    },
    {
      "code" : "VariableCount",
      "display" : "Number of variables that are part of this study"
    },
    {
      "code" : "AnalysesCount",
      "display" : "Number of analyses that are part of this study"
    },
    {
      "code" : "MolecularDatasetCount",
      "display" : "Number of molecular datasets that are part of this study"
    },
    {
      "code" : "PhenotypeDatasetCount",
      "display" : "Number of phenotype datasets that are part of this study"
    },
    {
      "code" : "StorageSize",
      "display" : "Size on Disk"
    },
    {
      "code" : "ConsentCodes",
      "display" : "Consent Codes"
    },
    {
      "code" : "TerraWorkspace",
      "display" : "Terra Workspace Name"
    },
    {
      "code" : "PrimaryDisease",
      "display" : "Primary Disease"
    },
    {
      "code" : "AccessType",
      "display" : "Access Type"
    },
    {
      "code" : "StudyDesign",
      "display" : "Study Design"
    }
  ]
}

```

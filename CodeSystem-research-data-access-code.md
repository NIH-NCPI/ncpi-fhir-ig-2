# Research Data Access Codes - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Research Data Access Codes**

## CodeSystem: Research Data Access Codes 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/research-data-access-code | *Version*:0.2.0 |
| Active as of 2026-02-06 | *Computable Name*:ResearchDataAccessCode |

 
Enumerated list of access codes such as dbGaP consent codes among others. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [ResearchDataAccessCodeVS](ValueSet-research-data-access-code-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "research-data-access-code",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/research-data-access-code",
  "version" : "0.2.0",
  "name" : "ResearchDataAccessCode",
  "title" : "Research Data Access Codes",
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
  "description" : "Enumerated list of access codes such as dbGaP consent codes among others.",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 10,
  "concept" : [
    {
      "code" : "GRU",
      "display" : "General Research Use"
    },
    {
      "code" : "HMB",
      "display" : "Health/Medical/Biomedical"
    },
    {
      "code" : "DS",
      "display" : "Disease-Specific (Disease/Trait/Exposure)"
    },
    {
      "code" : "IRB",
      "display" : "IRB approval required"
    },
    {
      "code" : "PUB",
      "display" : "Publication required"
    },
    {
      "code" : "COL",
      "display" : "Collaboration Required"
    },
    {
      "code" : "NPU",
      "display" : "Not-for-profit use only"
    },
    {
      "code" : "MDS",
      "display" : "Methods"
    },
    {
      "code" : "GSO",
      "display" : "Genetic studies only"
    },
    {
      "code" : "GSR",
      "display" : "Genomic Summary Results"
    }
  ]
}

```

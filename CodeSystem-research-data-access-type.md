# Research Data Access Type Codes - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Research Data Access Type Codes**

## CodeSystem: Research Data Access Type Codes 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/research-data-access-type | *Version*:0.2.0 |
| Active as of 2025-12-03 | *Computable Name*:ResearchDataAccessType |

 
Enumerated list of access type codes such as 'Open Access', 'Registered Access' and 'Controlled Access' 

 This Code system is referenced in the content logical definition of the following value sets: 

* [ResearchDataAccessTypeVS](ValueSet-research-data-access-type-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "research-data-access-type",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/research-data-access-type",
  "version" : "0.2.0",
  "name" : "ResearchDataAccessType",
  "title" : "Research Data Access Type Codes",
  "status" : "active",
  "experimental" : false,
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
  "description" : "Enumerated list of access type codes such as 'Open Access', 'Registered Access' and 'Controlled Access'",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 5,
  "concept" : [
    {
      "code" : "open",
      "display" : "Open Access"
    },
    {
      "code" : "registered",
      "display" : "Registered Access"
    },
    {
      "code" : "controlled",
      "display" : "Controlled"
    },
    {
      "code" : "gsr-restricted",
      "display" : "GSR Restricted"
    },
    {
      "code" : "gsr-allowed",
      "display" : "GSR Allowed"
    }
  ]
}

```

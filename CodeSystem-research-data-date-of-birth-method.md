# Enumerations for how DOB was constructed - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Enumerations for how DOB was constructed**

## CodeSystem: Enumerations for how DOB was constructed 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/research-data-date-of-birth-method | *Version*:0.2.0 |
| Active as of 2026-01-13 | *Computable Name*:ResearchDataDateOfBirthMethod |

 
Enumerations for how DOB was constructed 

 This Code system is referenced in the content logical definition of the following value sets: 

* [ResearchDataDateOfBirthMethodVS](ValueSet-research-data-date-of-birth-method-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "research-data-date-of-birth-method",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/research-data-date-of-birth-method",
  "version" : "0.2.0",
  "name" : "ResearchDataDateOfBirthMethod",
  "title" : "Enumerations for how DOB was constructed",
  "status" : "active",
  "experimental" : false,
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
  "description" : "Enumerations for how DOB was constructed",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 5,
  "concept" : [
    {
      "code" : "exact",
      "display" : "Exact"
    },
    {
      "code" : "year-only",
      "display" : "Year Only"
    },
    {
      "code" : "shifted",
      "display" : "Shifted"
    },
    {
      "code" : "decade-only",
      "display" : "Decade Only"
    },
    {
      "code" : "other",
      "display" : "Other"
    }
  ]
}

```

# Type of Condition - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Type of Condition**

## CodeSystem: Type of Condition 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/condition-type | *Version*:0.2.0 |
| Active as of 2025-12-03 | *Computable Name*:ConditionType |

 
Code System for type of condition 

 This Code system is referenced in the content logical definition of the following value sets: 

* [ConditionTypeVS](ValueSet-condition-type-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "condition-type",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/condition-type",
  "version" : "0.2.0",
  "name" : "ConditionType",
  "title" : "Type of Condition",
  "status" : "active",
  "experimental" : false,
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
  "description" : "Code System for type of condition",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 6,
  "concept" : [
    {
      "code" : "Phenotypic-Feature",
      "display" : "Phenotypic Feature"
    },
    {
      "code" : "Disease",
      "display" : "Disease"
    },
    {
      "code" : "Comorbidity",
      "display" : "Comorbidity"
    },
    {
      "code" : "Histology",
      "display" : "Histology"
    },
    {
      "code" : "Clinical-Finding",
      "display" : "Clinical Finding"
    },
    {
      "code" : "EHR-Condition-Code",
      "display" : "EHR Condition Code"
    }
  ]
}

```

# NCPI Family Types CodeSystem - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NCPI Family Types CodeSystem**

## CodeSystem: NCPI Family Types CodeSystem 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/ncpi-family-types | *Version*:0.2.0 |
| Active as of 2026-02-06 | *Computable Name*:NcpiFamilyTypes |

 
CodeSystem for Types of Families 

 This Code system is referenced in the content logical definition of the following value sets: 

* [NcpiFamilyTypesVS](ValueSet-ncpi-family-types-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "ncpi-family-types",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/ncpi-family-types",
  "version" : "0.2.0",
  "name" : "NcpiFamilyTypes",
  "title" : "NCPI Family Types CodeSystem",
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
  "description" : "CodeSystem for Types of Families",
  "caseSensitive" : true,
  "content" : "fragment",
  "concept" : [
    {
      "code" : "Control-only",
      "display" : "Control Only"
    },
    {
      "code" : "Duo",
      "display" : "Duo"
    },
    {
      "code" : "Other",
      "display" : "Other"
    },
    {
      "code" : "Proband-only",
      "display" : "Proband Only"
    },
    {
      "code" : "Trio",
      "display" : "Trio"
    },
    {
      "code" : "Trio+",
      "display" : "Trio+"
    }
  ]
}

```

# Strandedness options - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Strandedness options**

## CodeSystem: Strandedness options 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/strandedness-cs | *Version*:0.2.0 |
| Active as of 2026-01-13 | *Computable Name*:StrandednessCS |

 
Strandedness options 

 This Code system is referenced in the content logical definition of the following value sets: 

* This CodeSystem is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "strandedness-cs",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/strandedness-cs",
  "version" : "0.2.0",
  "name" : "StrandednessCS",
  "title" : "Strandedness options",
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
  "description" : "Strandedness options",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 3,
  "concept" : [
    {
      "code" : "stranded",
      "display" : "Stranded"
    },
    {
      "code" : "unstranded",
      "display" : "Unstranded"
    },
    {
      "code" : "unknown",
      "display" : "Unknown"
    }
  ]
}

```

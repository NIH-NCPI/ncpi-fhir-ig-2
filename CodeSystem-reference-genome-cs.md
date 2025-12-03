# Reference genome examples - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Reference genome examples**

## CodeSystem: Reference genome examples 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/reference-genome-cs | *Version*:0.2.0 |
| Active as of 2025-12-03 | *Computable Name*:ReferenceGenomeCS |

 
Reference genome examples 

 This Code system is referenced in the content logical definition of the following value sets: 

* This CodeSystem is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "reference-genome-cs",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/reference-genome-cs",
  "version" : "0.2.0",
  "name" : "ReferenceGenomeCS",
  "title" : "Reference genome examples",
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
  "description" : "Reference genome examples",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 5,
  "concept" : [
    {
      "code" : "GRCh37",
      "display" : "GRCh37"
    },
    {
      "code" : "GRCh38",
      "display" : "CRCh38"
    },
    {
      "code" : "GRCh38p13",
      "display" : "GRCh38.p13"
    },
    {
      "code" : "GRCh38p14",
      "display" : "GRCh38.p14"
    },
    {
      "code" : "unknown",
      "display" : "Unknown"
    }
  ]
}

```

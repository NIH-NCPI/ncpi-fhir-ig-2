# Library selection options - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Library selection options**

## CodeSystem: Library selection options 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/library-selection-cs | *Version*:0.2.0 |
| Active as of 2025-12-03 | *Computable Name*:LibrarySelectionCS |

 
Library selection options 

 This Code system is referenced in the content logical definition of the following value sets: 

* This CodeSystem is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "library-selection-cs",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/library-selection-cs",
  "version" : "0.2.0",
  "name" : "LibrarySelectionCS",
  "title" : "Library selection options",
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
  "description" : "Library selection options",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 2,
  "concept" : [
    {
      "code" : "PolyTEnrichment",
      "display" : "Poly-T Enrichment"
    },
    {
      "code" : "unknown",
      "display" : "Unknown"
    }
  ]
}

```

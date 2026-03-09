# Sample availability for Sample and Aliquot modules - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Sample availability for Sample and Aliquot modules**

## CodeSystem: Sample availability for Sample and Aliquot modules 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/biospecimen-availability | *Version*:0.2.0 |
| Active as of 2026-03-09 | *Computable Name*:BiospecimenAvailability |

 
Sample availability for Sample and Aliquot modules 

 This Code system is referenced in the content logical definition of the following value sets: 

* This CodeSystem is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "biospecimen-availability",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/biospecimen-availability",
  "version" : "0.2.0",
  "name" : "BiospecimenAvailability",
  "title" : "Sample availability for Sample and Aliquot modules",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-03-09T20:11:59+00:00",
  "publisher" : "NCPI FHIR Working Group",
  "contact" : [{
    "name" : "NCPI FHIR Working Group",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.ncpi-acc.org/about/working-groups"
    },
    {
      "system" : "email",
      "value" : "ncpi-fhir-ig@googlegroups.com"
    }]
  }],
  "description" : "Sample availability for Sample and Aliquot modules",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 2,
  "concept" : [{
    "code" : "available",
    "display" : "Available"
  },
  {
    "code" : "unavailable",
    "display" : "Unavailable"
  }]
}

```

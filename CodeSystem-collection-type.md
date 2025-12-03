# Collection Type - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Collection Type**

## CodeSystem: Collection Type 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/collection-type | *Version*:0.2.0 |
| Draft as of 2025-12-03 | *Computable Name*:CollectionType |

 
Enumerated list of collection types 

 This Code system is referenced in the content logical definition of the following value sets: 

* [CollectionTypeVS](ValueSet-collection-type-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "collection-type",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/collection-type",
  "version" : "0.2.0",
  "name" : "CollectionType",
  "title" : "Collection Type",
  "status" : "draft",
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
  "description" : "Enumerated list of collection types",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 3,
  "concept" : [
    {
      "code" : "consortium",
      "display" : "Consortium"
    },
    {
      "code" : "program",
      "display" : "Program"
    },
    {
      "code" : "user-defined",
      "display" : "User Defined"
    }
  ]
}

```

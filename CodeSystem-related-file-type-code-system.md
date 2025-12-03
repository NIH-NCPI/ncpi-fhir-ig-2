# Related File Type Code System - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Related File Type Code System**

## CodeSystem: Related File Type Code System 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/related-file-type-code-system | *Version*:0.2.0 |
| Draft as of 2025-12-03 | *Computable Name*:RelatedFileTypeCS |

 
Explains the relationship of this file to the file of reference 

 This Code system is referenced in the content logical definition of the following value sets: 

* This CodeSystem is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "related-file-type-code-system",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/related-file-type-code-system",
  "version" : "0.2.0",
  "name" : "RelatedFileTypeCS",
  "title" : "Related File Type Code System",
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
  "description" : "Explains the relationship of this file to the file of reference",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 5,
  "concept" : [
    {
      "code" : "index_of",
      "display" : "Index of"
    },
    {
      "code" : "has_index",
      "display" : "Has index"
    },
    {
      "code" : "data_dictionary_of",
      "display" : "Data dictionary of"
    },
    {
      "code" : "has_data_dictionary",
      "display" : "Has data dictionary"
    },
    {
      "code" : "plink-type-associated-files",
      "display" : "Plink-type associated files"
    }
  ]
}

```

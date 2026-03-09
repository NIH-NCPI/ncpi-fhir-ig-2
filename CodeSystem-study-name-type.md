# Study Name Type - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Study Name Type**

## CodeSystem: Study Name Type 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/study-name-type | *Version*:0.2.0 |
| Draft as of 2026-03-09 | *Computable Name*:StudyNameType |

 
Some common types of study 'names'. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [StudyNameTypeVS](ValueSet-study-name-type-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "study-name-type",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/study-name-type",
  "version" : "0.2.0",
  "name" : "StudyNameType",
  "title" : "Study Name Type",
  "status" : "draft",
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
  "description" : "Some common types of study 'names'.",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 5,
  "concept" : [{
    "code" : "formal-title",
    "display" : "Formal Title"
  },
  {
    "code" : "internal-name",
    "display" : "Internal Name"
  },
  {
    "code" : "familiar-ame",
    "display" : "Familiar Name (Nickname)"
  },
  {
    "code" : "acronym",
    "display" : "Acronym"
  },
  {
    "code" : "alternative-name",
    "display" : "Alternative Name"
  }]
}

```

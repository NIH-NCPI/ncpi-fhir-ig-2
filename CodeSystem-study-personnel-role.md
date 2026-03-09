# Study Personnel Role - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Study Personnel Role**

## CodeSystem: Study Personnel Role 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/study-personnel-role | *Version*:0.2.0 |
| Draft as of 2026-03-09 | *Computable Name*:StudyPersonnelRole |

 
Roles associated with study personnel. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [StudyPersonnelRoleVS](ValueSet-study-personnel-role-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "study-personnel-role",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/study-personnel-role",
  "version" : "0.2.0",
  "name" : "StudyPersonnelRole",
  "title" : "Study Personnel Role",
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
  "description" : "Roles associated with study personnel.",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 3,
  "concept" : [{
    "code" : "primary-investigator",
    "display" : "Primary Investigator"
  },
  {
    "code" : "administrator",
    "display" : "Administrator"
  },
  {
    "code" : "collaborator",
    "display" : "Collaborator"
  }]
}

```

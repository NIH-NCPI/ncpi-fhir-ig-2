# Workflow type options - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Workflow type options**

## CodeSystem: Workflow type options 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/workflow-type-cs | *Version*:0.2.0 |
| Active as of 2026-02-06 | *Computable Name*:WorkflowTypeCS |

 
Workflow type options 

 This Code system is referenced in the content logical definition of the following value sets: 

* This CodeSystem is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "workflow-type-cs",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/workflow-type-cs",
  "version" : "0.2.0",
  "name" : "WorkflowTypeCS",
  "title" : "Workflow type options",
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
  "description" : "Workflow type options",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 3,
  "concept" : [
    {
      "code" : "alignment",
      "display" : "Alignment"
    },
    {
      "code" : "somatic",
      "display" : "Somatic"
    },
    {
      "code" : "unknown",
      "display" : "Unknown"
    }
  ]
}

```

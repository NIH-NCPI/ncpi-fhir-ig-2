# Workflow tool options - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Workflow tool options**

## CodeSystem: Workflow tool options 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/workflow-tool-cs | *Version*:0.2.0 |
| Active as of 2026-03-09 | *Computable Name*:WorkflowToolCS |

 
Workflow tool options 

 This Code system is referenced in the content logical definition of the following value sets: 

* This CodeSystem is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "workflow-tool-cs",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/workflow-tool-cs",
  "version" : "0.2.0",
  "name" : "WorkflowToolCS",
  "title" : "Workflow tool options",
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
  "description" : "Workflow tool options",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 3,
  "concept" : [{
    "code" : "bammem",
    "display" : "BAM-MEM"
  },
  {
    "code" : "GATKHaplotypeCaller",
    "display" : "GATK-Haplotype Caller"
  },
  {
    "code" : "unknown",
    "display" : "Unknown"
  }]
}

```

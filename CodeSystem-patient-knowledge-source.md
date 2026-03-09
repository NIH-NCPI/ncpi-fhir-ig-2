# Patient Knowledge Source - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Patient Knowledge Source**

## CodeSystem: Patient Knowledge Source 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/patient-knowledge-source | *Version*:0.2.0 |
| Active as of 2026-03-09 | *Computable Name*:PatientKnowledgeSource |

 
The source of the knowledge represented in a `Patient` resource. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [PatientKnowledgeSourceVS](ValueSet-patient-knowledge-source-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "patient-knowledge-source",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/patient-knowledge-source",
  "version" : "0.2.0",
  "name" : "PatientKnowledgeSource",
  "title" : "Patient Knowledge Source",
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
  "description" : "The source of the knowledge represented in a `Patient` resource.",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 2,
  "concept" : [{
    "code" : "traditional",
    "display" : "Traditional",
    "definition" : "The knowledge comes from traditional sources like a form filled out by a patient or information copied from an external traditional source like government records."
  },
  {
    "code" : "inferred",
    "display" : "Inferred",
    "definition" : "The knowledge is inferred from indirect evidence. For example, the existence of one patient's mother can be inferred from the existence of the patient."
  }]
}

```

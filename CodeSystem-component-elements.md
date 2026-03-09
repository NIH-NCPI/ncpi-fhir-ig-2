# Elements of Component - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Elements of Component**

## CodeSystem: Elements of Component 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/component-elements | *Version*:0.2.0 |
| Draft as of 2026-03-09 | *Computable Name*:ComponentElements |

 
Slicing for elements of component 

 This Code system is referenced in the content logical definition of the following value sets: 

* This CodeSystem is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "component-elements",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/component-elements",
  "version" : "0.2.0",
  "name" : "ComponentElements",
  "title" : "Elements of Component",
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
  "description" : "Slicing for elements of component",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 6,
  "concept" : [{
    "code" : "ageAtEvent",
    "display" : "Age at Event"
  },
  {
    "code" : "ageAtAssertion",
    "display" : "Age at Assertion"
  },
  {
    "code" : "ageAtOnset",
    "display" : "Age at Onset"
  },
  {
    "code" : "ageAtResolution",
    "display" : "Age at Resolution"
  },
  {
    "code" : "otherModifiers",
    "display" : "Other Modifiers"
  },
  {
    "code" : "stage",
    "display" : "Stage"
  }]
}

```

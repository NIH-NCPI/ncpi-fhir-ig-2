# Research Study Acknowledgement - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Research Study Acknowledgement**

## Extension: Research Study Acknowledgement 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-study-acknowledgement | *Version*:0.2.0 |
| Draft as of 2026-03-09 | *Computable Name*:ResearchStudyAcknowledgement |

Provides an informative description of acknowledgement expectations for those using data from the research study.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [NCPI Research Study](StructureDefinition-ncpi-research-study.md)
* Examples for this Extension: [ResearchStudy/kf-research-study-cbtn](ResearchStudy-kf-research-study-cbtn.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/research-study-acknowledgement)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-research-study-acknowledgement.csv), [Excel](StructureDefinition-research-study-acknowledgement.xlsx), [Schematron](StructureDefinition-research-study-acknowledgement.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "research-study-acknowledgement",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-study-acknowledgement",
  "version" : "0.2.0",
  "name" : "ResearchStudyAcknowledgement",
  "title" : "Research Study Acknowledgement",
  "status" : "draft",
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
  "description" : "Provides an informative description of acknowledgement expectations for those using data from the research study.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "ResearchStudy"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Research Study Acknowledgement",
      "definition" : "Provides an informative description of acknowledgement expectations for those using data from the research study."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-study-acknowledgement"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "short" : "Details about acknowledgement requirements for derivative publications.",
      "min" : 1,
      "type" : [{
        "code" : "markdown"
      }]
    }]
  }
}

```

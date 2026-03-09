# Research Usage Limitation Disease Code - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Research Usage Limitation Disease Code**

## Extension: Research Usage Limitation Disease Code 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-disease-use-limitation | *Version*:0.2.0 |
| Draft as of 2026-03-09 | *Computable Name*:ResearchDiseaseUseLimitation |

Coding associated with limitation on what research can be performed this data.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [NCPI Research Access Policy](StructureDefinition-ncpi-research-access-policy.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/research-disease-use-limitation)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-research-disease-use-limitation.csv), [Excel](StructureDefinition-research-disease-use-limitation.xlsx), [Schematron](StructureDefinition-research-disease-use-limitation.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "research-disease-use-limitation",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-disease-use-limitation",
  "version" : "0.2.0",
  "name" : "ResearchDiseaseUseLimitation",
  "title" : "Research Usage Limitation Disease Code",
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
  "description" : "Coding associated with limitation on what research can be performed this data.",
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
    "expression" : "Consent.provision"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Research Usage Limitation Disease Code",
      "definition" : "Coding associated with limitation on what research can be performed this data."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-disease-use-limitation"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "example",
        "valueSet" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/mesh-terms"
      }
    }]
  }
}

```

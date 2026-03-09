# Research Web Link - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Research Web Link**

## Extension: Research Web Link 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-web-link | *Version*:0.2.0 |
| Draft as of 2026-03-09 | *Computable Name*:ResearchWebLink |

A URL pointing to a either a research study's website, an online document or other research related site or document.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [NCPI Research Access Policy](StructureDefinition-ncpi-research-access-policy.md) and [NCPI Research Collection](StructureDefinition-ncpi-research-collection.md)
* Examples for this Extension: [Consent/kf-gru-dac-consent](Consent-kf-gru-dac-consent.md), [Consent/kf-gru-dbgap-consent](Consent-kf-gru-dbgap-consent.md), [Consent/kf-gsr-allowed-access](Consent-kf-gsr-allowed-access.md), [Consent/kf-registered-allowed-access](Consent-kf-registered-allowed-access.md)... Show 2 more, [List/ncpi-research-collection-kfx01](List-ncpi-research-collection-kfx01.md) and [List/ncpi-research-collection-pbta](List-ncpi-research-collection-pbta.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/research-web-link)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-research-web-link.csv), [Excel](StructureDefinition-research-web-link.xlsx), [Schematron](StructureDefinition-research-web-link.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "research-web-link",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-web-link",
  "version" : "0.2.0",
  "name" : "ResearchWebLink",
  "title" : "Research Web Link",
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
  "description" : "A URL pointing to a either a research study's website, an online document or other research related site or document.",
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
    "expression" : "List"
  },
  {
    "type" : "element",
    "expression" : "Consent"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Research Web Link",
      "definition" : "A URL pointing to a either a research study's website, an online document or other research related site or document."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-web-link"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "$this"
        }],
        "ordered" : false,
        "rules" : "open"
      },
      "min" : 1
    },
    {
      "id" : "Extension.value[x]:valueUrl",
      "path" : "Extension.value[x]",
      "sliceName" : "valueUrl",
      "short" : "The URL associated with the document or related website.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "url"
      }]
    }]
  }
}

```

# Registered Tier Access - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Registered Tier Access**

## Example Consent: Registered Tier Access

Profile: [NCPI Research Access Policy](StructureDefinition-ncpi-research-access-policy.md)

## Participants


This consent is made under the regulation Common Rule Informed Consent .

The subject has given their consent.



## Resource Content

```json
{
  "resourceType" : "Consent",
  "id" : "kf-registered-allowed-access",
  "meta" : {
    "profile" : ["https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-research-access-policy"]
  },
  "extension" : [{
    "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/access-policy-description",
    "valueMarkdown" : "Spans clinical data, expression data, somatic mutations, etc"
  },
  {
    "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-web-link",
    "valueUrl" : "https://kidsfirstdrc.org/portal/portal-features/#dataAccess"
  },
  {
    "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/access-type",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/research-data-access-type",
        "code" : "registered"
      }]
    }
  }],
  "status" : "draft",
  "scope" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/consentscope",
      "code" : "research"
    }]
  },
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/consentcategorycodes",
      "code" : "research",
      "display" : "Research Information Access"
    }]
  }],
  "policyRule" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/consentpolicycodes",
      "code" : "cric"
    }]
  }
}

```

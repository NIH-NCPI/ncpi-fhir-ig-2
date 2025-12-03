# Genomic Summary Results (GSR) Allowed Access - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Genomic Summary Results (GSR) Allowed Access**

## Example Consent: Genomic Summary Results (GSR) Allowed Access

Profile: [NCPI Research Access Policy](StructureDefinition-ncpi-research-access-policy.md)

**Access Policy Description**: 

Public Posting of Genomic Summary Results - Allowed.

**Research Web Link**: [https://www.genome.gov/about-nhgri/Policies-Guidance/Data-Sharing-Policies-and-Expectations/GSR-update-FAQs](https://www.genome.gov/about-nhgri/Policies-Guidance/Data-Sharing-Policies-and-Expectations/GSR-update-FAQs)

**Access Type**: GSR Allowed

**status**: Pending

**scope**: Research

**category**: Research Information Access

**policyRule**: Common Rule Informed Consent



## Resource Content

```json
{
  "resourceType" : "Consent",
  "id" : "kf-gsr-allowed-access",
  "meta" : {
    "profile" : [
      "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-research-access-policy"
    ]
  },
  "extension" : [
    {
      "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/access-policy-description",
      "valueMarkdown" : "Public Posting of Genomic Summary Results - Allowed."
    },
    {
      "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-web-Link",
      "valueUrl" : "https://www.genome.gov/about-nhgri/Policies-Guidance/Data-Sharing-Policies-and-Expectations/GSR-update-FAQs"
    },
    {
      "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/access-type",
      "valueCodeableConcept" : {
        "coding" : [
          {
            "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/research-data-access-type",
            "code" : "gsr-allowed"
          }
        ]
      }
    }
  ],
  "status" : "draft",
  "scope" : {
    "coding" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/consentscope",
        "code" : "research"
      }
    ]
  },
  "category" : [
    {
      "coding" : [
        {
          "system" : "http://terminology.hl7.org/CodeSystem/consentcategorycodes",
          "code" : "research",
          "display" : "Research Information Access"
        }
      ]
    }
  ],
  "policyRule" : {
    "coding" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/consentpolicycodes",
        "code" : "cric"
      }
    ]
  }
}

```

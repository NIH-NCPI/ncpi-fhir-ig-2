# CBTN General Research Use (GRU) Consent DAC - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **CBTN General Research Use (GRU) Consent DAC**

## Example Consent: CBTN General Research Use (GRU) Consent DAC

Profile: [NCPI Research Access Policy](StructureDefinition-ncpi-research-access-policy.md)

**Access Policy Description**: 

Use of the data is limited only by the terms of the model Data Use Certification.

**Research Web Link**: [https://airtable.com/apperYvVD82ti3021/pagdArwI0TxJQpiVW/form](https://airtable.com/apperYvVD82ti3021/pagdArwI0TxJQpiVW/form)

**Access Type**: Controlled

**status**: Pending

**scope**: Research

**category**: Research Information Access

**policyRule**: Common Rule Informed Consent

### Provisions

| | | |
| :--- | :--- | :--- |
| - | **Type** | **Purpose** |
| * | Opt In | [Research Data Access Codes: GRU](CodeSystem-research-data-access-code.md#research-data-access-code-GRU)(General Research Use) |



## Resource Content

```json
{
  "resourceType" : "Consent",
  "id" : "kf-gru-dac-consent",
  "meta" : {
    "profile" : [
      "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-research-access-policy"
    ]
  },
  "extension" : [
    {
      "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/access-policy-description",
      "valueMarkdown" : "Use of the data is limited only by the terms of the model Data Use Certification."
    },
    {
      "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-web-link",
      "valueUrl" : "https://airtable.com/apperYvVD82ti3021/pagdArwI0TxJQpiVW/form"
    },
    {
      "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/access-type",
      "valueCodeableConcept" : {
        "coding" : [
          {
            "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/research-data-access-type",
            "code" : "controlled"
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
  },
  "provision" : {
    "type" : "permit",
    "purpose" : [
      {
        "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/research-data-access-code",
        "code" : "GRU",
        "display" : "General Research Use"
      }
    ]
  }
}

```

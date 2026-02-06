# Example file based on CBTN - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example file based on CBTN**

## Example DocumentReference: Example file based on CBTN

Profile: [NCPI File](StructureDefinition-ncpi-file.md)

**Version of the contents of the file**: V1

**The file format used**: VCF

**The size of the file, e.g., in bytes.**: 1044770380 bytes

> **Provides a list of hashes for confirming file transfers**
* https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/hash-value: 8f107912d862cf91fbfb77bf9c1bab36-4
* https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/hash-type: etag

**Part of Study**: [ResearchStudy Children's Brain Tumor Network (CBTN)](ResearchStudy-kf-research-study-cbtn.md)

**identifier**: GF-6BAD9S7D

**status**: Current

**type**: Variant calling

**subject**: [Anonymous Patient (no stated gender), DoB Unknown ( https://cbtn.org/#C21156)](Patient-PT-006SP660.md)

**description**: Annotated Variant Call

> **content****If present, only those under the specific Access Policy can access the file in this location.**: [Consent: extension = Use of the data is limited only by the terms of the model Data Use Certification.,https://redcap.chop.edu/surveys/?s=A7M873HMN8,Controlled; status = draft; scope = Research; category = Research Information Access; policyRule = Common Rule Informed Consent](Consent-kf-gru-dac-consent.md)

### Attachments

| | |
| :--- | :--- |
| - | **Url** |
| * | s3://kf-strides-study-us-east-1-prd-sd-54g4wg4r/harmonized-data/family-variants/155bb529-2e7b-474f-ba24-cd0656d5f3d0.CGP.filtered.deNovo.vep.vcf.gz |




## Resource Content

```json
{
  "resourceType" : "DocumentReference",
  "id" : "GF-6BAD9S7D",
  "meta" : {
    "profile" : [
      "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-file"
    ]
  },
  "extension" : [
    {
      "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/content-version",
      "valueString" : "V1"
    },
    {
      "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/file-format",
      "valueCodeableConcept" : {
        "coding" : [
          {
            "system" : "http://edamontology.org",
            "code" : "format_3016",
            "display" : "VCF"
          }
        ]
      }
    },
    {
      "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/file-size",
      "valueQuantity" : {
        "value" : 1044770380,
        "unit" : "bytes"
      }
    },
    {
      "extension" : [
        {
          "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/hash-value",
          "valueString" : "8f107912d862cf91fbfb77bf9c1bab36-4"
        },
        {
          "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/hash-type",
          "valueCode" : "etag"
        }
      ],
      "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/hash-extension"
    },
    {
      "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study",
      "valueReference" : {
        "reference" : "ResearchStudy/kf-research-study-cbtn"
      }
    }
  ],
  "identifier" : [
    {
      "value" : "GF-6BAD9S7D"
    }
  ],
  "status" : "current",
  "type" : {
    "coding" : [
      {
        "system" : "http://edamontology.org",
        "code" : "operation_3227",
        "display" : "Variant calling"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PT-006SP660"
  },
  "description" : "Annotated Variant Call",
  "content" : [
    {
      "extension" : [
        {
          "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/location-access",
          "valueReference" : {
            "reference" : "Consent/kf-gru-dac-consent"
          }
        }
      ],
      "attachment" : {
        "url" : "s3://kf-strides-study-us-east-1-prd-sd-54g4wg4r/harmonized-data/family-variants/155bb529-2e7b-474f-ba24-cd0656d5f3d0.CGP.filtered.deNovo.vep.vcf.gz"
      }
    }
  ]
}

```

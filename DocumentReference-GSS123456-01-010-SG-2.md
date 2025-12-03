# Example file based on GREGoR - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example file based on GREGoR**

## Example DocumentReference: Example file based on GREGoR

Profile: [NCPI File](StructureDefinition-ncpi-file.md)

**Version of the contents of the file**: V1

**The file format used**: BAM

**The size of the file, e.g., in bytes.**: 1044770380 bytes

> **Provides a list of hashes for confirming file transfers**
* https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/hash-value: 9c2460c4647fdc57261f040042863fa0
* https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/hash-type: md5

**Part of Study**: [ResearchStudy: identifier = AnVIL_GREGoR_GSS_U08_GRU; status = completed](ResearchStudy-research-study-gregor.md)

**identifier**: GSS123456-01-010-SG-2

**status**: Current

**type**: Read mapping

**subject**: [Anonymous Patient (no stated gender), DoB Unknown ( https://anvil.terra.bio/#GSS123456)](Patient-GSS123456.md)

**description**: Aligned DNA short read

> **content****If present, only those under the specific Access Policy can access the file in this location.**:[Consent: extension = Use of the data is limited only by the terms of the model Data Use Certification.,https://airtable.com/apperYvVD82ti3021/pagdArwI0TxJQpiVW/form,Controlled; status = draft; scope = Research; category = Research Information Access; policyRule = Common Rule Informed Consent](Consent-kf-gru-dac-consent.md)

### Attachments

| | |
| :--- | :--- |
| - | **Url** |
| * | gs://fc-secure-a1f0e28d-c9d9-43bb-b4ba-5e0h81784fb1/GSS123456/SR_GS/GSS123456.bam |




## Resource Content

```json
{
  "resourceType" : "DocumentReference",
  "id" : "GSS123456-01-010-SG-2",
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
            "code" : "format_2572",
            "display" : "BAM"
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
          "valueString" : "9c2460c4647fdc57261f040042863fa0"
        },
        {
          "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/hash-type",
          "valueCode" : "md5"
        }
      ],
      "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/hash-extension"
    },
    {
      "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study",
      "valueReference" : {
        "reference" : "ResearchStudy/research-study-gregor"
      }
    }
  ],
  "identifier" : [
    {
      "value" : "GSS123456-01-010-SG-2"
    }
  ],
  "status" : "current",
  "type" : {
    "coding" : [
      {
        "system" : "http://edamontology.org",
        "code" : "operation_3198",
        "display" : "Read mapping"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/GSS123456"
  },
  "description" : "Aligned DNA short read",
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
        "url" : "gs://fc-secure-a1f0e28d-c9d9-43bb-b4ba-5e0h81784fb1/GSS123456/SR_GS/GSS123456.bam"
      }
    }
  ]
}

```

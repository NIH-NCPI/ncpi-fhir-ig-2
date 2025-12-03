# Example patients based on data from PCGC - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example patients based on data from PCGC**

## Example Patient: Example patients based on data from PCGC

Profile: [NCPI Participant](StructureDefinition-ncpi-participant.md)

Anonymous Patient (no stated gender), DoB: ( http://chdgenes.org/#20757)

-------

| | |
| :--- | :--- |
| Other Id: | `http://chdgenes.org/`/PT_005B7CZ4 |
| [Part of Study](StructureDefinition-part-of-study.md) | [ResearchStudy Children's Brain Tumor Network (CBTN)](ResearchStudy-kf-research-study-cbtn.md) |
| US Core Ethnicity Extension: | * ombCategory: [CDC Race and Ethnicity: 2135-2](http://terminology.hl7.org/6.2.0/CodeSystem-CDCREC.html#CDCREC-2135-2) (Hispanic or Latino)
* text: Hispanic or Latino
 |
| [US Core Birth Sex Extension](http://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-birthsex.html) | F |
| US Core Race Extension: | * ombCategory: [CDC Race and Ethnicity: 2106-3](http://terminology.hl7.org/6.2.0/CodeSystem-CDCREC.html#CDCREC-2106-3) (White)
* text: White
 |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "PT-006SP675",
  "meta" : {
    "profile" : [
      "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-participant"
    ]
  },
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex",
      "valueCode" : "F"
    },
    {
      "extension" : [
        {
          "url" : "ombCategory",
          "valueCoding" : {
            "system" : "urn:oid:2.16.840.1.113883.6.238",
            "code" : "2106-3",
            "display" : "White"
          }
        },
        {
          "url" : "text",
          "valueString" : "White"
        }
      ],
      "url" : "http://hl7.org/fhir/us/core/StructureDefinition/us-core-race"
    },
    {
      "extension" : [
        {
          "url" : "ombCategory",
          "valueCoding" : {
            "system" : "urn:oid:2.16.840.1.113883.6.238",
            "code" : "2135-2",
            "display" : "Hispanic or Latino"
          }
        },
        {
          "url" : "text",
          "valueString" : "Hispanic or Latino"
        }
      ],
      "url" : "http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity"
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
      "system" : "http://chdgenes.org/",
      "value" : "20757"
    },
    {
      "system" : "http://chdgenes.org/",
      "value" : "PT_005B7CZ4"
    }
  ],
  "_birthDate" : {
    "extension" : [
      {
        "extension" : [
          {
            "url" : "target",
            "valueReference" : {
              "reference" : "Patient/PT-006SP675"
            }
          },
          {
            "url" : "targetPath",
            "valueString" : "birthDate"
          },
          {
            "url" : "relationship",
            "valueCode" : "after"
          },
          {
            "url" : "offset",
            "valueDuration" : {
              "value" : 2006,
              "unit" : "d",
              "system" : "http://unitsofmeasure.org",
              "code" : "days"
            }
          }
        ],
        "url" : "http://hl7.org/fhir/StructureDefinition/cqf-relativeDateTime"
      }
    ]
  }
}

```

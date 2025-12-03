# Example patients based on data from CBTN - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example patients based on data from CBTN**

## Example Patient: Example patients based on data from CBTN

Profile: [NCPI Participant](StructureDefinition-ncpi-participant.md)

Anonymous Patient (no stated gender), DoB Unknown ( https://cbtn.org/#C21156)

-------

| | |
| :--- | :--- |
| Other Id: | `https://data.kidsfirstdrc.org`/PT-006SP660 |
| [Part of Study](StructureDefinition-part-of-study.md) | [ResearchStudy Children's Brain Tumor Network (CBTN)](ResearchStudy-kf-research-study-cbtn.md) |
| US Core Ethnicity Extension: | * ombCategory: [CDC Race and Ethnicity: 2186-5](http://terminology.hl7.org/6.2.0/CodeSystem-CDCREC.html#CDCREC-2186-5) (Not Hispanic or Latino)
* text: Not Hispanic or Latino
 |
| [Age at Last Vital Status Extension](StructureDefinition-research-age-at-last-vital-status.md) | 6314 days(Details: UCUM coded = 'd') |
| [Research Date of Birth Method](StructureDefinition-research-date-of-birth-method.md) | [Enumerations for how DOB was constructed: year-only](CodeSystem-research-data-date-of-birth-method.md#research-data-date-of-birth-method-year-only)(Year Only) |
| [US Core Birth Sex Extension](http://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-birthsex.html) | F |
| US Core Race Extension: | * ombCategory: [CDC Race and Ethnicity: 2106-3](http://terminology.hl7.org/6.2.0/CodeSystem-CDCREC.html#CDCREC-2106-3) (White)
* text: White
 |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "PT-006SP660",
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
            "code" : "2186-5",
            "display" : "Not Hispanic or Latino"
          }
        },
        {
          "url" : "text",
          "valueString" : "Not Hispanic or Latino"
        }
      ],
      "url" : "http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity"
    },
    {
      "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-date-of-birth-method",
      "valueCoding" : {
        "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/research-data-date-of-birth-method",
        "code" : "year-only"
      }
    },
    {
      "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-age-at-last-vital-status",
      "valueQuantity" : {
        "value" : 6314,
        "unit" : "days",
        "system" : "http://unitsofmeasure.org",
        "code" : "d"
      }
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
      "system" : "https://cbtn.org/",
      "value" : "C21156"
    },
    {
      "system" : "https://data.kidsfirstdrc.org",
      "value" : "PT-006SP660"
    }
  ]
}

```

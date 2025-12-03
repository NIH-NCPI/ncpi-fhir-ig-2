# Example patients based on data from GREGoR - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example patients based on data from GREGoR**

## Example Patient: Example patients based on data from GREGoR

Profile: [NCPI Participant](StructureDefinition-ncpi-participant.md)

Anonymous Patient (no stated gender), DoB Unknown ( https://anvil.terra.bio/#GSS123456)

-------

| | |
| :--- | :--- |
| [Part of Study](StructureDefinition-part-of-study.md) | [ResearchStudy: identifier = AnVIL_GREGoR_GSS_U08_GRU; status = completed](ResearchStudy-research-study-gregor.md) |
| US Core Ethnicity Extension: | * ombCategory: [CDC Race and Ethnicity: 2186-5](http://terminology.hl7.org/6.2.0/CodeSystem-CDCREC.html#CDCREC-2186-5) (Not Hispanic or Latino)
* text: Not Hispanic or Latino
 |
| [US Core Birth Sex Extension](http://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-birthsex.html) | M |
| US Core Race Extension: | * ombCategory: [CDC Race and Ethnicity: 2106-3](http://terminology.hl7.org/6.2.0/CodeSystem-CDCREC.html#CDCREC-2106-3) (White)
* text: White
 |
| [Research Population](StructureDefinition-research-population.md) | English|Scottish |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "GSS123456",
  "meta" : {
    "profile" : [
      "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-participant"
    ]
  },
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex",
      "valueCode" : "M"
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
      "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-population",
      "valueString" : "English|Scottish"
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
      "system" : "https://anvil.terra.bio/",
      "value" : "GSS123456"
    }
  ]
}

```

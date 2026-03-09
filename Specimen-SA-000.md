# Example biospecimen based on data from CBTN - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example biospecimen based on data from CBTN**

## Example Specimen: Example biospecimen based on data from CBTN

Profile: [NCPI Sample](StructureDefinition-ncpi-sample.md)

**Part of Study**: [ResearchStudy Children's Brain Tumor Network (CBTN)](ResearchStudy-kf-research-study-cbtn.md)

**identifier**: SA_RV52EY7S

**type**: Peripheral Whole Blood

**subject**: [Anonymous Patient (no stated gender), DoB Unknown ( https://cbtn.org/#C21156)](Patient-PT-006SP660.md)

### Collections

| | | |
| :--- | :--- | :--- |
| - | **Collected[x]** | **Method** |
| * | `Relative date time: ` | Blood Draw |

### Containers

| | |
| :--- | :--- |
| - | **Identifier** |
| * | BS_9QM8EXG3 |



## Resource Content

```json
{
  "resourceType" : "Specimen",
  "id" : "SA-000",
  "meta" : {
    "profile" : ["https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-sample"]
  },
  "extension" : [{
    "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study",
    "valueReference" : {
      "reference" : "ResearchStudy/kf-research-study-cbtn"
    }
  }],
  "identifier" : [{
    "value" : "SA_RV52EY7S"
  }],
  "type" : {
    "text" : "Peripheral Whole Blood"
  },
  "subject" : {
    "reference" : "Patient/PT-006SP660"
  },
  "collection" : {
    "_collectedDateTime" : {
      "extension" : [{
        "extension" : [{
          "url" : "target",
          "valueReference" : {
            "reference" : "Patient/PT-006SP660"
          }
        },
        {
          "url" : "targetPath",
          "valueString" : "None"
        },
        {
          "url" : "relationship",
          "valueCode" : "after"
        },
        {
          "url" : "offset",
          "valueDuration" : {
            "value" : 4931,
            "unit" : "d",
            "system" : "http://unitsofmeasure.org",
            "code" : "days"
          }
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/cqf-relativeDateTime"
      }]
    },
    "method" : {
      "coding" : [{
        "system" : "https://loinc.org",
        "code" : "LP125037-4"
      }],
      "text" : "Blood Draw"
    }
  },
  "container" : [{
    "identifier" : [{
      "value" : "BS_9QM8EXG3"
    }]
  }]
}

```

# Example condition assertion using data from CBTN - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example condition assertion using data from CBTN**

## Example Observation: Example condition assertion using data from CBTN

Profile: [NCPI Participant Assertion](StructureDefinition-ncpi-participant-assertion.md)

**Part of Study**: [ResearchStudy Children's Brain Tumor Network (CBTN)](ResearchStudy-kf-research-study-cbtn.md)

**status**: Final

**category**: Disease

**code**: ventricular ectopy

**subject**: [Anonymous Patient (no stated gender), DoB Unknown ( https://cbtn.org/#C21156)](Patient-PT-006SP660.md)

**effective**: `Relative date time: `

**value**: Present



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "PT-006SP660-condition",
  "meta" : {
    "profile" : ["https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-participant-assertion"]
  },
  "extension" : [{
    "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study",
    "valueReference" : {
      "reference" : "ResearchStudy/kf-research-study-cbtn"
    }
  }],
  "status" : "final",
  "category" : [{
    "coding" : [{
      "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/condition-type",
      "code" : "Disease"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://purl.obolibrary.org/obo/mondo.owl",
      "code" : "MONDO:0002203"
    }],
    "text" : "ventricular ectopy"
  },
  "subject" : {
    "reference" : "Patient/PT-006SP660"
  },
  "_effectiveDateTime" : {
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
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/phenotypic-feature-assertion",
      "code" : "Present"
    }]
  }
}

```

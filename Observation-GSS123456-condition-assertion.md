# Example condition assertion using data from GREGoR - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example condition assertion using data from GREGoR**

## Example Observation: Example condition assertion using data from GREGoR

Profile: [NCPI Participant Assertion](StructureDefinition-ncpi-participant-assertion.md)

**Part of Study**: [ResearchStudy: identifier = AnVIL_GREGoR_GSS_U08_GRU; status = completed](ResearchStudy-research-study-gregor.md)

**status**: Final

**category**: Disease

**code**: retrocerebellar cyst

**subject**: [Anonymous Patient (no stated gender), DoB Unknown ( https://anvil.terra.bio/#GSS123456)](Patient-GSS123456.md)

**value**: Present

> **component****code**: otherModifiers

> **component****code**: ageAtOnset**value**: 64 years (Details: UCUM codea = 'a')

> **component****code**: otherModifiers**value**: HP:0012832



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "GSS123456-condition-assertion",
  "meta" : {
    "profile" : ["https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-participant-assertion"]
  },
  "extension" : [{
    "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study",
    "valueReference" : {
      "reference" : "ResearchStudy/research-study-gregor"
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
      "system" : "http://human-phenotype-ontology.org",
      "code" : "HP:0006951"
    }],
    "text" : "retrocerebellar cyst"
  },
  "subject" : {
    "reference" : "Patient/GSS123456"
  },
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/phenotypic-feature-assertion",
      "code" : "Present"
    }]
  },
  "component" : [{
    "code" : {
      "coding" : [{
        "code" : "otherModifiers"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "code" : "ageAtOnset"
      }]
    },
    "valueQuantity" : {
      "value" : 64,
      "unit" : "years",
      "system" : "http://unitsofmeasure.org",
      "code" : "a"
    }
  },
  {
    "code" : {
      "coding" : [{
        "code" : "otherModifiers"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://human-phenotype-ontology.org",
        "code" : "HP:0012832"
      }]
    }
  }]
}

```

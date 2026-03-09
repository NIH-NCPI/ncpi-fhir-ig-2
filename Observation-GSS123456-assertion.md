# Example assertion using data from GREGoR - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example assertion using data from GREGoR**

## Example Observation: Example assertion using data from GREGoR

Profile: [NCPI Participant Assertion](StructureDefinition-ncpi-participant-assertion.md)

**Part of Study**: [ResearchStudy: identifier = AnVIL_GREGoR_GSS_U08_GRU; status = completed](ResearchStudy-research-study-gregor.md)

**status**: Final

**category**: Clinical Finding

**code**: Height / growth measure

**subject**: [Anonymous Patient (no stated gender), DoB Unknown ( https://anvil.terra.bio/#GSS123456)](Patient-GSS123456.md)

**value**: 66 inches (Details: UCUM code[in_us] = '[in_us]')

> **component****code**: ageAtAssertion

> **component****code**: ageAtAssertion**value**: 38 year (Details: UCUM codea = 'a')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "GSS123456-assertion",
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
      "code" : "Clinical-Finding"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "271603002"
    }],
    "text" : "Height / growth measure"
  },
  "subject" : {
    "reference" : "Patient/GSS123456"
  },
  "valueQuantity" : {
    "value" : 66,
    "unit" : "inches",
    "system" : "http://unitsofmeasure.org",
    "code" : "[in_us]"
  },
  "component" : [{
    "code" : {
      "coding" : [{
        "code" : "ageAtAssertion"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "code" : "ageAtAssertion"
      }]
    },
    "valueQuantity" : {
      "value" : 38,
      "unit" : "year",
      "system" : "http://unitsofmeasure.org",
      "code" : "a"
    }
  }]
}

```

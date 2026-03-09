# Example condition summary using data from GREGoR - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example condition summary using data from GREGoR**

## Example Condition: Example condition summary using data from GREGoR

Profile: [NCPI Conditon Summary](StructureDefinition-ncpi-condition-summary.md)

**Any additional modifiers for this condition, such as severity.**: HP:0012832

**Part of Study**: [ResearchStudy: identifier = AnVIL_GREGoR_GSS_U08_GRU; status = completed](ResearchStudy-research-study-gregor.md)

**category**: Disease

**code**: retrocerebellar cyst

**subject**: [Anonymous Patient (no stated gender), DoB Unknown ( https://anvil.terra.bio/#GSS123456)](Patient-GSS123456.md)

**onset**: 64 years (Details: UCUM codea = 'a')



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "GSS123456-condition-summary",
  "meta" : {
    "profile" : ["https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-condition-summary"]
  },
  "extension" : [{
    "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/other-condition-modifiers",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://human-phenotype-ontology.org",
        "code" : "HP:0012832"
      }]
    }
  },
  {
    "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study",
    "valueReference" : {
      "reference" : "ResearchStudy/research-study-gregor"
    }
  }],
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
  "onsetAge" : {
    "value" : 64,
    "unit" : "years",
    "system" : "http://unitsofmeasure.org",
    "code" : "a"
  }
}

```

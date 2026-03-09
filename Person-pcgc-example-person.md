# Example patients based on data from PCGC - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example patients based on data from PCGC**

## Example Person: Example patients based on data from PCGC

Profile: [NCPI Person](StructureDefinition-ncpi-person.md)

**Part of Study**: [ResearchStudy Children's Brain Tumor Network (CBTN)](ResearchStudy-kf-research-study-cbtn.md)

**identifier**: `http://chdgenes.org/`/PS_123

### Links

| | |
| :--- | :--- |
| - | **Target** |
| * | [Anonymous Patient (no stated gender), DoB: ( http://chdgenes.org/#20757)](Patient-PT-006SP675.md) |



## Resource Content

```json
{
  "resourceType" : "Person",
  "id" : "pcgc-example-person",
  "meta" : {
    "profile" : ["https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-person"]
  },
  "extension" : [{
    "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study",
    "valueReference" : {
      "reference" : "ResearchStudy/kf-research-study-cbtn"
    }
  }],
  "identifier" : [{
    "system" : "http://chdgenes.org/",
    "value" : "PS_123"
  }],
  "link" : [{
    "target" : {
      "reference" : "Patient/PT-006SP675"
    }
  }]
}

```

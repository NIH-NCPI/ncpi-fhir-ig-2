# An example family relationship based on data from CBTN - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **An example family relationship based on data from CBTN**

## Example Observation: An example family relationship based on data from CBTN

Profile: [Family Relationship](StructureDefinition-ncpi-family-relationship.md)

**Part of Study**: [ResearchStudy Children's Brain Tumor Network (CBTN)](ResearchStudy-kf-research-study-cbtn.md)

**status**: Registered

**code**: natural son

**subject**: [Anonymous Patient (no stated gender), DoB: ( http://chdgenes.org/#20757)](Patient-PT-006SP675.md)

**focus**: [Anonymous Patient (no stated gender), DoB Unknown ( https://cbtn.org/#C21156)](Patient-PT-006SP660.md)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "cbtn-family-relationship-son",
  "meta" : {
    "profile" : [
      "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-family-relationship"
    ]
  },
  "extension" : [
    {
      "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study",
      "valueReference" : {
        "reference" : "ResearchStudy/kf-research-study-cbtn"
      }
    }
  ],
  "status" : "registered",
  "code" : {
    "coding" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
        "code" : "SON",
        "display" : "natural son"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PT-006SP675"
  },
  "focus" : [
    {
      "reference" : "Patient/PT-006SP660"
    }
  ]
}

```

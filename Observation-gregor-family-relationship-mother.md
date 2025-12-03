# An example family relationship based on data from GREGoR - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **An example family relationship based on data from GREGoR**

## Example Observation: An example family relationship based on data from GREGoR

Profile: [Family Relationship](StructureDefinition-ncpi-family-relationship.md)

**Part of Study**: [ResearchStudy: identifier = AnVIL_GREGoR_GSS_U08_GRU; status = completed](ResearchStudy-research-study-gregor.md)

**status**: Registered

**code**: child

**subject**: [Anonymous Patient (no stated gender), DoB Unknown ( https://anvil.terra.bio/#GSS123456)](Patient-GSS123456.md)

**focus**: [Anonymous Patient (no stated gender), DoB Unknown ( https://anvil.terra.bio/#GSS654321)](Patient-GSS654321.md)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "gregor-family-relationship-mother",
  "meta" : {
    "profile" : [
      "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-family-relationship"
    ]
  },
  "extension" : [
    {
      "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study",
      "valueReference" : {
        "reference" : "ResearchStudy/research-study-gregor"
      }
    }
  ],
  "status" : "registered",
  "code" : {
    "coding" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
        "code" : "CHILD",
        "display" : "child"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/GSS123456"
  },
  "focus" : [
    {
      "reference" : "Patient/GSS654321"
    }
  ]
}

```

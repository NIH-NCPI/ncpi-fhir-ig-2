# Example family member based on data from GREGoR - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example family member based on data from GREGoR**

## Example Patient: Example family member based on data from GREGoR

Profile: [NCPI Participant](StructureDefinition-ncpi-participant.md)

Anonymous Patient (no stated gender), DoB Unknown ( https://anvil.terra.bio/#GSS654321)

-------

| | |
| :--- | :--- |
| [Part of Study](StructureDefinition-part-of-study.md) | [ResearchStudy: identifier = AnVIL_GREGoR_GSS_U08_GRU; status = completed](ResearchStudy-research-study-gregor.md) |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "GSS654321",
  "meta" : {
    "profile" : ["https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-participant"]
  },
  "extension" : [{
    "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study",
    "valueReference" : {
      "reference" : "ResearchStudy/research-study-gregor"
    }
  }],
  "identifier" : [{
    "system" : "https://anvil.terra.bio/",
    "value" : "GSS654321"
  }]
}

```

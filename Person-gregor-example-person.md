# Example patients based on data from GREGoR - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example patients based on data from GREGoR**

## Example Person: Example patients based on data from GREGoR

Profile: [NCPI Person](StructureDefinition-ncpi-person.md)

**Part of Study**: [ResearchStudy: identifier = AnVIL_GREGoR_GSS_U08_GRU; status = completed](ResearchStudy-research-study-gregor.md)

**identifier**: `https://anvil.terra.bio`/PS_000

### Links

| | |
| :--- | :--- |
| - | **Target** |
| * | [Anonymous Patient (no stated gender), DoB Unknown ( https://anvil.terra.bio/#GSS123456)](Patient-GSS123456.md) |



## Resource Content

```json
{
  "resourceType" : "Person",
  "id" : "gregor-example-person",
  "meta" : {
    "profile" : [
      "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-person"
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
  "identifier" : [
    {
      "system" : "https://anvil.terra.bio",
      "value" : "PS_000"
    }
  ],
  "link" : [
    {
      "target" : {
        "reference" : "Patient/GSS123456"
      }
    }
  ]
}

```

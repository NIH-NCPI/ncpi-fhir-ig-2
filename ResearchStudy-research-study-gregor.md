# Example study from GREGoR - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example study from GREGoR**

## Example ResearchStudy: Example study from GREGoR

Profile: [NCPI Research Study](StructureDefinition-ncpi-research-study.md)

**identifier**: AnVIL_GREGoR_GSS_U08_GRU

**status**: Completed



## Resource Content

```json
{
  "resourceType" : "ResearchStudy",
  "id" : "research-study-gregor",
  "meta" : {
    "profile" : [
      "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-research-study"
    ]
  },
  "identifier" : [
    {
      "value" : "AnVIL_GREGoR_GSS_U08_GRU"
    }
  ],
  "status" : "completed"
}

```

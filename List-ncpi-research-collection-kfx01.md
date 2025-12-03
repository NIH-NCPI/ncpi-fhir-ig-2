# Kids First X01s - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Kids First X01s**

## Example List: Kids First X01s

Profile: [NCPI Research Collection](StructureDefinition-ncpi-research-collection.md)

## Kids First X01s

| | | |
| :--- | :--- | :--- |
| Mode: Snapshot List | Status: Current | Code: Program |
|  | | |

note

> 

Through its Data Resource Center and NIH X01 grant mechanism, Kids First supports data generation and data sharing in the cloud. To date, the program has supported the public release of data from 30 projects and made available nearly 30,000 genomes, representing structural birth defects and childhood cancer patients and families through the Kids First Data Resource Portal


* **Items**: [ResearchStudy Children's Brain Tumor Network (CBTN)](ResearchStudy-kf-research-study-cbtn.md)



## Resource Content

```json
{
  "resourceType" : "List",
  "id" : "ncpi-research-collection-kfx01",
  "meta" : {
    "profile" : [
      "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-research-collection"
    ]
  },
  "extension" : [
    {
      "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-web-link",
      "valueUrl" : "https://cbtn.org/pediatric-brain-tumor-atlas"
    }
  ],
  "status" : "current",
  "mode" : "snapshot",
  "title" : "Kids First X01s",
  "code" : {
    "coding" : [
      {
        "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/collection-type",
        "code" : "program",
        "display" : "Program"
      }
    ]
  },
  "note" : [
    {
      "text" : "Through its Data Resource Center and NIH X01 grant mechanism, Kids First supports data generation and data sharing in the cloud. To date, the program has supported the public release of data from 30 projects and made available nearly 30,000 genomes, representing structural birth defects and childhood cancer patients and families through the Kids First Data Resource Portal"
    }
  ],
  "entry" : [
    {
      "item" : {
        "reference" : "ResearchStudy/kf-research-study-cbtn"
      }
    }
  ]
}

```

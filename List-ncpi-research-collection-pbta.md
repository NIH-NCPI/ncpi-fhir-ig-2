# Pediatric Brain Tumor Atlas - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Pediatric Brain Tumor Atlas**

## Example List: Pediatric Brain Tumor Atlas

Profile: [NCPI Research Collection](StructureDefinition-ncpi-research-collection.md)

## Pediatric Brain Tumor Atlas

| | | |
| :--- | :--- | :--- |
| Mode: Snapshot List | Status: Current | Code: Consortium |
|  | | |

note

> 

The Pediatric Brain Tumor Atlas (PBTA) is a collaborative effort to accelerate discoveries for therapeutic intervention for children diagnosed with a brain tumor. The first PBTA dataset release occurred in September of 2018 and includes data from tumor types including matched tumor/normal, whole genome data (WGS), RNAseq, proteomics, longitudinal clinical data, imaging data including MRIs and radiology reports, histology slide images and pathology reports. Funding for this initiative was provided by more than 50 foundation sponsors


* **Items**: [ResearchStudy Children's Brain Tumor Network (CBTN)](ResearchStudy-kf-research-study-cbtn.md)



## Resource Content

```json
{
  "resourceType" : "List",
  "id" : "ncpi-research-collection-pbta",
  "meta" : {
    "profile" : [
      "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-research-collection"
    ]
  },
  "extension" : [
    {
      "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-web-Link",
      "valueUrl" : "https://cbtn.org/pediatric-brain-tumor-atlas"
    },
    {
      "extension" : [
        {
          "url" : "type",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://hl7.org/fhir/title-type",
                "code" : "acronym"
              }
            ]
          }
        },
        {
          "url" : "label",
          "valueString" : "PBTA"
        }
      ],
      "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/label-extension"
    }
  ],
  "status" : "current",
  "mode" : "snapshot",
  "title" : "Pediatric Brain Tumor Atlas",
  "code" : {
    "coding" : [
      {
        "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/collection-type",
        "code" : "consortium",
        "display" : "Consortium"
      }
    ]
  },
  "note" : [
    {
      "text" : "The Pediatric Brain Tumor Atlas (PBTA) is a collaborative effort to accelerate discoveries for therapeutic intervention for children diagnosed with a brain tumor. The first PBTA dataset release occurred in September of 2018 and includes data from tumor types including matched tumor/normal, whole genome data (WGS), RNAseq, proteomics, longitudinal clinical data, imaging data including MRIs and radiology reports, histology slide images and pathology reports. Funding for this initiative was provided by more than 50 foundation sponsors"
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

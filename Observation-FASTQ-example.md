# Example file metadata from CBTN - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example file metadata from CBTN**

## Example Observation: Example file metadata from CBTN

Profile: [NCPI FASTQ File](StructureDefinition-ncpi-fastq.md)

**Part of Study**: [ResearchStudy Children's Brain Tumor Network (CBTN)](ResearchStudy-kf-research-study-cbtn.md)

**status**: Final

**code**: format_1930

**focus**: [DocumentReference: extension = V1,VCF,1044770380 bytes,,->ResearchStudy Children's Brain Tumor Network (CBTN); identifier = GF-6BAD9S7D; status = current; type = Variant calling; description = Annotated Variant Call](DocumentReference-GF-6BAD9S7D.md)

**specimen**: [Specimen: extension = ->ResearchStudy Children's Brain Tumor Network (CBTN); identifier = SA_RV52EY7S; type = ](Specimen-SA-000.md)

> **component****code**: Assay strategy**value**: whole genome sequencing assay

> **component****code**: Platform instrument**value**: Illumina HiSeq 2000

> **component****code**: Library preparation**value**: polyA

> **component****code**: Library selection**value**: PolyTEnrichment

> **component****code**: Strandedness**value**: unstranded

> **component****code**: Is paired end**value**: false

> **component****code**: Adaptor trimmed**value**: true



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "FASTQ-example",
  "meta" : {
    "profile" : [
      "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-fastq"
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
  "status" : "final",
  "code" : {
    "coding" : [
      {
        "system" : "http://edamontology.org",
        "code" : "format_1930"
      }
    ]
  },
  "focus" : [
    {
      "reference" : "DocumentReference/GF-6BAD9S7D"
    }
  ],
  "specimen" : {
    "reference" : "Specimen/SA-000"
  },
  "component" : [
    {
      "code" : {
        "coding" : [
          {
            "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/metadata-elements",
            "code" : "AssayStrategy"
          }
        ]
      },
      "valueCodeableConcept" : {
        "coding" : [
          {
            "system" : "http://purl.obolibrary.org/obo/obi.owl",
            "code" : "0002117",
            "display" : "whole genome sequencing assay"
          }
        ]
      }
    },
    {
      "code" : {
        "coding" : [
          {
            "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/metadata-elements",
            "code" : "PlatformInstrument"
          }
        ]
      },
      "valueCodeableConcept" : {
        "coding" : [
          {
            "system" : "http://purl.obolibrary.org/obo/obi.owl",
            "code" : "0002001",
            "display" : "Illumina HiSeq 2000"
          }
        ]
      }
    },
    {
      "code" : {
        "coding" : [
          {
            "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/metadata-elements",
            "code" : "LibraryPrep"
          }
        ]
      },
      "valueCodeableConcept" : {
        "coding" : [
          {
            "code" : "polyA"
          }
        ]
      }
    },
    {
      "code" : {
        "coding" : [
          {
            "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/metadata-elements",
            "code" : "LibrarySelection"
          }
        ]
      },
      "valueCodeableConcept" : {
        "coding" : [
          {
            "code" : "PolyTEnrichment"
          }
        ]
      }
    },
    {
      "code" : {
        "coding" : [
          {
            "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/metadata-elements",
            "code" : "Strandedness"
          }
        ]
      },
      "valueCodeableConcept" : {
        "coding" : [
          {
            "code" : "unstranded"
          }
        ]
      }
    },
    {
      "code" : {
        "coding" : [
          {
            "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/metadata-elements",
            "code" : "IsPairedEnd"
          }
        ]
      },
      "valueBoolean" : false
    },
    {
      "code" : {
        "coding" : [
          {
            "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/metadata-elements",
            "code" : "AdaptorTrimmed"
          }
        ]
      },
      "valueBoolean" : true
    }
  ]
}

```

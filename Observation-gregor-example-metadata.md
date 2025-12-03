# Example file metadata for a BAM-CRAM file from GREGoR - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example file metadata for a BAM-CRAM file from GREGoR**

## Example Observation: Example file metadata for a BAM-CRAM file from GREGoR

Profile: [BAM or CRAM file profile](StructureDefinition-ncpi-bamcram.md)

**Part of Study**: [ResearchStudy: identifier = AnVIL_GREGoR_GSS_U08_GRU; status = completed](ResearchStudy-research-study-gregor.md)

**status**: Final

**code**: format_2572

**focus**: [Anonymous Patient (no stated gender), DoB Unknown ( https://anvil.terra.bio/#GSS123456)](Patient-GSS123456.md)

**specimen**: [Specimen: extension = ->ResearchStudy: identifier = AnVIL_GREGoR_GSS_U08_GRU; status = completed; identifier = GSS123456-s1; type =](Specimen-GSS123456-01-010.md)

> **component****code**:Assay strategy**value**:whole genome sequencing assay

> **component****code**:Platform instrument**value**:Illumina HiSeq 2000

> **component****code**:Library preparation**value**:polyA

> **component****code**:Library selection**value**:PolyTEnrichment

> **component****code**:Target region**value**:Not Applicable

> **component****code**:Strandedness**value**:stranded

> **component****code**:Reference genome**value**:GRCh38

> **component****code**:Is paired end**value**: false

> **component****code**:Workflow tool**value**:bammem

> **component****code**:Workflow type**value**:alignment



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "gregor-example-metadata",
  "meta" : {
    "profile" : [
      "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-bamcram"
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
  "status" : "final",
  "code" : {
    "coding" : [
      {
        "system" : "http://edamontology.org",
        "code" : "format_2572"
      }
    ]
  },
  "focus" : [
    {
      "reference" : "Patient/GSS123456"
    }
  ],
  "specimen" : {
    "reference" : "Specimen/GSS123456-01-010"
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
            "code" : "TargetRegion"
          }
        ]
      },
      "valueCodeableConcept" : {
        "text" : "Not Applicable"
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
            "code" : "stranded"
          }
        ]
      }
    },
    {
      "code" : {
        "coding" : [
          {
            "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/metadata-elements",
            "code" : "ReferenceGenome"
          }
        ]
      },
      "valueCodeableConcept" : {
        "coding" : [
          {
            "code" : "GRCh38"
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
            "code" : "WorkflowTool"
          }
        ]
      },
      "valueCodeableConcept" : {
        "coding" : [
          {
            "code" : "bammem"
          }
        ]
      }
    },
    {
      "code" : {
        "coding" : [
          {
            "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/metadata-elements",
            "code" : "WorkflowType"
          }
        ]
      },
      "valueCodeableConcept" : {
        "coding" : [
          {
            "code" : "alignment"
          }
        ]
      }
    }
  ]
}

```

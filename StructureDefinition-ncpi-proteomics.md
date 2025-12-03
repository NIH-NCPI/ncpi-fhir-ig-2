# Proteomics file profile - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Proteomics file profile**

## Resource Profile: Proteomics file profile 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-proteomics | *Version*:0.2.0 |
| Draft as of 2025-12-03 | *Computable Name*:NcpiProteomics |

 
Proteomics file profile 

### Proteomics File Metadata

| | | | |
| :--- | :--- | :--- | :--- |
| **Logical Model Property** | **Cardinality** | **NCPI FHIR Resource** | **Value Set or Example** |
| parent_file | 1..1 | Observation.focus | [NCPI File Metadata](StructureDefinition-ncpi-file-metadata.md) |
| assay_strategy | 1..1 | Observation.component | e.g., Whole Genome Sequencing |
| platform_instrument | 1..1 | Observation.component | e.g., Illumina HiSeq2000 |
| library_prep | 0..1 | Observation.component | e.g., polyA |
| library_selection | 0..1 | Observation.component |   |
| strandedness | 0..1 | Observation.component | stranded, unstranded |
| target_region | 0..1 | Observation.component |   |
| is_paired_end | 0..1 | Observation.component | True, False |
| adaptor_trimmed | 0..1 | Observation.component | True, False |
| reference_genome | 1..1 | Observation.component | GRCh37, GRCh38 |
| workflow_type | 1..1 | Observation.component | e.g., alignment, somatic |
| workflow_tool | 1..1 | Observation.component | e.g., BAM-MEM, GATK-Haplotype Caller |
| related_samples | 0..* | Extension Reference(Any) | e.g., Reference(Participant_ID) |

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/ncpi-proteomics)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ncpi-proteomics.csv), [Excel](StructureDefinition-ncpi-proteomics.xlsx), [Schematron](StructureDefinition-ncpi-proteomics.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ncpi-proteomics",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-proteomics",
  "version" : "0.2.0",
  "name" : "NcpiProteomics",
  "title" : "Proteomics file profile",
  "status" : "draft",
  "date" : "2025-12-03T18:37:31+00:00",
  "publisher" : "NCPI FHIR Working Group",
  "contact" : [
    {
      "name" : "NCPI FHIR Working Group",
      "telecom" : [
        {
          "system" : "url",
          "value" : "http://example.org/example-publisher"
        },
        {
          "system" : "email",
          "value" : "ncpi-fhir-ig@googlegroups.com"
        }
      ]
    }
  ],
  "description" : "Proteomics file profile",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "workflow",
      "uri" : "http://hl7.org/fhir/workflow",
      "name" : "Workflow Pattern"
    },
    {
      "identity" : "sct-concept",
      "uri" : "http://snomed.info/conceptdomain",
      "name" : "SNOMED CT Concept Domain Binding"
    },
    {
      "identity" : "v2",
      "uri" : "http://hl7.org/v2",
      "name" : "HL7 v2 Mapping"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "sct-attr",
      "uri" : "http://snomed.org/attributebinding",
      "name" : "SNOMED CT Attribute Binding"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Observation",
  "baseDefinition" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-file-metadata",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Observation",
        "path" : "Observation"
      },
      {
        "id" : "Observation.extension",
        "path" : "Observation.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        }
      },
      {
        "id" : "Observation.extension:collection",
        "path" : "Observation.extension",
        "sliceName" : "collection",
        "short" : "Linkage for related samples",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/specimen-collection"
            ]
          }
        ]
      },
      {
        "id" : "Observation.component",
        "path" : "Observation.component",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "description" : "Slice pattern for component.code",
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 5
      },
      {
        "id" : "Observation.component:assay_strategy",
        "path" : "Observation.component",
        "sliceName" : "assay_strategy",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "Observation.component:assay_strategy.code",
        "path" : "Observation.component.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "code" : "AssayStrategy"
            }
          ]
        }
      },
      {
        "id" : "Observation.component:assay_strategy.value[x]",
        "path" : "Observation.component.value[x]",
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ],
        "binding" : {
          "strength" : "preferred",
          "valueSet" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/assay-strategy-vs"
        }
      },
      {
        "id" : "Observation.component:platform_instrument",
        "path" : "Observation.component",
        "sliceName" : "platform_instrument",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "Observation.component:platform_instrument.code",
        "path" : "Observation.component.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "code" : "PlatformInstrument"
            }
          ]
        }
      },
      {
        "id" : "Observation.component:platform_instrument.value[x]",
        "path" : "Observation.component.value[x]",
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ],
        "binding" : {
          "strength" : "preferred",
          "valueSet" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/platform-instrument-vs"
        }
      },
      {
        "id" : "Observation.component:library_prep",
        "path" : "Observation.component",
        "sliceName" : "library_prep",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Observation.component:library_prep.code",
        "path" : "Observation.component.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "code" : "LibraryPrep"
            }
          ]
        }
      },
      {
        "id" : "Observation.component:library_prep.value[x]",
        "path" : "Observation.component.value[x]",
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ]
      },
      {
        "id" : "Observation.component:library_selection",
        "path" : "Observation.component",
        "sliceName" : "library_selection",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Observation.component:library_selection.code",
        "path" : "Observation.component.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "code" : "LibrarySelection"
            }
          ]
        }
      },
      {
        "id" : "Observation.component:library_selection.value[x]",
        "path" : "Observation.component.value[x]",
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ]
      },
      {
        "id" : "Observation.component:strandedness",
        "path" : "Observation.component",
        "sliceName" : "strandedness",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Observation.component:strandedness.code",
        "path" : "Observation.component.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "code" : "Strandedness"
            }
          ]
        }
      },
      {
        "id" : "Observation.component:strandedness.value[x]",
        "path" : "Observation.component.value[x]",
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ]
      },
      {
        "id" : "Observation.component:target_region",
        "path" : "Observation.component",
        "sliceName" : "target_region",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Observation.component:target_region.code",
        "path" : "Observation.component.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "code" : "TargetRegion"
            }
          ]
        }
      },
      {
        "id" : "Observation.component:target_region.value[x]",
        "path" : "Observation.component.value[x]",
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ]
      },
      {
        "id" : "Observation.component:is_paired_end",
        "path" : "Observation.component",
        "sliceName" : "is_paired_end",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Observation.component:is_paired_end.code",
        "path" : "Observation.component.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "code" : "IsPairedEnd"
            }
          ]
        }
      },
      {
        "id" : "Observation.component:is_paired_end.value[x]",
        "path" : "Observation.component.value[x]",
        "type" : [
          {
            "code" : "CodeableConcept"
          },
          {
            "code" : "boolean"
          }
        ]
      },
      {
        "id" : "Observation.component:adaptor_trimmed",
        "path" : "Observation.component",
        "sliceName" : "adaptor_trimmed",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Observation.component:adaptor_trimmed.code",
        "path" : "Observation.component.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "code" : "AdaptorTrimmed"
            }
          ]
        }
      },
      {
        "id" : "Observation.component:adaptor_trimmed.value[x]",
        "path" : "Observation.component.value[x]",
        "type" : [
          {
            "code" : "CodeableConcept"
          },
          {
            "code" : "boolean"
          }
        ]
      },
      {
        "id" : "Observation.component:reference_genome",
        "path" : "Observation.component",
        "sliceName" : "reference_genome",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "Observation.component:reference_genome.code",
        "path" : "Observation.component.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "code" : "ReferenceGenome"
            }
          ]
        }
      },
      {
        "id" : "Observation.component:reference_genome.value[x]",
        "path" : "Observation.component.value[x]",
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ]
      },
      {
        "id" : "Observation.component:workflow_type",
        "path" : "Observation.component",
        "sliceName" : "workflow_type",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "Observation.component:workflow_type.code",
        "path" : "Observation.component.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "code" : "WorkflowType"
            }
          ]
        }
      },
      {
        "id" : "Observation.component:workflow_type.value[x]",
        "path" : "Observation.component.value[x]",
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ]
      },
      {
        "id" : "Observation.component:workflow_tool",
        "path" : "Observation.component",
        "sliceName" : "workflow_tool",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "Observation.component:workflow_tool.code",
        "path" : "Observation.component.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "code" : "WorkflowTool"
            }
          ]
        }
      },
      {
        "id" : "Observation.component:workflow_tool.value[x]",
        "path" : "Observation.component.value[x]",
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ]
      }
    ]
  }
}

```

# NCPI FASTQ File - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NCPI FASTQ File**

## Resource Profile: NCPI FASTQ File 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-fastq | *Version*:0.2.0 |
| Draft as of 2026-02-06 | *Computable Name*:NcpiFASTQ |

 
NCPI FASTQ File 

### FASTQ File Metadata

| | | | |
| :--- | :--- | :--- | :--- |
| **Logical Model Property** | **Cardinality** | **NCPI FHIR Resource** | **Value Set or Example** |
| parent_file | 1..1 | Observation.focus | [NCPI File Metadata](StructureDefinition-ncpi-file-metadata.md) |
| assay_strategy | 1..1 | Observation.component | e.g., Whole Genome Sequencing |
| platform_instrument | 1..1 | Observation.component | e.g., Illumina HiSeq2000 |
| library_prep | 1..1 | Observation.component | e.g., polyA |
| library_selection | 1..1 | Observation.component |   |
| strandedness | 1..1 | Observation.component | stranded, unstranded |
| target_region | 1..1 | Observation.component |   |
| is_paired_end | 1..1 | Observation.component | True, False |
| adaptor_trimmed | 1..1 | Observation.component | True, False |
| reference_genome | 0..1 | Observation.component | GRCh37, GRCh38 |
| workflow_type | 0..1 | Observation.component | e.g., alignment, somatic |
| workflow_tool | 0..1 | Observation.component | e.g., BAM-MEM, GATK-Haplotype Caller |
| related_samples | 0..* | Extension Reference(Any) | e.g., Reference(Participant_ID) |

**Usages:**

* Examples for this Profile: [Observation/FASTQ-example](Observation-FASTQ-example.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/ncpi-fastq)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ncpi-fastq.csv), [Excel](StructureDefinition-ncpi-fastq.xlsx), [Schematron](StructureDefinition-ncpi-fastq.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ncpi-fastq",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-fastq",
  "version" : "0.2.0",
  "name" : "NcpiFASTQ",
  "title" : "NCPI FASTQ File",
  "status" : "draft",
  "date" : "2026-02-06T18:07:39+00:00",
  "publisher" : "NCPI FHIR Working Group",
  "contact" : [
    {
      "name" : "NCPI FHIR Working Group",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://www.ncpi-acc.org/about/working-groups"
        },
        {
          "system" : "email",
          "value" : "ncpi-fhir-ig@googlegroups.com"
        }
      ]
    }
  ],
  "description" : "NCPI FASTQ File",
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
        "min" : 7
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
              "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/metadata-elements",
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
              "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/metadata-elements",
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
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "Observation.component:library_prep.code",
        "path" : "Observation.component.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/metadata-elements",
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
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "Observation.component:library_selection.code",
        "path" : "Observation.component.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/metadata-elements",
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
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "Observation.component:strandedness.code",
        "path" : "Observation.component.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/metadata-elements",
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
              "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/metadata-elements",
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
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "Observation.component:is_paired_end.code",
        "path" : "Observation.component.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/metadata-elements",
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
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "Observation.component:adaptor_trimmed.code",
        "path" : "Observation.component.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/metadata-elements",
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
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Observation.component:reference_genome.code",
        "path" : "Observation.component.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/metadata-elements",
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
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Observation.component:workflow_type.code",
        "path" : "Observation.component.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/metadata-elements",
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
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Observation.component:workflow_tool.code",
        "path" : "Observation.component.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/metadata-elements",
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

# NCPI File Meta Data - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NCPI File Meta Data**

## Resource Profile: NCPI File Meta Data 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-file-metadata | *Version*:0.2.0 |
| Draft as of 2026-01-13 | *Computable Name*:NcpiFileMetadata |

 
Representation of file metadata for NCPI 

#### Key Guidelines

The NCPI File Metadata profile is based on the standard resource type, [Observation](https://hl7.org/fhir/r4/observation.html) and is intended to represent information about the file metadata associated with a file.

##### Added Profile Restrictions

In order to ensure that our resources are interoperable across studies, we have employed a number of restrictions that should make consuming Patient resources more consistent.

The NCPI File Metadata profile is essentially a collection of slices built on one another.

#### Recommended Practices

This IG supports FASTQ, BAM/CRAM, MAF, VCF, and Proteomics file types, all of which use the NCPI File Metadata profile as its Parent. Each file has a set of expectations for pieces of information to include based on the specific needs of each file type.

##### FHIR Mappings

The following fields from the shared data model are to be mapped to the NCPI File Metadata as shown below:

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| **Logical Model Property** | **Cardinality** | **NCPI FHIR Mapping** | **Usage Guidance** | **Notes** |
| parent_file | 1..1 | focus | A Reference to a file to which the metadata is related |   |
| assay_strategy | [BAM/CRAM](StructureDefinition-ncpi-bamcram-definitions.md#Observation.component:assay_strategy),[FASTQ](StructureDefinition-ncpi-fastq-definitions.md#Observation.component:assay_strategy),[MAF](StructureDefinition-ncpi-maf-definitions.md#Observation.component:assay_strategy),[Proteomics](StructureDefinition-ncpi-proteomics-definitions.md#Observation.component:assay_strategy),[VCF](StructureDefinition-ncpi-vcf-definitions.md#Observation.component:assay_strategy) | Observation.component | e.g., Whole Genome Sequencing |   |
| platform_instrument | [BAM/CRAM](StructureDefinition-ncpi-bamcram-definitions.md#Observation.component:platform_instrument),[FASTQ](StructureDefinition-ncpi-fastq-definitions.md#Observation.component:platform_instrument),[MAF](StructureDefinition-ncpi-maf-definitions.md#Observation.component:platform_instrument),[Proteomics](StructureDefinition-ncpi-proteomics-definitions.md#Observation.component:platform_instrument),[VCF](StructureDefinition-ncpi-vcf-definitions.md#Observation.component:platform_instrument) | Observation.component | e.g., Illumina HiSeq2000 |   |
| library_prep | [BAM/CRAM](StructureDefinition-ncpi-bamcram-definitions.md#Observation.component:library_prep),[FASTQ](StructureDefinition-ncpi-fastq-definitions.md#Observation.component:library_prep),[MAF](StructureDefinition-ncpi-maf-definitions.md#Observation.component:library_prep),[Proteomics](StructureDefinition-ncpi-proteomics-definitions.md#Observation.component:library_prep),[VCF](StructureDefinition-ncpi-vcf-definitions.md#Observation.component:library_prep) | Observation.component | e.g., polyA |   |
| library_selection | [BAM/CRAM](StructureDefinition-ncpi-bamcram-definitions.md#Observation.component:library_selection),[FASTQ](StructureDefinition-ncpi-fastq-definitions.md#Observation.component:library_selection),[MAF](StructureDefinition-ncpi-maf-definitions.md#Observation.component:library_selection),[Proteomics](StructureDefinition-ncpi-proteomics-definitions.md#Observation.component:library_selection),[VCF](StructureDefinition-ncpi-vcf-definitions.md#Observation.component:library_selection) | Observation.component |   |   |
| strandedness | [BAM/CRAM](StructureDefinition-ncpi-bamcram-definitions.md#Observation.component:strandedness),[FASTQ](StructureDefinition-ncpi-fastq-definitions.md#Observation.component:strandedness),[MAF](StructureDefinition-ncpi-maf-definitions.md#Observation.component:strandedness),[Proteomics](StructureDefinition-ncpi-proteomics-definitions.md#Observation.component:strandedness),[VCF](StructureDefinition-ncpi-vcf-definitions.md#Observation.component:strandedness) | Observation.component | stranded, unstranded |   |
| target_region | [BAM/CRAM](StructureDefinition-ncpi-bamcram-definitions.md#Observation.component:target_region),[FASTQ](StructureDefinition-ncpi-fastq-definitions.md#Observation.component:target_region),[MAF](StructureDefinition-ncpi-maf-definitions.md#Observation.component:target_region),[Proteomics](StructureDefinition-ncpi-proteomics-definitions.md#Observation.component:target_region),[VCF](StructureDefinition-ncpi-vcf-definitions.md#Observation.component:target_region) | Observation.component |   |   |
| is_paired_end | [BAM/CRAM](StructureDefinition-ncpi-bamcram-definitions.md#Observation.component:is_paired_end),[FASTQ](StructureDefinition-ncpi-fastq-definitions.md#Observation.component:is_paired_end),[MAF](StructureDefinition-ncpi-maf-definitions.md#Observation.component:is_paired_end),[Proteomics](StructureDefinition-ncpi-proteomics-definitions.md#Observation.component:is_paired_end),[VCF](StructureDefinition-ncpi-vcf-definitions.md#Observation.component:is_paired_end) | Observation.component | True, False |   |
| adaptor_trimmed | [BAM/CRAM](StructureDefinition-ncpi-bamcram-definitions.md#Observation.component:adaptor_trimmed),[FASTQ](StructureDefinition-ncpi-fastq-definitions.md#Observation.component:adaptor_trimmed),[MAF](StructureDefinition-ncpi-maf-definitions.md#Observation.component:adaptor_trimmed),[Proteomics](StructureDefinition-ncpi-proteomics-definitions.md#Observation.component:adaptor_trimmed),[VCF](StructureDefinition-ncpi-vcf-definitions.md#Observation.component:adaptor_trimmed) | Observation.component | True, False |   |
| reference_genome | [BAM/CRAM](StructureDefinition-ncpi-bamcram-definitions.md#Observation.component:reference_genome),[FASTQ](StructureDefinition-ncpi-fastq-definitions.md#Observation.component:reference_genome),[MAF](StructureDefinition-ncpi-maf-definitions.md#Observation.component:reference_genome),[Proteomics](StructureDefinition-ncpi-proteomics-definitions.md#Observation.component:reference_genome),[VCF](StructureDefinition-ncpi-vcf-definitions.md#Observation.component:reference_genome) | Observation.component | GRCh37, GRCh38 |   |
| workflow_type | [BAM/CRAM](StructureDefinition-ncpi-bamcram-definitions.md#Observation.component:workflow_type),[FASTQ](StructureDefinition-ncpi-fastq-definitions.md#Observation.component:workflow_type),[MAF](StructureDefinition-ncpi-maf-definitions.md#Observation.component:workflow_type),[Proteomics](StructureDefinition-ncpi-proteomics-definitions.md#Observation.component:workflow_type),[VCF](StructureDefinition-ncpi-vcf-definitions.md#Observation.component:workflow_type) | Observation.component | e.g., alignment, somatic |   |
| workflow_tool | [BAM/CRAM](StructureDefinition-ncpi-bamcram-definitions.md#Observation.component:workflow_tool),[FASTQ](StructureDefinition-ncpi-fastq-definitions.md#Observation.component:workflow_tool),[MAF](StructureDefinition-ncpi-maf-definitions.md#Observation.component:workflow_tool),[Proteomics](StructureDefinition-ncpi-proteomics-definitions.md#Observation.component:workflow_tool),[VCF](StructureDefinition-ncpi-vcf-definitions.md#Observation.component:workflow_tool) | Observation.component | e.g., BAM-MEM, GATK-Haplotype Caller |   |
| specimen_collection | [BAM/CRAM](StructureDefinition-ncpi-bamcram-definitions.md#key_Observation.extension:collection),[FASTQ](StructureDefinition-ncpi-fastq-definitions.md#key_Observation.extension:collection),[MAF](StructureDefinition-ncpi-maf-definitions.md#key_Observation.extension:collection),[Proteomics](StructureDefinition-ncpi-proteomics-definitions.md#key_Observation.extension:collection),[VCF](StructureDefinition-ncpi-vcf-definitions.md#key_Observation.extension:collection) | Extension Reference(Any) | e.g., Reference(Participant_ID) |   |

**Usages:**

* Derived from this Profile: [BAM or CRAM file profile](StructureDefinition-ncpi-bamcram.md), [NCPI FASTQ File](StructureDefinition-ncpi-fastq.md), [Gene fusion or gene expression file profile](StructureDefinition-ncpi-gene-fusion-expression.md), [MAF (Somatic Mutation) file profile](StructureDefinition-ncpi-maf.md)...Show 2 more,[Proteomics file profile](StructureDefinition-ncpi-proteomics.md)and[VCF or gVCF file profile](StructureDefinition-ncpi-vcf.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/ncpi-file-metadata)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ncpi-file-metadata.csv), [Excel](StructureDefinition-ncpi-file-metadata.xlsx), [Schematron](StructureDefinition-ncpi-file-metadata.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ncpi-file-metadata",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-file-metadata",
  "version" : "0.2.0",
  "name" : "NcpiFileMetadata",
  "title" : "NCPI File Meta Data",
  "status" : "draft",
  "date" : "2026-01-13T18:03:13+00:00",
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
  "description" : "Representation of file metadata for NCPI",
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
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Observation",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Observation",
        "path" : "Observation"
      },
      {
        "id" : "Observation.focus",
        "path" : "Observation.focus",
        "min" : 1,
        "max" : "1"
      }
    ]
  }
}

```

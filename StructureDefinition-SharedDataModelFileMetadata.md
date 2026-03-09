# Shared data model for File Metadata - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Shared data model for File Metadata**

## Logical Model: Shared data model for File Metadata 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelFileMetadata | *Version*:0.2.0 |
| Draft as of 2026-03-09 | *Computable Name*:CdmFileMetadata |

 
The **Shared Data Model for File Metadata** 

### NCPI File Metadata

#### Introduction

File metadata serves to provide further information about a given file related to certain participants or specimen. This IG supports FASTQ, MAF, BAM/CRAM, Proteomics, and VCF file types as branches from a common parent of NCPI [File Metadata](StructureDefinition-ncpi-file-metadata.md)

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/SharedDataModelFileMetadata)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-SharedDataModelFileMetadata.csv), [Excel](StructureDefinition-SharedDataModelFileMetadata.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "SharedDataModelFileMetadata",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelFileMetadata",
  "version" : "0.2.0",
  "name" : "CdmFileMetadata",
  "title" : "Shared data model for File Metadata",
  "status" : "draft",
  "date" : "2026-03-09T20:11:59+00:00",
  "publisher" : "NCPI FHIR Working Group",
  "contact" : [{
    "name" : "NCPI FHIR Working Group",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.ncpi-acc.org/about/working-groups"
    },
    {
      "system" : "email",
      "value" : "ncpi-fhir-ig@googlegroups.com"
    }]
  }],
  "description" : "The **Shared Data Model for File Metadata**",
  "fhirVersion" : "4.0.1",
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelFileMetadata",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "SharedDataModelFileMetadata",
      "path" : "SharedDataModelFileMetadata",
      "short" : "Shared data model for File Metadata",
      "definition" : "The **Shared Data Model for File Metadata**"
    },
    {
      "id" : "SharedDataModelFileMetadata.parentFile",
      "path" : "SharedDataModelFileMetadata.parentFile",
      "short" : "The file which this metadata refers to",
      "definition" : "The file which this metadata refers to",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Reference"
      }]
    },
    {
      "id" : "SharedDataModelFileMetadata.assayStrategy",
      "path" : "SharedDataModelFileMetadata.assayStrategy",
      "short" : "Assay strategy employed for this file",
      "definition" : "Assay strategy employed for this file",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "SharedDataModelFileMetadata.platformInstrument",
      "path" : "SharedDataModelFileMetadata.platformInstrument",
      "short" : "The platform instrument employed for this file",
      "definition" : "The platform instrument employed for this file",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "SharedDataModelFileMetadata.relatedSamples",
      "path" : "SharedDataModelFileMetadata.relatedSamples",
      "short" : "Any samples (biospecimen) related to the file",
      "definition" : "Any samples (biospecimen) related to the file",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Reference"
      }]
    },
    {
      "id" : "SharedDataModelFileMetadata.libraryPrep",
      "path" : "SharedDataModelFileMetadata.libraryPrep",
      "short" : "The library preparation employed for this file",
      "definition" : "The library preparation employed for this file",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "SharedDataModelFileMetadata.librarySelection",
      "path" : "SharedDataModelFileMetadata.librarySelection",
      "short" : "The library selection employed for this file",
      "definition" : "The library selection employed for this file",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "SharedDataModelFileMetadata.strandedness",
      "path" : "SharedDataModelFileMetadata.strandedness",
      "short" : "The strandedness of the file",
      "definition" : "The strandedness of the file",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "SharedDataModelFileMetadata.targetRegion",
      "path" : "SharedDataModelFileMetadata.targetRegion",
      "short" : "The target region employed for this file",
      "definition" : "The target region employed for this file",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "SharedDataModelFileMetadata.referenceGenome",
      "path" : "SharedDataModelFileMetadata.referenceGenome",
      "short" : "The reference genome employed for this file",
      "definition" : "The reference genome employed for this file",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "SharedDataModelFileMetadata.isPairedEnd",
      "path" : "SharedDataModelFileMetadata.isPairedEnd",
      "short" : "Does this file represent paired end data?",
      "definition" : "Does this file represent paired end data?",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "SharedDataModelFileMetadata.workflowType",
      "path" : "SharedDataModelFileMetadata.workflowType",
      "short" : "The workflow type employed for this file",
      "definition" : "The workflow type employed for this file",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "SharedDataModelFileMetadata.workflowTool",
      "path" : "SharedDataModelFileMetadata.workflowTool",
      "short" : "The workflow tool employed for this file",
      "definition" : "The workflow tool employed for this file",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "SharedDataModelFileMetadata.adaptorTrimmed",
      "path" : "SharedDataModelFileMetadata.adaptorTrimmed",
      "short" : "Does this file indicate that an adaptor is trimmed?",
      "definition" : "Does this file indicate that an adaptor is trimmed?",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    }]
  }
}

```

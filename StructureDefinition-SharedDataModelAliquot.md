# Shared Data Model for Aliquot - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Shared Data Model for Aliquot**

## Logical Model: Shared Data Model for Aliquot 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelAliquot | *Version*:0.2.0 |
| Draft as of 2026-01-13 | *Computable Name*:CmdAliquot |

 
Shared Data Model for Aliquot 

### NCPI Sample

#### Introduction

These entities are intended to present to users the history of samples used in a research study. They may also indicate potential availability of samples for request by other researchers. This model is specifically intended to express sample origins (Collection), sample flow and processing (Sample), and even specific stored tubes/slides (Aliquot). Conceptually, these represent the procedure at which the Biospecimen was collected (Collection), “biologically equivalent” samples in the path of processing (Sample), and specific tubes which may have a role in some circumstances (Aliquot).

A high level requirement from our common use cases is to understand “what sample was collected” and “what sample went into the assay”. This is important in genomics given “whole blood” vs “saliva” DNA analysis.

#### Aliquot

Some studies may provide detailed information about biospecimen-in-tubes. They may be available for analysis by others, for example. These can represent exact tubes or total amounts available of a Sample.

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/SharedDataModelAliquot)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-SharedDataModelAliquot.csv), [Excel](StructureDefinition-SharedDataModelAliquot.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "SharedDataModelAliquot",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelAliquot",
  "version" : "0.2.0",
  "name" : "CmdAliquot",
  "title" : "Shared Data Model for Aliquot",
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
  "description" : "Shared Data Model for Aliquot",
  "fhirVersion" : "4.0.1",
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelAliquot",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [
      {
        "id" : "SharedDataModelAliquot",
        "path" : "SharedDataModelAliquot",
        "short" : "Shared Data Model for Aliquot",
        "definition" : "Shared Data Model for Aliquot"
      },
      {
        "id" : "SharedDataModelAliquot.aliquotId",
        "path" : "SharedDataModelAliquot.aliquotId",
        "short" : "Unique ID for this aliquot",
        "definition" : "Unique ID for this aliquot",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "string"
          }
        ]
      },
      {
        "id" : "SharedDataModelAliquot.sample",
        "path" : "SharedDataModelAliquot.sample",
        "short" : "The sample of which this tube is a part.",
        "definition" : "The sample of which this tube is a part.",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : ["http://hl7.org/fhir/StructureDefinition/valueset-reference"]
          }
        ]
      },
      {
        "id" : "SharedDataModelAliquot.availabilityStatus",
        "path" : "SharedDataModelAliquot.availabilityStatus",
        "short" : "Can this Sample be requested for further analysis?",
        "definition" : "Can this Sample be requested for further analysis?",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "code"
          }
        ]
      },
      {
        "id" : "SharedDataModelAliquot.volume",
        "path" : "SharedDataModelAliquot.volume",
        "short" : "What is the volume of the Aliquot?",
        "definition" : "What is the volume of the Aliquot?",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Quantity"
          }
        ]
      },
      {
        "id" : "SharedDataModelAliquot.concentration",
        "path" : "SharedDataModelAliquot.concentration",
        "short" : "What is the concentration of the analyte in the Aliquot?",
        "definition" : "What is the concentration of the analyte in the Aliquot?",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Quantity"
          }
        ]
      }
    ]
  }
}

```

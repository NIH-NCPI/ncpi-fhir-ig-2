# Shared Data Model for Sample - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Shared Data Model for Sample**

## Logical Model: Shared Data Model for Sample 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelSample | *Version*:0.2.0 |
| Draft as of 2026-03-09 | *Computable Name*:CdmSample |

 
Shared Data Model for Sample 

### NCPI Sample

#### Introduction

These entities are intended to present to users the history of samples used in a research study. They may also indicate potential availability of samples for request by other researchers. This model is specifically intended to express sample origins (Collection), sample flow and processing (Sample), and even specific stored tubes/slides (Aliquot). Conceptually, these represent the procedure at which the Biospecimen was collected (Collection), “biologically equivalent” samples in the path of processing (Sample), and specific tubes which may have a role in some circumstances (Aliquot).

A high level requirement from our common use cases is to understand “what sample was collected” and “what sample went into the assay”. This is important in genomics given “whole blood” vs “saliva” DNA analysis.

#### Sample

Samples are ideally “biologically equivalent” biospecimen. This may be an abstraction from real-world samples, but provide a helpful tool for simplifying potentially complex data recorded in LIMS. For example, a protocol may include several edta tubes of whole blood: those would be tracked separately in a LIMS, but a secondary data research consumer doesn’t need to know those details in most cases.

Samples can be derived from other samples or from a collection event. It’s possible to describe detailed processing chains, for example tracking Whole Blood -> WBCs -> DNA, but this is not required. *Only the collected biospecimen and any biospecimen used in analysis NEED to be recorded.

There are cases where tube contamination may present challenges that a user of this data may not be able to track without further information, but this is out of scope for our use case.

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/SharedDataModelSample)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-SharedDataModelSample.csv), [Excel](StructureDefinition-SharedDataModelSample.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "SharedDataModelSample",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelSample",
  "version" : "0.2.0",
  "name" : "CdmSample",
  "title" : "Shared Data Model for Sample",
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
  "description" : "Shared Data Model for Sample",
  "fhirVersion" : "4.0.1",
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelSample",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "SharedDataModelSample",
      "path" : "SharedDataModelSample",
      "short" : "Shared Data Model for Sample",
      "definition" : "Shared Data Model for Sample"
    },
    {
      "id" : "SharedDataModelSample.sampleId",
      "path" : "SharedDataModelSample.sampleId",
      "short" : "Unique ID for this sample",
      "definition" : "Unique ID for this sample",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "SharedDataModelSample.participant",
      "path" : "SharedDataModelSample.participant",
      "short" : "The participant from whom the biospecimen was taken",
      "definition" : "The participant from whom the biospecimen was taken",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/valueset-reference"]
      }]
    },
    {
      "id" : "SharedDataModelSample.parentSample",
      "path" : "SharedDataModelSample.parentSample",
      "short" : "The Sample from which this Sample was derived",
      "definition" : "The Sample from which this Sample was derived",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/valueset-reference"]
      }]
    },
    {
      "id" : "SharedDataModelSample.type",
      "path" : "SharedDataModelSample.type",
      "short" : "The type of material of which this Sample is comprised",
      "definition" : "The type of material of which this Sample is comprised",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "SharedDataModelSample.processing",
      "path" : "SharedDataModelSample.processing",
      "short" : "Processing that was applied to the Parent Sample or from the Biospecimen Collection that yielded this distinct sample",
      "definition" : "Processing that was applied to the Parent Sample or from the Biospecimen Collection that yielded this distinct sample",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "SharedDataModelSample.availabilityStatus",
      "path" : "SharedDataModelSample.availabilityStatus",
      "short" : "Can this Sample be requested for further analysis?",
      "definition" : "Can this Sample be requested for further analysis?",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "SharedDataModelSample.storageMethod",
      "path" : "SharedDataModelSample.storageMethod",
      "short" : "How is the Sample stored, eg, Frozen or with additives",
      "definition" : "How is the Sample stored, eg, Frozen or with additives",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "SharedDataModelSample.quantity",
      "path" : "SharedDataModelSample.quantity",
      "short" : "The total quantity of the specimen",
      "definition" : "The total quantity of the specimen",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Quantity"
      }]
    }]
  }
}

```

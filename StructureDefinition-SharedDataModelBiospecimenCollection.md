# Shared Data Model for Biospecimen Collection - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Shared Data Model for Biospecimen Collection**

## Logical Model: Shared Data Model for Biospecimen Collection 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelBiospecimenCollection | *Version*:0.2.0 |
| Draft as of 2026-02-06 | *Computable Name*:CdmBiospecimenCollection |

 
Shared Data Model for Biospecimen Collection 

### NCPI Sample

#### Introduction

These entities are intended to present to users the history of samples used in a research study. They may also indicate potential availability of samples for request by other researchers. This model is specifically intended to express sample origins (Collection), sample flow and processing (Sample), and even specific stored tubes/slides (Aliquot). Conceptually, these represent the procedure at which the Biospecimen was collected (Collection), “biologically equivalent” samples in the path of processing (Sample), and specific tubes which may have a role in some circumstances (Aliquot).

A high level requirement from our common use cases is to understand “what sample was collected” and “what sample went into the assay”. This is important in genomics given “whole blood” vs “saliva” DNA analysis.

#### Biospecimen Collection

The Collection entity describes the collection procedure that generated the biospecimen. This can be very lightweight, for example just describing the age at collection and pointing to the Sample that was collected, or it can have robust information about the procedure, location, and laterality. Collection details are not required, but it should be indicated if a Sample was the “collected sample” (if known).

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/SharedDataModelBiospecimenCollection)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-SharedDataModelBiospecimenCollection.csv), [Excel](StructureDefinition-SharedDataModelBiospecimenCollection.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "SharedDataModelBiospecimenCollection",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelBiospecimenCollection",
  "version" : "0.2.0",
  "name" : "CdmBiospecimenCollection",
  "title" : "Shared Data Model for Biospecimen Collection",
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
  "description" : "Shared Data Model for Biospecimen Collection",
  "fhirVersion" : "4.0.1",
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelBiospecimenCollection",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [
      {
        "id" : "SharedDataModelBiospecimenCollection",
        "path" : "SharedDataModelBiospecimenCollection",
        "short" : "Shared Data Model for Biospecimen Collection",
        "definition" : "Shared Data Model for Biospecimen Collection"
      },
      {
        "id" : "SharedDataModelBiospecimenCollection.sampleGenerated",
        "path" : "SharedDataModelBiospecimenCollection.sampleGenerated",
        "short" : "Sample that was generated from this collection event",
        "definition" : "Sample that was generated from this collection event",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "string"
          }
        ]
      },
      {
        "id" : "SharedDataModelBiospecimenCollection.participant",
        "path" : "SharedDataModelBiospecimenCollection.participant",
        "short" : "The participant from whom the biospecimen was taken",
        "definition" : "The participant from whom the biospecimen was taken",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-participant"
            ]
          }
        ]
      },
      {
        "id" : "SharedDataModelBiospecimenCollection.ageAtCollection",
        "path" : "SharedDataModelBiospecimenCollection.ageAtCollection",
        "short" : "The age at which this biospecimen was collected. Could be expressed with a term, an age, or an age range.",
        "definition" : "The age at which this biospecimen was collected. Could be expressed with a term, an age, or an age range.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Quantity"
          }
        ]
      },
      {
        "id" : "SharedDataModelBiospecimenCollection.method",
        "path" : "SharedDataModelBiospecimenCollection.method",
        "short" : "The approach used to collect the biospecimen",
        "definition" : "The approach used to collect the biospecimen",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "code"
          }
        ]
      },
      {
        "id" : "SharedDataModelBiospecimenCollection.site",
        "path" : "SharedDataModelBiospecimenCollection.site",
        "short" : "The location of the specimen collection",
        "definition" : "The location of the specimen collection",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "code"
          }
        ]
      },
      {
        "id" : "SharedDataModelBiospecimenCollection.spatial",
        "path" : "SharedDataModelBiospecimenCollection.spatial",
        "short" : "Any spatial/location qualifiers",
        "definition" : "Any spatial/location qualifiers",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "code"
          }
        ]
      },
      {
        "id" : "SharedDataModelBiospecimenCollection.laterality",
        "path" : "SharedDataModelBiospecimenCollection.laterality",
        "short" : "Any spatial/location qualifiers",
        "definition" : "Any spatial/location qualifiers",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "code"
          }
        ]
      }
    ]
  }
}

```

# NCPI Metadata slices - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NCPI Metadata slices**

## CodeSystem: NCPI Metadata slices 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/metadata-elements | *Version*:0.2.0 |
| Active as of 2025-12-03 | *Computable Name*:MetadataElements |

 
NCPI Metadata slices 

 This Code system is referenced in the content logical definition of the following value sets: 

* This CodeSystem is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "metadata-elements",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/metadata-elements",
  "version" : "0.2.0",
  "name" : "MetadataElements",
  "title" : "NCPI Metadata slices",
  "status" : "active",
  "experimental" : false,
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
  "description" : "NCPI Metadata slices",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 12,
  "concept" : [
    {
      "code" : "AssayStrategy",
      "display" : "Assay strategy"
    },
    {
      "code" : "PlatformInstrument",
      "display" : "Platform instrument"
    },
    {
      "code" : "RelatedSamples",
      "display" : "Related samples"
    },
    {
      "code" : "LibraryPrep",
      "display" : "Library preparation"
    },
    {
      "code" : "LibrarySelection",
      "display" : "Library selection"
    },
    {
      "code" : "Strandedness",
      "display" : "Strandedness"
    },
    {
      "code" : "TargetRegion",
      "display" : "Target region"
    },
    {
      "code" : "ReferenceGenome",
      "display" : "Reference genome"
    },
    {
      "code" : "IsPairedEnd",
      "display" : "Is paired end"
    },
    {
      "code" : "WorkflowType",
      "display" : "Workflow type"
    },
    {
      "code" : "WorkflowTool",
      "display" : "Workflow tool"
    },
    {
      "code" : "AdaptorTrimmed",
      "display" : "Adaptor trimmed"
    }
  ]
}

```

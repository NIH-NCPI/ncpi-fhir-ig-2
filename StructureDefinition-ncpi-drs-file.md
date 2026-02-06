# NCPI DRS File - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NCPI DRS File**

## Resource Profile: NCPI DRS File 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-drs-file | *Version*:0.2.0 |
| Draft as of 2026-02-06 | *Computable Name*:NcpiDRSFile |

 
Information about a DRS file related to a research participant 

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/ncpi-drs-file)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ncpi-drs-file.csv), [Excel](StructureDefinition-ncpi-drs-file.xlsx), [Schematron](StructureDefinition-ncpi-drs-file.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ncpi-drs-file",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-drs-file",
  "version" : "0.2.0",
  "name" : "NcpiDRSFile",
  "title" : "NCPI DRS File",
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
  "description" : "Information about a DRS file related to a research participant",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "workflow",
      "uri" : "http://hl7.org/fhir/workflow",
      "name" : "Workflow Pattern"
    },
    {
      "identity" : "fhircomposition",
      "uri" : "http://hl7.org/fhir/composition",
      "name" : "FHIR Composition"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "cda",
      "uri" : "http://hl7.org/v3/cda",
      "name" : "CDA (R2)"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "v2",
      "uri" : "http://hl7.org/v2",
      "name" : "HL7 v2 Mapping"
    },
    {
      "identity" : "xds",
      "uri" : "http://ihe.net/xds",
      "name" : "XDS metadata equivalent"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "DocumentReference",
  "baseDefinition" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-file",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "DocumentReference",
        "path" : "DocumentReference"
      },
      {
        "id" : "DocumentReference.content",
        "path" : "DocumentReference.content",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "attachment.url"
            }
          ],
          "description" : "Slicing pattern to make content.attachment require a DRS file type and allow other file types",
          "ordered" : true,
          "rules" : "openAtEnd"
        }
      },
      {
        "id" : "DocumentReference.content:DRS",
        "path" : "DocumentReference.content",
        "sliceName" : "DRS",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "DocumentReference.content:DRS.extension:locationAccess",
        "path" : "DocumentReference.content.extension",
        "sliceName" : "locationAccess"
      },
      {
        "id" : "DocumentReference.content:DRS.attachment",
        "path" : "DocumentReference.content.attachment",
        "type" : [
          {
            "code" : "Attachment",
            "profile" : [
              "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-drs-attachment"
            ]
          }
        ]
      }
    ]
  }
}

```

# Shared Data Model for File - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Shared Data Model for File**

## Logical Model: Shared Data Model for File 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelFile | *Version*:0.2.0 |
| Draft as of 2025-12-03 | *Computable Name*:CdmFile |

 
The**Shared Data Model for File** 

### NCPI File

#### Introduction

Files are a common research product. In this straightforward representation, we provide basic details of the file and how to access it. Details about what is contained in the file or how the content was generated should be described with other entities, such as data dictionaries, summaries, or assays.

#### File Definitions

File contains basic file metadata about the file location and contents. Files are typically associated with one or more participants, though they can also include general study documents. The file content may have different access control restrictions when compared to this entity, which is only the file metadata.

There can be multiple file location references, for example DRS and cloud storage references, though the access approaches for those locations should be reasonably apparent through the Access Policy for the file content.

#### Example

If a data file is ONLY accessible through DRS, the underlying bucket locations should not be included here as no user would be able to access them directly. However, if there are multiple Access Policies that provide routes to access the data through different URIs, those can be included. Controlled access release via DRS with a consortium access model permitting direct bucket access could both be stated here to permit consistent reference to the File irrespective of the access mechanism.

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/SharedDataModelFile)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-SharedDataModelFile.csv), [Excel](StructureDefinition-SharedDataModelFile.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "SharedDataModelFile",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelFile",
  "version" : "0.2.0",
  "name" : "CdmFile",
  "title" : "Shared Data Model for File",
  "status" : "draft",
  "date" : "2025-12-03T22:26:51+00:00",
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
  "description" : "The **Shared Data Model for File**",
  "fhirVersion" : "4.0.1",
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelFile",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [
      {
        "id" : "SharedDataModelFile",
        "path" : "SharedDataModelFile",
        "short" : "Shared Data Model for File",
        "definition" : "The **Shared Data Model for File**"
      },
      {
        "id" : "SharedDataModelFile.participantID",
        "path" : "SharedDataModelFile.participantID",
        "short" : "The participant(s) for whom this file contains data",
        "definition" : "The participant(s) for whom this file contains data",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : ["http://hl7.org/fhir/StructureDefinition/valueset-reference"]
          }
        ]
      },
      {
        "id" : "SharedDataModelFile.fileExternalID",
        "path" : "SharedDataModelFile.fileExternalID",
        "short" : "A related identifier of this file",
        "definition" : "A related identifier of this file",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "string"
          }
        ]
      },
      {
        "id" : "SharedDataModelFile.format",
        "path" : "SharedDataModelFile.format",
        "short" : "The file format used",
        "definition" : "The file format used",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "code"
          }
        ]
      },
      {
        "id" : "SharedDataModelFile.location",
        "path" : "SharedDataModelFile.location",
        "short" : "List of locations where this data can be accessed",
        "definition" : "List of locations where this data can be accessed",
        "min" : 1,
        "max" : "*",
        "type" : [
          {
            "code" : "List"
          }
        ]
      },
      {
        "id" : "SharedDataModelFile.location.uri",
        "path" : "SharedDataModelFile.location.uri",
        "short" : "The URI at which this data can be accessed",
        "definition" : "The URI at which this data can be accessed",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "uri"
          }
        ]
      },
      {
        "id" : "SharedDataModelFile.location.accessPolicy",
        "path" : "SharedDataModelFile.location.accessPolicy",
        "short" : "If present, only those under the specific Access Policy can access the file in this location.",
        "definition" : "If present, only those under the specific Access Policy can access the file in this location.",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Extension",
            "profile" : ["http://hl7.org/fhir/StructureDefinition/valueset-reference"]
          }
        ]
      },
      {
        "id" : "SharedDataModelFile.fileSize",
        "path" : "SharedDataModelFile.fileSize",
        "short" : "The size of the file, e.g., in bytes.",
        "definition" : "The size of the file, e.g., in bytes.",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Quantity"
          }
        ]
      },
      {
        "id" : "SharedDataModelFile.hash",
        "path" : "SharedDataModelFile.hash",
        "short" : "Provides a list of hashes for confirming file transfers",
        "definition" : "Provides a list of hashes for confirming file transfers",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "List"
          }
        ]
      },
      {
        "id" : "SharedDataModelFile.hash.type",
        "path" : "SharedDataModelFile.hash.type",
        "short" : "Algorithm used to calculate the hash (and size, where applicable)",
        "definition" : "Algorithm used to calculate the hash (and size, where applicable)",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "code"
          }
        ]
      },
      {
        "id" : "SharedDataModelFile.hash.value",
        "path" : "SharedDataModelFile.hash.value",
        "short" : "Value of hashing the file",
        "definition" : "Value of hashing the file",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "string"
          }
        ]
      },
      {
        "id" : "SharedDataModelFile.contentVersion",
        "path" : "SharedDataModelFile.contentVersion",
        "short" : "Version of the file content",
        "definition" : "Version of the file content",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "string"
          }
        ]
      },
      {
        "id" : "SharedDataModelFile.description",
        "path" : "SharedDataModelFile.description",
        "short" : "A description of the file",
        "definition" : "A description of the file",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "string"
          }
        ]
      },
      {
        "id" : "SharedDataModelFile.type",
        "path" : "SharedDataModelFile.type",
        "short" : "The type of data contained in this file. Should be as detailed as possible, e.g., Whole Exome Variant Calls.",
        "definition" : "The type of data contained in this file. Should be as detailed as possible, e.g., Whole Exome Variant Calls.",
        "min" : 1,
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

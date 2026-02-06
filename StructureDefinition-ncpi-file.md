# NCPI File - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NCPI File**

## Resource Profile: NCPI File 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-file | *Version*:0.2.0 |
| Draft as of 2026-02-06 | *Computable Name*:NcpiFile |

 
Information about a file related to a research participant 

#### Key Guidelines

The NCPI File profile is based on the standard resource type, [DocumentReference](https://hl7.org/fhir/r4/documentreference.html) and is intended to represent the files associated with a participant in a research study.

##### Added Profile Restrictions

In order to ensure that our resources are interoperable across studies, we have employed a number of restrictions that should make consuming Patient resources more consistent.

* participantID **should** be a globally unique identifier associated with the patient. This practice is intended to make constructing queries for the same patient compatible across different servers (such as QA vs PROD) but also to make the resource URLs more meaningful.
* fileExternalID **should** have all appropriate Identifiers with a meaningful system/value pair. Such identifiers may include DbGAP accession IDs, global and external IDs, etc.
* format and relatedFile.type **should** use [EDAM](https://edamontology.org/) terminology (i.e., codes) when available. Other file type code systems are allowed if a suitable EDAM code does not exist.

#### Recommended Practices

Providing as much information about a file and file metatdata will help individuals using this IG to understand the details and limits of information conveyed about a file.

##### FHIR Mappings

The following fields from the shared data model are to be mapped to the NCPI File as shown below:

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| **Logical Model Property** | **Cardinality** | **NCPI FHIR Mapping** | **Usage Guidance** | **Notes** |
| [participantID](StructureDefinition-SharedDataModelFile-definitions.md#diff_SharedDataModelFile.participantID) | 0..1 | subject | The participant(s) for whom this file contains data |   |
| [fileExternalID](StructureDefinition-SharedDataModelFile-definitions.md#diff_SharedDataModelFile.fileExternalID) | 0..1 | identifier.value | A related identifier of this file |   |
| [format](StructureDefinition-SharedDataModelFile-definitions.md#diff_SharedDataModelFile.format) | 1..1 | extension[file-format].valueCodeableConcept.coding | The file format used |   |
| [location](StructureDefinition-SharedDataModelFile-definitions.md#diff_SharedDataModelFile.location) | 1..* | content | List of locations where this data can be accessed |   |
| [location.uri](StructureDefinition-SharedDataModelFile-definitions.md#diff_SharedDataModelFile.location.uri) | 1..1 | content.attachment.url | The URI at which this data can be accessed |   |
| [location.accessPolicy](StructureDefinition-SharedDataModelFile-definitions.md#diff_SharedDataModelFile.location.accessPolicy) | 0..* | content.extension[location-access].valueReference | If present, only those under the specific Access Policy can access the file in this location. |   |
| [fileSize](StructureDefinition-SharedDataModelFile-definitions.md#diff_SharedDataModelFile.fileSize) | 1..1 | extension[file-size].valueQuantity.value, extension[file-size].valueQuantity.unit | The size of the file, e.g., in bytes. |   |
| [hash](StructureDefinition-SharedDataModelFile-definitions.md#diff_SharedDataModelFile.hash) | 0..* | extension[hash] | Provides a list of hashes for confirming file transfers |   |
| [hash.type](StructureDefinition-SharedDataModelFile-definitions.md#diff_SharedDataModelFile.hash.type) | 0..1 | extension[hash-type].valueCode | Algorithm used to calculate the hash (and size, where applicable) |   |
| [hash.value](StructureDefinition-SharedDataModelFile-definitions.md#diff_SharedDataModelFile.hash.value) | 1..1 | extension[hash-value].valueString | Value of hashing the file |   |
| [contentVersion](StructureDefinition-SharedDataModelFile-definitions.md#diff_SharedDataModelFile.contentVersion) | 0..1 | extension[content-version].valueString | Version of the file content |   |
| [description](StructureDefinition-SharedDataModelFile-definitions.md#diff_SharedDataModelFile.description) | 0..1 | description | A description of the file |   |
| [type](StructureDefinition-SharedDataModelFile-definitions.md#diff_SharedDataModelFile.type) | 1..1 | type | The type of data contained in this file. Should be as detailed as possible, e.g., Whole Exome Variant Calls. |   |

**Usages:**

* Derived from this Profile: [NCPI DRS File](StructureDefinition-ncpi-drs-file.md)
* Examples for this Profile: [DocumentReference/GF-6BAD9S7D](DocumentReference-GF-6BAD9S7D.md) and [DocumentReference/GSS123456-01-010-SG-2](DocumentReference-GSS123456-01-010-SG-2.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/ncpi-file)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ncpi-file.csv), [Excel](StructureDefinition-ncpi-file.xlsx), [Schematron](StructureDefinition-ncpi-file.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ncpi-file",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-file",
  "version" : "0.2.0",
  "name" : "NcpiFile",
  "title" : "NCPI File",
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
  "description" : "Information about a file related to a research participant",
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
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/DocumentReference",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "DocumentReference",
        "path" : "DocumentReference"
      },
      {
        "id" : "DocumentReference.extension",
        "path" : "DocumentReference.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 2
      },
      {
        "id" : "DocumentReference.extension:fileFormat",
        "path" : "DocumentReference.extension",
        "sliceName" : "fileFormat",
        "short" : "The file format used (EDAM is preferred)",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/file-format"
            ]
          }
        ]
      },
      {
        "id" : "DocumentReference.extension:fileSize",
        "path" : "DocumentReference.extension",
        "sliceName" : "fileSize",
        "short" : "Indicate the size of the file in reference",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/file-size"
            ]
          }
        ]
      },
      {
        "id" : "DocumentReference.extension:hash",
        "path" : "DocumentReference.extension",
        "sliceName" : "hash",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/hash-extension"
            ]
          }
        ]
      },
      {
        "id" : "DocumentReference.extension:contentVersion",
        "path" : "DocumentReference.extension",
        "sliceName" : "contentVersion",
        "short" : "The version of the content in the file",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/content-version"
            ]
          }
        ]
      },
      {
        "id" : "DocumentReference.identifier",
        "path" : "DocumentReference.identifier",
        "short" : "A related external file ID"
      },
      {
        "id" : "DocumentReference.type",
        "path" : "DocumentReference.type",
        "short" : "The type of data contained in this file.",
        "binding" : {
          "strength" : "extensible",
          "valueSet" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/edam-ontology-terms-vs"
        }
      },
      {
        "id" : "DocumentReference.subject",
        "path" : "DocumentReference.subject",
        "short" : "The participant(s) for whom this file contains data (i.e., ParticipantID)"
      },
      {
        "id" : "DocumentReference.description",
        "path" : "DocumentReference.description",
        "short" : "A description of the file"
      },
      {
        "id" : "DocumentReference.content.extension",
        "path" : "DocumentReference.content.extension",
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
        "id" : "DocumentReference.content.extension:locationAccess",
        "path" : "DocumentReference.content.extension",
        "sliceName" : "locationAccess",
        "short" : "If present, only those under the specific Access Policy can access the file in this location.",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/location-access"
            ]
          }
        ]
      },
      {
        "id" : "DocumentReference.content.attachment.url",
        "path" : "DocumentReference.content.attachment.url",
        "short" : "The URI at which this data can be accessed",
        "min" : 1
      }
    ]
  }
}

```

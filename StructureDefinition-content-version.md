# Version of the contents of the file - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Version of the contents of the file**

## Extension: Version of the contents of the file 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/content-version | *Version*:0.2.0 |
| Draft as of 2025-12-03 | *Computable Name*:ContentVersion |

Version of the contents of the file

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [NCPI File](StructureDefinition-ncpi-file.md)
* Examples for this Extension: [DocumentReference/GF-6BAD9S7D](DocumentReference-GF-6BAD9S7D.md) and [DocumentReference/GSS123456-01-010-SG-2](DocumentReference-GSS123456-01-010-SG-2.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/content-version)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-content-version.csv), [Excel](StructureDefinition-content-version.xlsx), [Schematron](StructureDefinition-content-version.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "content-version",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/content-version",
  "version" : "0.2.0",
  "name" : "ContentVersion",
  "title" : "Version of the contents of the file",
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
  "description" : "Version of the contents of the file",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    }
  ],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [
    {
      "type" : "element",
      "expression" : "DocumentReference"
    }
  ],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Extension",
        "path" : "Extension",
        "short" : "Version of the contents of the file",
        "definition" : "Version of the contents of the file"
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/content-version"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "short" : "Indicate the version (e.g., V1) for the contents of this file",
        "type" : [
          {
            "code" : "string"
          }
        ]
      }
    ]
  }
}

```

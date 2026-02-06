# The size of the file, e.g., in bytes. - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **The size of the file, e.g., in bytes.**

## Extension: The size of the file, e.g., in bytes. 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/file-size | *Version*:0.2.0 |
| Draft as of 2026-02-06 | *Computable Name*:FileSize |

The size of the file, e.g., in bytes.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [NCPI File](StructureDefinition-ncpi-file.md)
* Examples for this Extension: [DocumentReference/GF-6BAD9S7D](DocumentReference-GF-6BAD9S7D.md) and [DocumentReference/GSS123456-01-010-SG-2](DocumentReference-GSS123456-01-010-SG-2.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/file-size)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-file-size.csv), [Excel](StructureDefinition-file-size.xlsx), [Schematron](StructureDefinition-file-size.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "file-size",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/file-size",
  "version" : "0.2.0",
  "name" : "FileSize",
  "title" : "The size of the file, e.g., in bytes.",
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
  "description" : "The size of the file, e.g., in bytes.",
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
        "short" : "The size of the file, e.g., in bytes.",
        "definition" : "The size of the file, e.g., in bytes."
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/file-size"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "short" : "Indicate the size of the file in reference",
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

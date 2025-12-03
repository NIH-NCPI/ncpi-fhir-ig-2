# Provides a list of hashes for confirming file transfers - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Provides a list of hashes for confirming file transfers**

## Extension: Provides a list of hashes for confirming file transfers 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/hash-extension | *Version*:0.2.0 |
| Draft as of 2025-12-03 | *Computable Name*:HashExtension |

Provides a list of hashes for confirming file transfers

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [NCPI File](StructureDefinition-ncpi-file.md)
* Examples for this Extension: [DocumentReference/GF-6BAD9S7D](DocumentReference-GF-6BAD9S7D.md) and [DocumentReference/GSS123456-01-010-SG-2](DocumentReference-GSS123456-01-010-SG-2.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/hash-extension)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-hash-extension.csv), [Excel](StructureDefinition-hash-extension.xlsx), [Schematron](StructureDefinition-hash-extension.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "hash-extension",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/hash-extension",
  "version" : "0.2.0",
  "name" : "HashExtension",
  "title" : "Provides a list of hashes for confirming file transfers",
  "status" : "draft",
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
  "description" : "Provides a list of hashes for confirming file transfers",
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
        "short" : "Provides a list of hashes for confirming file transfers",
        "definition" : "Provides a list of hashes for confirming file transfers"
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "min" : 2
      },
      {
        "id" : "Extension.extension:hashValue",
        "path" : "Extension.extension",
        "sliceName" : "hashValue",
        "short" : "Value of hashing the file",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/hash-value"
            ]
          }
        ]
      },
      {
        "id" : "Extension.extension:hashType",
        "path" : "Extension.extension",
        "sliceName" : "hashType",
        "short" : "Algorithm used to calculate the hash (and size, where applicable)",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/hash-type"
            ]
          }
        ]
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/hash-extension"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "max" : "0"
      }
    ]
  }
}

```

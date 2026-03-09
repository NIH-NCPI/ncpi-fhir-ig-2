# Algorithm used to calculate the hash (and size, where applicable) - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Algorithm used to calculate the hash (and size, where applicable)**

## Extension: Algorithm used to calculate the hash (and size, where applicable) 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/hash-type | *Version*:0.2.0 |
| Draft as of 2026-03-09 | *Computable Name*:HashType |

Algorithm used to calculate the hash (and size, where applicable)

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Provides a list of hashes for confirming file transfers](StructureDefinition-hash-extension.md)
* Examples for this Extension: [DocumentReference/GF-6BAD9S7D](DocumentReference-GF-6BAD9S7D.md) and [DocumentReference/GSS123456-01-010-SG-2](DocumentReference-GSS123456-01-010-SG-2.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/hash-type)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-hash-type.csv), [Excel](StructureDefinition-hash-type.xlsx), [Schematron](StructureDefinition-hash-type.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "hash-type",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/hash-type",
  "version" : "0.2.0",
  "name" : "HashType",
  "title" : "Algorithm used to calculate the hash (and size, where applicable)",
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
  "description" : "Algorithm used to calculate the hash (and size, where applicable)",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "DocumentReference.extension"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Algorithm used to calculate the hash (and size, where applicable)",
      "definition" : "Algorithm used to calculate the hash (and size, where applicable)"
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/hash-type"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "short" : "Algorithm used to calculate the hash (and size, where applicable)",
      "type" : [{
        "code" : "code"
      }]
    }]
  }
}

```

# If present, only those under the specific Access Policy can access the file in this location. - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **If present, only those under the specific Access Policy can access the file in this location.**

## Extension: If present, only those under the specific Access Policy can access the file in this location. 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/location-access | *Version*:0.2.0 |
| Draft as of 2025-12-03 | *Computable Name*:LocationAccess |

If present, only those under the specific Access Policy can access the file in this location.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [NCPI File](StructureDefinition-ncpi-file.md)
* Examples for this Extension: [DocumentReference/GF-6BAD9S7D](DocumentReference-GF-6BAD9S7D.md) and [DocumentReference/GSS123456-01-010-SG-2](DocumentReference-GSS123456-01-010-SG-2.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/location-access)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-location-access.csv), [Excel](StructureDefinition-location-access.xlsx), [Schematron](StructureDefinition-location-access.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "location-access",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/location-access",
  "version" : "0.2.0",
  "name" : "LocationAccess",
  "title" : "If present, only those under the specific Access Policy can access the file in this location.",
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
  "description" : "If present, only those under the specific Access Policy can access the file in this location.",
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
      "expression" : "DocumentReference.content"
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
        "short" : "If present, only those under the specific Access Policy can access the file in this location.",
        "definition" : "If present, only those under the specific Access Policy can access the file in this location."
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/location-access"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "short" : "If present, only those under the specific Access Policy can access the file in this location.",
        "type" : [
          {
            "code" : "Reference"
          }
        ]
      }
    ]
  }
}

```

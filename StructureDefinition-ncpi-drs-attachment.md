# DRS Attachment - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DRS Attachment**

## Data Type Profile: DRS Attachment 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-drs-attachment | *Version*:0.2.0 |
| Draft as of 2026-01-13 | *Computable Name*:DRSAttachment |

 
A FHIR Attachment with a DRS url. 

**Usages:**

* Use this DataType Profile: [NCPI DRS File](StructureDefinition-ncpi-drs-file.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/ncpi-drs-attachment)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ncpi-drs-attachment.csv), [Excel](StructureDefinition-ncpi-drs-attachment.xlsx), [Schematron](StructureDefinition-ncpi-drs-attachment.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ncpi-drs-attachment",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-drs-attachment",
  "version" : "0.2.0",
  "name" : "DRSAttachment",
  "title" : "DRS Attachment",
  "status" : "draft",
  "date" : "2026-01-13T18:03:13+00:00",
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
  "description" : "A FHIR Attachment with a DRS url.",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "v2",
      "uri" : "http://hl7.org/v2",
      "name" : "HL7 v2 Mapping"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    }
  ],
  "kind" : "complex-type",
  "abstract" : false,
  "type" : "Attachment",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Attachment",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Attachment",
        "path" : "Attachment",
        "constraint" : [
          {
            "key" : "must-be-drs-uri",
            "severity" : "error",
            "human" : "attachment.url must start with ^drs://. A drs:// hostname-based URI, as defined in the DRS documentation, that tells clients how to access this object. The intent of this field is to make DRS objects self-contained, and therefore easier for clients to store and pass around.  For example, if you arrive at this DRS JSON by resolving a compact identifier-based DRS URI, the `self_uri` presents you with a hostname and properly encoded DRS ID for use in subsequent `access` endpoint calls.",
            "expression" : "$this.url.matches('^drs://.*')",
            "source" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-drs-attachment"
          }
        ]
      }
    ]
  }
}

```

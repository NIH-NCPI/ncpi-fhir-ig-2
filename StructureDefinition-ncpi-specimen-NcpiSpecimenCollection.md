# Linkage for related samples - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Linkage for related samples**

## Resource Profile: Linkage for related samples 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-specimen-NcpiSpecimenCollection | *Version*:0.2.0 |
| Draft as of 2025-12-03 | *Computable Name*:NcpiSpecimenCollection |

 
Linkage for related samples 

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/ncpi-specimen-NcpiSpecimenCollection)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ncpi-specimen-NcpiSpecimenCollection.csv), [Excel](StructureDefinition-ncpi-specimen-NcpiSpecimenCollection.xlsx), [Schematron](StructureDefinition-ncpi-specimen-NcpiSpecimenCollection.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ncpi-specimen-NcpiSpecimenCollection",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-specimen-NcpiSpecimenCollection",
  "version" : "0.2.0",
  "name" : "NcpiSpecimenCollection",
  "title" : "Linkage for related samples",
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
  "description" : "Linkage for related samples",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "List",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/List",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "List",
        "path" : "List"
      },
      {
        "id" : "List.subject",
        "path" : "List.subject",
        "short" : "Reference to any subjects or other samples related to a subject"
      }
    ]
  }
}

```

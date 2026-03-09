# NCPI Research Collection - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NCPI Research Collection**

## Resource Profile: NCPI Research Collection 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-research-collection | *Version*:0.2.0 |
| Draft as of 2026-03-09 | *Computable Name*:NcpiResearchCollection |

 
Collections of research data including, but not limited, to Consortia, Programs, adhoc collections of Studies and datasets among other types of collections. 

### Basic Definition

The collection element allows for high level organization of objects into various related groups. One common type of collection is a consortium, but other collections can also be established. Items in a collection can include studies, datasets, or other collections (for example, if consortium A becomes a member of consortium B, the collection that represents consortium A can be added as an item in the collection representing consortium B).

#### Primary Profile Restrictions and Enhancements

* title **must** be defined in order for users to understand the purpose of the collection.
* code **must** be defined and **should** be one of the codes from the CodeSystem, [CollectionType](CodeSystem-collection-type.md), when possible.
* note **should** contain a meaningful description whenever possible.
* there **must** be one or more entries referencing the "contained" resources.
* When possible, a [website](StructureDefinition-research-web-link.md) should be provided. For Consortium, programs and other entities with formal websites, this should be the one that provides the best overview of the group. For adhoc collections, or those collections that are less formally defined, an online document may be sufficient.

**Usages:**

* Examples for this Profile: [List/ncpi-research-collection-kfx01](List-ncpi-research-collection-kfx01.md) and [List/ncpi-research-collection-pbta](List-ncpi-research-collection-pbta.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/ncpi-research-collection)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ncpi-research-collection.csv), [Excel](StructureDefinition-ncpi-research-collection.xlsx), [Schematron](StructureDefinition-ncpi-research-collection.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ncpi-research-collection",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-research-collection",
  "version" : "0.2.0",
  "name" : "NcpiResearchCollection",
  "title" : "NCPI Research Collection",
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
  "description" : "Collections of research data including, but not limited, to Consortia, Programs, adhoc collections of Studies and datasets among other types of collections.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "List",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/List",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "List",
      "path" : "List"
    },
    {
      "id" : "List.extension",
      "path" : "List.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "List.extension:website",
      "path" : "List.extension",
      "sliceName" : "website",
      "short" : "URL describing the research collection, this can include a formal website, such as the Consortium or Program's website, or to an online document describing the collection.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-web-link"]
      }]
    },
    {
      "id" : "List.extension:label",
      "path" : "List.extension",
      "sliceName" : "label",
      "short" : "Alias such as acronym and alternate names.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/label-extension"]
      }]
    },
    {
      "id" : "List.title",
      "path" : "List.title",
      "short" : "The collection's title.",
      "min" : 1
    },
    {
      "id" : "List.code",
      "path" : "List.code",
      "short" : "The type of collection being described.",
      "min" : 1,
      "binding" : {
        "strength" : "extensible",
        "valueSet" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/collection-type-vs"
      }
    },
    {
      "id" : "List.note",
      "path" : "List.note",
      "short" : "The description of the collection."
    },
    {
      "id" : "List.entry",
      "path" : "List.entry",
      "short" : "List of references to items included in the list.",
      "min" : 1
    }]
  }
}

```

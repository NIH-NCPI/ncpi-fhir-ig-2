# Shared Data Model for Research Collection - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Shared Data Model for Research Collection**

## Logical Model: Shared Data Model for Research Collection 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelResearchCollection | *Version*:0.2.0 |
| Draft as of 2026-03-09 | *Computable Name*:CdmResearchCollection |

 
The **Shared Data Model for Research Collection** represent various collections of research data including, but not limited, to Consortia, Programs, adhoc collections of Studies and datasets among other types of collections. 

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/SharedDataModelResearchCollection)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-SharedDataModelResearchCollection.csv), [Excel](StructureDefinition-SharedDataModelResearchCollection.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "SharedDataModelResearchCollection",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelResearchCollection",
  "version" : "0.2.0",
  "name" : "CdmResearchCollection",
  "title" : "Shared Data Model for Research Collection",
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
  "description" : "The **Shared Data Model for Research Collection** represent various collections of research data including, but not limited, to Consortia, Programs, adhoc collections of Studies and datasets among other types of collections.",
  "fhirVersion" : "4.0.1",
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelResearchCollection",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "SharedDataModelResearchCollection",
      "path" : "SharedDataModelResearchCollection",
      "short" : "Shared Data Model for Research Collection",
      "definition" : "The **Shared Data Model for Research Collection** represent various collections of research data including, but not limited, to Consortia, Programs, adhoc collections of Studies and datasets among other types of collections."
    },
    {
      "id" : "SharedDataModelResearchCollection.name",
      "path" : "SharedDataModelResearchCollection.name",
      "short" : "The title of the collection.",
      "definition" : "The title of the collection.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "SharedDataModelResearchCollection.description",
      "path" : "SharedDataModelResearchCollection.description",
      "short" : "The description of the collection.",
      "definition" : "The description of the collection.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "SharedDataModelResearchCollection.type",
      "path" : "SharedDataModelResearchCollection.type",
      "short" : "The type of collection being described.",
      "definition" : "The type of collection being described.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "binding" : {
        "strength" : "extensible",
        "valueSet" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/collection-type-vs"
      }
    },
    {
      "id" : "SharedDataModelResearchCollection.website",
      "path" : "SharedDataModelResearchCollection.website",
      "short" : "A URL for a website, document, or other reference that provides more information as an authoritative source of information about the collection.",
      "definition" : "A URL for a website, document, or other reference that provides more information as an authoritative source of information about the collection.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "url"
      }]
    },
    {
      "id" : "SharedDataModelResearchCollection.items",
      "path" : "SharedDataModelResearchCollection.items",
      "short" : "List of references to items included in the list. These can be studies, datasets, etc.",
      "definition" : "List of references to items included in the list. These can be studies, datasets, etc.",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "Reference"
      }]
    }]
  }
}

```

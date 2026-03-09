# NCPI Research Study Group - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NCPI Research Study Group**

## Resource Profile: NCPI Research Study Group 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-study-group | *Version*:0.2.0 |
| Draft as of 2026-03-09 | *Computable Name*:ResearchStudyGroup |

 
Grouping subject participation within a research study is helpful to provide definitive lists of participants that fit a specific criteria such as **All Participants** or **Participants From a Particular Consent Group**, etc. 

**Usages:**

* Examples for this Profile: [Participants from the GREGoR research study GSS U08 GRU](Group-gregor-research-study-participants.md) and [Participants from the CBTN research study](Group-kf-research-study-cbtn-participants.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/research-study-group)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-research-study-group.csv), [Excel](StructureDefinition-research-study-group.xlsx), [Schematron](StructureDefinition-research-study-group.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "research-study-group",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-study-group",
  "version" : "0.2.0",
  "name" : "ResearchStudyGroup",
  "title" : "NCPI Research Study Group",
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
  "description" : "Grouping subject participation within a research study is helpful to provide definitive lists of participants that fit a specific criteria such as *All Participants* or *Participants From a Particular Consent Group*, etc. ",
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
  "type" : "Group",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Group",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Group",
      "path" : "Group"
    },
    {
      "id" : "Group.type",
      "path" : "Group.type",
      "patternCode" : "person"
    },
    {
      "id" : "Group.actual",
      "path" : "Group.actual",
      "patternBoolean" : true
    },
    {
      "id" : "Group.code",
      "path" : "Group.code",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://purl.obolibrary.org/obo/ncit.owl",
          "code" : "C142710",
          "display" : "Study Participant"
        }]
      }
    },
    {
      "id" : "Group.quantity",
      "path" : "Group.quantity",
      "min" : 1
    },
    {
      "id" : "Group.member.entity",
      "path" : "Group.member.entity",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }]
    }]
  }
}

```

# NCPI Study Participant - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NCPI Study Participant**

## Resource Profile: NCPI Study Participant 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-Study-Participant | *Version*:0.2.0 |
| Draft as of 2026-03-09 | *Computable Name*:NcpiStudyParticipant |

 
Research Study 

**Usages:**

* Examples for this Profile: [ResearchSubject/gregor-example-participantstudy](ResearchSubject-gregor-example-participantstudy.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/ncpi-Study-Participant)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ncpi-Study-Participant.csv), [Excel](StructureDefinition-ncpi-Study-Participant.xlsx), [Schematron](StructureDefinition-ncpi-Study-Participant.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ncpi-Study-Participant",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-Study-Participant",
  "version" : "0.2.0",
  "name" : "NcpiStudyParticipant",
  "title" : "NCPI Study Participant",
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
  "description" : "Research Study",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "BRIDG5.1",
    "uri" : "https://bridgmodel.nci.nih.gov",
    "name" : "BRIDG 5.1 Mapping"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
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
  "type" : "ResearchSubject",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/ResearchSubject",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "ResearchSubject",
      "path" : "ResearchSubject"
    },
    {
      "id" : "ResearchSubject.extension",
      "path" : "ResearchSubject.extension",
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
      "id" : "ResearchSubject.extension:accessPolicy",
      "path" : "ResearchSubject.extension",
      "sliceName" : "accessPolicy",
      "short" : "The Access Policy that may apply to this participant's data from this study. Not canonical, ie, one must rely on the row level AP.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/access-policy"]
      }]
    },
    {
      "id" : "ResearchSubject.study",
      "path" : "ResearchSubject.study",
      "short" : "The Research Study this participant has a relationship with"
    },
    {
      "id" : "ResearchSubject.individual",
      "path" : "ResearchSubject.individual",
      "short" : "The participant we are describing",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-participant"]
      }]
    }]
  }
}

```

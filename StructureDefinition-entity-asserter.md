# Person who recorded assertion about participant - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Person who recorded assertion about participant**

## Extension: Person who recorded assertion about participant 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/entity-asserter | *Version*:0.2.0 |
| Draft as of 2025-12-03 | *Computable Name*:EntityAsserter |

Person who recorded assertion about participant

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [NCPI Conditon Summary](StructureDefinition-ncpi-condition-summary.md) and [NCPI Participant Assertion](StructureDefinition-ncpi-participant-assertion.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/entity-asserter)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-entity-asserter.csv), [Excel](StructureDefinition-entity-asserter.xlsx), [Schematron](StructureDefinition-entity-asserter.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "entity-asserter",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/entity-asserter",
  "version" : "0.2.0",
  "name" : "EntityAsserter",
  "title" : "Person who recorded assertion about participant",
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
  "description" : "Person who recorded assertion about participant",
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
      "expression" : "Observation"
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
        "short" : "Person who recorded assertion about participant",
        "definition" : "Person who recorded assertion about participant"
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/entity-asserter"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "short" : "Who recorded this assertion about the Participant? This can support understanding the differences between self-report, doctor, trained research staff.",
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ]
      }
    ]
  }
}

```

# NCPI Phenotypic Feature Assertion - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NCPI Phenotypic Feature Assertion**

## Resource Profile: NCPI Phenotypic Feature Assertion 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-phenotypic-feature-assertion | *Version*:0.2.0 |
| Draft as of 2025-12-03 | *Computable Name*:NcpiPhenotypicFeatureAssertion |

 
Assertion about a phenotypic feature's presence or absence given a particular participant. 

#### Key Guidelines

(TBD)

##### Added Profile Restrictions

(TBD)

#### Recommended Practices

(TBD)

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/ncpi-phenotypic-feature-assertion)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ncpi-phenotypic-feature-assertion.csv), [Excel](StructureDefinition-ncpi-phenotypic-feature-assertion.xlsx), [Schematron](StructureDefinition-ncpi-phenotypic-feature-assertion.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ncpi-phenotypic-feature-assertion",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-phenotypic-feature-assertion",
  "version" : "0.2.0",
  "name" : "NcpiPhenotypicFeatureAssertion",
  "title" : "NCPI Phenotypic Feature Assertion",
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
  "description" : "Assertion about a phenotypic feature's presence or absence given a particular participant.",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "workflow",
      "uri" : "http://hl7.org/fhir/workflow",
      "name" : "Workflow Pattern"
    },
    {
      "identity" : "sct-concept",
      "uri" : "http://snomed.info/conceptdomain",
      "name" : "SNOMED CT Concept Domain Binding"
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
    },
    {
      "identity" : "sct-attr",
      "uri" : "http://snomed.org/attributebinding",
      "name" : "SNOMED CT Attribute Binding"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Observation",
  "baseDefinition" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-participant-assertion",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Observation",
        "path" : "Observation"
      },
      {
        "id" : "Observation.code",
        "path" : "Observation.code",
        "binding" : {
          "strength" : "extensible",
          "valueSet" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/phenotypic-feature-code-vs"
        }
      },
      {
        "id" : "Observation.value[x]",
        "path" : "Observation.value[x]",
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ],
        "binding" : {
          "strength" : "required",
          "valueSet" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/phenotypic-feature-assertion-vs"
        }
      }
    ]
  }
}

```

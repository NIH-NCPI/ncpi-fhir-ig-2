# Assertion of Phenotypic Feature Codes - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Assertion of Phenotypic Feature Codes**

## ValueSet: Assertion of Phenotypic Feature Codes 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/phenotypic-feature-assertion-vs | *Version*:0.2.0 |
| Draft as of 2025-12-03 | *Computable Name*:PhenotypicFeatureAssertionVS |

 
Assertion of Phenotypic Feature Codes 

 **References** 

* [NCPI Phenotypic Feature Assertion](StructureDefinition-ncpi-phenotypic-feature-assertion.md)

### Logical Definition (CLD)

 

### Expansion

Expansion from tx.fhir.org based on:

* Loinc v2.81
* [codesystem NullFlavor v3.0.0 (CodeSystem)](http://terminology.hl7.org/7.0.0/CodeSystem-v3-NullFlavor.html)
* [valueset NullFlavor v3.0.0 (ValueSet)](http://terminology.hl7.org/7.0.0/ValueSet-v3-NullFlavor.html)

This value set contains 19 concepts

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R4/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "phenotypic-feature-assertion-vs",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/phenotypic-feature-assertion-vs",
  "version" : "0.2.0",
  "name" : "PhenotypicFeatureAssertionVS",
  "title" : "Assertion of Phenotypic Feature Codes",
  "status" : "draft",
  "experimental" : false,
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
  "description" : "Assertion of Phenotypic Feature Codes",
  "compose" : {
    "include" : [
      {
        "system" : "http://loinc.org",
        "concept" : [
          {
            "code" : "LA9633-4",
            "display" : "Present"
          },
          {
            "code" : "LA9634-2",
            "display" : "Absent"
          }
        ]
      },
      {
        "valueSet" : ["http://terminology.hl7.org/ValueSet/v3-NullFlavor"]
      }
    ]
  }
}

```

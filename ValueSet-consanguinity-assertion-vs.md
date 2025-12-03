# Consanguinity Value Codes - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Consanguinity Value Codes**

## ValueSet: Consanguinity Value Codes 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/consanguinity-assertion-vs | *Version*:0.2.0 |
| Draft as of 2025-12-03 | *Computable Name*:ConsanguinityAssertionVS |

 
List of codes indicates the level of known consanguinity (blood relation) within a study family. 

 **References** 

* [Consanguinity Extension](StructureDefinition-consanguinity.md)

### Logical Definition (CLD)

 

### Expansion

Expansion from tx.fhir.org based on SNOMED CT International edition 01-Feb 2025

This value set contains 4 concepts

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
  "id" : "consanguinity-assertion-vs",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/consanguinity-assertion-vs",
  "version" : "0.2.0",
  "name" : "ConsanguinityAssertionVS",
  "title" : "Consanguinity Value Codes",
  "status" : "draft",
  "experimental" : false,
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
  "description" : "List of codes indicates the level of known consanguinity (blood relation) within a study family.",
  "compose" : {
    "include" : [
      {
        "system" : "http://snomed.info/sct",
        "concept" : [
          {
            "code" : "428263003",
            "display" : "NOT suspected"
          },
          {
            "code" : "415684004",
            "display" : "Suspected"
          },
          {
            "code" : "410515003",
            "display" : "Known present"
          },
          {
            "code" : "261665006",
            "display" : "Unknown"
          }
        ]
      }
    ]
  }
}

```

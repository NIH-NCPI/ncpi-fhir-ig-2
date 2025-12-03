# Phenotypic Feature Codes - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Phenotypic Feature Codes**

## ValueSet: Phenotypic Feature Codes 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/phenotypic-feature-code-vs | *Version*:0.2.0 |
| Draft as of 2025-12-03 | *Computable Name*:PhenotypicFeatureCodeVS |

 
Includes all codes from**HPO** 

 **References** 

* [NCPI Phenotypic Feature Assertion](StructureDefinition-ncpi-phenotypic-feature-assertion.md)

### Logical Definition (CLD)

* Include all codes defined in [`http://human-phenotype-ontology.org`](http://terminology.hl7.org/6.2.0/CodeSystem-HPO.html)version Not Stated (use latest from terminology server)

 

### Expansion

No Expansion for this valueset (not supported by Publication Tooling)

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
  "id" : "phenotypic-feature-code-vs",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/phenotypic-feature-code-vs",
  "version" : "0.2.0",
  "name" : "PhenotypicFeatureCodeVS",
  "title" : "Phenotypic Feature Codes",
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
  "description" : "Includes all codes from **HPO** ",
  "compose" : {
    "include" : [
      {
        "system" : "http://human-phenotype-ontology.org"
      }
    ]
  }
}

```

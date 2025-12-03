# Condition Codes - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Condition Codes**

## ValueSet: Condition Codes 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/condition-code-vs | *Version*:0.2.0 |
| Draft as of 2025-12-03 | *Computable Name*:ConditionCodeVS |

 
Includes all codes from**HPO**and**MONDO** 

 **References** 

This value set is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)

### Logical Definition (CLD)

This value set includes codes based on the following rules:

* Include all codes defined in [`http://human-phenotype-ontology.org`](http://terminology.hl7.org/6.2.0/CodeSystem-HPO.html)version Not Stated (use latest from terminology server)
* Include all codes defined in [`http://purl.obolibrary.org/obo/mondo.owl`](http://terminology.hl7.org/6.2.0/CodeSystem-MONDO.html)version Not Stated (use latest from terminology server)

 

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
  "id" : "condition-code-vs",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/condition-code-vs",
  "version" : "0.2.0",
  "name" : "ConditionCodeVS",
  "title" : "Condition Codes",
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
  "description" : "Includes all codes from **HPO** and **MONDO**",
  "compose" : {
    "include" : [
      {
        "system" : "http://human-phenotype-ontology.org"
      },
      {
        "system" : "http://purl.obolibrary.org/obo/mondo.owl"
      }
    ]
  }
}

```

# Family Types Codes - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Family Types Codes**

## ValueSet: Family Types Codes (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/research-study-party-role-vs | *Version*:0.2.0 |
| Active as of 2026-01-13 | *Computable Name*:ResearchStudyPartyRoleVS |

 
A value set with all codes used for the expected family types. 

 **References** 

* [Research Study Associated Party](StructureDefinition-research-study-associated-party.md)

### Logical Definition (CLD)

 

### Expansion

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
  "id" : "research-study-party-role-vs",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/research-study-party-role-vs",
  "version" : "0.2.0",
  "name" : "ResearchStudyPartyRoleVS",
  "title" : "Family Types Codes",
  "status" : "active",
  "experimental" : true,
  "date" : "2026-01-13T18:03:13+00:00",
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
  "description" : "A value set with all codes used for the expected family types.",
  "compose" : {
    "include" : [
      {
        "system" : "http://hl7.org/fhir/research-study-party-role"
      }
    ]
  }
}

```

# Title Type - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Title Type**

## ValueSet: Title Type 

| | | |
| :--- | :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/title-type | *Version*:0.2.0 | |
| *Standards status:*[Trial-use](http://hl7.org/fhir/R4/versions.html#std-process) | [Maturity Level](http://hl7.org/fhir/versions.html#maturity): 1 | *Computable Name*:TitleTypeVS |
| *Other Identifiers:*OID:2.16.840.1.113883.4.642.3.2974 | | |

 
Used to express the reason and specific aspect for the variant title, such as language and specific language. 

 **References** 

* [Label](StructureDefinition-label-extension.md)

### Logical Definition (CLD)

Profile: [Shareable ValueSet](http://hl7.org/fhir/R4/shareablevalueset.html)

* Include all codes defined in [`http://hl7.org/fhir/title-type`](CodeSystem-title-type.md)version 📦0.2.0

 

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
  "id" : "title-type-vs",
  "meta" : {
    "profile" : ["http://hl7.org/fhir/StructureDefinition/shareablevalueset"]
  },
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status",
      "valueCode" : "trial-use"
    },
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm",
      "valueInteger" : 1
    }
  ],
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/title-type",
  "identifier" : [
    {
      "system" : "urn:ietf:rfc:3986",
      "value" : "urn:oid:2.16.840.1.113883.4.642.3.2974"
    }
  ],
  "version" : "0.2.0",
  "name" : "TitleTypeVS",
  "title" : "Title Type",
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
  "description" : "Used to express the reason and specific aspect for the variant title, such as language and specific language.",
  "immutable" : true,
  "compose" : {
    "include" : [
      {
        "system" : "http://hl7.org/fhir/title-type"
      }
    ]
  }
}

```

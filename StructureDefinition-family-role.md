# Study Family Focus - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Study Family Focus**

## Extension: Study Family Focus 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/family-role | *Version*:0.2.0 |
| Draft as of 2025-12-03 | *Computable Name*:FamilyRole |

Extension containing Family Role

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [NCPI Study Family](StructureDefinition-ncpi-study-family.md)
* Examples for this Extension: [Group/cbtn-study-family](Group-cbtn-study-family.md) and [Group/gregor-study-family](Group-gregor-study-family.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/family-role)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-family-role.csv), [Excel](StructureDefinition-family-role.xlsx), [Schematron](StructureDefinition-family-role.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "family-role",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/family-role",
  "version" : "0.2.0",
  "name" : "FamilyRole",
  "title" : "Study Family Focus",
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
  "description" : "Extension containing Family Role",
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
      "expression" : "Group.member.entity"
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
        "short" : "Study Family Focus",
        "definition" : "Extension containing Family Role"
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/family-role"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "short" : "The role this individual has in the family, specifically with respect to a proband or index participant",
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ],
        "binding" : {
          "strength" : "extensible",
          "valueSet" : "http://terminology.hl7.org/ValueSet/v3-FamilyMember"
        }
      }
    ]
  }
}

```

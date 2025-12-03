# Biological Relationship Codes - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Biological Relationship Codes**

## ValueSet: Biological Relationship Codes 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/family-biological-relationship-vs | *Version*:0.2.0 |
| Draft as of 2025-12-03 | *Computable Name*:FamilyBiologicalRelationshipVS |

 
List of codes indicating the biological relationship between two individuals in a family. It is restrictive to encourage a standardized representation. 

# Code Selection Rationale

 

## Parent Codes

 
We use the NCI Thesaurus here for the mother and father because its definitions are more precise. 
* [`C96572`(**"Biological Father"**)](https://evsexplore.semantics.cancer.gov/evsexplore/concept/ncit/C96572): A male who contributes to the genetic makeup of his offspring through the fertilization of an ovum by his sperm.
* [`C96580`(**"Biological Mother"**)](https://evsexplore.semantics.cancer.gov/evsexplore/concept/ncit/C96580): A female who contributes to the genetic makeup of her offspring from the fertilization of her ovum.
 
In contrast, the parental family-role's codes are less refined: 
* [`NMTH`(**"natural mother"**)](https://terminology.hl7.org/6.5.0/CodeSystem-v3-RoleCode.html#v3-RoleCode-NMTH): The player of the role is a female who conceives or gives birth to the scoping entity (child).
* [`NFTH`(**"natural father"**)](https://terminology.hl7.org/6.5.0/CodeSystem-v3-RoleCode.html#v3-RoleCode-NFTH): The player of the role is a male who begets the scoping entity (child).
 
In particular,**"Biological Mother"**excludes surrogates but`NMTH`is ambiguous.**"Biological Father"**specifies fertilization of an ovum by sperm, whereas`NFTH`uses the ambiguous term "begets," which could include other mechanisms. 

## Twin Codes

 
For twins, we use the RoleCode`ITWIN`code rather than the NCI`C73429`. 
* [`C73429`(**"Identical Twin"**)](https://evsexplore.semantics.cancer.gov/evsexplore/concept/ncit/C73429): Either of the two offspring resulting from a shared ovum.
* [`ITWIN`(**"Identical Twin"**)](https://terminology.hl7.org/6.5.0/CodeSystem-v3-RoleCode.html#v3-RoleCode-ITWIN): The scoper and player are offspring of the same egg-sperm pair.
 
Though being "offspring" of the same fertilized egg is questionable wording, we use`ITWIN`because it also allows other multiples (triplets, quadruplets, etc.) to be represented with the same code whereas`C73429`is only for twins. 

# Note for upgrading to FHIR R5

 
When we add support for R5 to the IG, we should add the rest of the codes from[http://terminology.hl7.org/ValueSet/v3-FamilyMember](http://terminology.hl7.org/ValueSet/v3-FamilyMember)as additional bindings to guide users when not using one of the main bindings. 
We intend that when users need to use a code that is not in the main bindings, they should default to the FamilyMember ValueSet. However, in R4, there is no way to express this in the ValueSet itself. 

 **References** 

* [Family Relationship](StructureDefinition-ncpi-family-relationship.md)

### Logical Definition (CLD)

 

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
  "id" : "family-biological-relationship-vs",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/family-biological-relationship-vs",
  "version" : "0.2.0",
  "name" : "FamilyBiologicalRelationshipVS",
  "title" : "Biological Relationship Codes",
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
  "description" : "List of codes indicating the biological relationship between two individuals\nin a family. It is restrictive to encourage a standardized representation.\n\n# Code Selection Rationale\n\n## Parent Codes\n\nWe use the NCI Thesaurus here for the mother and father because its\ndefinitions are more precise.\n\n- [`C96572` (**\"Biological Father\"**)](https://evsexplore.semantics.cancer.gov/evsexplore/concept/ncit/C96572):\n   A male who contributes to the genetic makeup of his offspring through\n   the fertilization of an ovum by his sperm.\n- [`C96580` (**\"Biological Mother\"**)](https://evsexplore.semantics.cancer.gov/evsexplore/concept/ncit/C96580):\n   A female who contributes to the genetic makeup of her offspring\n   from the fertilization of her ovum.\n\nIn contrast, the parental family-role's codes are less refined:\n\n- [`NMTH` (**\"natural mother\"**)](https://terminology.hl7.org/6.5.0/CodeSystem-v3-RoleCode.html#v3-RoleCode-NMTH):\n   The player of the role is a female who conceives\n   or gives birth to the scoping entity (child).\n- [`NFTH` (**\"natural father\"**)](https://terminology.hl7.org/6.5.0/CodeSystem-v3-RoleCode.html#v3-RoleCode-NFTH):\n   The player of the role is a male who begets the\n   scoping entity (child).\n\nIn particular, **\"Biological Mother\"** excludes surrogates but\n`NMTH` is ambiguous. **\"Biological Father\"** specifies\nfertilization of an ovum by sperm, whereas `NFTH` uses the\nambiguous term \"begets,\" which could include other\nmechanisms.\n\n## Twin Codes\n\nFor twins, we use the RoleCode `ITWIN` code rather than the NCI `C73429`.\n\n- [`C73429` (**\"Identical Twin\"**)](https://evsexplore.semantics.cancer.gov/evsexplore/concept/ncit/C73429):\n   Either of the two offspring resulting from a shared ovum.\n- [`ITWIN` (**\"Identical Twin\"**)](https://terminology.hl7.org/6.5.0/CodeSystem-v3-RoleCode.html#v3-RoleCode-ITWIN):\n   The scoper and player are offspring of the same egg-sperm\n   pair.\n\nThough being \"offspring\" of the same fertilized egg is\nquestionable wording, we use `ITWIN` because it also allows\nother multiples (triplets, quadruplets, etc.) to be\nrepresented with the same code whereas `C73429` is only for\ntwins.\n\n# Note for upgrading to FHIR R5\n\nWhen we add support for R5 to the IG, we should add the rest of the\ncodes from <http://terminology.hl7.org/ValueSet/v3-FamilyMember>\nas additional bindings to guide users when not using one of the\nmain bindings.\n\nWe intend that when users need to use a code that is not in\nthe main bindings, they should default to the FamilyMember\nValueSet. However, in R4, there is no way to express this\nin the ValueSet itself.",
  "compose" : {
    "include" : [
      {
        "system" : "http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl",
        "version" : "3.0.0",
        "concept" : [
          {
            "code" : "C96580",
            "display" : "Biological Mother"
          },
          {
            "code" : "C96572",
            "display" : "Biological Father"
          }
        ]
      },
      {
        "system" : "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
        "version" : "3.0.0",
        "concept" : [
          {
            "code" : "ITWIN",
            "display" : "identical twin"
          }
        ]
      }
    ]
  }
}

```

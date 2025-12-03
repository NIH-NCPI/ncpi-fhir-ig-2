# An example family relationship (parent to child) based on data from CBTN - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **An example family relationship (parent to child) based on data from CBTN**

## Example FamilyMemberHistory: An example family relationship (parent to child) based on data from CBTN

Profile: [Family Relationship](StructureDefinition-ncpi-family-relationship.md)

**FamilyMemberHistory Patient Record**: [Anonymous Patient (no stated gender), DoB: ( http://chdgenes.org/#20757)](Patient-PT-006SP675.md)

**status**: Completed

**patient**: [Anonymous Patient (no stated gender), DoB Unknown ( https://cbtn.org/#C21156)](Patient-PT-006SP660.md)

**relationship**: natural daughter



## Resource Content

```json
{
  "resourceType" : "FamilyMemberHistory",
  "id" : "cbtn-family-relationship-daughter",
  "meta" : {
    "profile" : [
      "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-family-relationship"
    ]
  },
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/familymemberhistory-patient-record",
      "valueReference" : {
        "reference" : "Patient/PT-006SP675"
      }
    }
  ],
  "status" : "completed",
  "patient" : {
    "reference" : "Patient/PT-006SP660"
  },
  "relationship" : {
    "coding" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
        "version" : "3.0.0",
        "code" : "DAU",
        "display" : "natural daughter"
      }
    ]
  }
}

```

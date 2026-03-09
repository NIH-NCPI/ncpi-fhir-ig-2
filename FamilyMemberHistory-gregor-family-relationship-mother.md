# An example family relationship (child-to-parent) based on data from GREGoR - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **An example family relationship (child-to-parent) based on data from GREGoR**

## Example FamilyMemberHistory: An example family relationship (child-to-parent) based on data from GREGoR

Profile: [Family Relationship](StructureDefinition-ncpi-family-relationship.md)

**FamilyMemberHistory Patient Record**: [Anonymous Patient (no stated gender), DoB Unknown ( https://anvil.terra.bio/#GSS654321)](Patient-GSS654321.md)

**Part of Study**: [ResearchStudy: identifier = AnVIL_GREGoR_GSS_U08_GRU; status = completed](ResearchStudy-research-study-gregor.md)

**status**: Completed

**patient**: [Anonymous Patient (no stated gender), DoB Unknown ( https://anvil.terra.bio/#GSS123456)](Patient-GSS123456.md)

**relationship**: isBiologicalMotherOf



## Resource Content

```json
{
  "resourceType" : "FamilyMemberHistory",
  "id" : "gregor-family-relationship-mother",
  "meta" : {
    "profile" : ["https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-family-relationship"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/familymemberhistory-patient-record",
    "valueReference" : {
      "reference" : "Patient/GSS654321"
    }
  },
  {
    "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study",
    "valueReference" : {
      "reference" : "ResearchStudy/research-study-gregor"
    }
  }],
  "status" : "completed",
  "patient" : {
    "reference" : "Patient/GSS123456"
  },
  "relationship" : {
    "coding" : [{
      "system" : "http://purl.org/ga4gh/kin.fhir",
      "version" : "0.1.0",
      "code" : "KIN:027",
      "display" : "isBiologicalMotherOf"
    }]
  }
}

```

# Example patients based on data from GREGoR - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example patients based on data from GREGoR**

## Example Group: Example patients based on data from GREGoR

Profile: [NCPI Study Family](StructureDefinition-ncpi-study-family.md)

**Family Type Extension**: Duo

**Part of Study**: [ResearchStudy: identifier = AnVIL_GREGoR_GSS_U08_GRU; status = completed](ResearchStudy-research-study-gregor.md)

**identifier**: `https://anvil.terra.bio/`/GSS5555

**type**: Person

**actual**: true

> **member****entity**: [Anonymous Patient (no stated gender), DoB Unknown ( https://anvil.terra.bio/#GSS123456)](Patient-GSS123456.md)

> **member****entity**: [Anonymous Patient (no stated gender), DoB Unknown ( https://anvil.terra.bio/#GSS654321)](Patient-GSS654321.md)



## Resource Content

```json
{
  "resourceType" : "Group",
  "id" : "gregor-study-family",
  "meta" : {
    "profile" : ["https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-study-family"]
  },
  "extension" : [{
    "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/family-type",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/ncpi-family-types",
        "code" : "Duo",
        "display" : "Duo"
      }]
    }
  },
  {
    "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study",
    "valueReference" : {
      "reference" : "ResearchStudy/research-study-gregor"
    }
  }],
  "identifier" : [{
    "system" : "https://anvil.terra.bio/",
    "value" : "GSS5555"
  }],
  "type" : "person",
  "actual" : true,
  "member" : [{
    "entity" : {
      "extension" : [{
        "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/family-role",
        "valueCodeableConcept" : {
          "coding" : [{
            "system" : "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
            "version" : "3.0.0",
            "code" : "CHILD",
            "display" : "child"
          }]
        }
      }],
      "reference" : "Patient/GSS123456"
    }
  },
  {
    "entity" : {
      "extension" : [{
        "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/family-role",
        "valueCodeableConcept" : {
          "coding" : [{
            "system" : "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
            "version" : "3.0.0",
            "code" : "MTH",
            "display" : "mother"
          }]
        }
      }],
      "reference" : "Patient/GSS654321"
    }
  }]
}

```

# Example patients based on data from CBTN - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example patients based on data from CBTN**

## Example Group: Example patients based on data from CBTN

Profile: [NCPI Study Family](StructureDefinition-ncpi-study-family.md)

**Part of Study**: [ResearchStudy Children's Brain Tumor Network (CBTN)](ResearchStudy-kf-research-study-cbtn.md)

**Family Type Extension**: Trio

**Study Family Focus Extension**: Cancer

**identifier**: `https://cbtn.org/`/FM-00C8Y7DG

**type**: Person

**actual**: true

> **member****entity**:[Anonymous Patient (no stated gender), DoB Unknown ( https://cbtn.org/#C21156)](Patient-PT-006SP660.md)

> **member****entity**:[Anonymous Patient (no stated gender), DoB: ( http://chdgenes.org/#20757)](Patient-PT-006SP675.md)



## Resource Content

```json
{
  "resourceType" : "Group",
  "id" : "cbtn-study-family",
  "meta" : {
    "profile" : [
      "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-study-family"
    ]
  },
  "extension" : [
    {
      "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study",
      "valueReference" : {
        "reference" : "ResearchStudy/kf-research-study-cbtn"
      }
    },
    {
      "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/family-type",
      "valueCodeableConcept" : {
        "coding" : [
          {
            "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/ncpi-family-types",
            "code" : "Trio",
            "display" : "Trio"
          }
        ]
      }
    },
    {
      "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/study-family-focus",
      "valueCodeableConcept" : {
        "coding" : [
          {
            "system" : "http://purl.obolibrary.org/obo/mondo.owl",
            "code" : "0004992",
            "display" : "Cancer"
          }
        ]
      }
    }
  ],
  "identifier" : [
    {
      "system" : "https://cbtn.org/",
      "value" : "FM-00C8Y7DG"
    }
  ],
  "type" : "person",
  "actual" : true,
  "member" : [
    {
      "entity" : {
        "extension" : [
          {
            "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/family-role",
            "valueCodeableConcept" : {
              "coding" : [
                {
                  "system" : "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
                  "code" : "MTH",
                  "display" : "mother"
                }
              ]
            }
          }
        ],
        "reference" : "Patient/PT-006SP660"
      }
    },
    {
      "entity" : {
        "extension" : [
          {
            "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/family-role",
            "valueCodeableConcept" : {
              "coding" : [
                {
                  "system" : "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
                  "code" : "SON",
                  "display" : "natural son"
                }
              ]
            }
          }
        ],
        "reference" : "Patient/PT-006SP675"
      }
    }
  ]
}

```

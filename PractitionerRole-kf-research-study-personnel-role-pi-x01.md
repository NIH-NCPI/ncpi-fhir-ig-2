# dbGaP PI, X01 FY 2021 - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **dbGaP PI, X01 FY 2021**

## Example PractitionerRole: dbGaP PI, X01 FY 2021

**organization**: [Organization Children's Hospital of Philadelphia](Organization-kf-research-study-organization-chop.md)

**code**: Researcher



## Resource Content

```json
{
  "resourceType" : "PractitionerRole",
  "id" : "kf-research-study-personnel-role-pi-x01",
  "organization" : {
    "reference" : "Organization/kf-research-study-organization-chop"
  },
  "code" : [
    {
      "coding" : [
        {
          "system" : "http://terminology.hl7.org/CodeSystem/practitioner-role",
          "code" : "researcher"
        }
      ]
    }
  ]
}

```

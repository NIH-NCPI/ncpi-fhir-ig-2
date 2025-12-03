# CBTN Operations Lead - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **CBTN Operations Lead**

## Example PractitionerRole: CBTN Operations Lead

**organization**: [Organization Children's Hospital of Philadelphia](Organization-kf-research-study-organization-chop.md)

**code**: ICT professional



## Resource Content

```json
{
  "resourceType" : "PractitionerRole",
  "id" : "kf-research-study-personnel-role-op-lead",
  "organization" : {
    "reference" : "Organization/kf-research-study-organization-chop"
  },
  "code" : [
    {
      "coding" : [
        {
          "system" : "http://terminology.hl7.org/CodeSystem/practitioner-role",
          "code" : "ict"
        }
      ]
    }
  ]
}

```

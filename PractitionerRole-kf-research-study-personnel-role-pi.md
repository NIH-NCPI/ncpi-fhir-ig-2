# dbGaP PI - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **dbGaP PI**

## Example PractitionerRole: dbGaP PI

**organization**: [Organization Children's Hospital of Philadelphia](Organization-kf-research-study-organization-chop.md)

**code**: Researcher



## Resource Content

```json
{
  "resourceType" : "PractitionerRole",
  "id" : "kf-research-study-personnel-role-pi",
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

# Research Study Party Role - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Research Study Party Role**

## CodeSystem: Research Study Party Role 

| | | |
| :--- | :--- | :--- |
| *Official URL*:http://hl7.org/fhir/research-study-party-role | *Version*:0.2.0 | |
| * Standards status: *[Trial-use](http://hl7.org/fhir/R4/versions.html#std-process) | [Maturity Level](http://hl7.org/fhir/versions.html#maturity): 0 | *Computable Name*:ResearchStudyPartyRole |
| *Other Identifiers:*OID:2.16.840.1.113883.4.642.4.1968 | | |

 
This is a ResearchStudy's party role. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [ResearchStudyPartyRoleVS](ValueSet-research-study-party-role-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "research-study-party-role",
  "meta" : {
    "profile" : [
      "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"
    ]
  },
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status",
      "valueCode" : "trial-use"
    },
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm",
      "valueInteger" : 0
    }
  ],
  "url" : "http://hl7.org/fhir/research-study-party-role",
  "identifier" : [
    {
      "system" : "urn:ietf:rfc:3986",
      "value" : "urn:oid:2.16.840.1.113883.4.642.4.1968"
    }
  ],
  "version" : "0.2.0",
  "name" : "ResearchStudyPartyRole",
  "title" : "Research Study Party Role",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-02-06T18:07:39+00:00",
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
  "description" : "This is a ResearchStudy's party role.",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 12,
  "concept" : [
    {
      "code" : "sponsor",
      "display" : "sponsor",
      "definition" : "sponsor"
    },
    {
      "code" : "lead-sponsor",
      "display" : "lead-sponsor",
      "definition" : "lead-sponsor"
    },
    {
      "code" : "sponsor-investigator",
      "display" : "sponsor-investigator",
      "definition" : "sponsor-investigator"
    },
    {
      "code" : "primary-investigator",
      "display" : "primary-investigator",
      "definition" : "primary-investigator"
    },
    {
      "code" : "collaborator",
      "display" : "collaborator",
      "definition" : "collaborator"
    },
    {
      "code" : "funding-source",
      "display" : "funding-source",
      "definition" : "funding-source"
    },
    {
      "code" : "general-contact",
      "display" : "general-contact",
      "definition" : "general-contact"
    },
    {
      "code" : "recruitment-contact",
      "display" : "recruitment-contact",
      "definition" : "recruitment-contact"
    },
    {
      "code" : "sub-investigator",
      "display" : "sub-investigator",
      "definition" : "sub-investigator"
    },
    {
      "code" : "study-director",
      "display" : "study-director",
      "definition" : "study-director"
    },
    {
      "code" : "study-chair",
      "display" : "study-chair",
      "definition" : "study-chair"
    },
    {
      "code" : "irb",
      "display" : "Institutional Review Board"
    }
  ]
}

```

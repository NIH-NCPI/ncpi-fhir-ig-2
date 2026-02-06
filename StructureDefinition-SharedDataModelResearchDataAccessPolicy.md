# Shared Data Model for Research Data Access Policy - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Shared Data Model for Research Data Access Policy**

## Logical Model: Shared Data Model for Research Data Access Policy 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelResearchDataAccessPolicy | *Version*:0.2.0 |
| Draft as of 2026-02-06 | *Computable Name*:CdmResearchDataAccessPolicy |

 
The **Shared Data Model for Research Data Access Policy** represent the various Data Use Agreements that govern a researcher's access and use of research data. 

### Shared Data Model Research Data Access Policy

#### Basic Definition

Access policy communicates the limitations and/or requirements that define how a user may gain access to a particular set of data.

Access policy is limited to describing restrictions that respect the privacy and rights of the participants arising from consents, protocols, or other official documents. It should not be used to describe technical requirements for accessing data.

Access policy is defined using a standard set of codes, with one policy per set of codes that apply to a specified portion of the data. Each Access Policy element also includes a free text field that allows for further description of the policy and necessary steps for gaining access.

For Summary-only submissions, Access Policy elements should be included in order to describe the various data use limitations present in the dataset. For submissions which include data and/or participant records, Access Policy should be associated with the participants and data files to appropriately describe the applicable limitations.

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/SharedDataModelResearchDataAccessPolicy)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-SharedDataModelResearchDataAccessPolicy.csv), [Excel](StructureDefinition-SharedDataModelResearchDataAccessPolicy.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "SharedDataModelResearchDataAccessPolicy",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelResearchDataAccessPolicy",
  "version" : "0.2.0",
  "name" : "CdmResearchDataAccessPolicy",
  "title" : "Shared Data Model for Research Data Access Policy",
  "status" : "draft",
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
  "description" : "The **Shared Data Model for Research Data Access Policy** represent the various Data Use Agreements that govern a researcher's access and use of research data.",
  "fhirVersion" : "4.0.1",
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelResearchDataAccessPolicy",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [
      {
        "id" : "SharedDataModelResearchDataAccessPolicy",
        "path" : "SharedDataModelResearchDataAccessPolicy",
        "short" : "Shared Data Model for Research Data Access Policy",
        "definition" : "The **Shared Data Model for Research Data Access Policy** represent the various Data Use Agreements that govern a researcher's access and use of research data."
      },
      {
        "id" : "SharedDataModelResearchDataAccessPolicy.policyCode",
        "path" : "SharedDataModelResearchDataAccessPolicy.policyCode",
        "short" : "Enumerated values that describe the policy including: dbGaP consent codes, DUO Terms among others. The bindings to these terms should enable groups to create their own codes.",
        "definition" : "Enumerated values that describe the policy including: dbGaP consent codes, DUO Terms among others. The bindings to these terms should enable groups to create their own codes.",
        "min" : 1,
        "max" : "*",
        "type" : [
          {
            "code" : "code"
          }
        ],
        "binding" : {
          "strength" : "required",
          "valueSet" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/research-data-access-code-vs"
        }
      },
      {
        "id" : "SharedDataModelResearchDataAccessPolicy.description",
        "path" : "SharedDataModelResearchDataAccessPolicy.description",
        "short" : "Free text further describing the policy, including description of necessary steps for gaining access to data",
        "definition" : "Free text further describing the policy, including description of necessary steps for gaining access to data",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "string"
          }
        ]
      },
      {
        "id" : "SharedDataModelResearchDataAccessPolicy.website",
        "path" : "SharedDataModelResearchDataAccessPolicy.website",
        "short" : "TBD",
        "definition" : "TBD",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "url"
          }
        ]
      }
    ]
  }
}

```

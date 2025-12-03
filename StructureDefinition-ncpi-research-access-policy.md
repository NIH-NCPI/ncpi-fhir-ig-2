# NCPI Research Access Policy - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NCPI Research Access Policy**

## Resource Profile: NCPI Research Access Policy 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-research-access-policy | *Version*:0.2.0 |
| Draft as of 2025-12-03 | *Computable Name*:NcpiResearchAccessPolicy |

 
Limitations and/or requirements that define how a user may gain access to a particular set of data. 

### Basic Definition

Access policy communicates the limitations and/or requirements that define how a user may gain access to a particular set of data.

Access policy is limited to describing restrictions that respect the privacy and rights of the participants arising from consents, protocols, or other official documents. It should not be used to describe technical requirements for accessing data.

Access policy is defined using a standard set of codes, with one policy per set of codes that apply to a specified portion of the data. Each Access Policy element also includes a free text field that allows for further description of the policy and necessary steps for gaining access.

For Summary-only submissions, Access Policy elements should be included in order to describe the various data use limitations present in the dataset. For submissions which include data and/or participant records, Access Policy should be associated with the participants and data files to appropriately describe the applicable limitations.

#### Primary Profile Restrictions and Enhancements

* category **must** be assigned **research**.
* a meaningful **description** must be provided using the [Access Policy Description](StructureDefinition-access-policy-description.md) extension.
* a provision.purpose **must** be defined for each distinct research constraint associated with this policy. These codes **must** be selected from the ValueSet representing the codes found in [ResearchDataAccessCodes](CodeSystem-research-data-access-code.md).
* For those policies that are disease specific, the code, DS, **shall** be used and **must** be accompanied by a properly defined [Disease Use Limitation](StructureDefinition-research-disease-use-limitation.md).

**Usages:**

* Refer to this Profile: [Access policy](StructureDefinition-access-policy.md)
* Examples for this Profile: [Consent/gregor-gru-consent](Consent-gregor-gru-consent.md), [Consent/kf-gru-dac-consent](Consent-kf-gru-dac-consent.md), [Consent/kf-gru-dbgap-consent](Consent-kf-gru-dbgap-consent.md), [Consent/kf-gsr-allowed-access](Consent-kf-gsr-allowed-access.md) and [Consent/kf-registered-allowed-access](Consent-kf-registered-allowed-access.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/ncpi-research-access-policy)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ncpi-research-access-policy.csv), [Excel](StructureDefinition-ncpi-research-access-policy.xlsx), [Schematron](StructureDefinition-ncpi-research-access-policy.sch) 

### Notes:

While the standard FHIR R4 Consent is intended to be directly associated with a particular patient, given the nature of research access control policies, this profile is intended to be instantiated once and associated with a number of patients (TBD).



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ncpi-research-access-policy",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-research-access-policy",
  "version" : "0.2.0",
  "name" : "NcpiResearchAccessPolicy",
  "title" : "NCPI Research Access Policy",
  "status" : "draft",
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
  "description" : "Limitations and/or requirements that define how a user may gain access to a particular set of data.",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "workflow",
      "uri" : "http://hl7.org/fhir/workflow",
      "name" : "Workflow Pattern"
    },
    {
      "identity" : "v2",
      "uri" : "http://hl7.org/v2",
      "name" : "HL7 v2 Mapping"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Consent",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Consent",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Consent",
        "path" : "Consent",
        "constraint" : [
          {
            "key" : "completed-consent-code",
            "severity" : "error",
            "human" : "If category is DS then there must be a ResearchConsentDiseaseAbbreviation",
            "expression" : "provision.purpose.where(code = 'DS').empty() or provision.extension.where(url='https://nih-ncpi.github.io/ncpi-fhir-ig/StructureDefinition/research-disease-use-limitation').exists()",
            "source" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-research-access-policy"
          }
        ]
      },
      {
        "id" : "Consent.extension",
        "path" : "Consent.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Consent.extension:description",
        "path" : "Consent.extension",
        "sliceName" : "description",
        "short" : "Descriptive text summarizing the policy restrictions and other details associated with this access provision.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/access-policy-description"
            ]
          }
        ]
      },
      {
        "id" : "Consent.extension:accessType",
        "path" : "Consent.extension",
        "sliceName" : "accessType",
        "short" : "Type of access restrictions on file downloads ( open | registered | controlled )",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/access-type"
            ]
          }
        ]
      },
      {
        "id" : "Consent.extension:website",
        "path" : "Consent.extension",
        "sliceName" : "website",
        "short" : "URL describing the policy restrictions in detail.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-web-link"
            ]
          }
        ]
      },
      {
        "id" : "Consent.category",
        "path" : "Consent.category",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://terminology.hl7.org/CodeSystem/consentcategorycodes",
              "code" : "research",
              "display" : "Research Information Access"
            }
          ]
        }
      },
      {
        "id" : "Consent.provision.extension",
        "path" : "Consent.provision.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        }
      },
      {
        "id" : "Consent.provision.extension:diseaseUseLimitation",
        "path" : "Consent.provision.extension",
        "sliceName" : "diseaseUseLimitation",
        "short" : "Consent Code Disease Abbreviation",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-disease-use-limitation"
            ]
          }
        ]
      },
      {
        "id" : "Consent.provision.purpose",
        "path" : "Consent.provision.purpose",
        "binding" : {
          "strength" : "extensible",
          "valueSet" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/research-data-access-code-vs"
        }
      }
    ]
  }
}

```

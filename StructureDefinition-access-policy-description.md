# Access Policy Description - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Access Policy Description**

## Extension: Access Policy Description 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/access-policy-description | *Version*:0.2.0 |
| Draft as of 2025-12-03 | *Computable Name*:AccessPolicyDescription |

Descriptive text summarizing the policy restrictions and other details associated with this access provision.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [NCPI Research Access Policy](StructureDefinition-ncpi-research-access-policy.md)
* Examples for this Extension: [Consent/gregor-gru-consent](Consent-gregor-gru-consent.md), [Consent/kf-gru-dac-consent](Consent-kf-gru-dac-consent.md), [Consent/kf-gru-dbgap-consent](Consent-kf-gru-dbgap-consent.md), [Consent/kf-gsr-allowed-access](Consent-kf-gsr-allowed-access.md) and [Consent/kf-registered-allowed-access](Consent-kf-registered-allowed-access.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/access-policy-description)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-access-policy-description.csv), [Excel](StructureDefinition-access-policy-description.xlsx), [Schematron](StructureDefinition-access-policy-description.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "access-policy-description",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/access-policy-description",
  "version" : "0.2.0",
  "name" : "AccessPolicyDescription",
  "title" : "Access Policy Description",
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
  "description" : "Descriptive text summarizing the policy restrictions and other details associated with this access provision.",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    }
  ],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [
    {
      "type" : "element",
      "expression" : "Consent"
    }
  ],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Extension",
        "path" : "Extension",
        "short" : "Access Policy Description",
        "definition" : "Descriptive text summarizing the policy restrictions and other details associated with this access provision."
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/access-policy-description"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "short" : "Descriptive text summarizing the policy restrictions and other details associated with this access provision.",
        "min" : 1,
        "type" : [
          {
            "code" : "markdown"
          }
        ]
      }
    ]
  }
}

```

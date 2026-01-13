# NCPI Participant - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NCPI Participant**

## Resource Profile: NCPI Participant 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-participant | *Version*:0.2.0 |
| Draft as of 2026-01-13 | *Computable Name*:NcpiParticipant |

 
Research oriented patient 

#### Key Guidelines

The NCPI Participant profile is based on the standard resource type, [Patient](https://hl7.org/fhir/R4B/patient.html) and is intended to represent an individual participating in a specific research study.

##### Added Profile Restrictions

In order to ensure that our resources are interoperable across studies, we have employed a number of restrictions that should make consuming Patient resources more consistent.

* ID **should** be a globally unique identifier associated with the patient. This practice is intended to make constructing queries for the same patient compatible across different servers (such as QA vs PROD) but also to make the resource URLs more meaningful.
* Identifier **should** have all appropriate identifiers with a meaningful system/value pair. Such identifiers may include dbGaP accession IDs, global and external IDs, etc.
* Race and ethnicity **must** be defined using OMB Categories using the relevant US Core extensions ([us-core-race extension](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-race.html) & [us-core-ethnicity](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-ethnicity.html))
* Where birth date is known, the extension, [research-date-of-birth-method](StructureDefinition-research-date-of-birth-method.md) **must** be provided to indicate the method used in the construction of that value.

#### Recommended Practices

While only some of the fields in NCPI Participant are strictly required, it is recommended that users of this IG fill out as much information as they have available for a given participant.

##### FHIR Mappings

The following fields from the shared data model are to be mapped into the NCPI Participant as shown below:

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| **Logical Model Property** | **Cardinality** | **NCPI FHIR Mapping** | **Usage Guidance** | **Notes** |
| [participantID](StructureDefinition-SharedDataModelResearchParticipant-definitions.md#diff_SharedDataModelResearchParticipant.participantID) | 1..1 | id | Strongly recommended | It is strongly recommended for the Participant Resource ID to be a unique identifier with an appropriate system |
| [externalID](StructureDefinition-SharedDataModelResearchParticipant-definitions.md#diff_SharedDataModelResearchParticipant.externalID) | 0..* | identifier |   |   |
| [population](StructureDefinition-SharedDataModelResearchParticipant-definitions.md#diff_SharedDataModelResearchParticipant.population) | 0..* | TBD | Strongly recommended |   |
| [ombRace](StructureDefinition-SharedDataModelResearchParticipant-definitions.md#diff_SharedDataModelResearchParticipant.ombRace) | 0..* | extension | Required if available | Use the[us-core-race extension](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-race.html) |
| [ombEth](StructureDefinition-SharedDataModelResearchParticipant-definitions.md#diff_SharedDataModelResearchParticipant.ombEth) | 0..* | extension | Required if available | Use the[us-core-ethnicity](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-ethnicity.html) |
| [sex](StructureDefinition-SharedDataModelResearchParticipant-definitions.md#diff_SharedDataModelResearchParticipant.sex) | 1..1 | extension | Required if available | Use the[us-core-birthsex](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-birthsex.html)extension |
| [dateOfBirth](StructureDefinition-SharedDataModelResearchParticipant-definitions.md#diff_SharedDataModelResearchParticipant.dateOfBirth) | 0..1 | birthDate | Optional |   |
| [dobMethod](StructureDefinition-SharedDataModelResearchParticipant-definitions.md#diff_SharedDataModelResearchParticipant.dobMethod) | 0..1 | extension[ResearchDateOfBirthMethod](StructureDefinition-research-date-of-birth-method.md) | Required if dateOfBirth is provided |   |
| [ageAtLastVitalStatus](StructureDefinition-SharedDataModelResearchParticipant-definitions.md#diff_SharedDataModelResearchParticipant.ageAtLastVitalStatus) | 0..1 | extension[AgeAtLastVitalStatus](StructureDefinition-research-age-at-last-vital-status.md) | Recommended |   |
| [vitalStatus](StructureDefinition-SharedDataModelResearchParticipant-definitions.md#diff_SharedDataModelResearchParticipant.vitalStatus) | 0..1 | deceased | Recommended |   |

##### Study Participation

The conventional FHIR mechanism to link Patient resources to a ResearchStudy is through the use of a ResearchSubject resource. Let's use GREGoR data as an example: our example NCPI Participant, "GSS123456", is linked to NCPI Person "PS_000" which represents the "actual" person participating in a study. In this case, GSS123456 is connected to PS_000 by `link.target` and if PS_000 participated in another study, their other unique NCPI Participant ID could be similarly linked. NCPI Study Participant connects NCPI Research Study, relevant Access Policies, and an NCPI Participant into a single profile while NCPI Study Group contains a list of Study Participants.

For further information, see the Participant, Research Study, and Person examples:

| | |
| :--- | :--- |
| **NCPI Profile** | **Link to GREGoR Example** |
| Research Study | [Example JSON](ResearchStudy-research-study-gregor.json.md) |
| Research Study Group | [Example JSON](Group-gregor-research-study-participants.json.md) |
| Study Participant | [Example JSON](ResearchSubject-gregor-example-participantstudy.json.md) |
| Participant | [Example JSON GSS123456](Patient-GSS123456.json.md),[Example JSON GSS654321](Patient-GSS654321.json.md) |
| Person | [Example JSON](Person-gregor-example-person.json.md) |

**Usages:**

* Refer to this Profile: [NCPI Study Participant](StructureDefinition-ncpi-Study-Participant.md), [Family Relationship](StructureDefinition-ncpi-family-relationship.md), [NCPI Participant Assertion](StructureDefinition-ncpi-participant-assertion.md), [NCPI Person](StructureDefinition-ncpi-person.md) and [NCPI Study Family](StructureDefinition-ncpi-study-family.md)
* Examples for this Profile: [Patient/GSS123456](Patient-GSS123456.md), [Patient/GSS654321](Patient-GSS654321.md), [Patient/PT-006SP660](Patient-PT-006SP660.md) and [Patient/PT-006SP675](Patient-PT-006SP675.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/ncpi-participant)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ncpi-participant.csv), [Excel](StructureDefinition-ncpi-participant.xlsx), [Schematron](StructureDefinition-ncpi-participant.sch) 

### Notes:

#### US Core Race Values

The extension binds the following [ValueSet](https://cts.nlm.nih.gov/fhir/res/ValueSet/$expand?url=http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1021.24). Please note that, in order to view this, you must have logged into your browser using your API key (or provided the key using appriate flow specified by UMLS's docs)

For those who don't have a key, or just want a quick reminder, the codes are listed below:

ValueSet URL: http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1021.24

| | | |
| :--- | :--- | :--- |
| **Code** | **Display** | **System** |
| F | Female | http://terminology.hl7.org/CodeSystem/v3-AdministrativeGender |
| M | Male | http://terminology.hl7.org/CodeSystem/v3-AdministrativeGender |
| ASKU | asked but unknown | http://terminology.hl7.org/CodeSystem/v3-NullFlavor |
| OTH | other | http://terminology.hl7.org/CodeSystem/v3-NullFlavor |
| UNK | unknown | http://terminology.hl7.org/CodeSystem/v3-NullFlavor |
| asked-declined | Asked But Declined | http://terminology.hl7.org/CodeSystem/data-absent-reason |

Please note that there are 3 different systems listed in the codes above.



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ncpi-participant",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-participant",
  "version" : "0.2.0",
  "name" : "NcpiParticipant",
  "title" : "NCPI Participant",
  "status" : "draft",
  "date" : "2026-01-13T18:03:13+00:00",
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
  "description" : "Research oriented patient",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "cda",
      "uri" : "http://hl7.org/v3/cda",
      "name" : "CDA (R2)"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "v2",
      "uri" : "http://hl7.org/v2",
      "name" : "HL7 v2 Mapping"
    },
    {
      "identity" : "loinc",
      "uri" : "http://loinc.org",
      "name" : "LOINC code for the element"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Patient",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Patient",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Patient",
        "path" : "Patient"
      },
      {
        "id" : "Patient.id",
        "path" : "Patient.id",
        "short" : "ParticipantID - Unique participant identifier. System identifier used for internal references."
      },
      {
        "id" : "Patient.extension",
        "path" : "Patient.extension",
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
        "id" : "Patient.extension:usCoreBirthSex",
        "path" : "Patient.extension",
        "sliceName" : "usCoreBirthSex",
        "short" : "Sex assigned at birth (or pre-natal observed sex)",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex|6.1.0"
            ]
          }
        ]
      },
      {
        "id" : "Patient.extension:usCoreRace",
        "path" : "Patient.extension",
        "sliceName" : "usCoreRace",
        "short" : "US Core Race",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://hl7.org/fhir/us/core/StructureDefinition/us-core-race|6.1.0"
            ]
          }
        ]
      },
      {
        "id" : "Patient.extension:usCoreEthnicity",
        "path" : "Patient.extension",
        "sliceName" : "usCoreEthnicity",
        "short" : "US Core Ethnicity",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity|6.1.0"
            ]
          }
        ]
      },
      {
        "id" : "Patient.extension:population",
        "path" : "Patient.extension",
        "sliceName" : "population",
        "short" : "Population, Race, and/or Ethnicity information.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-population"
            ]
          }
        ]
      },
      {
        "id" : "Patient.extension:dobMethod",
        "path" : "Patient.extension",
        "sliceName" : "dobMethod",
        "short" : "Specifies method used to alter DOB for research sharing. Details should be available in the study protocols.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-date-of-birth-method"
            ]
          }
        ]
      },
      {
        "id" : "Patient.extension:ageAtLastVitalStatus",
        "path" : "Patient.extension",
        "sliceName" : "ageAtLastVitalStatus",
        "short" : "Age or date of last vital status",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-age-at-last-vital-status"
            ]
          }
        ]
      },
      {
        "id" : "Patient.identifier",
        "path" : "Patient.identifier",
        "short" : "External IDs for this participant. Requires scoping."
      },
      {
        "id" : "Patient.birthDate",
        "path" : "Patient.birthDate",
        "short" : "Date of Birth of the participant. Details of privacy method should be included in DOBMethod"
      },
      {
        "id" : "Patient.deceased[x]",
        "path" : "Patient.deceased[x]",
        "short" : "Implementers can provide relativeDateTime or actual date or T/F, depending on data available."
      }
    ]
  }
}

```

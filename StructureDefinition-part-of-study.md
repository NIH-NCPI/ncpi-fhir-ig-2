# Part of Study - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Part of Study**

## Extension: Part of Study 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study | *Version*:0.2.0 |
| Draft as of 2026-02-06 | *Computable Name*:PartOfStudy |

Link study related sources back to the relevant study.

**Context of Use**

**Usage info**

**Usages:**

* Examples for this Extension: [Condition/GSS123456-condition-summary](Condition-GSS123456-condition-summary.md), [DocumentReference/GF-6BAD9S7D](DocumentReference-GF-6BAD9S7D.md), [DocumentReference/GSS123456-01-010-SG-2](DocumentReference-GSS123456-01-010-SG-2.md), [Group/cbtn-study-family](Group-cbtn-study-family.md)... Show 21 more, [Participants from the GREGoR research study GSS U08 GRU](Group-gregor-research-study-participants.md), [Group/gregor-study-family](Group-gregor-study-family.md), [Participants from the CBTN research study](Group-kf-research-study-cbtn-participants.md), [Observation/FASTQ-example](Observation-FASTQ-example.md), [Observation/GSS123456-assertion](Observation-GSS123456-assertion.md), [Observation/GSS123456-condition-assertion](Observation-GSS123456-condition-assertion.md), [Observation/PT-006SP660-condition](Observation-PT-006SP660-condition.md), [Observation/cbtn-family-relationship-mother](Observation-cbtn-family-relationship-mother.md), [Observation/cbtn-family-relationship-son](Observation-cbtn-family-relationship-son.md), [Observation/gregor-example-metadata](Observation-gregor-example-metadata.md), [Observation/gregor-family-relationship-mother](Observation-gregor-family-relationship-mother.md), [Patient/GSS123456](Patient-GSS123456.md), [Patient/GSS654321](Patient-GSS654321.md), [Patient/PT-006SP660](Patient-PT-006SP660.md), [Patient/PT-006SP675](Patient-PT-006SP675.md), [Person/gregor-example-person](Person-gregor-example-person.md), [Person/pcgc-example-person](Person-pcgc-example-person.md), [ResearchSubject/gregor-example-participantstudy](ResearchSubject-gregor-example-participantstudy.md), [Specimen/GSS123456-01-010](Specimen-GSS123456-01-010.md), [Specimen/GSS123456-01-010p](Specimen-GSS123456-01-010p.md) and [Specimen/SA-000](Specimen-SA-000.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/part-of-study)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-part-of-study.csv), [Excel](StructureDefinition-part-of-study.xlsx), [Schematron](StructureDefinition-part-of-study.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "part-of-study",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study",
  "version" : "0.2.0",
  "name" : "PartOfStudy",
  "title" : "Part of Study",
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
  "description" : "Link study related sources back to the relevant study.",
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
      "expression" : "DomainResource"
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
        "short" : "Part of Study",
        "definition" : "Link study related sources back to the relevant study."
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "short" : "Reference to the relevant research study.",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-research-study"
            ]
          }
        ]
      }
    ]
  }
}

```

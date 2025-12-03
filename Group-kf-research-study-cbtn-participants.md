# Participants from the CBTN research study - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Participants from the CBTN research study**

## Example Group: Participants from the CBTN research study

Profile: [NCPI Research Study Group](StructureDefinition-research-study-group.md)

**Part of Study**: [ResearchStudy Children's Brain Tumor Network (CBTN)](ResearchStudy-kf-research-study-cbtn.md)

**identifier**: `https://cbtn.org/`/CBTN-Participants

**type**: Person

**actual**: true

**name**: Participants from the CBTN research study

**quantity**: 6667



## Resource Content

```json
{
  "resourceType" : "Group",
  "id" : "kf-research-study-cbtn-participants",
  "meta" : {
    "profile" : [
      "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-study-group"
    ]
  },
  "extension" : [
    {
      "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study",
      "valueReference" : {
        "reference" : "ResearchStudy/kf-research-study-cbtn"
      }
    }
  ],
  "identifier" : [
    {
      "system" : "https://cbtn.org/",
      "value" : "CBTN-Participants"
    }
  ],
  "type" : "person",
  "actual" : true,
  "name" : "Participants from the CBTN research study",
  "quantity" : 6667
}

```

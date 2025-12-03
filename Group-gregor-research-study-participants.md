# Participants from the GREGoR research study - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Participants from the GREGoR research study**

## Example Group: Participants from the GREGoR research study

Profile: [NCPI Research Study Group](StructureDefinition-research-study-group.md)

**Part of Study**: [ResearchStudy: identifier = AnVIL_GREGoR_GSS_U08_GRU; status = completed](ResearchStudy-research-study-gregor.md)

**identifier**: `https://anvil.terra.bio/`/GREGoR Participants

**type**: Person

**actual**: true

**name**: Participants from the GREGoR research study GSS U08 GRU

**quantity**: 555



## Resource Content

```json
{
  "resourceType" : "Group",
  "id" : "gregor-research-study-participants",
  "meta" : {
    "profile" : [
      "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-study-group"
    ]
  },
  "extension" : [
    {
      "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study",
      "valueReference" : {
        "reference" : "ResearchStudy/research-study-gregor"
      }
    }
  ],
  "identifier" : [
    {
      "system" : "https://anvil.terra.bio/",
      "value" : "GREGoR Participants"
    }
  ],
  "type" : "person",
  "actual" : true,
  "name" : "Participants from the GREGoR research study GSS U08 GRU",
  "quantity" : 555
}

```

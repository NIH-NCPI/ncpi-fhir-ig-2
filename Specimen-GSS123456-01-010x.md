# Example biospecimen based on data from GREGoR, intentionally breaking the no parent and collection together rule. This should generate a warning. - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example biospecimen based on data from GREGoR, intentionally breaking the no parent and collection together rule. This should generate a warning.**

## Example Specimen: Example biospecimen based on data from GREGoR, intentionally breaking the no parent and collection together rule. This should generate a warning.

Profile: [NCPI Sample](StructureDefinition-ncpi-sample.md)

**Part of Study**: [ResearchStudy: identifier = AnVIL_GREGoR_GSS_U08_GRU; status = completed](ResearchStudy-research-study-gregor.md)

**identifier**: GSS123456-s1

**type**: DNA

**subject**: [Anonymous Patient (no stated gender), DoB Unknown ( https://anvil.terra.bio/#GSS123456)](Patient-GSS123456.md)

**parent**: [Specimen: extension = ->ResearchStudy: identifier = AnVIL_GREGoR_GSS_U08_GRU; status = completed; identifier = GSS123456-s1; type =](Specimen-GSS123456-01-010p.md)

### Collections

| | |
| :--- | :--- |
| - | **Method** |
| * | DNA |



## Resource Content

```json
{
  "resourceType" : "Specimen",
  "id" : "GSS123456-01-010x",
  "meta" : {
    "profile" : [
      "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-sample"
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
      "value" : "GSS123456-s1"
    }
  ],
  "type" : {
    "text" : "DNA"
  },
  "subject" : {
    "reference" : "Patient/GSS123456"
  },
  "parent" : [
    {
      "reference" : "Specimen/GSS123456-01-010p"
    }
  ],
  "collection" : {
    "method" : {
      "text" : "DNA"
    }
  }
}

```

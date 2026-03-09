# Example mappings based on data from GREGoR - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example mappings based on data from GREGoR**

## Example ResearchSubject: Example mappings based on data from GREGoR

Profile: [NCPI Study Participant](StructureDefinition-ncpi-Study-Participant.md)

**Part of Study**: [ResearchStudy: identifier = AnVIL_GREGoR_GSS_U08_GRU; status = completed](ResearchStudy-research-study-gregor.md)

**status**: Candidate

**study**: [ResearchStudy: identifier = AnVIL_GREGoR_GSS_U08_GRU; status = completed](ResearchStudy-research-study-gregor.md)

**individual**: [Anonymous Patient (no stated gender), DoB Unknown ( https://anvil.terra.bio/#GSS123456)](Patient-GSS123456.md)

**consent**: [gregor-gru-consent](Consent-gregor-gru-consent.md)



## Resource Content

```json
{
  "resourceType" : "ResearchSubject",
  "id" : "gregor-example-participantstudy",
  "meta" : {
    "profile" : ["https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-Study-Participant"]
  },
  "extension" : [{
    "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study",
    "valueReference" : {
      "reference" : "ResearchStudy/research-study-gregor"
    }
  }],
  "status" : "candidate",
  "study" : {
    "reference" : "ResearchStudy/research-study-gregor"
  },
  "individual" : {
    "reference" : "Patient/GSS123456"
  },
  "consent" : {
    "reference" : "Consent/gregor-gru-consent"
  }
}

```

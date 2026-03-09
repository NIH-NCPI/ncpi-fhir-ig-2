# Children's Brain Tumor Network (CBTN) - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Children's Brain Tumor Network (CBTN)**

## Example ResearchStudy: Children's Brain Tumor Network (CBTN)

Profile: [NCPI Research Study](StructureDefinition-ncpi-research-study.md)

**Research Study Acknowledgement**: 

Please cite/reference the use of dbGaP data by including the dbGaP accession phs002517.v2.p2. Additionally, use the following statement to acknowledge the submitter(s) of this study:

The data from this study phs002517 was made available pre-publication without embargo to support rapid and collaborative research in pediatric cancer via the NCI's Cancer Research Data Commons (https://datacommons.cancer.gov). This availability is made possible with the support of NCI's Childhood Cancer Data Initiative (grant No. 3P30CA082103-21S9) and Gabriella Miller Kids First Pediatric Research Program (X01 CA267587). Initial data generation efforts and coordination costs were supported by a number of philanthropic and industry partners with further details at cbtn.org.

Suggested Acknowledgement Statement for secondary users: The results analyzed and <published or shown> here are based in whole or in part analyzing the study phs002517 and were accessed from the NCI's Cancer Research Data Commons (https://datacommons.cancer.gov).

> **Research Study Associated Party**
* name: Adam C. Resnick
* role: primary-investigator
* party: [PractitionerRole Researcher](PractitionerRole-kf-research-study-personnel-role-pi-x01.md)

> **Research Study Associated Party**
* name: Allison P. Heath
* role: primary-investigator
* party: [PractitionerRole Researcher](PractitionerRole-kf-research-study-personnel-role-pi.md)

> **Research Study Associated Party**
* name: Jennifer Mason
* role: study-director
* party: [PractitionerRole ICT professional](PractitionerRole-kf-research-study-personnel-role-op-lead.md)

**identifier**: SD_BHJXBDQK, `https://www.ncbi.nlm.nih.gov/projects/gap/cgi-bin/study.cgi?study_id=`/phs002517.v2.p2, CBTN, PBTA-CBTN

**title**: Children's Brain Tumor Network (CBTN)

**status**: Completed

**focus**: Brain Neoplasms

### RelatedArtifacts

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| - | **Type** | **Label** | **Display** | **Url** |
| * | Documentation | dbGaP Study Name | Childhood Cancer Data Initiative (CCDI): Molecular Characterization across Pediatric Brain Tumors and Other Solid and Hematologic Malignancies for Research, Diagnostic, and Precision Medicine |  |
| * | Documentation | Legacy Study Name | Pediatric Brain Tumor Atlas: CBTTC |  |
| * | Documentation | Website |  | [https://cbtn.org/](https://cbtn.org/) |
| * | Documentation | enrollmentCriteria | Pediatric and AYA patients diagnosed with a central nervous system tumor, solid tumor, or hematologic malignancy. |  |
| * | Citation | Publication |  | [https://cbtn.org/publications](https://cbtn.org/publications) |

**description**: 

Brain tumors are the most common form of cancer in children aged 0-19 in the United States, and are the largest cause of cancer-related deaths. The estimated number of new cases in 2019 is nearly 3,800 and thus brain tumors are a rare disease. Despite their relative rarity, the years of potential life lost due to brain tumors in 2009 was estimated at 47,631 years for children and adolescents aged 0-19 in the United States; this is a disproportionate amount of life lost compared to adult cancers and represents an unrecognized societal threat. There is an urgent need to improve therapies for these children. Most of the high-grade glial and embryonal brain cancers still remain largely incurable despite decades of clinical and laboratory research. Existing non-targeted chemotherapies and radiation, while at times effective, often represent pyrrhic victories, leaving behind life-long health burdens and causing a significant risk of secondary malignancies. NIH funded pediatric brain tumor cohort-based genomic dataset generation efforts have lagged behind other histologies and have yet to be included as part of large-scale sequencing efforts. However, consortia-based initiatives like those supported by the Children's Brain Tumor Network (CBTN) have demonstrated the early potential for clinically annotated genomic cohorts and their utility and interest by both the pediatric cancer and structural birth defect community with more than 130 data access requests for a non-embargoed cohort of tumor/normal whole genomes and paired tumor RNAseq. Indeed more than one quarter of this 800-subject initial sequencing cohort were identified to have birth-defect-associated clinical annotations in their clinical records, however, to our knowledge limited to no trio-based genomics cohort studies exist for any one pediatric brain tumor histology. The project's proposed sequencing cohort defines the largest, clinically annotated pediatric brain tumor cohort study to date and seeks to define the intersection of germline and somatic underpinnings of pediatric brain tumors across a shared developmental context of cancer and structural birth defects.



## Resource Content

```json
{
  "resourceType" : "ResearchStudy",
  "id" : "kf-research-study-cbtn",
  "meta" : {
    "profile" : ["https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-research-study"]
  },
  "extension" : [{
    "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-study-acknowledgement",
    "valueMarkdown" : "Please cite/reference the use of dbGaP data by including the dbGaP accession phs002517.v2.p2. Additionally, use the following statement to acknowledge the submitter(s) of this study:\n\n\nThe data from this study phs002517 was made available pre-publication without embargo to support rapid and collaborative research in pediatric cancer via the NCI's Cancer Research Data Commons (https://datacommons.cancer.gov). This availability is made possible with the support of NCI's Childhood Cancer Data Initiative (grant No. 3P30CA082103-21S9) and Gabriella Miller Kids First Pediatric Research Program (X01 CA267587). Initial data generation efforts and coordination costs were supported by a number of philanthropic and industry partners with further details at cbtn.org.\n\n\n\nSuggested Acknowledgement Statement for secondary users: The results analyzed and <published or shown> here are based in whole or in part analyzing the study phs002517 and were accessed from the NCI's Cancer Research Data Commons (https://datacommons.cancer.gov)."
  },
  {
    "extension" : [{
      "url" : "name",
      "valueString" : "Adam C. Resnick"
    },
    {
      "url" : "role",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://hl7.org/fhir/research-study-party-role",
          "code" : "primary-investigator"
        }]
      }
    },
    {
      "url" : "party",
      "valueReference" : {
        "reference" : "PractitionerRole/kf-research-study-personnel-role-pi-x01"
      }
    }],
    "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-study-associated-party"
  },
  {
    "extension" : [{
      "url" : "name",
      "valueString" : "Allison P. Heath"
    },
    {
      "url" : "role",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://hl7.org/fhir/research-study-party-role",
          "code" : "primary-investigator"
        }]
      }
    },
    {
      "url" : "party",
      "valueReference" : {
        "reference" : "PractitionerRole/kf-research-study-personnel-role-pi"
      }
    }],
    "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-study-associated-party"
  },
  {
    "extension" : [{
      "url" : "name",
      "valueString" : "Jennifer Mason"
    },
    {
      "url" : "role",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://hl7.org/fhir/research-study-party-role",
          "code" : "study-director"
        }]
      }
    },
    {
      "url" : "party",
      "valueReference" : {
        "reference" : "PractitionerRole/kf-research-study-personnel-role-op-lead"
      }
    }],
    "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/research-study-associated-party"
  }],
  "identifier" : [{
    "value" : "SD_BHJXBDQK"
  },
  {
    "system" : "https://www.ncbi.nlm.nih.gov/projects/gap/cgi-bin/study.cgi?study_id=",
    "value" : "phs002517.v2.p2"
  },
  {
    "value" : "CBTN"
  },
  {
    "value" : "PBTA-CBTN"
  }],
  "title" : "Children's Brain Tumor Network (CBTN)",
  "status" : "completed",
  "focus" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/MSH",
      "code" : "D001932",
      "display" : "Brain Neoplasms"
    },
    {
      "system" : "http://terminology.hl7.org/CodeSystem/MSH",
      "code" : "D010372",
      "display" : "Pediatrics"
    }]
  }],
  "relatedArtifact" : [{
    "type" : "documentation",
    "label" : "dbGaP Study Name",
    "display" : "Childhood Cancer Data Initiative (CCDI): Molecular Characterization across Pediatric Brain Tumors and Other Solid and Hematologic Malignancies for Research, Diagnostic, and Precision Medicine"
  },
  {
    "type" : "documentation",
    "label" : "Legacy Study Name",
    "display" : "Pediatric Brain Tumor Atlas: CBTTC"
  },
  {
    "type" : "documentation",
    "label" : "Website",
    "url" : "https://cbtn.org/"
  },
  {
    "type" : "documentation",
    "label" : "enrollmentCriteria",
    "display" : "Pediatric and AYA patients diagnosed with a central nervous system tumor, solid tumor, or hematologic malignancy."
  },
  {
    "type" : "citation",
    "label" : "Publication",
    "url" : "https://cbtn.org/publications"
  }],
  "description" : "Brain tumors are the most common form of cancer in children aged 0-19 in the United States, and are the largest cause of cancer-related deaths. The estimated number of new cases in 2019 is nearly 3,800 and thus brain tumors are a rare disease. Despite their relative rarity, the years of potential life lost due to brain tumors in 2009 was estimated at 47,631 years for children and adolescents aged 0-19 in the United States; this is a disproportionate amount of life lost compared to adult cancers and represents an unrecognized societal threat. There is an urgent need to improve therapies for these children. Most of the high-grade glial and embryonal brain cancers still remain largely incurable despite decades of clinical and laboratory research. Existing non-targeted chemotherapies and radiation, while at times effective, often represent pyrrhic victories, leaving behind life-long health burdens and causing a significant risk of secondary malignancies. NIH funded pediatric brain tumor cohort-based genomic dataset generation efforts have lagged behind other histologies and have yet to be included as part of large-scale sequencing efforts. However, consortia-based initiatives like those supported by the Children's Brain Tumor Network (CBTN) have demonstrated the early potential for clinically annotated genomic cohorts and their utility and interest by both the pediatric cancer and structural birth defect community with more than 130 data access requests for a non-embargoed cohort of tumor/normal whole genomes and paired tumor RNAseq. Indeed more than one quarter of this 800-subject initial sequencing cohort were identified to have birth-defect-associated clinical annotations in their clinical records, however, to our knowledge limited to no trio-based genomics cohort studies exist for any one pediatric brain tumor histology. The project's proposed sequencing cohort defines the largest, clinically annotated pediatric brain tumor cohort study to date and seeks to define the intersection of germline and somatic underpinnings of pediatric brain tumors across a shared developmental context of cancer and structural birth defects."
}

```

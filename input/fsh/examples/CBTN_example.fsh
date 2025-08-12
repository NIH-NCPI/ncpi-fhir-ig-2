// NCPI Research Study
Instance: kf-research-study-organization-chop
InstanceOf: Organization
Title: "Children's Hospital of Philadelphia"
Usage: #example
Description: "Represents the Organization for which CHOP PIs are affiliated"
* identifier[0].value = "CHOP"
* name = "Children's Hospital of Philadelphia"
* alias[0] = "CHOP"

Instance: kf-research-study-personnel-role-pi-x01
InstanceOf: PractitionerRole
Title: "dbGaP PI, X01 FY 2021"
Usage: #example
Description: "dbGaP PI, X01 FY 2021"
* organization = Reference(kf-research-study-organization-chop)
* code = http://terminology.hl7.org/CodeSystem/practitioner-role#researcher

Instance: kf-research-study-personnel-role-pi
InstanceOf: PractitionerRole
Title: "dbGaP PI"
Usage: #example
Description: "dbGaP PI"
* organization = Reference(kf-research-study-organization-chop)
* code = http://terminology.hl7.org/CodeSystem/practitioner-role#researcher

Instance: kf-research-study-personnel-role-op-lead
InstanceOf: PractitionerRole
Title: "CBTN Operations Lead"
Usage: #example
Description: "CBTN Operations Lead"
* organization = Reference(kf-research-study-organization-chop)
* code = http://terminology.hl7.org/CodeSystem/practitioner-role#ict

Instance: kf-research-study-cbtn
InstanceOf: NcpiResearchStudy
Title: "Children's Brain Tumor Network (CBTN)"
Usage: #example
Description: "Brain tumors are the most common form of cancer in children aged 0-19 in the United States, and are the largest cause of cancer-related deaths. The estimated number of new cases in 2019 is nearly 3,800 and thus brain tumors are a rare disease. Despite their relative rarity, the years of potential life lost due to brain tumors in 2009 was estimated at 47,631 years for children and adolescents aged 0-19 in the United States; this is a disproportionate amount of life lost compared to adult cancers and represents an unrecognized societal threat. There is an urgent need to improve therapies for these children. Most of the high-grade glial and embryonal brain cancers still remain largely incurable despite decades of clinical and laboratory research. Existing non-targeted chemotherapies and radiation, while at times effective, often represent pyrrhic victories, leaving behind life-long health burdens and causing a significant risk of secondary malignancies. NIH funded pediatric brain tumor cohort-based genomic dataset generation efforts have lagged behind other histologies and have yet to be included as part of large-scale sequencing efforts. However, consortia-based initiatives like those supported by the Children's Brain Tumor Network (CBTN) have demonstrated the early potential for clinically annotated genomic cohorts and their utility and interest by both the pediatric cancer and structural birth defect community with more than 130 data access requests for a non-embargoed cohort of tumor/normal whole genomes and paired tumor RNAseq. Indeed more than one quarter of this 800-subject initial sequencing cohort were identified to have birth-defect-associated clinical annotations in their clinical records, however, to our knowledge limited to no trio-based genomics cohort studies exist for any one pediatric brain tumor histology. The project's proposed sequencing cohort defines the largest, clinically annotated pediatric brain tumor cohort study to date and seeks to define the intersection of germline and somatic underpinnings of pediatric brain tumors across a shared developmental context of cancer and structural birth defects."
* identifier[+]
  * value = "SD_BHJXBDQK"
* identifier[+]
  * system = "https://www.ncbi.nlm.nih.gov/projects/gap/cgi-bin/study.cgi?study_id="
  * value = "phs002517.v2.p2"
* identifier[+]
  * value = "CBTN"
* identifier[+]
  * value = "PBTA-CBTN"
* title = "Children's Brain Tumor Network (CBTN)"
* description = "Brain tumors are the most common form of cancer in children aged 0-19 in the United States, and are the largest cause of cancer-related deaths. The estimated number of new cases in 2019 is nearly 3,800 and thus brain tumors are a rare disease. Despite their relative rarity, the years of potential life lost due to brain tumors in 2009 was estimated at 47,631 years for children and adolescents aged 0-19 in the United States; this is a disproportionate amount of life lost compared to adult cancers and represents an unrecognized societal threat. There is an urgent need to improve therapies for these children. Most of the high-grade glial and embryonal brain cancers still remain largely incurable despite decades of clinical and laboratory research. Existing non-targeted chemotherapies and radiation, while at times effective, often represent pyrrhic victories, leaving behind life-long health burdens and causing a significant risk of secondary malignancies. NIH funded pediatric brain tumor cohort-based genomic dataset generation efforts have lagged behind other histologies and have yet to be included as part of large-scale sequencing efforts. However, consortia-based initiatives like those supported by the Children's Brain Tumor Network (CBTN) have demonstrated the early potential for clinically annotated genomic cohorts and their utility and interest by both the pediatric cancer and structural birth defect community with more than 130 data access requests for a non-embargoed cohort of tumor/normal whole genomes and paired tumor RNAseq. Indeed more than one quarter of this 800-subject initial sequencing cohort were identified to have birth-defect-associated clinical annotations in their clinical records, however, to our knowledge limited to no trio-based genomics cohort studies exist for any one pediatric brain tumor histology. The project's proposed sequencing cohort defines the largest, clinically annotated pediatric brain tumor cohort study to date and seeks to define the intersection of germline and somatic underpinnings of pediatric brain tumors across a shared developmental context of cancer and structural birth defects."
* focus.coding[+] = $mesh#D001932 "Brain Neoplasms"
* focus.coding[+] = $mesh#D010372 "Pediatrics"
* relatedArtifact[+]
  * type = #documentation
  * label = "dbGaP Study Name"
  * display = "Childhood Cancer Data Initiative (CCDI): Molecular Characterization across Pediatric Brain Tumors and Other Solid and Hematologic Malignancies for Research, Diagnostic, and Precision Medicine"
* relatedArtifact[+]
  * type = #documentation
  * label = "Legacy Study Name"
  * display = "Pediatric Brain Tumor Atlas: CBTTC"
* relatedArtifact[+]
  * type = #documentation
  * label = "Website"
  * url = "https://cbtn.org/"
* relatedArtifact[+]
  * .type = #documentation
  * label = "enrollmentCriteria"
  * display = "Pediatric and AYA patients diagnosed with a central nervous system tumor, solid tumor, or hematologic malignancy."
* relatedArtifact[+]
  * type = #citation 
  * label = "Publication"
  * url = "https://cbtn.org/publications"
* status = #completed
* extension[acknowledgement].valueMarkdown = """Please cite/reference the use of dbGaP data by including the dbGaP accession phs002517.v2.p2. Additionally, use the following statement to acknowledge the submitter(s) of this study:\n\n\nThe data from this study phs002517 was made available pre-publication without embargo to support rapid and collaborative research in pediatric cancer via the NCI's Cancer Research Data Commons (https://datacommons.cancer.gov). This availability is made possible with the support of NCI's Childhood Cancer Data Initiative (grant No. 3P30CA082103-21S9) and Gabriella Miller Kids First Pediatric Research Program (X01 CA267587). Initial data generation efforts and coordination costs were supported by a number of philanthropic and industry partners with further details at cbtn.org.\n\n\n\nSuggested Acknowledgement Statement for secondary users: The results analyzed and <published or shown> here are based in whole or in part analyzing the study phs002517 and were accessed from the NCI's Cancer Research Data Commons (https://datacommons.cancer.gov)."""
* extension[research-study-associated-party][+]
  * extension[name].valueString = "Adam C. Resnick"
  * extension[role].valueCodeableConcept = $research-study-party-role#primary-investigator
  * extension[party].valueReference = Reference(kf-research-study-personnel-role-pi-x01)
* extension[research-study-associated-party][+]
  * extension[name].valueString = "Allison P. Heath"
  * extension[role].valueCodeableConcept = http://hl7.org/fhir/research-study-party-role#primary-investigator
  * extension[party].valueReference = Reference(kf-research-study-personnel-role-pi)
* extension[research-study-associated-party][+]
  * extension[name].valueString = "Jennifer Mason"
  * extension[role].valueCodeableConcept = http://hl7.org/fhir/research-study-party-role#study-director
  * extension[party].valueReference = Reference(kf-research-study-personnel-role-op-lead)



Instance: kf-research-study-cbtn-participants
InstanceOf: ResearchStudyGroup
Title: "Participants from the CBTN research study"
Usage: #example
Description: "Participants from the CBTN research study"
* identifier[0]
  * system = "https://cbtn.org/"
  * value = "CBTN-Participants"
* name = "Participants from the CBTN research study"
* quantity = 6667
* actual = true
* type = #person

Instance: kf-gru-dac-consent
InstanceOf: NcpiResearchAccessPolicy
Title: "CBTN General Research Use (GRU) Consent DAC"
Usage: #example
Description: "General Research Use (GRU)"
* status = #draft
* scope = http://terminology.hl7.org/CodeSystem/consentscope#research
* category.coding = http://terminology.hl7.org/CodeSystem/consentcategorycodes#research
* policyRule = http://terminology.hl7.org/CodeSystem/consentpolicycodes#cric
* provision.type = http://hl7.org/fhir/consent-provision-type#permit
* provision.purpose[+] = $ncpi-data-access-code#GRU "General Research Use"
* extension[description].valueMarkdown = "Use of the data is limited only by the terms of the model Data Use Certification."
* extension[website].valueUrl = "https://redcap.chop.edu/surveys/?s=A7M873HMN8"
* extension[accessType].valueCodeableConcept = $ncpi-data-access-type#controlled

/*
Instance: kf-research-study-subject-gru-dac
InstanceOf: ResearchStudySubject
Title: "CBTN GRU data access via DAC"
Usage: #example
Description: "GRU data access via DAC"
* identifier[0]
  * system = "https://cbtn.org/"
  * value = "GRU-DAC"
* title = "GRU-DAC Study Subject"
* description = "General Research Use data access via DAC"
* status = #completed
* partOf = Reference(kf-research-study-cbtn)
* extension[consent].valueReference = Reference(kf-gru-dac-consent)
* enrollment = Reference(kf-research-study-cbtn-participants)
*/

Instance: kf-gru-dbgap-consent
InstanceOf: NcpiResearchAccessPolicy
Title: "CBTN General Research Use (GRU) Consent dbGaP"
Usage: #example
Description: "General Research Use (GRU)"
* status = #draft
* scope = http://terminology.hl7.org/CodeSystem/consentscope#research
* category.coding = http://terminology.hl7.org/CodeSystem/consentcategorycodes#research
* policyRule = http://terminology.hl7.org/CodeSystem/consentpolicycodes#cric
* provision.type = http://hl7.org/fhir/consent-provision-type#permit
* provision.purpose[+] = $ncpi-data-access-code#GRU "General Research Use"
* extension[description].valueMarkdown = "Use of the data is limited only by the terms of the model Data Use Certification."
* extension[website].valueUrl = "https://www.ncbi.nlm.nih.gov/projects/gap/cgi-bin/study.cgi?study_id=phs002517"
* extension[accessType].valueCodeableConcept = $ncpi-data-access-type#controlled

/*
Instance: kf-research-study-subject-gru-dbgap
InstanceOf: ResearchStudySubject
Title: "CBTN GRU data access via dbGaP"
Usage: #example
Description: "GRU data access via dbGaP"
* identifier[0]
  * system = "https://cbtn.org/"
  * value = "GRU-dbGaP"
* title = "GRU-dbGaP Study Subject"
* description = "General Research Use data access via dbGaP"
* status = #completed
* partOf = Reference(kf-research-study-cbtn)
* extension[consent].valueReference = Reference(kf-gru-dbgap-consent)
* enrollment = Reference(kf-research-study-cbtn-participants)
*/

Instance: kf-gsr-allowed-access
InstanceOf: NcpiResearchAccessPolicy
Title: "Genomic Summary Results (GSR) Allowed Access"
Usage: #example
Description: "Genomic Summary Results (GSR) Allowed Access"
* status = #draft
* scope = http://terminology.hl7.org/CodeSystem/consentscope#research
* category.coding = http://terminology.hl7.org/CodeSystem/consentcategorycodes#research
* policyRule = http://terminology.hl7.org/CodeSystem/consentpolicycodes#cric
* extension[description].valueMarkdown = "Public Posting of Genomic Summary Results - Allowed."
* extension[website].valueUrl = "https://www.genome.gov/about-nhgri/Policies-Guidance/Data-Sharing-Policies-and-Expectations/GSR-update-FAQs"
* extension[accessType].valueCodeableConcept = $ncpi-data-access-type#gsr-allowed

/*
Instance: kf-research-study-subject-gsr-allowed
InstanceOf: ResearchStudySubject
Title: "CBTN Genomic Summary Results (GSR) Allowed Access"
Usage: #example
Description: "Genomic Summary Results (GSR) Allowed Access"
* identifier[0]
  * system = "https://cbtn.org/"
  * value = "GSR-ALLOWED"
* title = "GSR-ALLOWED Study Subject"
* description = "Genomic Summary Results (GSR) Allowed Access"
* status = #completed
* partOf = Reference(kf-research-study-cbtn)
* extension[consent].valueReference = Reference(kf-gsr-allowed-access)
* enrollment = Reference(kf-research-study-cbtn-participants)
*/
Instance: kf-registered-allowed-access
InstanceOf: NcpiResearchAccessPolicy
Title: "Registered Tier Access"
Usage: #example
Description: "Registered Tier Access"
* status = #draft
* scope = http://terminology.hl7.org/CodeSystem/consentscope#research
* category.coding = http://terminology.hl7.org/CodeSystem/consentcategorycodes#research
* policyRule = http://terminology.hl7.org/CodeSystem/consentpolicycodes#cric
* extension[description].valueMarkdown = "Spans clinical data, expression data, somatic mutations, etc"
* extension[website].valueUrl = "https://kidsfirstdrc.org/portal/portal-features/#dataAccess"
* extension[accessType].valueCodeableConcept = $ncpi-data-access-type#registered

/*
Instance: kf-research-study-subject-registered
InstanceOf: ResearchStudySubject
Title: "CBTN Registered Tier Access"
Usage: #example
Description: "CBTN Registered Tier Access"
* identifier[0]
  * system = "https://cbtn.org/"
  * value = "GSR-ALLOWED"
* title = "GSR-ALLOWED Study Subject"
* description = "CBTN Registered Tier Access"
* status = #completed
* partOf = Reference(kf-research-study-cbtn)
* extension[consent].valueReference = Reference(kf-gsr-allowed-access)
* enrollment = Reference(kf-research-study-cbtn-participants)
*/

Instance: ncpi-research-collection-pbta
InstanceOf: NcpiResearchCollection
Usage: #example
Description: "Pediatric Brain Tumor Atlas"
* title = "Pediatric Brain Tumor Atlas"
* code = $ncpi-collection-type#consortium "Consortium"
* note[0].text = "The Pediatric Brain Tumor Atlas (PBTA) is a collaborative effort to accelerate discoveries for therapeutic intervention for children diagnosed with a brain tumor. The first PBTA dataset release occurred in September of 2018 and includes data from tumor types including matched tumor/normal, whole genome data (WGS), RNAseq, proteomics, longitudinal clinical data, imaging data including MRIs and radiology reports, histology slide images and pathology reports. Funding for this initiative was provided by more than 50 foundation sponsors"
* status = http://hl7.org/fhir/list-status#current 
* mode = http://hl7.org/fhir/list-mode#snapshot
* extension[website].valueUrl = "https://cbtn.org/pediatric-brain-tumor-atlas"
* extension[label][0].extension[type].valueCodeableConcept = $title-type#acronym
* extension[label][0].extension[label].valueString = "PBTA"
* entry[+].item = Reference(kf-research-study-cbtn)

Instance: ncpi-research-collection-kfx01
InstanceOf: NcpiResearchCollection
Usage: #example
Description: "Kids First X01s"
* title = "Kids First X01s"
* code = $ncpi-collection-type#program "Program"
* note[0].text = "Through its Data Resource Center and NIH X01 grant mechanism, Kids First supports data generation and data sharing in the cloud. To date, the program has supported the public release of data from 30 projects and made available nearly 30,000 genomes, representing structural birth defects and childhood cancer patients and families through the Kids First Data Resource Portal"
* status = http://hl7.org/fhir/list-status#current 
* mode = http://hl7.org/fhir/list-mode#snapshot
* extension[website].valueUrl = "https://cbtn.org/pediatric-brain-tumor-atlas"
* entry[+].item = Reference(kf-research-study-cbtn)

// NCPI Participant
Instance: PT-006SP660
InstanceOf: NcpiParticipant
Title: "Example patients based on data from CBTN"
Usage: #example
Description: "Example patients based on data from CBTN."
// Notice that we can use the DbGaP study ID for easier searching
* identifier[0]
  * system = "https://cbtn.org/"
  * value = "C21156"
* identifier[1]
  * system = "https://data.kidsfirstdrc.org"
  * value = "PT-006SP660"
* extension[usCoreBirthSex].valueCode = #F "Female"
* extension[usCoreRace]
  * extension[ombCategory].valueCoding =  $omb-race-eth#2106-3 "White"
  * extension[text].valueString = "White"
* extension[usCoreEthnicity]
  * extension[ombCategory].valueCoding =  $omb-race-eth#2186-5 "Not Hispanic or Latino"
  * extension[text].valueString = "Not Hispanic or Latino"
* extension[dobMethod].valueCoding = $ncpi-dob-method#year-only
* extension[ageAtLastVitalStatus].valueQuantity
  * value = 6314
  * unit = "days"
  * system = $ucum
  * code = #d "days"



Instance: PT-006SP675
InstanceOf: NcpiParticipant
Title: "Example patients based on data from PCGC"
Usage: #example
Description: "Example patients based on data from PCGC."
* identifier[0]
  * system = "http://chdgenes.org/"
  * value = "20757"
* identifier[1]
  * system = "http://chdgenes.org/"
  * value = "PT_005B7CZ4"
* birthDate.extension[+]
  * url = $cqf-relativeDateTime
  * extension[+]
    * url = "target"
    * valueReference = Reference(PT-006SP675)
  * extension[+]
    * url = "targetPath"
    * valueString =  "birthDate"
  * extension[+]
    * url = "relationship"
    * valueCode = #after
  * extension[+]
    * url = "offset"
    * valueDuration = 2006 'days'
    * valueDuration.unit = "d"
* extension[usCoreBirthSex].valueCode = #F "Female"
* extension[usCoreRace]
  * extension[ombCategory].valueCoding =  $omb-race-eth#2106-3 "White"
  * extension[text].valueString = "White"
* extension[usCoreEthnicity]
  * extension[ombCategory].valueCoding =  $omb-race-eth#2135-2 "Hispanic or Latino"
  * extension[text].valueString = "Hispanic or Latino"

Instance: pcgc-example-person
InstanceOf: NcpiPerson
Title: "Example patients based on data from PCGC"
Usage: #example
Description: "Example patients based on data from PCGC"
* identifier
  * system = "http://chdgenes.org/"
  * value = "PS_123"
* link
  * target = Reference(PT-006SP675) 
// NCPI Family -- TBD

Instance: FM-00C8Y7DG
InstanceOf: NcpiStudyFamily
Title: "Example patients based on data from CBTN"
Usage: #example
Description: "Example patients based on data from CBTN."
* id = "cbtn-study-family"
* identifier[0]
  * system = "https://cbtn.org/"
  * value = "FM-00C8Y7DG"
* type = #person // Required by Group with required VS
* actual = true // Required by Group

* extension[familyType].valueCodeableConcept = $ncpi-family-types#Trio "Trio"
// * extension[description].valueMarkdown = "Potential inheritance details"
// * extension[consanguinity].valueCodeableConcept = $snomedct_us#261665006  "Unknown"
* extension[studyFamilyFocus].valueCodeableConcept = $mondo#0004992 "Cancer"
* member[0].entity = Reference(PT-006SP660)
* member[0].entity.extension[familyRole].valueCodeableConcept = $family-role-code#MTH "mother"
* member[1].entity = Reference(PT-006SP675)
* member[1].entity.extension[familyRole].valueCodeableConcept = $family-role-code#SON "natural son"

Instance: cbtn-family-relationship-mother
InstanceOf: NcpiFamilyRelationship
Title: "An example family relationship based on data from CBTN"
Usage: #example
Description: "An example family relationship based on data from CBTN."
* subject = Reference(PT-006SP660)
* focus = Reference(PT-006SP675)
* code = $family-role-code#MTH "mother"
* status = #registered



Instance: cbtn-family-relationship-son
InstanceOf: NcpiFamilyRelationship
Title: "An example family relationship based on data from CBTN"
Usage: #example
Description: "An example family relationship based on data from CBTN."
* subject = Reference(PT-006SP675)
* focus = Reference(PT-006SP660)
* code = $family-role-code#SON "natural son"
* status = #registered


// NCPI Condition Assertion
Instance: PT-006SP660-condition
InstanceOf: NcpiParticipantAssertion
Title: "Example condition assertion using data from CBTN"
Usage: #example
Description: "Example condition assertion using data from CBTN."
* status = #final
// had to change reference participant so sushi doesn't get errors
* subject = Reference(PT-006SP660)
/* condition code */
* code.coding = $mondo#MONDO:0002203
/* condition text */
* code.text = "ventricular ectopy"
/* age at assertion */
* effectiveDateTime.extension[+]
  * url = $cqf-relativeDateTime
  * extension[+]
    * url = "target"
// had to change reference participant so sushi doesn't get errors
    * valueReference = Reference(PT-006SP660)
  * extension[+]
    * url = "targetPath"
    * valueString = "None"
  * extension[+]
    * url = "relationship"
    * valueCode = #after
  * extension[+]
    * url = "offset"
    * valueDuration = 4931 'days'
    * valueDuration.unit = "d"
/* assertion */
* valueCodeableConcept = $phenotypic-feature-assertion#Present
/* condition type */
* category = $condition-type#Disease

// NCPI Biospecimen
Instance: SA-000 /*Collection Event ID can't have underscores*/
InstanceOf: NCPISample
Title: "Example biospecimen based on data from CBTN"
Usage: #example
Description: "Example biospecimen based on data from CBTN"
* identifier.value = "SA_RV52EY7S" /*Sample ID*/
* subject = Reference(PT-006SP660) /*Participant ID*/
* type.text = "Peripheral Whole Blood" /*Sample Type*/
/*There is a SNOMED term for peripheral blood specimen OR 
https://github.com/include-dcc/include-model-forge/blob/main/input/fsh/codesystems/CodeSystem-SampleTypes.fsh 
to access this codesystem for now but we defintely need a real ontology for describing things like blood draws etc.*/
* collection.method.text = "Blood Draw" /*Biospecimen Method*/
* collection.method.coding = $loinc#LP125037-4 /*Biospecimen Method*/
* container.identifier.value = "BS_9QM8EXG3" /*Aliquot.AliquotID*/
* collection.collectedDateTime.extension[+]
  * url = $cqf-relativeDateTime
  * extension[+]
    * url = "target"
    * valueReference = Reference(PT-006SP660)
  * extension[+]
    * url = "targetPath"
    * valueString = "None"
  * extension[+]
    * url = "relationship"
    * valueCode = #after
  * extension[+]
    * url = "offset"
    * valueDuration = 4931 'days'
    * valueDuration.unit = "d"
 
// NCPI File
Instance: GF-6BAD9S7D
InstanceOf: NcpiFile
Title: "Example file based on CBTN"
Usage: #example
Description: "Use case of file information from CBTN"
* identifier.value = "GF-6BAD9S7D"
* subject = Reference(PT-006SP660)
* description = "Annotated Variant Call"
* type = $edam#operation_3227 "Variant calling"
* extension[contentVersion].valueString = "V1"
* status = #current
* content[+]
  * attachment.url = "s3://kf-strides-study-us-east-1-prd-sd-54g4wg4r/harmonized-data/family-variants/155bb529-2e7b-474f-ba24-cd0656d5f3d0.CGP.filtered.deNovo.vep.vcf.gz"
  * extension[locationAccess].valueReference = Reference(kf-gru-dac-consent)
* extension[fileFormat].valueCodeableConcept.coding = $edam#format_3016 "VCF"
* extension[fileSize]
  * valueQuantity
    * value = 1044770380
    * unit = "bytes"
* extension[hash]
  * extension[hashValue].valueString = "8f107912d862cf91fbfb77bf9c1bab36-4"
  * extension[hashType].valueCode = #etag

// NCPI File Metadata
Instance: FASTQ-example
InstanceOf: NcpiFASTQ
Title: "Example file metadata from CBTN"
Usage: #example
Description: "Example file metadata from CBTN"
* focus = Reference(GF-6BAD9S7D)
* status = #final
* code = $edam#format_1930
* specimen = Reference(SA-000) // using specimen is a placeholder for using a slice of component for related samples
* component[assay_strategy].valueCodeableConcept = $obi#0002117 "whole genome sequencing assay" 
* component[platform_instrument].valueCodeableConcept = $obi#0002001 "Illumina HiSeq 2000"
* component[library_prep].valueCodeableConcept = #polyA
* component[library_selection].valueCodeableConcept = #PolyTEnrichment
* component[strandedness].valueCodeableConcept = #unstranded
* component[is_paired_end].valueBoolean = false
* component[adaptor_trimmed].valueBoolean = true
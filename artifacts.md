# Artifacts Summary - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Structures: Logical Models 

These define data models that represent the domain covered by this implementation guide in more business-friendly terms than the underlying FHIR resources.

| | |
| :--- | :--- |
| [Shared Data Model for Aliquot](StructureDefinition-SharedDataModelAliquot.md) | Shared Data Model for Aliquot |
| [Shared Data Model for Biospecimen Collection](StructureDefinition-SharedDataModelBiospecimenCollection.md) | Shared Data Model for Biospecimen Collection |
| [Shared Data Model for Condition Assertions](StructureDefinition-SharedDataModelCondition.md) | The Shared Data Model for**Condition Assertions** |
| [Shared Data Model for Family Relationship](StructureDefinition-SharedDataModelFamilyRelationship.md) | The**Shared Data Model for Family Relationship** |
| [Shared Data Model for Family Role](StructureDefinition-SharedDataModelFamilyRole.md) | The**Shared Data Model for Family Role** |
| [Shared Data Model for File](StructureDefinition-SharedDataModelFile.md) | The**Shared Data Model for File** |
| [Shared Data Model for Participant Assertion](StructureDefinition-SharedDataModelParticipantAssertion.md) | The Shared Data Model for**Participant Assertion** |
| [Shared Data Model for Research Collection](StructureDefinition-SharedDataModelResearchCollection.md) | The**Shared Data Model for Research Collection**represent various collections of research data including, but not limited, to Consortia, Programs, adhoc collections of Studies and datasets among other types of collections. |
| [Shared Data Model for Research Data Access Policy](StructureDefinition-SharedDataModelResearchDataAccessPolicy.md) | The**Shared Data Model for Research Data Access Policy**represent the various Data Use Agreements that govern a researcher's access and use of research data. |
| [Shared Data Model for Research Participant and Study Mapping](StructureDefinition-SharedDataModelStudyParticipant.md) | The**Shared data model for StudyParticipant** |
| [Shared Data Model for Research Participants](StructureDefinition-SharedDataModelResearchParticipant.md) | The**Shared Data Model for Research Participants** |
| [Shared Data Model for Research Persons](StructureDefinition-SharedDataModelPerson.md) | The**Shared data model for Person** |
| [Shared Data Model for Research Study](StructureDefinition-SharedDataModelResearchStudy.md) | The**Shared Data Model for Research Study**represents the understanding of what a Research Study is from the context of users and authors of the NCPI FHIR IG. |
| [Shared Data Model for Sample](StructureDefinition-SharedDataModelSample.md) | Shared Data Model for Sample |
| [Shared Data Model for Study Family](StructureDefinition-SharedDataModelStudyFamily.md) | The**Shared Data Model for Study Family** |
| [Shared data model for File Metadata](StructureDefinition-SharedDataModelFileMetadata.md) | The**Shared Data Model for File Metadata** |

### Structures: Resource Profiles 

These define constraints on FHIR resources for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [BAM or CRAM file profile](StructureDefinition-ncpi-bamcram.md) | BAM or CRAM file profile |
| [Family Relationship](StructureDefinition-ncpi-family-relationship.md) | A relationship between individuals in a pedigree or family. |
| [Gene fusion or gene expression file profile](StructureDefinition-ncpi-gene-fusion-expression.md) | Gene fusion or gene expression file profile |
| [Linkage for related samples](StructureDefinition-ncpi-specimen-NcpiSpecimenCollection.md) | Linkage for related samples |
| [MAF (Somatic Mutation) file profile](StructureDefinition-ncpi-maf.md) | MAF (Somatic Mutation) file profile |
| [NCPI Conditon Summary](StructureDefinition-ncpi-condition-summary.md) | Information about a condition related to a research participant |
| [NCPI DRS File](StructureDefinition-ncpi-drs-file.md) | Information about a DRS file related to a research participant |
| [NCPI FASTQ File](StructureDefinition-ncpi-fastq.md) | NCPI FASTQ File |
| [NCPI File](StructureDefinition-ncpi-file.md) | Information about a file related to a research participant |
| [NCPI File Meta Data](StructureDefinition-ncpi-file-metadata.md) | Representation of file metadata for NCPI |
| [NCPI Participant](StructureDefinition-ncpi-participant.md) | Research oriented patient |
| [NCPI Participant Assertion](StructureDefinition-ncpi-participant-assertion.md) | Assertion about a particular Participant. May include Conditions, Measurements, etc. |
| [NCPI Person](StructureDefinition-ncpi-person.md) | Person |
| [NCPI Phenotypic Feature Assertion](StructureDefinition-ncpi-phenotypic-feature-assertion.md) | Assertion about a phenotypic feature's presence or absence given a particular participant. |
| [NCPI Research Access Policy](StructureDefinition-ncpi-research-access-policy.md) | Limitations and/or requirements that define how a user may gain access to a particular set of data. |
| [NCPI Research Collection](StructureDefinition-ncpi-research-collection.md) | Collections of research data including, but not limited, to Consortia, Programs, adhoc collections of Studies and datasets among other types of collections. |
| [NCPI Research Study](StructureDefinition-ncpi-research-study.md) | The NCPI Research Study FHIR resource represents an individual research effort and acts as a grouper or “container” for that effort’s study participants and their related data files. |
| [NCPI Research Study Group](StructureDefinition-research-study-group.md) | Grouping subject participation within a research study is helpful to provide definitive lists of participants that fit a specific criteria such as**All Participants**or**Participants From a Particular Consent Group**, etc. |
| [NCPI Sample](StructureDefinition-ncpi-sample.md) | FHIR Profile for NCPI Sample |
| [NCPI Study Family](StructureDefinition-ncpi-study-family.md) | Study Family |
| [NCPI Study Participant](StructureDefinition-ncpi-Study-Participant.md) | Research Study |
| [Proteomics file profile](StructureDefinition-ncpi-proteomics.md) | Proteomics file profile |
| [VCF or gVCF file profile](StructureDefinition-ncpi-vcf.md) | VCF or gVCF file profile |

### Structures: Data Type Profiles 

These define constraints on FHIR data types for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [DRS Attachment](StructureDefinition-ncpi-drs-attachment.md) | A FHIR Attachment with a DRS url. |

### Structures: Extension Definitions 

These define constraints on FHIR data types for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Access Policy Description](StructureDefinition-access-policy-description.md) | Descriptive text summarizing the policy restrictions and other details associated with this access provision. |
| [Access Type](StructureDefinition-access-type.md) | 
| | | |
| :--- | :--- | :--- |
| Access type code associated with downloads affected by this Access Policy ( open | registered | controlled ) |
 |
| [Access policy](StructureDefinition-access-policy.md) | Access Policy Extension |
| [Age at Assertion](StructureDefinition-age-at-assertion.md) | Age at Assertion Extension |
| [Age at Event](StructureDefinition-age-at-event.md) | Age at Event Extension |
| [Age at Last Vital Status Extension](StructureDefinition-research-age-at-last-vital-status.md) | Age at Last Vital Status Extension |
| [Algorithm used to calculate the hash (and size, where applicable)](StructureDefinition-hash-type.md) | Algorithm used to calculate the hash (and size, where applicable) |
| [Any additional modifiers for this condition, such as severity.](StructureDefinition-other-condition-modifiers.md) | Any additional modifiers for this condition, such as severity. |
| [Availability Status of Aliquot](StructureDefinition-aliquot-availability.md) | Availability Status of Aliquot |
| [Concentration of the Aliquot](StructureDefinition-aliquot-concentration.md) | Concentration of the Aliquot |
| [Consanguinity Extension](StructureDefinition-consanguinity.md) | Extension containing a consanguinity assertion |
| [Description](StructureDefinition-description.md) | Free text describing containing resource. |
| [Family Role](StructureDefinition-family-role.md) | Extension containing Family Role |
| [Family Type Extension](StructureDefinition-family-type.md) | Extension containing Family Type |
| [If present, only those under the specific Access Policy can access the file in this location.](StructureDefinition-location-access.md) | If present, only those under the specific Access Policy can access the file in this location. |
| [Label](StructureDefinition-label-extension.md) | A text label accompanied by a code indicating the label type (such as Acronym, subtitle, etc) |
| [Laterality Information](StructureDefinition-biospecimen-laterality.md) | Laterality Information |
| [Linkage for related samples](StructureDefinition-specimen-collection.md) | Linkage for related samples |
| [Part of Study](StructureDefinition-part-of-study.md) | Link study related sources back to the relevant study. |
| [Patient Knowledge Source](StructureDefinition-patient-knowledge-source.md) | An extension to record the source of the knowledge in a particular`Patient`resource.The primary use case is to identify those`Patient`resources created via inference in order to support indirect pedigree relationships. |
| [Person who recorded assertion about participant](StructureDefinition-entity-asserter.md) | Person who recorded assertion about participant |
| [Provides a list of hashes for confirming file transfers](StructureDefinition-hash-extension.md) | Provides a list of hashes for confirming file transfers |
| [Research Date of Birth Method](StructureDefinition-research-date-of-birth-method.md) | Code indicating method of the DOB construction |
| [Research Population](StructureDefinition-research-population.md) | Code describing the population (CDC) |
| [Research Study Acknowledgement](StructureDefinition-research-study-acknowledgement.md) | Provides an informative description of acknowledgement expectations for those using data from the research study. |
| [Research Study Associated Party](StructureDefinition-research-study-associated-party.md) | Sponsors, collaborators, and other parties affiliated with a research study. |
| [Research Study Design](StructureDefinition-research-study-design.md) | Codes categorizing the type of study such as investigational vs. observational, type of blinding, type of randomization, safety vs. efficacy, etc. |
| [Research Usage Limitation Disease Code](StructureDefinition-research-disease-use-limitation.md) | Coding associated with limitation on what research can be performed this data. |
| [Research Web Link](StructureDefinition-research-web-link.md) | A URL pointing to a either a research study's website, an online document or other research related site or document. |
| [Spatial Information](StructureDefinition-biospecimen-spatial.md) | Spatial Information |
| [Study Family Focus Extension](StructureDefinition-study-family-focus.md) | Extension containing a study family focus assertion |
| [The file format used](StructureDefinition-file-format.md) | The file format used |
| [The size of the file, e.g., in bytes.](StructureDefinition-file-size.md) | The size of the file, e.g., in bytes. |
| [Value of hashing the file](StructureDefinition-hash-value.md) | Value of hashing the file |
| [Version of the contents of the file](StructureDefinition-content-version.md) | Version of the contents of the file |

### Terminology: Value Sets 

These define sets of codes used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Assay strategy options](ValueSet-assay-strategy-vs.md) | Assay strategy options |
| [Assertion of Phenotypic Feature Codes](ValueSet-phenotypic-feature-assertion-vs.md) | Assertion of Phenotypic Feature Codes |
| [Biological Relationship Codes](ValueSet-family-biological-relationship-vs.md) | List of codes indicating the biological relationship between two individuals in a family. It is restrictive to encourage a standardized representation.# Code Selection Rationale## Parent CodesWe use the NCI Thesaurus here for the mother and father because its definitions are more precise.* [`C96572`(**"Biological Father"**)](https://evsexplore.semantics.cancer.gov/evsexplore/concept/ncit/C96572): A male who contributes to the genetic makeup of his offspring through the fertilization of an ovum by his sperm.
* [`C96580`(**"Biological Mother"**)](https://evsexplore.semantics.cancer.gov/evsexplore/concept/ncit/C96580): A female who contributes to the genetic makeup of her offspring from the fertilization of her ovum.
In contrast, the parental family-role's codes are less refined:* [`NMTH`(**"natural mother"**)](https://terminology.hl7.org/6.5.0/CodeSystem-v3-RoleCode.html#v3-RoleCode-NMTH): The player of the role is a female who conceives or gives birth to the scoping entity (child).
* [`NFTH`(**"natural father"**)](https://terminology.hl7.org/6.5.0/CodeSystem-v3-RoleCode.html#v3-RoleCode-NFTH): The player of the role is a male who begets the scoping entity (child).
In particular,**"Biological Mother"**excludes surrogates but`NMTH`is ambiguous.**"Biological Father"**specifies fertilization of an ovum by sperm, whereas`NFTH`uses the ambiguous term "begets," which could include other mechanisms.## Twin CodesFor twins, we use the RoleCode`ITWIN`code rather than the NCI`C73429`.* [`C73429`(**"Identical Twin"**)](https://evsexplore.semantics.cancer.gov/evsexplore/concept/ncit/C73429): Either of the two offspring resulting from a shared ovum.
* [`ITWIN`(**"Identical Twin"**)](https://terminology.hl7.org/6.5.0/CodeSystem-v3-RoleCode.html#v3-RoleCode-ITWIN): The scoper and player are offspring of the same egg-sperm pair.
Though being "offspring" of the same fertilized egg is questionable wording, we use`ITWIN`because it also allows other multiples (triplets, quadruplets, etc.) to be represented with the same code whereas`C73429`is only for twins.# Note for upgrading to FHIR R5When we add support for R5 to the IG, we should add the rest of the codes from <http://terminology.hl7.org/ValueSet/v3-FamilyMember> as additional bindings to guide users when not using one of the main bindings.We intend that when users need to use a code that is not in the main bindings, they should default to the FamilyMember ValueSet. However, in R4, there is no way to express this in the ValueSet itself. |
| [Collection Type](ValueSet-collection-type-vs.md) | Enumerated list of Collection types |
| [Condition Codes](ValueSet-condition-code-vs.md) | Includes all codes from**HPO**and**MONDO** |
| [Consanguinity Value Codes](ValueSet-consanguinity-assertion-vs.md) | List of codes indicates the level of known consanguinity (blood relation) within a study family. |
| [Enumerations for how DOB was constructed](ValueSet-research-data-date-of-birth-method-vs.md) | Enumerations for how DOB was constructed |
| [Enumerations for the EDAM ontology](ValueSet-edam-ontology-terms-vs.md) | Enumerations for the EDAM ontology |
| [Family Types Codes](ValueSet-ncpi-family-types-vs.md) | A value set with all codes used for the expected family types. |
| [Family Types Codes](ValueSet-research-study-party-role-vs.md) | A value set with all codes used for the expected family types. |
| [MeSH Terms](ValueSet-mesh-terms.md) | Example terms from Medical Subject Headings (MeSH) Ontology |
| [Patient Knowledge Source](ValueSet-patient-knowledge-source-vs.md) | The source of the knowledge represented in a`Patient`resource. |
| [Phenotypic Feature Codes](ValueSet-phenotypic-feature-code-vs.md) | Includes all codes from**HPO** |
| [Platform instrument options](ValueSet-platform-instrument-vs.md) | Platform instrument options |
| [Research Data Access Codes](ValueSet-research-data-access-code-vs.md) | Enumerated list of access codes such as dbGaP consent codes among others. |
| [Research Data Access Type Codes](ValueSet-research-data-access-type-vs.md) | Enumerated list of access type codes such as 'Open Access', 'Registered Access' and 'Controlled Access' |
| [Study Name Type](ValueSet-study-name-type-vs.md) | Some common types of study 'names'. |
| [Study Personnel Role](ValueSet-study-personnel-role-vs.md) | Roles associated with study personnel. |
| [Title Type](ValueSet-title-type-vs.md) | Used to express the reason and specific aspect for the variant title, such as language and specific language. |
| [Type of Condition](ValueSet-condition-type-vs.md) | Type of Condition |

### Terminology: Code Systems 

These define new code systems used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Adaptor trimmed options](CodeSystem-adaptor-trimmed-cs.md) | Adaptor trimmed options |
| [Collection Type](CodeSystem-collection-type.md) | Enumerated list of collection types |
| [Elements of Component](CodeSystem-component-elements.md) | Slicing for elements of component |
| [Enumerations for how DOB was constructed](CodeSystem-research-data-date-of-birth-method.md) | Enumerations for how DOB was constructed |
| [Hash Types Code System](CodeSystem-example-hash-type-code-system.md) | Algorithm used to calculate the hash (and size, where applicable) |
| [Library prep options](CodeSystem-library-prep-cs.md) | Library prep options |
| [Library selection options](CodeSystem-library-selection-cs.md) | Library selection options |
| [NCPI FHIR Codes](CodeSystem-ncpi.md) | Codes that would apply to NCPI projects |
| [NCPI Family Types CodeSystem](CodeSystem-ncpi-family-types.md) | CodeSystem for Types of Families |
| [NCPI Metadata slices](CodeSystem-metadata-elements.md) | NCPI Metadata slices |
| [Patient Knowledge Source](CodeSystem-patient-knowledge-source.md) | The source of the knowledge represented in a`Patient`resource. |
| [Reference genome examples](CodeSystem-reference-genome-cs.md) | Reference genome examples |
| [Related File Type Code System](CodeSystem-related-file-type-code-system.md) | Explains the relationship of this file to the file of reference |
| [Research Data Access Codes](CodeSystem-research-data-access-code.md) | Enumerated list of access codes such as dbGaP consent codes among others. |
| [Research Data Access Type Codes](CodeSystem-research-data-access-type.md) | Enumerated list of access type codes such as 'Open Access', 'Registered Access' and 'Controlled Access' |
| [Research Study Party Role](CodeSystem-research-study-party-role.md) | This is a ResearchStudy's party role. |
| [Sample availability for Sample and Aliquot modules](CodeSystem-biospecimen-availability.md) | Sample availability for Sample and Aliquot modules |
| [Strandedness options](CodeSystem-strandedness-cs.md) | Strandedness options |
| [Study Name Type](CodeSystem-study-name-type.md) | Some common types of study 'names'. |
| [Study Personnel Role](CodeSystem-study-personnel-role.md) | Roles associated with study personnel. |
| [TitleType](CodeSystem-title-type.md) | Used to express the reason and specific aspect for the variant title, such as language and specific language. |
| [Type of Condition](CodeSystem-condition-type.md) | Code System for type of condition |
| [Workflow tool options](CodeSystem-workflow-tool-cs.md) | Workflow tool options |
| [Workflow type options](CodeSystem-workflow-type-cs.md) | Workflow type options |

### Example: Example Instances 

These are example instances that show what data produced and consumed by systems conforming with this implementation guide might look like.

| | |
| :--- | :--- |
| [An example family relationship (child to parent) based on data from CBTN](FamilyMemberHistory-cbtn-family-relationship-mother.md) | An example family relationship based on data from CBTN.PT-006SP675 (the patient) is female and 5 years old PT-006SP660 (the relative) is female and 17 years old This is the "mother" relationship. The relative is the mother of the patient.This instance instantiates the minimum relationship direction to reproduce a PED file. |
| [An example family relationship (child-to-parent) based on data from GREGoR](FamilyMemberHistory-gregor-family-relationship-mother.md) | An example family relationship based on data from GREGoR.GSS123456 (the patient) is male and >= 64 years old GSS654321 (the relative) has no information in the patient record This is the "mother" relationship. The relative is the mother of the patient.This instance instantiates the minimum relationship direction to reproduce a PED file. |
| [An example family relationship (parent to child) based on data from CBTN](FamilyMemberHistory-cbtn-family-relationship-daughter.md) | An example family relationship based on data from CBTN.* extension[+] 
* url = "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study"
* valueReference = Reference(kf-research-study-cbtn)
 
PT-006SP675 (the relative) is female and 5 years old PT-006SP660 (the patient) is female and 17 years old This is the "daughter" relationship. The relative is the daughter of the patient.This demonstrates using extensibility to express the reverse of the minimum relationship convention. |
| [CBTN General Research Use (GRU) Consent DAC](Consent-kf-gru-dac-consent.md) | General Research Use (GRU) |
| [CBTN General Research Use (GRU) Consent dbGaP](Consent-kf-gru-dbgap-consent.md) | General Research Use (GRU) |
| [CBTN Operations Lead](PractitionerRole-kf-research-study-personnel-role-op-lead.md) | CBTN Operations Lead |
| [Children's Brain Tumor Network (CBTN)](ResearchStudy-kf-research-study-cbtn.md) | Brain tumors are the most common form of cancer in children aged 0-19 in the United States, and are the largest cause of cancer-related deaths. The estimated number of new cases in 2019 is nearly 3,800 and thus brain tumors are a rare disease. Despite their relative rarity, the years of potential life lost due to brain tumors in 2009 was estimated at 47,631 years for children and adolescents aged 0-19 in the United States; this is a disproportionate amount of life lost compared to adult cancers and represents an unrecognized societal threat. There is an urgent need to improve therapies for these children. Most of the high-grade glial and embryonal brain cancers still remain largely incurable despite decades of clinical and laboratory research. Existing non-targeted chemotherapies and radiation, while at times effective, often represent pyrrhic victories, leaving behind life-long health burdens and causing a significant risk of secondary malignancies. NIH funded pediatric brain tumor cohort-based genomic dataset generation efforts have lagged behind other histologies and have yet to be included as part of large-scale sequencing efforts. However, consortia-based initiatives like those supported by the Children's Brain Tumor Network (CBTN) have demonstrated the early potential for clinically annotated genomic cohorts and their utility and interest by both the pediatric cancer and structural birth defect community with more than 130 data access requests for a non-embargoed cohort of tumor/normal whole genomes and paired tumor RNAseq. Indeed more than one quarter of this 800-subject initial sequencing cohort were identified to have birth-defect-associated clinical annotations in their clinical records, however, to our knowledge limited to no trio-based genomics cohort studies exist for any one pediatric brain tumor histology. The project's proposed sequencing cohort defines the largest, clinically annotated pediatric brain tumor cohort study to date and seeks to define the intersection of germline and somatic underpinnings of pediatric brain tumors across a shared developmental context of cancer and structural birth defects. |
| [Children's Hospital of Philadelphia](Organization-kf-research-study-organization-chop.md) | Represents the Organization for which CHOP PIs are affiliated |
| [Example assertion using data from GREGoR](Observation-GSS123456-assertion.md) | Example assertion using data from GREGoR |
| [Example biospecimen based on data from CBTN](Specimen-SA-000.md) | Example biospecimen based on data from CBTN |
| [Example biospecimen based on data from GREGoR](Specimen-GSS123456-01-010.md) | Example biospecimen based on data from GREGoR |
| [Example biospecimen based on data from GREGoR](Specimen-GSS123456-01-010p.md) | Example biospecimen based on data from GREGoR |
| [Example biospecimen based on data from GREGoR, intentionally breaking the no parent and collection together rule. This should generate a warning.](Specimen-GSS123456-01-010x.md) | Example biospecimen based on data from GREGoR that will generate a warning |
| [Example condition assertion using data from CBTN](Observation-PT-006SP660-condition.md) | Example condition assertion using data from CBTN. |
| [Example condition assertion using data from GREGoR](Observation-GSS123456-condition-assertion.md) | Example condition assertion using data from GREGoR |
| [Example condition summary using data from GREGoR](Condition-GSS123456-condition-summary.md) | Example condition summary using data from GREGoR |
| [Example family member based on data from GREGoR](Patient-GSS654321.md) | Example family member based on data from GREGoR. |
| [Example file based on CBTN](DocumentReference-GF-6BAD9S7D.md) | Use case of file information from CBTN |
| [Example file based on GREGoR](DocumentReference-GSS123456-01-010-SG-2.md) | Use case of file information from GREGor |
| [Example file metadata for a BAM-CRAM file from GREGoR](Observation-gregor-example-metadata.md) | Example file metadata for a BAM-CRAM file from GREGoR |
| [Example file metadata from CBTN](Observation-FASTQ-example.md) | Example file metadata from CBTN |
| [Example mappings based on data from GREGoR](ResearchSubject-gregor-example-participantstudy.md) | Example mappings based on data from GREGoR |
| [Example patients based on data from CBTN](Group-cbtn-study-family.md) | Example patients based on data from CBTN. |
| [Example patients based on data from CBTN](Patient-PT-006SP660.md) | Example patients based on data from CBTN. |
| [Example patients based on data from GREGoR](Group-gregor-study-family.md) | Example patients based on data from GREGoR. |
| [Example patients based on data from GREGoR](Patient-GSS123456.md) | Example patients based on data from GREGoR. |
| [Example patients based on data from GREGoR](Person-gregor-example-person.md) | Example patients based on data from GREGoR |
| [Example patients based on data from PCGC](Patient-PT-006SP675.md) | Example patients based on data from PCGC. |
| [Example patients based on data from PCGC](Person-pcgc-example-person.md) | Example patients based on data from PCGC |
| [Example study from GREGoR](ResearchStudy-research-study-gregor.md) | Example study from GREGoR |
| [GREGoR General Research Use (GRU) Consent](Consent-gregor-gru-consent.md) | General Research Use (GRU) |
| [Genomic Summary Results (GSR) Allowed Access](Consent-kf-gsr-allowed-access.md) | Genomic Summary Results (GSR) Allowed Access |
| [Kids First X01s](List-ncpi-research-collection-kfx01.md) | Kids First X01s |
| [Participants from the CBTN research study](Group-kf-research-study-cbtn-participants.md) | Participants from the CBTN research study |
| [Participants from the GREGoR research study](Group-gregor-research-study-participants.md) | Participants from the GREGoR research study |
| [Pediatric Brain Tumor Atlas](List-ncpi-research-collection-pbta.md) | Pediatric Brain Tumor Atlas |
| [Registered Tier Access](Consent-kf-registered-allowed-access.md) | Registered Tier Access |
| [dbGaP PI](PractitionerRole-kf-research-study-personnel-role-pi.md) | dbGaP PI |
| [dbGaP PI, X01 FY 2021](PractitionerRole-kf-research-study-personnel-role-pi-x01.md) | dbGaP PI, X01 FY 2021 |


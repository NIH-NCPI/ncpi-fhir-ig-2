Alias: $ncpi-study-name-type = https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/study-name-type
Alias: $ncpi-study-personnel-role = https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/study-personnel-role
Alias: $research-study-party-organization-type = https://hl7.org/fhir/valueset-research-study-party-organization-type.html


Extension: ResearchStudyDesign
Id: research-study-design
Title: "Research Study Design"
Description: "Codes categorizing the type of study such as investigational vs. observational, type of blinding, type of randomization, safety vs. efficacy, etc."
* insert SetContext(ResearchStudy) 
* value[x] only CodeableConcept 
* valueCodeableConcept from https://hl7.org/fhir/valueset-study-design.html (example)

/*
 * For now, we are not using this extension because it depends on R4B, which we are moving away from
Extension: ResearchStudyResult
Id: research-study-result
Title: "Research Study Result"
Description: "Link to citations associated with the study's publications."
* insert SetContext(ResearchStudy) 
* valueReference only Reference(Citation)
*/

Extension: ResearchStudyAcknowledgement
Id: research-study-acknowledgement
Title: "Research Study Acknowledgement"
Description: "Provides an informative description of acknowledgement expectations for those using data from the research study."
* insert SetContext(ResearchStudy)
* value[x] only markdown
* valueMarkdown 1..1 
* valueMarkdown ^short  = "Details about acknowledgement requirements for derivative publications."

Extension: ResearchStudyAssociatedParty
Id: research-study-associated-party
Title: "Research Study Associated Party"
Description: "Sponsors, collaborators, and other parties affiliated with a research study."
* insert SetContext(ResearchStudy)
* extension contains
    name 1..1 MS and
    role 0..1 MS and
    period 0..* and 
    classifier 0..* and
    party 0..1 MS
* extension[name] ^short = "Name of associated party"
* extension[name].value[x] only string 
* extension[role] ^short = "sponsor | lead-sponsor | sponsor-investigator | primary-investigator | collaborator | funding-source | general-contact | recruitment-contact | sub-investigator | study-director | study-chair
Binding: Research Study Party Role (Extensible)"
* extension[role].value[x] only CodeableConcept 
* extension[role].valueCodeableConcept from  https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/research-study-party-role-vs
* extension[period] ^short = "When active in the role"
* extension[period].value[x] only Period
* extension[period].valuePeriod 
* extension[classifier] ^short = "nih | fda | government | nonprofit | academic | industry
Binding: Research Study Party Organization Type (Example)"
* extension[classifier].value[x] only CodeableConcept
* extension[classifier].valueCodeableConcept from $research-study-party-organization-type
* extension[party] ^short = "Individual or organization associated with study (use practitionerRole to specify their organisation)"
* extension[party].value[x] only Reference
* extension[party].valueReference only Reference(Practitioner or PractitionerRole or Organization) 


Profile: NcpiResearchStudy
Parent: ResearchStudy
Id: ncpi-research-study
Title: "NCPI Research Study"
Description: "The NCPI Research Study FHIR resource represents an individual research effort and acts as a grouper or “container” for that effort’s study participants and their related data files."
* ^description = "The NCPI Research Study FHIR resource represents an individual research effort and acts as a grouper or “container” for that effort’s study participants and their related data files."
* ^version = "0.0.1"
* ^status = #draft
* identifier ^short = "External facing, globally unique identifiers. When providing more than one identifier, researchers should indicate the 'official' identifier by assigning 'official' to that identifier's use property."
* title ^short = "Study's formal title."
* description ^short = "Study Description (Recommended)"
* category.coding ^short = "Indicate this is an NCPI Research Study"
* category.coding = $ncpi#StudyCohort "Study Cohort"
* relatedArtifact ^short = "Attribution, Study Weblinks, Citation, Study Documents, etc."
* focus ^short = "The primary, non-disease focus(es) of the study. This can include terms related to intervention, drug, device, or other focus."
* focus ^comment = "Researcher specified foci that are not specific to disease/phenotype codes."
* condition ^short =  "The primary focus(es) of the study. This is specific to the disease. MeSH terms are preferred."
* condition ^comment = "Disease and phenotype codes identified in the CDM study's 'focus'."
* extension contains 
    ResearchStudyDesign named studyDesign 0..* and
    ResearchStudyAssociatedParty named associatedParty 0..* and
    ResearchStudyAcknowledgement named acknowledgement 0..*
    // Removing this for now, since we are migrating back to R4 which doesn't have the Citation resource
    // ResearchStudyResult named result 0..* and
    
* extension[studyDesign] ^short = "Study Design and Study Type"
// * extension[result] ^short = "Link to results generated during the study."
* extension[acknowledgement] ^short = "URL describing the policy restrictions in detail."

// These are TBD for after we have completed digging into what access control 
// will require
// * enrollment ^short = "Study Participants"
// * enrollment 1..1
// * enrollment only Reference(StudyGroup) 

// Moving Sponsor and investigator over to associatedParty
// * sponsor ^short = "Consortium or other group the study is a member"
// * sponsor only Reference(ResearchConsortium)   
// * principalInvestigator only Reference(Practitioner)  // The primary investigator

CodeSystem: StudyNameType
Id: study-name-type
Title: "Study Name Type"
Description: "Some common types of study 'names'."
* ^url = $study-name-type
* ^experimental = false
* ^caseSensitive = true
* #formal-title "Formal Title"
* #internal-name "Internal Name"
* #familiar-ame "Familiar Name (Nickname)"
* #acronym "Acronym"
* #alternative-name "Alternative Name"


ValueSet: StudyNameTypeVS
Id: study-name-type-vs
Title: "Study Name Type"
Description: "Some common types of study 'names'."
* ^experimental = false
* include codes from system $study-name-type

CodeSystem: StudyPersonnelRole
Id: study-personnel-role
Title: "Study Personnel Role"
Description: "Roles associated with study personnel."
* ^url = $ncpi-study-personnel-role
* ^experimental = false
* ^caseSensitive = true
* #primary-investigator "Primary Investigator"
* #administrator "Administrator"
* #collaborator "Collaborator"

ValueSet: StudyPersonnelRoleVS
Id: study-personnel-role-vs
Title: "Study Personnel Role"
Description: "Roles associated with study personnel."
* ^experimental = false
* include codes from system $ncpi-study-personnel-role

Logical: CdmResearchStudy
Id: SharedDataModelResearchStudy
Title: "Shared Data Model for Research Study"
Description: "The **Shared Data Model for Research Study** represents the understanding of what a Research Study is from the context of users and authors of the NCPI FHIR IG."
* persistentIdentifier 0..* Identifier "External facing, globally unique identifier."
* parentStudy 0..1 CdmResearchStudy "Parent study, required only for substudies."
// * parentStudy 0..1 Reference(CdmResearchStudy) "Parent study, required only for substudies."
* name 1..* BackboneElement "Name is a repeatable object that consists of sets of two fields.  All ResearchStudy records must have at least one Name object with Name.Type=”formal title”."
* name.text 1..1 string "The study's name"
* name.type 0..1 code "Type of name or title this name relates to (formal-title, internale-name, familiar-name, etc)"
* name.type from StudyNameTypeVS (extensible)
* description 1..1 string "short summary of relevant and important information about the study."
* website 0..* url "A URL for a website that provides information about the research effort as a whole."
* totalParticipants 0..1 integer "Number of total participants represented by the data in this study."
* studyFocus 0..* BackboneElement "The primary focus(es) of the study. This can include terms related to disease area, intervention, drug, device, or other focus. MeSH terms are preferred."
* studyFocus.term 1..1 string "The term used to describe the focus of the study. A valid MeSH is preferred."
* studyFocus.termSource 0..1 string "The source ontology or vocabulary for subjectFocus.Term (optional if term uses curie)."
* enrollmentCriteria 0..1 markdown "EnrollmentCriteria describes the inclusion and exclusion criteria used to enroll participants in this study. This can be provided as a free text description, but may also be structured using bullets, tables, or other organizational methods." 
* population 0..* BackboneElement "Population is a repeatable object that consists of sets of two fields. Population provides an overall description of the general population enrolled in the study, including basic demographics at a minimum and other useful population descriptors as appropriate."
* population.type 1..1 string "A term that specifies the population being described."
* population.description 0..1 string "A free text field that provides more information about the population specified in PopulationType within the context of this researchStudy."
* citation 0..* string "Provide any relevant information regarding how to cite this study. This can be as specific as including a full citation or as simple as a DOI."
* publications 0..* string "Provide a list of publications that use this data. This may be updated to include new publications as they are created."
* additionalDocumentation 0..* string "AdditionalDocumentation should be used to provide URLs, citations, or other appropriate references to technical documentation that is important for understanding the data included in this study. This can include data dictionaries, methods descriptions, github repositories, case report forms (CRFs), or any other relevant documentation."
* consortium 0..1 string "If the data in this study was gathered as part of a consortial effort, list the consortium here."
* acknowledgements 0..* string "Acknowledgements describes any attribution or acknowledgements relevant to the study.  This can include but is not limited to funding sources, organizational affiliations or sponsors."
* personnel 0..* BackboneElement "Every study must have at least one Primary Contact defined. Additional personnel such as Primary Investigator(s), Administrator(s), Collaborator(s) or other roles may also be included. If there are no appropriate individuals who can serve as primary contact for a study, an organization may be provided."
* personnel.name 1..1 HumanName "The name of the person being described."
* personnel.role 1..1 code "The role of the person being described."
* personnel.role from StudyPersonnelRoleVS (extensible)
* personnel.organization 0..1 string "The organizational affiliation of the person being described."

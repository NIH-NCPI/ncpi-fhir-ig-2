/*
Family Module

Logical models, profiles, extensions and valuesets for:
* NcpiStudyFamily
* NcpiFamilyRelationship

*/


// Study Family

Logical: CdmStudyFamily
Id: SharedDataModelStudyFamily
Title: "Shared Data Model for Study Family"
Description: "The **Shared Data Model for Study Family**"
* familyID 1..1 string "Unique study family identifier. System identifier used for internal references."
* externalID 0..* string "Study family identifier. System identifier used for external references."
* familyType 0..1 code "Describes the 'type' of study family, eg, trio."
* description 0..1 string "Free text describing the study family, such as potential inheritance or details about consanguinity"
* consanguinity 0..1 code "Is there known or suspected consanguinity in this study family?"
* studyFamilyFocus 0..1 code "What is this study family investigating? EG, a specific condition"

// Family Role

Logical: CdmFamilyRole
Id: SharedDataModelFamilyRole
Title: "Shared Data Model for Family Role"
Description: "The **Shared Data Model for Family Role**"
* participant 1..1 Reference "The participant we are describing"
* studyFamily 1..1 Reference "The study family this participant is part of"
* familyRole 0..1 code "The role this individual has in the family, specifically with respect to a proband or index participant"


Extension: FamilyRole
Id: family-role
Title: "Study Family Focus"
Description: "Extension containing Family Role"

* insert SetContext(Group.member.entity)
* value[x] only CodeableConcept
* valueCodeableConcept ^short = "The role this individual has in the family, specifically with respect to a proband or index participant"
* valueCodeableConcept from $ncpi-family-member (extensible)

CodeSystem: NcpiFamilyTypes
Id: ncpi-family-types
Title: "NCPI Family Types CodeSystem"
Description: "CodeSystem for Types of Families"
* ^url = $ncpi-family-types
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^publisher = "NCPI FHIR Works"
* ^content = #fragment
* #Control-only "Control Only"
* #Duo "Duo"
* #Other "Other"
* #Proband-only "Proband Only"
* #Trio "Trio"
* #Trio+ "Trio+"

ValueSet: NcpiFamilyTypesVS
Id: ncpi-family-types-vs
Title: "Family Types Codes"
Description: "A value set with all codes used for the expected family types."
* ^experimental = false
* ^version = "0.1.0"
* ^status = #active
* include codes from system $ncpi-family-types

Extension: FamilyType
Id: family-type
Title: "Family Type Extension"
Description: "Extension containing Family Type"
* value[x] only CodeableConcept
* valueCodeableConcept ^short = "Describes the 'type' of study family, eg, trio."
* valueCodeableConcept from ncpi-family-types-vs (extensible)

Extension: Description
Id: description
Title: "Description"
Description: "Free text describing containing resource."
* value[x] only markdown
* valueMarkdown 0..1

ValueSet: ConsanguinityAssertionVS
Id: consanguinity-assertion-vs
Title: "Consanguinity Value Codes"
Description: "List of codes indicates the level of known consanguinity (blood relation) within a study family."
* ^experimental = false
* $snomedct_us#428263003  "NOT suspected"
* $snomedct_us#415684004  "Suspected"
* $snomedct_us#410515003  "Known present"
* $snomedct_us#261665006  "Unknown"

Extension: Consanguinity
Id: consanguinity
Title: "Consanguinity Extension"
Description: "Extension containing Consanguinity"
* value[x] only CodeableConcept
* valueCodeableConcept from consanguinity-assertion-vs (extensible)
* valueCodeableConcept ^short = "Is there known or suspected consanguinity in this study family?"

Extension: StudyFamilyFocus
Id: study-family-focus
Title: "Study Family Focus Extension"
Description: "Extension containing Study Family Focus"
* value[x] only CodeableConcept
* valueCodeableConcept ^short = "What is this study family investigating? EG, a specific condition"

Profile: NcpiStudyFamily
Parent: Group
Id: ncpi-study-family
Title: "NCPI Study Family"
Description: "Study Family"
* ^version = "0.1.0"
* ^status = #draft
* id ^short = "ParticipantID - Unique participant identifier. System identifier used for internal references."
* identifier ^short = "External IDs for this participant. Requires scoping."
* extension contains FamilyType named familyType 0..1
* extension[familyType] ^short = "Describes the 'type' of study family, eg, trio."
* extension contains Description named description 0..1
* extension[description] ^short = "Free text describing the study family, such as potential inheritance or details about consanguinity"
* extension contains Consanguinity named consanguinity 0..1
* extension[consanguinity] ^short = "Is there known or suspected consanguinity in this study family?"
* extension contains StudyFamilyFocus named studyFamilyFocus 0..1
* extension[studyFamilyFocus] ^short = "What is this study family investigating? EG, a specific condition"
* member 1..*
* member.entity only Reference(NcpiParticipant)
* member.entity ^short = "The participant described by this member."
* member.entity.extension contains FamilyRole named familyRole 0..1
* member.entity.extension[familyRole] ^short = "The role this individual has in the family, specifically with respect to a proband or index participant"


/*
Extension: StudyFamily
Id: study-family
Title: "Study Family Reference"
Description: "Extension containing Study Family Reference"
* insert SetContext(Group)
* value[x] only Reference
* valueReference 1..1
* valueReference only Reference(NcpiStudyFamily)
*/


// Family Relationship

Logical: CdmFamilyRelationship
Id: SharedDataModelFamilyRelationship
Title: "Shared Data Model for Family Relationship"
Description: "The **Shared Data Model for Family Relationship**"
* subject 1..1 Reference "The participant we are describing"
* target 1..1 Reference "The participant the subject has a relationship to, eg, 'Subject is Relationship to Target' or 'Subject is Mother of Target'"
* relationship 1..1 code "The relationship between the subject and the target."


ValueSet: FamilyBiologicalRelationshipVS
Id: family-biological-relationship-vs
Title: "Biological Relationship Codes"
Description: "List of codes indicating the biological relationship between two individuals in a family. It is restrictive to encourage a standardized representation."
* ^version = "0.1.0"
* ^experimental = false
* include $family-role-code#NPRN  "Natural Parent"
* include $family-role-code#ITWIN  "Identical Twin"
* include $ga4gh-kin#KIN:005 "isGestationalCarrier"
// If we were using version 5, we could add the rest of the
// codes from $ncpi-family-member as additional bindings
// to guide users when not using one of the main bindings.


Profile: NcpiFamilyRelationship
Parent: FamilyMemberHistory
Id: ncpi-family-relationship
Title: "Family Relationship"
Description: "A relationship between individuals in a pedigree or family."
* ^version = "0.2.0"
* ^status = #draft
* extension contains $family-patient-record named relative 1..1 MS
* extension[relative] ^short = "The other participant in the relationship. This participant is the player of the role listed in the relationship field. That is, if the relationship is NPRN (natural parent), the \"relative\" is the parent."
* relationship 1..1 MS
* relationship from FamilyBiologicalRelationshipVS (extensible)
* relationship ^short = "The family role the relative fills with respect to the patient for this relationship. For the sake of users, prefer to exclusively use NPRN and ITWIN for genetic relationships. All other genetic relationships can be expressed with these and dummy individuals. ITWIN should be used for all monozygotic multiples (triplets, quadruplets, etc.) and should be present for all the directions of the relationship. This provides an unambiguous representation of the relationship. Example: A,B,C are triplets. You need A→B, B→A, A→C, C→A, B→C, C→B. If X and Y are twins, you need X→Y and Y→X. If Q is the grandchild of R but Q's parent is outside the dataset, then you need to make a dummy D with unknown sex and age and make Q-(NCHILD)→D and D-(NCHILD)→R. Values like mother and son are redundant with the sex of the participants and unnecessarily reductive."
* patient 1..1 MS
* patient ^short = "The participant we are describing. That is, if the relationship is NPRN (natural parent), the patient is the child."
* name 0..0
* sex 0..0
* born[x] 0..0
* age[x] 0..0
* estimatedAge 0..0
* deceased[x] 0..0
* reasonCode 0..0
* reasonReference 0..0
* condition 0..0
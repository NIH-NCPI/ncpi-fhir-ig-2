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
* insert SetContext(Group)
* value[x] only CodeableConcept
* valueCodeableConcept ^short = "Describes the 'type' of study family, eg, trio."
* valueCodeableConcept from ncpi-family-types-vs (extensible)

Extension: Description
Id: description
Title: "Description"
Description: "Free text describing containing resource."
* insert SetContext(Group)
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
* insert SetContext(Group)
* value[x] only CodeableConcept
* valueCodeableConcept from consanguinity-assertion-vs (extensible)
* valueCodeableConcept ^short = "Is there known or suspected consanguinity in this study family?"

Extension: StudyFamilyFocus
Id: study-family-focus
Title: "Study Family Focus Extension"
Description: "Extension containing Study Family Focus"
* insert SetContext(Group)
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
// We use the NCI Thesaurus here for the mother and father because its
// definitions are more precise.
//
// C96572 ("Biological Father") is:
//    A male who contributes to the genetic makeup of his offspring through
//    the fertilization of an ovum by his sperm.
// C96580 ("Biological Mother") is:
//    A female who contributes to the genetic makeup of her offspring
//    from the fertilization of her ovum.
//
// Whereas the parental family-role's codes are less refined:
//
// NMTH ("natural mother") is
//    The player of the role is a female who conceives
//    or gives birth to the scoping entity (child).
// NFTH ("natural father") is
//    The player of the role is a male who begets the
//    scoping entity (child).
//
// In particular, "Biological Mother" excludes surrogates but
// NMTH is ambiguous and "Biological Father" specifies
// fertilization of an ovum by sperm. Whereas NFTH uses the
// ambiguous term "begets," which could include other
// mechanisms.
* include $nci-thesaurus#C96580 "Biological Mother"
* include $nci-thesaurus#C96572 "Biological Father"
// For Twin,
//
// C73429 ("Identical Twin") is:
//    Either of the two offspring resulting from a shared ovum.
//
// ITWIN ("Identical Twin") is:
//    The scoper and player are offspring of the same egg-sperm
//    pair.
//
// Though being "offspring" of the same fertilized egg is
// questionable wording, we use ITWIN because it also allows
// other multiples (triplets, quadruplets, etc.) to be
// represented with the same code whereas C73429 is only for
// twins.
* include $family-role-code#ITWIN "identical twin"
// If we were using version 5, we could add the rest of the
// codes from $ncpi-family-member as additional bindings
// to guide users when not using one of the main bindings.


Profile: NcpiFamilyRelationship
Parent: FamilyMemberHistory
Id: ncpi-family-relationship
Title: "Family Relationship"
Description: "A relationship between individuals in a pedigree or family. We chose the direction of the relationship to match PED files, which go from the individual to the mother and father."
* ^version = "0.2.0"
* ^status = #draft
* extension contains $family-patient-record named relative 1..1 MS
* extension[relative] ^short = "The other participant in the relationship who plays the role named by the relationship. That is, if the relationship is C96572 (Biological Father), the \"relative\" is the father."
* relationship 1..1 MS
* relationship from FamilyBiologicalRelationshipVS (extensible)
* relationship ^short = "The family role the relative fills with respect to the patient for this relationship.  [relative] is [relationship] to [patient]. For the sake of users, prefer to exclusively use C96572, C96580, and ITWIN for genetic relationships. All other genetic relationships can be expressed with these and dummy individuals. ITWIN should be used for all monozygotic multiples (triplets, quadruplets, etc.) and should be present for all the directions of the relationship. This provides an unambiguous representation of the relationship. Example: A,B,C are triplets. You need A→B, B→A, A→C, C→A, B→C, C→B. If X and Y are twins, you need X→Y and Y→X. If Q is the maternal grandchild of the female R but Q's parent is outside the dataset, then you need to make a dummy D and make D-(Biological Mother)→Q and R-(Biological Mother)→D."
* patient 1..1 MS
* patient ^short = "The participant we are describing. That is, if the relationship is C96572 (Biological Father), the patient is the child."
* name 0..0
* sex 0..0
* born[x] 0..0
* age[x] 0..0
* estimatedAge 0..0
* deceased[x] 0..0
* reasonCode 0..0
* reasonReference 0..0
* condition 0..0
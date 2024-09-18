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
* familyType 0..1 code "Describes the 'type' of study family, eg, trio. "
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
Title: "Study Family Description"
Description: "Free text describing the study family, such as potential inheritance or details about consanguinity"
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
* id 1..1 
* id ^short = "ParticipantID - Unique participant identifier. System identifier used for internal references."
* identifier 0..* 
* identifier ^short = "External IDs for this participant. Requires scoping."
* extension contains FamilyType named family-type 0..1
* extension[family-type] ^short = "Describes the 'type' of study family, eg, trio."
* extension contains Description named description 0..1
* extension[description] ^short = "Free text describing the study family, such as potential inheritance or details about consanguinity"
* extension contains Consanguinity named consanguinity 0..1
* extension[consanguinity] ^short = "Is there known or suspected consanguinity in this study family?"
* extension contains StudyFamilyFocus named study-family-focus 0..1
* extension[study-family-focus] ^short = "What is this study family investigating? EG, a specific condition"
* member 1..*
* member.entity only Reference(NcpiParticipant)
* member.entity ^short = "The participant we are describing."
* member.entity.extension contains FamilyRole named family-role 0..1
* member.entity.extension[family-role] ^short = "The role this individual has in the family, specifically with respect to a proband or index participant"


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

Profile: NcpiFamilyRelationship
Parent: Observation
Id: ncpi-family-relationship
Title: "Family Relationship"
Description: "Family Relationship"
* ^version = "0.1.0"
* ^status = #draft
* subject 1..1 
* subject only Reference(NcpiParticipant)
* subject ^short = "The participant we are describing"
* focus 1..1 
* focus only Reference(NcpiParticipant)
* focus ^short = "The participant the subject has a relationship to, eg, 'Subject is Relationship to Target' or 'Subject is Mother of Target'"
* code ^short = "The relationship between the subject and the target."
* code from $ncpi-family-member (extensible)

/*
Family Module

Logical models, profiles, extensions and valuesets for:
* Family Study
* Family Role
* Family Relationships

*/ 

// Family Study 

Logical: CdmFamilyStudy
Id: SharedDataModelFamilyStudy
Title: "Shared Data Model for Family Study"
Description: "The **Shared Data Model for Family Study**"
* familyID 1..1 string "Unique family study identifier. System identifier used for internal references."
* externalID 0..* string "Family study identifier. System identifier used for external references."
* familyType 0..1 code "Describes the 'type' of family study, eg, trio. "
* description 0..1 string "Free text describing the family study, such as potential inheritance or details about consanguinity"
* consanguinity 0..1 code "Is there known or suspected consanguinity in this family study?"
* familyStudyFocus 0..1 code "What is this family study investigating? EG, a specific condition"

CodeSystem: NcpiFamilyTypes
Id: ncpi-family-types
Title: "NCPI Family Types CodeSystem"
Description: "CodeSystem for Types of Families"
* ^url = $ncpi_family_types
* ^version = "0.1.0"
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
* include codes from system $ncpi_family_types

Extension: FamilyType
Id: family-type
Title: "Family Type Extension"
Description: "Extension containing Family Type"
* value[x] only CodeableConcept 
* valueCodeableConcept ^short = "Describes the 'type' of family study, eg, trio."
* valueCodeableConcept from ncpi_family-types-vs (extensible)

Extension: Description
Id: desctiption
Title: "Family Study Description"
Description: "Free text describing the family study, such as potential inheritance or details about consanguinity"
* value[x] only markdown 
* valueMarkdown 0..1

ValueSet: ConsanguinityAssertionVS
Id: consanguinity-assertion-vs
Title: "Consanguinity Value Codes"
Description: "List of codes indicates the level of known consanguinity (blood relation) within a family study."
* ^experimental = false
* $SNOMEDCT_US#428263003  "NOT suspected"
* $SNOMEDCT_US#415684004  "Suspected"
* $SNOMEDCT_US#410515003  "Known present"
* $SNOMEDCT_US#261665006  "Unknown"

Extension: Consanguinity
Id: consanguinity
Title: "Consanguinity Extension"
Description: "Extension containing Consanguinity"
* value[x] only CodeableConcept
* valueCodeableConcept from consanguinity-assertion-vs (extensible)
* valueCodeableConcept ^short = "Is there known or suspected consanguinity in this family study?"

Extension: FamilyStudyFocus
Id: family-study-focus
Title: "Family Study Focus Extension"
Description: "Extension containing Family Study Focus"
* value[x] only CodeableConcept 
* valueCodeableConcept ^short = "What is this family study investigating? EG, a specific condition"

Profile: NcpiFamilyStudy
Parent: Group
Id: ncpi-family-study
Title: "NCPI Family Study"
Description: "Family Study"
* ^version = "0.1.0"
* ^status = #draft
* id 1..1 
* id ^short = "ParticipantID - Unique participant identifier. System identifier used for internal references."
* identifier 0..* 
* identifier ^short = "External IDs for this participant. Requires scoping."
* extension contains FamilyType named family-type 0..1
* extension[family-type] ^short = "Describes the 'type' of family study, eg, trio."
* extension contains Description named description 0..1
* extension[description] ^short = "Free text describing the family study, such as potential inheritance or details about consanguinity"
* extension contains Consanguinity named consanguinity 0..1
* extension[consanguinity] ^short = "Is there known or suspected consanguinity in this family study?"
* extension contains FamilyStudyFocus named family-study-focus 0..1
* extension[family-study-focus] ^short = "What is this family study investigating? EG, a specific condition"

// Family Role

Logical: CdmFamilyRole
Id: SharedDataModelFamilyRole
Title: "Shared Data Model for Family Role"
Description: "The **Shared Data Model for Family Role**"
* participant 1..1 Reference "The participant we are describing"
* familyStudy 1..1 Reference "The family study this participant is part of"
* familyRole 0..1 code "The role this individual has in the family, specifically with respect to a proband or index participant"

Extension: FamilyStudy
Id: family-study
Title: "Family Study Reference"
Description: "Extension containing Family Study Reference"
* insert SetContext(Group)
* value[x] only Reference
* valueReference 1..1
* valueReference only Reference(NcpiFamilyStudy)

Extension: FamilyRole
Id: family-role
Title: "Family Study Focus"
Description: "Extension containing Family Role"
* value[x] only CodeableConcept 
* valueCodeableConcept ^short = "The role this individual has in the family, specifically with respect to a proband or index participant"
* valueCodeableConcept from $family-role-code (extensible)

Profile: NcpiFamilyRole
Parent: Group
Id: ncpi-family-role
Title: "Shared Data Model for Family Role"
Description: "Shared Data Model for Family Role"
* ^version = "0.1.0"
* ^status = #draft
* member.entity 1..1
* member.entity only Reference(NcpiParticipant)
* member.entity ^short = "The participant we are describing."
* extension contains FamilyStudy named family-study 0..1
* extension[family-study] ^short = "The family study this participant is part of"
* extension contains FamilyRole named family-role 0..1
* extension[family-role] ^short = "The role this individual has in the family, specifically with respect to a proband or index participant"


// Family Relationship

Logical: CdmFamilyRelationship
Id: SharedDataModelFamilyRelationship
Title: "Shared Data Model for Family Study"
Description: "The **Shared Data Model for Family Study**"
* subject 1..1 Reference "The participant we are describing"
* target 1..1 Reference "The participant the subject has a relationship to, eg, 'Subject is Relationship to Target' or 'Subject is Mother of Target'"
* relationship 1..1 code "The relationship between the subject and the target."

Profile: NcpiFamilyRelationship
Parent: Observation
Id: ncpi-family-relationship
Title: "Shared Data Model for Family Relationship"
Description: "Shared Data Model for Family Relationship"
* ^version = "0.1.0"
* ^status = #draft
* subject 1..1 
* subject only Reference(NcpiParticipant)
* focus 1..1 
* focus only Reference(NcpiParticipant)
* code ^short = "The relationship between the subject and the target."
* code from research-data-date-of-birth-method-vs (extensible)

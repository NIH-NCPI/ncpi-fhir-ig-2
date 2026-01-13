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
Title: "Family Role"
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
* ^version = "0.1.0"
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
Description: "Extension containing a consanguinity assertion"
* insert SetContext(Group)
* value[x] only CodeableConcept
* valueCodeableConcept from consanguinity-assertion-vs (extensible)
* valueCodeableConcept ^short = "Is there known or suspected consanguinity in this study family?"

Extension: StudyFamilyFocus
Id: study-family-focus
Title: "Study Family Focus Extension"
Description: "Extension containing a study family focus assertion"
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
Description: """
All codes from the GA4GH KIN ontology for family relationships. This ValueSet
duplicates the GA4GH PedigreeRelationshipTypes ValueSet to maintain compatibility
with the GA4GH PedigreeRelationship profile while documenting NCPI-specific guidance.

# NCPI-Recommended Codes for Maximum Interoperability

For maximum interoperability with other NCPI systems, prefer these three codes for
genetic relationships in pedigrees ([PED files](https://gatk.broadinstitute.org/hc/en-us/articles/360035531972-PED-Pedigree-format)):

- [`KIN:027` (**"isBiologicalMother"**)](https://ga4gh.github.io/pedigree-fhir-ig/CodeSystem-kin.html#kin-KIN.58027):
   The relative is the biological mother of the patient.
- [`KIN:028` (**"isBiologicalFather"**)](https://ga4gh.github.io/pedigree-fhir-ig/CodeSystem-kin.html#kin-KIN.58028):
   The relative is the biological father of the patient.
- [`KIN:010` (**"isMonozygoticTwin"**)](https://ga4gh.github.io/pedigree-fhir-ig/CodeSystem-kin.html#kin-KIN.58010):
   The relative and patient are monozygotic twins. For higher-order multiples
   (triplets, quadruplets, etc.), create KIN:010 relationships between every
   pair of individuals in the multiple. Since this is a non-directed relationship,
   each pair requires two FamilyRelationship resources (A→B and B→A).

Relationships are expressed from patient (child) to relative (parent):
`patient`=child, `relative`=parent, `relationship`="isBiologicalMother" or "isBiologicalFather".

For other genetic relationships (grandparents, aunts, uncles, cousins), use these
three codes with inferred individuals to represent the relationship chain.

# Additional KIN Codes

The full [KIN ontology](https://ga4gh.github.io/pedigree-fhir-ig/CodeSystem-kin.html)
provides 55 relationship codes including adoptive parents, step-relations, grandparents,
and more. While all codes are available for use, NCPI systems may not fully support
relationships beyond the three core codes listed above.

# Future Enhancement

When FHIR R5/R6 support is added, we plan to use additional binding features to better
express the preference for the three core codes while maintaining the full KIN ontology
as an option.
"""
* ^version = "0.2.0"
* ^experimental = false
* include codes from system $ga4gh-kin


Profile: NcpiFamilyRelationship
Parent: $ga4gh-pedigree-relationship
Id: ncpi-family-relationship
Title: "Family Relationship"
// The rest of the description is in
// input/pagecontent/StructureDefinition-ncpi-family-relationship-intro.md
Description: "A relationship between individuals in a pedigree or family."
* ^version = "0.2.0"
* ^status = #draft
// The relative extension slice is inherited from GA4GH PedigreeRelationship
* extension[relative] ^short = "The participant in the relationship who plays the role named by the relationship."
* extension[relative] ^definition = """
The participant in the relationship who plays the role named by the relationship.

That is, if the relationship is `KIN:028` (**\"isBiologicalFather\"**), the
`relative` is the father and the `patient` is the child.

This uses [the standard Patient Record extension](http://hl7.org/fhir/StructureDefinition/familymemberhistory-patient-record)
inherited from the [GA4GH PedigreeRelationship profile](https://ga4gh.github.io/pedigree-fhir-ig/StructureDefinition-PedigreeRelationship.html)
"""
* relationship 1..1 MS
* relationship from FamilyBiologicalRelationshipVS (required)
* relationship ^short = "The role the relative fills with respect to the patient for this relationship."
* relationship ^definition = """
The role the relative fills with respect to the patient for this relationship.

`relative` is `relationship` to `patient`.

# NCPI-Recommended Codes

For maximum interoperability with other NCPI systems, prefer these three codes for
genetic relationships in [PED files](https://gatk.broadinstitute.org/hc/en-us/articles/360035531972-PED-Pedigree-format):

- `KIN:027` (isBiologicalMother): The relative is the biological mother of the patient.
- `KIN:028` (isBiologicalFather): The relative is the biological father of the patient.
- `KIN:010` (isMonozygoticTwin): The relative and patient are monozygotic twins. For
  higher-order multiples (triplets, quadruplets, etc.), create pairwise `KIN:010`
  relationships between every pair with bidirectional relationships (both A→B and B→A).

All other genetic relationships (grandparents, aunts, uncles, cousins, etc.) can be
expressed using these three codes with inferred individuals to represent the relationship
chain. This provides a canonical way to express all pedigree relationships, which will ease
consuming the data.

# Additional KIN Codes

While all 55 codes from the [GA4GH KIN ontology](https://ga4gh.github.io/pedigree-fhir-ig/CodeSystem-kin.html)
are available, NCPI systems may not fully support relationships beyond the three core codes above.
"""
* relationship ^comment = """
# Examples

## Example 1 (triplets):

A,B,C are triplets. You need six `NcpiFamilyRelationship`
resources with `KIN:010` (isMonozygoticTwin):
- A→B
- B→A
- A→C
- C→A
- B→C
- C→B.

## Example 2 (twins):
If X and Y are twins, you need two `NcpiFamilyRelationship`
resources with `KIN:010` (isMonozygoticTwin):
- X→Y
- Y→X.

## Example 3 (maternal grandchild):
If Q is the maternal grandchild of the female R but Q's parent
is outside the dataset, then you need to make an inferred Patient
resource D and make two `NcpiFamilyRelationship` resources:
- D-(KIN:027, isBiologicalMother)→Q
- R-(KIN:027, isBiologicalMother)→D.
"""
* patient 1..1 MS
* patient ^short = "The participant we are describing."
* patient ^definition = """
The participant we are describing.

That is, if the relationship is `KIN:028` (**\"isBiologicalFather\"**), the `patient` is the child
and the `relative` is the father.
"""
// Remove the elements that are redundant with Patient for compatibility with
// the GA4GH PedigreeRelationship and because redundant elements incur
// database maintenance costs.
* name 0..0
* sex 0..0
* born[x] 0..0
* age[x] 0..0
* estimatedAge 0..0
* deceased[x] 0..0
* reasonCode 0..0
* reasonReference 0..0
* condition 0..0
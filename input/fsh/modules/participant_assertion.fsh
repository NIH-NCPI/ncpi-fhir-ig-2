/* Logical Model and Profiles for Participant Assertion Module */

Logical: CdmParticipantAssertion
Id: SharedDataModelParticipantAssertion
Title: "Shared Data Model for Participant Assertion"
Description: "The Shared Data Model for **Participant Assertion**"
* participant 1..1 reference "The participant we are describing"
* assertionCode 0..* code "The code associated with the measurement, procedure or other assertion being made about the user."
* assertionText 1..1 string "Detailed description / free text about this assertion."
* ageAtAssertion 0..1 Quantity "The date or age at which this information is being asserted."
* assertion 1..1 code "For assertions relating to a true/false status of a particular concept, is that value true or false?"
* AssertionType 0..1 code "The semantic type of the resource, eg, Condition."
* ageAtEvent 0..1 code "The age in decimal years of the Subject at the time point which the assertion..."
* otherModifiers 0..* code "Any additional modifiers for this condition, such as severity."
* assertionSource 0..1 code "Where or how was this this assertion about the Participant recorded? This can support understanding the differences between surveys, automated EHR extraction, manual chart abstraction, etc."
* asserter 0..1 code "Who recorded this assertion about the Participant? This can support understanding the differences between self-report, doctor, trained research staff."


ValueSet: ConditionCodeVS
Id: condition-code-vs
Title: "Condition Codes"
Description: "Includes all codes from **HPO** and **MONDO**"
* ^experimental = false
* include codes from system $hpo 
* include codes from system $mondo 

CodeSystem: ConditionType
Id: condition-type
Title: "Type of Condition"
Description: "Code System for type of condition"
* ^url = $condition-type
* ^experimental = false
* ^caseSensitive = true
* ^status = #active
* #Phenotypic-Feature "Phenotypic Feature"
* #Disease "Disease"
* #Comorbidity "Comorbidity"
* #Histology "Histology"
* #Clinical-Finding "Clinical Finding"
* #EHR-Condition-Code "EHR Condition Code"

ValueSet: ConditionTypeVS
Id: condition-type-vs
Title: "Type of Condition"
Description: "Type of Condition"
* ^experimental = false
* include codes from system condition-type

CodeSystem: PhenotypicFeatureAssertion
Id: phenotypic-feature-assertion
Title: "Assertion of Phenotypic Feature Codes"
Description: "Code System for assertion of phenotypic feature presence"
* ^url = $phenotypic-feature-assertion
* ^experimental = false
* ^caseSensitive = true
* #Present "Present"
* #Absent "Absent"
* #Unknown "Unknown"

ValueSet: PhenotypicFeatureAssertionVS
Id: phenotypic-feature-assertion-vs
Title: "Assertion of Phenotypic Feature Codes"
Description: "Assertion of Phenotypic Feature Codes"
* ^experimental = false
* include codes from system phenotypic-feature-assertion

ValueSet: PhenotypicFeatureCodeVS
Id: phenotypic-feature-code-vs
Title: "Phenotypic Feature Codes"
Description: "Includes all codes from **HPO** "
* ^experimental = false
* include codes from system $hpo 

Extension: AgeAtEvent
Id: age-at-event
Title: "Age at Event"
Description: "Age at Event Extension"
* insert SetContext(NcpiParticipantAssertion.component)
* insert SetContext(NcpiConditionSummary.extension)
//* insert SetContext(extension)
// * value[x] only date
* value[x] only dateTime
* valueDateTime ^short = "Indicate age via relative date time extension or official date of when condition was asserted."

// Moved to input/fsh/extensions/AgeAtAssertion.fsh
// Extension: AgeAtAssertion
// Id: age-at-assertion
// Title: "Age at Assertion"
// Description: "Age at Assertion Extension"
// * insert SetContext(effectiveDateTime)
// * value[x] only Quantity
// * valueQuantity ^short = "Indicate age via relative date time extension or official date of when condition was asserted."

Extension: OtherConditionModifiers 
Id: other-condition-modifiers 
Title: "Any additional modifiers for this condition, such as severity."
Description: "Any additional modifiers for this condition, such as severity."
* insert SetContext(Condition)
* value[x] only CodeableConcept 
* valueCodeableConcept ^short = "Any additional modifiers for this condition, such as severity."

Extension: EntityAsserter
Id: entity-asserter
Title: "Person who recorded assertion about participant"
Description: "Person who recorded assertion about participant"
* insert SetContext(Observation)
* value[x] only CodeableConcept
* valueCodeableConcept ^short = "Who recorded this assertion about the Participant? This can support understanding the differences between self-report, doctor, trained research staff."



CodeSystem: ComponentElements
Id: component-elements
Title: "Elements of Component"
Description: "Slicing for elements of component"
* ^experimental = false
* ^caseSensitive = true
* #ageAtEvent "Age at Event"
* #ageAtAssertion "Age at Assertion"
* #ageAtOnset "Age at Onset"
* #ageAtResolution "Age at Resolution"
* #otherModifiers "Other Modifiers"
* #stage "Stage"

Profile: NcpiParticipantAssertion
Parent: Observation 
Id: ncpi-participant-assertion 
Title: "NCPI Participant Assertion"
Description: "Assertion about a particular Participant. May include Conditions, Measurements, etc."
* ^version = "0.0.1"
* ^status = #draft
/*participant*/
* subject only Reference(NcpiParticipant)
* subject ^short = "The participant we are describing"
/* Assertion Code */
* code.coding ^short = "The structured term defining the meaning of the assertion"
/*assertionText*/
* code.text ^short = "Detailed description / free text about this assertion."
/*ageAtAssertion*/
* effective[x] only dateTime
* effectiveDateTime ^short = "The date or age at which this assertion is being made.  Could be expressed with a term, an age, or an age range. (for ages use http://hl7.org/fhir/StructureDefinition/cqf-relativeDateTime)"
/*assertion*/
* value[x] ^short = "The value of the assertion such as a numeric value, or structured term representing the assertion itself (such as true or false)"
* value[x] only CodeableConcept or Quantity or string or boolean or integer or Range or time or dateTime or Period 
/*conditionType*/ 
* category ^short = "The semantic type of the resource, eg, Condition"
/*ageAtOnset*/ 
* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "Slicing logic for observation component"
* component ^slicing.ordered = false
* component contains 
  ageAtEvent 0..* and 
  ageAtAssertion 0..* and 
  ageAtOnset 0..1 and
  ageAtResolution 0..1 and
  stage 0..* and 
  otherModifiers 0..* 
/**ageAtAssertion*/
* component[ageAtEvent].code = #ageAtEvent
* component[ageAtEvent].value[x] only Quantity or dateTime or CodeableConcept or Range
* component[ageAtEvent] ^short = "The age of the Subject when the assertion was made.  Could be expressed with a term, an age, or an age range. (for ages use http://hl7.org/fhir/StructureDefinition/cqf-relativeDateTime)"
/**ageAtOnset*/
* component[ageAtOnset].code = #ageAtOnset
* component[ageAtOnset].value[x] only Quantity or dateTime or CodeableConcept or Range
* component[ageAtOnset] ^short = "The age of onset for this condition. Could be expressed with a term, an age, or an age range."
/*ageAtResolution*/ 
* component[ageAtResolution].code = #ageAtResolution
* component[ageAtResolution].value[x] only Quantity or dateTime or CodeableConcept or Range
* component[ageAtResolution] ^short = "The age at which this condition was resolved, abated, or cured. Should be left empty in cases of current active status. Could be expressed with a term, an age, or an age range."
/*ageAtResolution*/ 
* component[ageAtAssertion].code = #ageAtAssertion
* component[ageAtAssertion].value[x] only Quantity or dateTime or CodeableConcept or Range
* component[ageAtAssertion] ^short = "The age in decimal years of the Subject at the time point which the assertion.  Could be expressed with a term, an age, or an age range. (for ages use http://hl7.org/fhir/StructureDefinition/cqf-relativeDateTime)"
/*otherModifiers*/ 
* component[otherModifiers].code = #otherModifiers
* component[otherModifiers].value[x] only CodeableConcept
* component[otherModifiers] ^short = "Any additional modifiers for this condition, such as severity."
/*stage*/ 
* component[stage].code = #stage
* component[stage].value[x] only CodeableConcept
* component[stage] ^short = "Cancer staging information"
/*location*/ 
* bodySite ^short = "Location information for the observation, including site, laterality, and other qualifiers as appropriate. Multiple observations may be required if the same assertion is made in many locations, or complete location details can be provided in an NCPI Condition Summary."
* bodySite.extension contains BodyLocationQualifier named mcodeBodyLocationQualifier 0..1 /*Condition.LocationQualifieri*/
* bodySite.extension[mcodeBodyLocationQualifier] ^short = "Any location qualifiers"
* bodySite.extension contains LateralityQualifier named mcodeLateralityQualifier 0..1 /*Condition.LateralityQualifier*/
* bodySite.extension[mcodeLateralityQualifier] ^short = "Laterality information for the condition site"

/*assertionSource*/ 
* method ^short = "Where or how was this this assertion about the Participant recorded? This can support understanding the differences between surveys, automated EHR extraction, manual chart abstraction, etc."
/*asserter*/
* extension contains EntityAsserter named entityAsserter 0..1
* extension[entityAsserter] ^short = "Who recorded this assertion about the Participant? This can support understanding the differences between self-report, doctor, trained research staff."


/*
 * For situations where there is evidence of a participant having a particular
 * condition, we recommend using NCPI Condition, which is based on the HL7
 * Condition Resource. It is still expected that a positive assertion be added
 * using ParticipantAssertions to enable basic queries to capture both positive
 * and negative assertions together. 
*/

Profile: NcpiPhenotypicFeatureAssertion 
Parent: NcpiParticipantAssertion 
Id: ncpi-phenotypic-feature-assertion 
Title: "NCPI Phenotypic Feature Assertion"
Description: "Assertion about a phenotypic feature's presence or absence given a particular participant."
* code from https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/phenotypic-feature-code-vs (extensible)
* value[x] only CodeableConcept
* valueCodeableConcept from https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/phenotypic-feature-assertion-vs (required)

Logical: CdmConditionAssertion
Id: SharedDataModelCondition
Title: "Shared Data Model for Condition Assertions"
Description: "The Shared Data Model for **Condition Assertions**"
* participant 1..1 reference "The participant we are describing"
* condition 0..* code "The condition, disease, phenotypic feature, etc that this participant may have."
* conditonText 1..1 string "Detailed description / free text about this condition."
* ageAtAssertion 0..1 Quantity "The date or age at which this condition is being asserted."
* assertion 1..1 code "Does the participant have this condition?"
* conditionType 0..1 code "Does this condition represent a specific \"type\" of condition, such as \"Phenotypic Feature\" vs \"Disease\" in a rare disease setting."
* ageAtOnset 0..1 code "The age of onset for this condition. Could be expressed with a term, an age, or an age range."
* ageAtResolution 0..1 date "The age at which this condition was resolved, abated, or cured. Should be left empty in cases of current active status. Could be expressed with a term, an age, or an age range."
* otherModifiers 0..* code "Any additional modifiers for this condition, such as severity."
* stage 0..1 code "Cancer staging information"
* location 0..* code "Location information, such as site and/or laterality, of the condition. Multiple values should be interpreted cumulatively, so complex location information, such as \"right lung\" and \"left kidney\" may require multiple condition rows."
* locationQualifier 0..1 code "Any spatial/location qualifiers"
* lateralityQualifier 0..1 code "Any laterality qualifiers"
* assertionSource 0..1 code "Where or how was this this assertion about the Participant recorded? This can support understanding the differences between surveys, automated EHR extraction, manual chart abstraction, etc."
* asserter 0..1 code "Who recorded this assertion about the Participant? This can support understanding the differences between self-report, doctor, trained research staff."


Profile: NcpiConditionSummary
Parent: Condition
Id: ncpi-condition-summary
Title: "NCPI Conditon Summary"
Description: "Information about a condition related to a research participant"
* ^version = "0.0.1"
* ^status = #draft
/*participant*/
* subject ^short = "The participant we are describing"
/* condition */
* code.coding ^short = "The condition, disease, phenotypic feature, etc that this participant may have."
/*conditionText*/
* code.text ^short = "Detailed description / free text about this condition."

/**
 * EST - 2025-4-14 I'm leaving these open to enable ranges and strings, but we
 *                 can definitely restrict these to onsetAge and abatementAge.
 */
/*ageAtOnset*/
* onset[x] ^short = "The age of onset for this condition. Could be expressed with a term, an age, or an age range. (for ages use http://hl7.org/fhir/StructureDefinition/cqf-relativeDateTime)"

/*ageAtResolution*/ 
* abatement[x] ^short = "The age at which this condition was resolved, abated, or cured. Should be left empty in cases of current active status. Could be expressed with a term, an age, or an age range."

/*conditionType*/
* category ^short = "Does this condition represent a specific \"type\" of condition, such as \"Phenotypic Feature\" vs \"Disease\" in a rare disease setting."

/*stage*/ 
* stage.summary ^short = "Cancer staging information. Example ValueSet, [condition-stage](https://hl7.org/fhir/R4/valueset-condition-stage.html)"
/*location*/ 
* bodySite ^short = "Location information for the condition, including site, laterality, and other qualifiers as appropriate."
* bodySite.extension contains BodyLocationQualifier named mcodeBodyLocationQualifier 0..1 /*Condition.LocationQualifieri*/
* bodySite.extension[mcodeBodyLocationQualifier] ^short = "Any location qualifiers"
* bodySite.extension contains LateralityQualifier named mcodeLateralityQualifier 0..1 /*Condition.LateralityQualifier*/
* bodySite.extension[mcodeLateralityQualifier] ^short = "Laterality information for the condition site"

/*ageAtAssertion*/
* extension contains AgeAtEvent named ageAtAssertion 0..1 /*ageAtAssertion*/
* extension[ageAtAssertion] ^short = "The age in decimal years of the Subject at the time point which the assertion.  Could be expressed with a term, an age, or an age range. (for ages use http://hl7.org/fhir/StructureDefinition/cqf-relativeDateTime)"

* asserter ^short = "Reference to the individual responsible for the assertion, if this information is known (participant's Patient resource, if it is self reported, etc.)"
/*asserter*/
* extension contains EntityAsserter named entityAsserter 0..1
* extension[entityAsserter] ^short = "Who recorded this assertion about the Participant? This can support understanding the differences between self-report, doctor, trained research staff."

* extension contains OtherConditionModifiers named otherConditionModifiers 0..* 
* extension[otherConditionModifiers] ^short = "Any additional modifiers for this condition, such as severity."

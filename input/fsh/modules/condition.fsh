/* Logical Model and Profiles for Condition Module */

Logical: CdmCondition
Id: SharedDataModelCondition
Title: "Shared Data Model for Condition"
Description: "The Shared Data Model for **Condition**"
* participant 1..1 reference "The participant we are describing"
* condition 0..* code "The condition, disease, phenotypic feature, etc that this participant may have."
* conditonText 1..1 string "Detailed description / free text about this condition."
* ageAtAssertion 0..1 Quantity "The date or age at which this condition is being asserted."
* assertion 1..1 code "Does the participant have this condition?"
* conditionType 0..1 code "Does this condition represent a specific \"type\" of condition, such as \"Phenotypic Feature\" vs \"Disease\" in a rare disease setting."
* ageAtOnset 0..1 code "The age of onset for this condition. Could be expressed with a term, an age, or an age range."
* ageAtResolution 0..1 date "The age at which this condition was resolved, abated, or cured. Should be left empty in cases of current active status. Could be expressed with a term, an age, or an age range."
* otherModifiers 0..* code "Any additional modifiers for this condition, such as severity."
* stage 0..1 date "Cancer staging information"
* location 0..* code "Location information, such as site and/or laterality, of the condition. Multiple values should be interpreted cumulatively, so complex location information, such as \"right lung\" and \"left kidney\" may require multiple condition rows."
* assertionSource 0..1 code "Where or how was this this assertion about the Participant recorded? This can support understanding the differences between surveys, automated EHR extraction, manual chart abstraction, etc."
* asserter 0..1 code "Who recorded this assertion about the Participant? This can support understanding the differences between self-report, doctor, trained research staff."


ValueSet: ConditionCodeVS
Id: condition-code-vs
Title: "Conditon Codes"
Description: "Includes all codes from **HPO** and **MONDO**"
* include codes from system $hpo 
* include codes from system $mondo 

CodeSystem: ConditionType
Id: condition-type
Title: "Type of Condition"
Description: "Code System for type of condition"
* ^url = $condition-type
* ^experimental = false
* ^caseSensitive = true
* #Phenotypic-Feature "Phenotypic Feature"
* #Disease "Disease"
* #Comorbidity "Comorbidity"
* #Histology "Histology"
* #Clinical-Finding "Clinical Finding"
* #EHR-Condition-Code "EHR Condition Code"

ValueSet: ConditionTypeVS
Id: condition-type-vs
Title: "Type of Condition"
* include codes from system condition-type

CodeSystem: ConditionAssertion
Id: condition-assertion
Title: "Assertion of Condition Codes"
Description: "Code System for assertion of condition presence"
* ^url = $condition-assertion
* ^experimental = false
* ^caseSensitive = true
* #Present "Present"
* #Absent "Absent"
* #Unknown "Unknown"

ValueSet: ConditionAssertionVS
Id: condition-assertion-vs
Title: "Assertion of Condition Codes"
* include codes from system condition-assertion

Extension: AgeAtAssertion
Id: age-at-assertion
Title: "Age at Assertion"
Description: "Age at Assertion Extension"
* insert SetContext(effectiveDateTime)
// * value[x] only date
* value[x] only Quantity
* valueQuantity ^short = "Indicate age via relative date time extension or official date of when condition was asserted."


Extension: ConditionAsserter
Id: condition-asserter
Title: "Person who recorded assertion about participant"
Description: "Person who recorded assertion about participant"
* insert SetContext(Observation)
* value[x] only CodeableConcept
* valueCodeableConcept ^short = "Who recorded this assertion about the Participant? This can support understanding the differences between self-report, doctor, trained research staff."

Profile: NcpiCondition
Parent: Observation
Id: ncpi-condition 
Title: "NCPI Conditon"
Description: "Information about a condition related to a research participant"
* ^version = "0.0.1"
* ^status = #draft
/*participant*/
* subject only Reference(NcpiParticipant)
* subject ^short = "The participant we are describing"
/* condition */
* code.coding ^short = "The condition, disease, phenotypic feature, etc that this participant may have."
/*conditionText*/
* code.text ^short = "Detailed description / free text about this condition."
/*ageAtAssertion*/
* effective[x] only dateTime
* effectiveDateTime ^short = "The date or age at which this condition is being asserted.  Could be expressed with a term, an age, or an age range. (for ages use http://hl7.org/fhir/StructureDefinition/cqf-relativeDateTime)"
/*assertion*/
* valueCodeableConcept from condition-assertion-vs
* valueCodeableConcept ^short = "Does the participant have this condition?"
/*conditionType*/ 
* category ^short = "Does this condition represent a specific \"type\" of condition, such as \"Phenotypic Feature\" vs \"Disease\" in a rare disease setting."
/*ageAtOnset*/ 
* component ^short = "The age of onset for this condition. Could be expressed with a term, an age, or an age range."
/*ageAtResolution*/ 
* component ^short = "The age at which this condition was resolved, abated, or cured. Should be left empty in cases of current active status. Could be expressed with a term, an age, or an age range."
/*otherModifiers*/ 
* component ^short = "Any additional modifiers for this condition, such as severity."
/*stage*/ 
* component ^short = "Cancer staging information"
/*location*/ 
* bodySite ^short = "Location information, such as site and/or laterality, of the condition. Multiple values should be interpreted cumulatively, so complex location information, such as \"right lung\" and \"left kidney\" may require multiple condition rows."
/*assertionSource*/ 
* method ^short = "Where or how was this this assertion about the Participant recorded? This can support understanding the differences between surveys, automated EHR extraction, manual chart abstraction, etc."
/*asserter*/
* extension contains ConditionAsserter named condition-asserter 0..1
* extension[condition-asserter] ^short = "Who recorded this assertion about the Participant? This can support understanding the differences between self-report, doctor, trained research staff."

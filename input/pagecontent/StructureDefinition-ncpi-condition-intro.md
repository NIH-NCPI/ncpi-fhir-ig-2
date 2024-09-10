#### Key Guidelines
The NCPI Condition profile is based on the standard resource type, [Observation](https://hl7.org/fhir/r4/observation.html) and is intended to represent a condition or phenotype associated with a participant in a research study.

#### Added Profile Restrictions
In order to ensure that our resources are interoperable across studies, we have employed a number of restrictions that should make consuming Patient resources more consistent.


* participantID **should** be a globally unique identifier associated with the patient. This practice is intended to make constructing queries for the same patient compatible across different servers (such as QA vs PROD) but also to make the resource URLs more meaningful.


#### Recommended Practices
TODO: Write Recommended Practices

#### NCPI FHIR Mappings
The following fields from the shared data model are to be mapped into the NCPI Condition as shown below:

| **Logical Model Property** | **Cardinality** |  **NCPI Mapping** |**Usage Guidance** | **Notes** |
| ---- | ---- | ---- | ---- | ----- |
| participant | 1..1 | subject | The participant we are describing | |
| condition | 0..* | code.coding | The condition, disease, phenotypic feature, etc that this participant may have. | |
| conditonText | 1..1 | code.text | Detailed description / free text about this condition. ||
| ageAtAssertion | 0..1 | effectiveDateTime | The date or age at which this condition is being asserted. ||
| assertion | 1..1 | valueCodeableConcept | Does the participant have this condition? ||
| conditionType | 0..1 | Category | Does this condition represent a specific "type" of condition, such as "Phenotypic Feature" vs "Disease" in a rare disease setting. ||
| ageAtOnset | 0..1 | Component | The age of onset for this condition. Could be expressed with a term, an age, or an age range. ||
| ageAtResolution | 0..1 | Component | The age at which this condition was resolved, abated, or cured. Should be left empty in cases of current active status. Could be expressed with a term, an age, or an age range. ||
| otherModifiers | 0..* | Component | Any additional modifiers for this condition, such as severity. ||
| stage | 0..1 | Component | Cancer staging information ||
| location | 0..* | Component | Location information, such as site and/or laterality, of the condition. Multiple values should be interpreted cumulatively, so complex location information, such as "right lung" and "left kidney" may require multiple condition rows. ||
| assertionSource | 0..1 | method | Where or how was this this assertion about the Participant recorded? This can support understanding the differences between surveys, automated EHR extraction, manual chart abstraction, etc. ||
| asserter | 0..1 | extension[codeableConcept] | Who recorded this assertion about the Participant? This can support understanding the differences between self-report, doctor, trained research staff. ||

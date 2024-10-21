#### Key Guidelines
The NCPI Condition profile is based on the standard resource type, [Observation](https://hl7.org/fhir/r4/observation.html) and is intended to represent a condition or phenotype associated with a participant in a research study.

#### Added Profile Restrictions
In order to ensure that our resources are interoperable across studies, we have employed a number of restrictions that should make consuming Patient resources more consistent.


* participantID **should** be a globally unique identifier associated with the patient. This practice is intended to make constructing queries for the same patient compatible across different servers (such as QA vs PROD) but also to make the resource URLs more meaningful.


#### Recommended Practices
NCPI Condition requests codes for conditions and condition information where possible rather than the use of free text; However, providing free text is an option in the `conditionText` field of the profile.

#### NCPI FHIR Mappings
The following fields from the shared data model are to be mapped into the NCPI Condition as shown below:

| **Logical Model Property** | **Cardinality** |  **NCPI FHIR Mapping** |**Usage Guidance** | **Notes** |
| ---- | ---- | ---- | ---- | ----- |
| [participant](StructureDefinition-SharedDataModelCondition-definitions.html#diff_SharedDataModelCondition.participant) | 1..1 | subject | The participant we are describing | |
| [condition](StructureDefinition-SharedDataModelCondition-definitions.html#diff_SharedDataModelCondition.condition) | 0..* | code.coding | The condition, disease, phenotypic feature, etc that this participant may have. | |
| [conditonText](StructureDefinition-SharedDataModelCondition-definitions.html#diff_SharedDataModelCondition.conditonText) | 1..1 | code.text | Detailed description / free text about this condition. ||
| [ageAtAssertion](StructureDefinition-SharedDataModelCondition-definitions.html#diff_SharedDataModelCondition.ageAtAssertion) | 0..1 | effectiveDateTime | The date or age at which this condition is being asserted. ||
| [assertion](StructureDefinition-SharedDataModelCondition-definitions.html#diff_SharedDataModelCondition.assertion) | 1..1 | valueCodeableConcept | Does the participant have this condition? ||
| [conditionType](StructureDefinition-SharedDataModelCondition-definitions.html#diff_SharedDataModelCondition.conditionType) | 0..1 | Category | Does this condition represent a specific "type" of condition, such as "Phenotypic Feature" vs "Disease" in a rare disease setting. ||
| [ageAtOnset](StructureDefinition-SharedDataModelCondition-definitions.html#diff_SharedDataModelCondition.ageAtOnset) | 0..1 | component[ageAtOnset] | The age of onset for this condition. Could be expressed with a term, an age, or an age range. ||
| [ageAtResolution](StructureDefinition-SharedDataModelCondition-definitions.html#diff_SharedDataModelCondition.ageAtResolution) | 0..1 | component[ageAtResolution] | The age at which this condition was resolved, abated, or cured. Should be left empty in cases of current active status. Could be expressed with a term, an age, or an age range. ||
| [otherModifiers](StructureDefinition-SharedDataModelCondition-definitions.html#diff_SharedDataModelCondition.otherModifiers) | 0..* | component[otherModifiers] | Any additional modifiers for this condition, such as severity. ||
| [stage](StructureDefinition-SharedDataModelCondition-definitions.html#diff_SharedDataModelCondition.stage) | 0..1 | component[stage] | Cancer staging information ||
| [location](StructureDefinition-SharedDataModelCondition-definitions.html#diff_SharedDataModelCondition.location) | 0..* | bodySite | Location information, such as site and/or laterality, of the condition. Multiple values should be interpreted cumulatively, so complex location information, such as "right lung" and "left kidney" may require multiple condition rows. ||
| [locationQualifier](StructureDefinition-SharedDataModelCondition-definitions.html#diff_SharedDataModelCondition.locationQualifier) | 0..1 | extension[codeableConcept] | Any spatial/location qualifiers ||
| [lateralityQualifier](StructureDefinition-SharedDataModelCondition-definitions.html#diff_SharedDataModelCondition.lateralityQualifier) | 0..1 | extension[codeableConcept] | Any laterality qualifiers ||
| [assertionSource](StructureDefinition-SharedDataModelCondition-definitions.html#diff_SharedDataModelCondition.assertionSource) | 0..1 | method | Where or how was this this assertion about the Participant recorded? This can support understanding the differences between surveys, automated EHR extraction, manual chart abstraction, etc. ||
| [asserter](StructureDefinition-SharedDataModelCondition-definitions.html#diff_SharedDataModelCondition.asserter) | 0..1 | extension[codeableConcept] | Who recorded this assertion about the Participant? This can support understanding the differences between self-report, doctor, trained research staff. ||

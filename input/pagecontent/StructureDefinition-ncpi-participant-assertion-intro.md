#### Key Guidelines
The NCPI Participant Assertion profile is based on the standard resource type, [Observation](https://hl7.org/fhir/r4/observation.html) and is intended to represent a condition or phenotype associated with a participant in a research study.

#### Added Profile Restrictions
In order to ensure that our resources are interoperable across studies, we have employed a number of restrictions that should make consuming Patient resources more consistent.


* participantID **should** be a globally unique identifier associated with the patient. This practice is intended to make constructing queries for the same patient compatible across different servers (such as QA vs PROD) but also to make the resource URLs more meaningful.


#### Recommended Practices
NCPI Subject Assertion requests codes relevant for the domain associated for the assertion itself, such as LOINC or SNOMED for a measurement where possible rather than the use of free text; However, providing free text is an option in the `assertionText/code.text` field of the profile.

#### NCPI FHIR Mappings
The following fields from the shared data model are to be mapped into the NCPI Condition as shown below:

| **Logical Model Property** | **Cardinality** |  **NCPI FHIR Mapping** |**Usage Guidance** | **Notes** |
| ---- | ---- | ---- | ---- | ----- |
| [participant](StructureDefinition-SharedDataModelParticipantAssertion-definitions.html#key_SharedDataModelParticipantAssertion.asserter) | 1..1 | subject | The participant we are describing | |
| [assertionCode](StructureDefinition-ncpi-participant-assertion-definitions.html#key_Observation.component:ageAtAssertion) | 0..* | code.coding | The measurement, procedure, etc being reported in relation to this participant. | |
| [assertionText](StructureDefinition-SharedDataModelParticipantAssertion-definitions.html#key_SharedDataModelParticipantAssertion.assertionText) | 1..1 | code.text | Detailed description / free text about this assertion. ||
| [ageAtAssertion](StructureDefinition-SharedDataModelParticipantAssertion-definitions.html#key_SharedDataModelParticipantAssertion.ageAtAssertion) | 0..1 | effectiveDateTime | The date or age at which this information is being asserted. ||
| [assertion](StructureDefinition-SharedDataModelParticipantAssertion-definitions.html#key_SharedDataModelParticipantAssertion.assertion) | 1..1 | valueCodeableConcept | Does the participant have this procedure or other true false assertion? ||
| [AssertionType](StructureDefinition-SharedDataModelParticipantAssertion-definitions.html#key_SharedDataModelParticipantAssertion.AssertionType) | 0..1 | Category | Describe the type of assertion being made. ||
| [ageAtAssertion](StructureDefinition-SharedDataModelParticipantAssertion-definitions.html#key_SharedDataModelParticipantAssertion.ageAtAssertion) | 0..1 | component[ageAtAssertion] | The age of at which this assertion was being made. Could be expressed with a term, an age, or an age range. ||
| [otherModifiers](StructureDefinition-SharedDataModelParticipantAssertion-definitions.html#key_SharedDataModelParticipantAssertion.otherModifiers) | 0..* | component[otherModifiers] | Any additional modifiers for this assertion, such as severity. ||
| [assertionSource](StructureDefinition-SharedDataModelParticipantAssertion-definitions.html#key_SharedDataModelParticipantAssertion.assertionSource) | 0..1 | method | Where or how was this this assertion about the Participant recorded? This can support understanding the differences between surveys, automated EHR extraction, manual chart abstraction, etc. ||
| [asserter](StructureDefinition-SharedDataModelParticipantAssertion-definitions.html#key_SharedDataModelParticipantAssertion.asserter) | 0..1 | extension[codeableConcept] | Who recorded this assertion about the Participant? This can support understanding the differences between self-report, doctor, trained research staff. ||

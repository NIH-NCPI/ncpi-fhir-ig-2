#### Key Guidelines
Study Participation (ResearchSubject) describes the relationship between a specific Participant and a Research Study that collects and is sharing data on that Participant. A single Participant may have this “Study Participation” relationship with multiple Research Studies, and each relationship may have a different sharing restriction. These relationships are primarily illustrative, as the Access Policy details of any given element are documented within that element. 

##### Added Profile Restrictions


#### Recommended Practices
TODO: Write Recommended Practices

##### FHIR Mappings
The following fields from the shared data model are to be mapped into the NCPI Participant as shown below:


| **Logical Model Property** | **Cardinality** |  **NCPI Participant Mapping** |**Usage Guidance** | **Notes** |
|[Participant](StructureDefinition-SharedDataModelStudyParticipant-definitions.html#diff_SharedDataModelStudyParticipant.participant)|1..1|reference|Required||
|[ResearchStudy](StructureDefinition-SharedDataModelStudyParticipant-definitions.html#diff_SharedDataModelStudyParticipant.researchStudy)|1..1|reference|Required||
|[AccessPolicy](StructureDefinition-SharedDataModelStudyParticipant-definitions.html#diff_SharedDataModelStudyParticipant.accessPolicy)|0..*|reference|Required if available||


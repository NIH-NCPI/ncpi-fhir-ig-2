#### Key Guidelines
The NCPI Participant profile is based on the standard resource type, [Patient](https://hl7.org/fhir/R4B/patient.html) and is intended to represent an individual participating in a specific research study. 

##### Added Profile Restrictions
In order to ensure that our resources are interoperable across studies, we have employed a number of restrictions that should make consuming Patient resources more consistent.

* ID **should** be a globally unique identifier associated with the patient. This practice is intended to make constructing queries for the same patient compatible across different servers (such as QA vs PROD) but also to make the resource URLs more meaningful. 

##### FHIR Mappings
The following fields from the shared data model are to be mapped into the NCPI Participant as shown below:

| **Logical Model Property** | **Cardinality** |  **NCPI Participant Mapping** |**Usage Guidance** | **Notes** |
[participantID](StructureDefinition-SharedDataModelResearchParticipant-definitions.html#diff_SharedDataModelResearchParticipant.participantID)|1..1|id| Strongly recommended | It is strongly recommended for the Participant Resource ID to be a unique identifier with an appropriate system|


#### Key Guidelines
The NCPI Study Participant profile is based on the standard resource type, [Research Study](https://hl7.org/fhir/R4B/researchstudy.html) and is intended to link Participant resources to a ResearchStudy.

##### Added Profile Restrictions


#### Recommended Practices
TODO: Write Recommended Practices

##### FHIR Mappings
The following fields from the shared data model are to be mapped into the NCPI Participant as shown below:


| **Logical Model Property** | **Cardinality** |  **NCPI Participant Mapping** |**Usage Guidance** | **Notes** |
Participant|1..1|reference|Required||
ResearchStudy|1..1|reference|Required||
AccessPolicy|0..*|reference|Required if available||


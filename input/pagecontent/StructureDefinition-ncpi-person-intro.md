#### Key Guidelines

The NCPI Participant profile is based on the standard resource type, [Person](https://hl7.org/fhir/R4B/person.html) and is intended to represent the emographics and administrative information about a person independent of a specific health-related context.

##### Added Profile Restrictions
In order to ensure that our resources are interoperable across studies, we have employed a number of restrictions that should make consuming Patient resources more consistent.

* ID **should** be a globally unique identifier associated with the person. This practice is intended to make constructing queries for the same person compatible across different servers (such as QA vs PROD) but also to make the resource URLs more meaningful. 


#### Recommended Practices
TODO: Write Recommended Practices

##### FHIR Mappings
The following fields from the shared data model are to be mapped into the NCPI Participant as shown below:

| **Logical Model Property** | **Cardinality** |  **NCPI Person Mapping** |**Usage Guidance** | **Notes** |
Person|1..1|id| Required | It is strongly recommended for the Person ID to be a unique identifier with an appropriate system|
Participant|0..1|Reference|Required|It is strongly recommended for the Participant ID to be a unique identifier with an appropriate system|

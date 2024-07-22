#### Key Guidelines
In situations where a person participates in multiple studies that have participant data scoped in an exclusive way within one or more projects, we have a Person entity. It is functionally a “group” of Participants that are all describing one “actual” person. This is especially to support situations where access policies about that participant might be conflicting and cases where the data itself about the participant might conflict but cannot be adjudicated by the repository.

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

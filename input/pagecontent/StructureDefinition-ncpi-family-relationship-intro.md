#### Key Guidelines
Family Relationships describe the relationship between two Participants. The core use case is to present biological parentage of a participant to support family / pedigree analyses. In this spirit, platforms should seek to provide minimally the information in a “ped” file: if known, a Participant should have a Family Relationship to their biological mother and father. Twins are also a high priority item for reporting. Further extended relationships can be made available using Family Relationship, but may not be as widely supported as they are harder to interpret.

##### Added Profile Restrictions
In order to ensure that our resources are interoperable across studies, we have employed a number of restrictions that should make consuming Patient resources more consistent.

* ID **should** be a globally unique identifier associated with the person. This practice is intended to make constructing queries for the same person compatible across different servers (such as QA vs PROD) but also to make the resource URLs more meaningful. 

#### Recommended Practices
Family relationship profiles can be constructed for each individual to reflect the different directions of relationships. For example, if we have a mother and son enrolled in a given research study, NCPI Family Relationship can be used to define how mother (`subject`) relates to son (`focus`) and what kind of code describes their relationship (`relationship`), in this case, the code "MTH" for mother. Use of multiple NCPI Family Relationship profiles to define relevant parties will as a whole describe interrelationships.

##### FHIR Mappings
The following fields from the shared data model are to be mapped into the NCPI Participant as shown below:

| **Logical Model Property** | **Cardinality** |  **NCPI Person Mapping** |**Usage Guidance** | **Notes** |
|[subject](StructureDefinition-SharedDataModelFamilyRelationship-definitions.html#diff_SharedDataModelFamilyRelationship.subject)|1..1|subject| Required | |
|[target](StructureDefinition-SharedDataModelFamilyRelationship-definitions.html#diff_SharedDataModelFamilyRelationship.target)|1..1|focus|||
|[relationship](StructureDefinition-SharedDataModelFamilyRelationship-definitions.html#diff_SharedDataModelFamilyRelationship.relationship)|1..1|code|||

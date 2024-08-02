#### Key Guidelines
Family Study describes a group of Participants that are related. This is not an expression of all individuals in a “family”, but a tool to identify “family members of interest” that were studied. For example, a family trio in a rare disease study does not exclude the existence of other siblings. Family Studies do not require much detail, but there are often attributes of those families that may be of use to researchers.

##### Added Profile Restrictions
In order to ensure that our resources are interoperable across studies, we have employed a number of restrictions that should make consuming Patient resources more consistent.

* ID **should** be a globally unique identifier associated with the family.


#### Recommended Practices
TODO: Write Recommended Practices

##### FHIR Mappings
The following fields from the shared data model are to be mapped into the NCPI Participant as shown below:

| **Logical Model Property** | **Cardinality** |  **NCPI Person Mapping** |**Usage Guidance** | **Notes** |
FamilyID|1..1|id| Required | It is strongly recommended for the Person ID to be a unique identifier with an appropriate system|
externalID|0..*|identifier|||
FamilyType|0..1|extension [FamilyType](StructureDefinition-family-type)|||
Description|0..1|extension [Description](StructureDefinition-description)|||
Consanguinity|0..1|extension [Consanguinity](StructureDefinition-consanguinity)|||
FamilyStudyFocus|0..1|extension [FamilyStudyFocus](StructureDefinition-family-study-focus)|||


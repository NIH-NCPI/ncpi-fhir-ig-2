#### Key Guidelines
The Family Membership Role indicates the inclusion of a Participant in a “Family Study” and describes their high level role, for example “Proband”. This summary is a helpful tool and often reported by studies. Participants may be part of 0 or more Family Studies, though in most circumstances we anticipate this to be only 0 or 1. This flexibility to support circumstances where Participants may have different “roles” in different analyses or groups. 


##### Added Profile Restrictions
In order to ensure that our resources are interoperable across studies, we have employed a number of restrictions that should make consuming Patient resources more consistent.

* ID **should** be a globally unique identifier associated with the person. This practice is intended to make constructing queries for the same person compatible across different servers (such as QA vs PROD) but also to make the resource URLs more meaningful. 


#### Recommended Practices
TODO: Write Recommended Practices

##### FHIR Mappings
The following fields from the shared data model are to be mapped into the NCPI Participant as shown below:

| **Logical Model Property** | **Cardinality** |  **NCPI Person Mapping** |**Usage Guidance** | **Notes** |
Participant|1..1|Reference| Required ||
FamilyStudy|0..1|Reference|||
FamilyRole|0..1|CodeableConcept|||


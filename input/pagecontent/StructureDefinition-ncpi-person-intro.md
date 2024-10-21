#### Key Guidelines
In situations where a person participates in multiple studies that have participant data scoped in an exclusive way within one or more projects, we have a Person entity. It is functionally a “group” of Participants that are all describing one “actual” person. This is especially to support situations where access policies about that participant might be conflicting and cases where the data itself about the participant might conflict but cannot be adjudicated by the repository.

##### Added Profile Restrictions
In order to ensure that our resources are interoperable across studies, we have employed a number of restrictions that should make consuming Patient resources more consistent.

* ID **should** be a globally unique identifier associated with the person. This practice is intended to make constructing queries for the same person compatible across different servers (such as QA vs PROD) but also to make the resource URLs more meaningful. 

#### Recommended Practices
Unique participant identifiers are essential to joining the information about a single entity's (i.e., person's) involvement in multiple research studies.

##### FHIR Mappings
The following fields from the shared data model are to be mapped into the NCPI Participant as shown below:

| **Logical Model Property** | **Cardinality** |  **NCPI FHIR Mapping** |**Usage Guidance** | **Notes** |
|Person|1..1|id| Required | It is strongly recommended for the Person ID to be a unique identifier with an appropriate system|
|Participant|0..1|link.target|Required|It is strongly recommended for the Participant ID to be a unique identifier with an appropriate system|

##### Study Participation
The conventional FHIR mechanism to link Patient resources to a ResearchStudy is through the use of a ResearchSubject resource. Let's use GREGoR data as an example: NCPI Person "PS_000" which represents the "actual" person participating in a study is linked to a specific research study via NCPI Participant, "GSS123456". In this case, GSS123456 is connected to PS_000 by `link.target` and if PS_000 participanted in another study, their other unique NCPI Participant ID could be similarly linked. NCPI Study Participant connects NCPI Research Study, relevant Access Policies, and an NCPI Participant into a single profile while NCPI Study Group contains a list of Study Participants.

For further information, see the Participant, Research Study, and Person examples:

|**NCPI Profile**|**Link to GREGoR Example**|
|Research Study|[Example JSON](ResearchStudy-research-study-gregor.json.html)|
|Research Study Group|[Example JSON](Group-gregor-research-study-participants.json.html)|
|Study Participant|[Example JSON](ResearchSubject-gregor-example-participantstudy.json.html)|
|Participant|[Example JSON GSS123456](Patient-GSS123456.json.html), [Example JSON GSS654321](Patient-GSS654321.json.html)|
|Person|[Example JSON](Person-gregor-example-person.json.html)|


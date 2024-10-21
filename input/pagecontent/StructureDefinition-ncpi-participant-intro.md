#### Key Guidelines
The NCPI Participant profile is based on the standard resource type, [Patient](https://hl7.org/fhir/R4B/patient.html) and is intended to represent an individual participating in a specific research study. 

##### Added Profile Restrictions
In order to ensure that our resources are interoperable across studies, we have employed a number of restrictions that should make consuming Patient resources more consistent.

* ID **should** be a globally unique identifier associated with the patient. This practice is intended to make constructing queries for the same patient compatible across different servers (such as QA vs PROD) but also to make the resource URLs more meaningful. 
* Identifier **should** have all appropriate identifiers with a meaningful system/value pair. Such identifiers may include dbGaP accession IDs, global and external IDs, etc. 
* Race and ethnicity **must** be defined using OMB Categories using the relevant US Core extensions ([us-core-race extension](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-race.html) & [us-core-ethnicity](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-ethnicity.html))
* Where birth date is known, the extension, [research-date-of-birth-method](StructureDefinition-research-date-of-birth-method.html) **must** be provided to indicate the method used in the construction of that value.  

#### Recommended Practices
While only some of the fields in NCPI Participant are strictly required, it is recommended that users of this IG fill out as much information as they have available for a given participant.

##### FHIR Mappings
The following fields from the shared data model are to be mapped into the NCPI Participant as shown below:

| **Logical Model Property** | **Cardinality** |  **NCPI FHIR Mapping** |**Usage Guidance** | **Notes** |
[participantID](StructureDefinition-SharedDataModelResearchParticipant-definitions.html#diff_SharedDataModelResearchParticipant.participantID)|1..1|id| Strongly recommended | It is strongly recommended for the Participant Resource ID to be a unique identifier with an appropriate system|
[externalID](StructureDefinition-SharedDataModelResearchParticipant-definitions.html#diff_SharedDataModelResearchParticipant.externalID)|0..*|identifier||
[population](StructureDefinition-SharedDataModelResearchParticipant-definitions.html#diff_SharedDataModelResearchParticipant.population)|0..*|TBD|Strongly recommended ||
[ombRace](StructureDefinition-SharedDataModelResearchParticipant-definitions.html#diff_SharedDataModelResearchParticipant.ombRace)|0..*|extension|Required if available |Use the [us-core-race extension](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-race.html)|
[ombEth](StructureDefinition-SharedDataModelResearchParticipant-definitions.html#diff_SharedDataModelResearchParticipant.ombEth)|0..*|extension|Required if available|Use the [us-core-ethnicity](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-ethnicity.html)|
[sex](StructureDefinition-SharedDataModelResearchParticipant-definitions.html#diff_SharedDataModelResearchParticipant.sex)|1..1|extension|Required if available|Use the [us-core-birthsex](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-birthsex.html) extension|
[dateOfBirth](StructureDefinition-SharedDataModelResearchParticipant-definitions.html#diff_SharedDataModelResearchParticipant.dateOfBirth)|0..1|birthDate|Optional||
[dobMethod](StructureDefinition-SharedDataModelResearchParticipant-definitions.html#diff_SharedDataModelResearchParticipant.dobMethod)|0..1|extension [ResearchDateOfBirthMethod](StructureDefinition-research-date-of-birth-method.html)|Required if dateOfBirth is provided||
[ageAtLastVitalStatus](StructureDefinition-SharedDataModelResearchParticipant-definitions.html#diff_SharedDataModelResearchParticipant.ageAtLastVitalStatus)|0..1|extension [AgeAtLastVitalStatus](StructureDefinition-research-age-at-last-vital-status.html)|Recommended||
[vitalStatus](StructureDefinition-SharedDataModelResearchParticipant-definitions.html#diff_SharedDataModelResearchParticipant.vitalStatus)|0..1|deceased|Recommended||

##### Study Participation
The conventional FHIR mechanism to link Patient resources to a ResearchStudy is through the use of a ResearchSubject resource. Let's use GREGoR data as an example: our example NCPI Participant, "GSS123456", is linked to NCPI Person "PS_000" which represents the "actual" person participating in a study. In this case, GSS123456 is connected to PS_000 by `link.target` and if PS_000 participated in another study, their other unique NCPI Participant ID could be similarly linked. NCPI Study Participant connects NCPI Research Study, relevant Access Policies, and an NCPI Participant into a single profile while NCPI Study Group contains a list of Study Participants.

For further information, see the Participant, Research Study, and Person examples:

|**NCPI Profile**|**Link to GREGoR Example**|
|Research Study|[Example JSON](ResearchStudy-research-study-gregor.json.html)|
|Research Study Group|[Example JSON](Group-gregor-research-study-participants.json.html)|
|Study Participant|[Example JSON](ResearchSubject-gregor-example-participantstudy.json.html)|
|Participant|[Example JSON GSS123456](Patient-GSS123456.json.html), [Example JSON GSS654321](Patient-GSS654321.json.html)|
|Person|[Example JSON](Person-gregor-example-person.json.html)|

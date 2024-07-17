#### Key Guidelines
The NCPI Participant profile is based on the standard resource type, [Patient](https://hl7.org/fhir/R4B/patient.html) and is intended to represent an individual participating in a specific research study. 

##### Added Profile Restrictions
In order to ensure that our resources are interoperable across studies, we have employed a number of restrictions that should make consuming Patient resources more consistent.

* ID **should** be a globally unique identifier associated with the patient. This practice is intended to make constructing queries for the same patient compatible across different servers (such as QA vs PROD) but also to make the resource URLs more meaningful. 
* identifier **should** have all appropriate Identifiers with a meaningful system/value pair. Such identifiers may include DbGAP accession IDs, global and external IDs, etc. 
* race and ethnicity **must** be defined using OMB Categories using the relevant US Core extensions ([us-core-race extension](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-race.html) & [us-core-ethnicity](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-ethnicity.html))
* Where birth date is known, the extension, [reseearch-date-of-birth-method](StructureDefinition-research-date-of-birth-method.html) **must** be provided to indicate the method used in the construction of that value.  

#### Recommended Practices
TDOD: Write Recommended Practices

##### FHIR Mappings
The following fields from the shared data model are to be mapped into the NCPI Participant as shown below:

| **Logical Model Property** | **Cardinality** |  **NCPI Participant Mapping** |**Usage Guidance** | **Notes** |
[participantID](structuredefinition-shareddatamodelresearchparticipant-definitions.html#diff_SharedDataModelResearchParticipant.participantID)|1..1|id| Strongly recommended | It is strongly recommended for the Participant Resource ID to be a unique identifier with an appropriate system|
[externalID](structuredefinition-shareddatamodelresearchparticipant-definitions.html#diff_SharedDataModelResearchParticipant.externalID)|0..*|identifier||
[population](structuredefinition-shareddatamodelresearchparticipant-definitions.html#diff_SharedDataModelResearchParticipant.population)|0..*|TBD|Strongly recommended ||
[ombRace](structuredefinition-shareddatamodelresearchparticipant-definitions.html#diff_SharedDataModelResearchParticipant.ombRace)|0..*|extension|Required if available |Use the [us-core-race extension](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-race.html)|
[ombEth](structuredefinition-shareddatamodelresearchparticipant-definitions.html#diff_SharedDataModelResearchParticipant.ombEth)|0..*|extension|Required if available|Use the [us-core-ethnicity](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-ethnicity.html)|
[sex](structuredefinition-shareddatamodelresearchparticipant-definitions.html#diff_SharedDataModelResearchParticipant.sex)|1..1|extension|Required if avaialble|Use the [us-core-birthsex](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-birthsex.html) extension|
[dateOfBirth](structuredefinition-shareddatamodelresearchparticipant-definitions.html#diff_SharedDataModelResearchParticipant.dateOfBirth)|0..1|birthDate|Optional||
[dobMethod](structuredefinition-shareddatamodelresearchparticipant-definitions.html#diff_SharedDataModelResearchParticipant.dobMethod)|0..1|extension [ResearchDateOfBirthMethod](StructureDefinition-research-date-of-birth-method)|Required if dateOfBirth is provided||
[ageAtLastVitalStatus](structuredefinition-shareddatamodelresearchparticipant-definitions.html#diff_SharedDataModelResearchParticipant.ageAtLastVitalStatus)|0..1|extension [AgeAtLastVitalStatus](StructureDefinition-research-age-at-last-vital-status)|Recommended||
[vitalStatus](structuredefinition-shareddatamodelresearchparticipant-definitions.html#diff_SharedDataModelResearchParticipant..vitalStatus)|0..1|deceased|Recommended||

##### Study Participation
The conventional FHIR mechanism to link Patient resources to a ResearchStudy is through the use of a ResearchSubject resource. **TODO: Write up details regarding the TBD Profile, NCPI Person, and the NCPI ResearchStudy.**

**TBD Write up details about linking a patient to the research study access policy (consent)**
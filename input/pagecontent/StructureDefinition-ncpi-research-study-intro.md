The NCPI Research Study is based upon the core HL7 FHIR ResearchStudy resource (R4) and acts as the umbrella for grouping and describing all other study resources..

For the purposes of interoperability, this guide includes recommended practices for the shared data elements required for submission.

Please see the research study documentation for in-depth mappings on the R4 version and the necessary extensions needed to ensure interoperability.

### Added Profile Restrictions
To ensure consistency across all NCPI research studies represented in FHIR, there are some additional requirements which must be enforced. These requirements are derived from the [Differential Table](#profile) section of this document.

#### The following requirements are true for all NCPI Research Studies:
* each study **should** have its _accession ID_ added as an identifier. This is an identifier provided by DbGAP or other organization which represents a common identifier recognized by similar research groups.
* each study **should** have its _study name_ as the title.
* for those studies which exist as part of a larger study, the parent study **should** be referenced in the study’s _partOf_ property.
* enrollment **must** contain 1 reference of type, [Study Group](StructureDefinition-research-study-group.html).
* category **must** contain the Coding from NCPI [StudyCohort](CodeSystem-ncpi.html).
* _principalInvestigator_ **must** be of type _Practitioner_ if present. (Note: we are using practitioner to maintain consistency with existing FHIR structures.)


### Recommended Practices
To ensure consistency across all NCPI research studies represented in FHIR, there are some additional elements which should be included if applicable to your study. A recommended element is one that is important and will likely have value for those trying to understand the study’s purpose and usefulness but not essential for validation against the profile. Those elements labeled as optional are not central to the fundamental understanding of the study’s content but may play a key role in a study being _findable_.

#### Shared Data Elements

| NCPI Shared Data Elements | HL7 FHIR (R4) Element | Recommended or Optional | Notes |
| ------------------------- | --------------------- | ----------------------- | ----- |
| Study description | description | Recommended | |
| Disease/focus | condition | Recommended | Should also have one or more Codings provided, indicating the disease or phenotypes that were interrogated during the study’s execution | |
| Attribution | relatedArtifact | Recommended | This can include, but not limited to; principal investigators, grant numbers, etc. | |
| Study weblinks | relatedArtifact | Optional | These elements fall under the StudyDescription element located in the [Added Profile Restrictions](#added-profile-restrictions) section of this document. | |
| Study design | [studyDesign](StructureDefinition-research-study-design.html) | Optional | These elements fall under the StudyDescription element located in the [Added Profile Restrictions](#added-profile-restrictions) section of this document. |
| Study type | [studyDesign](StructureDefinition-research-study-design.html) | Optional | These elements fall under the StudyDescription element located in the [Added Profile Restrictions](#added-profile-restrictions) section of this document. |
| Citation | relatedArtifact | Optional | |
| Study documents | relatedArtifact | Optional | | 

For a more detailed view of these elements as well as the recommended FHIR mappings please see the research study documentation.

#### Population Details
Each NCPI Research must have one [Study Group](StructureDefinition-research-study-group.html) which must, at the very least, indicate the total number of patients enrolled at the time the data was loaded into FHIR.

Additional Study Groups may be included to describe various aspects of the study’s population.

### Notes:
As mentioned in the section, “Added Profile Restrictions” above, each NCPI Research must have one NCPI [Study Group](StructureDefinition-research-study-group.html) which must, at the very least, indicate the total number of patients enrolled at the time the data was loaded into FHIR.


### Practices for Summary Only Resources
For Studies loaded into Summary Only FHIR servers, the Study’s Study Group resources **must** have the quantity. This promotes findability by enabling researchers without current access to the study’s row-level data to get basic study details including the different subject counts.

For studies that exist alongside row-level data, the Study’s Study Group resources **should** have each corresponding Patient referenced in the Group’s members array.

#### Identifiers - Best Practices
##### Provide meaningful systems at all times
System uris are important for identifying the origin of an identifier. These uris should be consistent across all groups which utilize these identifiers. Some important systems to note include:

| Organization | System | Comment |
| ------------ | ------ | ------- |
| DbGAP | https://www.ncbi.nlm.nih.gov/projects/gap/cgi-bin/study.cgi?study_id= | For DbGAP Research Studies, this recommended system, when combined with the value would constitute a valid URL for the study. |

For those identifiers that have been defined by the investigators and collaborators, the system should be unique to the Research Study and may be defined by those responsible for the ETL itself. 

##### Utilize 'use' Property
The [Identifier datatype](https://hl7.org/fhir/datatypes.html#Identifier) provides a **use** property which is used to indicate which identifier is **official** and **secondary** [(among others)](https://hl7.org/fhir/valueset-identifier-use.html) and should be used where appropriate. It is **strongly recommended** that the most visible external identifier be marked as **official**.

### Common Data Model Mappings
The following represents the mapping from the Logical Research Study model to this NCPI Research Study FHIR profile. 

| NCPI Shared Data Elements | FHIR Resource Mapping | Note |
| [persistentIdentifier](StructureDefinition-common-data-model-research-study-definitions.html#diff_common-data-model-research-study.persistentIdentifier) | identifier | System should be provided for each identifier which clearly indicates the identifier's origin |
| [parentStudy](StructureDefinition-common-data-model-research-study-definitions.html#diff_common-data-model-research-study.parentStudy) | partOf | |
| [name](StructureDefinition-common-data-model-research-study-definitions.html#diff_common-data-model-research-study.name) | title | The "Formal Title" will be stored as title |
| or [name](StructureDefinition-common-data-model-research-study-definitions.html#diff_common-data-model-research-study.name) | relatedArtifact | All other names will be recorded as relatedArtifacts |
| [description](StructureDefinition-common-data-model-research-study-definitions.html#diff_common-data-model-research-study.description) | description | |
| [website](StructureDefinition-common-data-model-research-study-definitions.html#diff_common-data-model-research-study.website) | relatedArtifact.url | relatedArtifact.type = 'documentation' and url will record the actual website URL |
| [studyFocus](StructureDefinition-common-data-model-research-study-definitions.html#diff_common-data-model-research-study.studyFocus) | focus | |
| [additionalDocumentation](StructureDefinition-common-data-model-research-study-definitions.html#diff_common-data-model-research-study.additionalDocumentation) | relatedArtifact | There should be some sort of guidance about how to designate the different possible documents listed here |
| [consortium](StructureDefinition-common-data-model-research-study-definitions.html#diff_common-data-model-research-study.consortium) | extension[associatedParty] | R5 provides a more inclusive option for sponsor, investigators, collaborators etcs. I recommend using an extension to emulate the new approach |
| [acknowledgements](StructureDefinition-common-data-model-research-study-definitions.html#diff_common-data-model-research-study.acknowledgements) | extension[associatedParty] | R5 provides a more inclusive option for sponsor, investigators, collaborators etcs. I recommend using an extension to emulate the new approach |
| [personnel](StructureDefinition-common-data-model-research-study-definitions.html#diff_common-data-model-research-study.personnel) | extension[associatedPart] | R5 provides a more inclusive option for sponsor, investigators, collaborators etcs. I recommend using an extension to emulate the new approach |


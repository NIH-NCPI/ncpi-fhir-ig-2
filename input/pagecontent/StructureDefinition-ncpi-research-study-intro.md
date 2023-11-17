For the purposes of interoperability, some restrictions have been made to enforce a common mechanism for describing enrollment and provide a simple means for summarizing subject count as well as access control through the main (parent) consent groups. In addition, we are providing some recommended practices for the common data elements required for submission. 

Please see the research study documentation for in-depth mappings on the R4 version and the necessary extensions needed to ensure interoperability. 

### Added Profile Restrictions
To ensure consistency across all NCPI research studies represented in FHIR, there are some additional requirements which must be enforced. These requirements are derived from the [Differential Table](#profile) section of this document. 

#### The following requirements are true for all NCPI Research Studies:
> TBD
> * enrollment **must** contain 1 reference of type, [Study Group](StructureDefinition-study-group.html).
> * category **must** contain the Coding from NCPI [StudyCohort](CodeSystem-ncpi.html).

* each study **should** have an externally recognized [persistentIdentifier](StructureDefinition-CommonDataModelResearchStudy-definitions.html#diff_CommonDataModelResearchStudy.persistentIdentifier) defined by an organization such as DbGAP marked with "use=primary". Other identifiers that are appropriate should be added as well.
* each study **should** have its [name](StructureDefinition-CommonDataModelResearchStudy-definitions.html#diff_CommonDataModelResearchStudy.name) as the title. 
* for those studies which exist as part of a larger study, the parent study **should** be referenced in the study's _partOf_ property. 

| NCPI Common Data Elements | HL7 FHIR (R4) Element | Notes |
| --- | --- | --- | 
| Accession # | identifier | Accession IDs from dbGaP, etc should be added as identifiers with a meaningful system |
| Study name | title | |
| Substudies | partOf | Substudies other than consent based organization should reference the parent NCPI Research Study using the partOf reference |

### Recommended Practices
#### Identifiers - Best Practices
##### Provide meaningful systems at all times
System uris are important for identifying the origin of an identifier. These uris should be consistent across all groups which utilize these identifiers. Some important systems to note include:

| Organization | System | Comment |
| ------------ | ------ | ------- |
| DbGAP | https://www.ncbi.nlm.nih.gov/projects/gap/cgi-bin/study.cgi?study_id= | For DbGAP Research Studies, this recommended system, when combined with the value would constitute a valid URL for the study. |

For those identifiers that have been defined by the investigators and collaborators, the system should be unique to the Research Study and may be defined by those responsible for the ETL itself. 

##### Utilize 'use' Property
The [Identifier datatype](https://hl7.org/fhir/datatypes.html#Identifier) provides a **use** property which is used to indicate which identifier is **official** and **secondary** [(among others)](https://hl7.org/fhir/valueset-identifier-use.html) and should be used where appropriate. It is **strongly recommended** that the most visible external identifier be marked as **official**.

#### Common Data Model Mappings
The following represents the mapping from the Logical Research Study model to this NCPI Research Study FHIR profile. 

| CDM Variable | FHIR Resource Mapping | Note |
| [persistentIdentifier](https://torstees.github.io/ncpi-fhir-ig-2/StructureDefinition-common-data-model-research-study-definitions.html#diff_common-data-model-research-study.persistentIdentifier) | identifier | System should be provided for each identifier which clearly indicates the identifier's origin |
| [parentStudy](https://torstees.github.io/ncpi-fhir-ig-2/StructureDefinition-common-data-model-research-study-definitions.html#diff_common-data-model-research-study.parentStudy) | partOf | |
| [name](https://torstees.github.io/ncpi-fhir-ig-2/StructureDefinition-common-data-model-research-study-definitions.html#diff_common-data-model-research-study.name) | title | The "Formal Title" will be stored as title |
| or [name](https://torstees.github.io/ncpi-fhir-ig-2/StructureDefinition-common-data-model-research-study-definitions.html#diff_common-data-model-research-study.name) | relatedArtifact | All other names will be recorded as relatedArtifacts |
| [description](https://torstees.github.io/ncpi-fhir-ig-2/StructureDefinition-common-data-model-research-study-definitions.html#diff_common-data-model-research-study.description) | description | |
| [website](https://torstees.github.io/ncpi-fhir-ig-2/StructureDefinition-common-data-model-research-study-definitions.html#diff_common-data-model-research-study.website) | relatedArtifact.url | relatedArtifact.type = 'documentation' and url will record the actual website URL |
| [studyFocus](https://torstees.github.io/ncpi-fhir-ig-2/StructureDefinition-common-data-model-research-study-definitions.html#diff_common-data-model-research-study.studyFocus) | focus | |
| [additionalDocumentation](https://torstees.github.io/ncpi-fhir-ig-2/StructureDefinition-common-data-model-research-study-definitions.html#diff_common-data-model-research-study.additionalDocumentation) | relatedArtifact | There should be some sort of guidance about how to designate the different possible documents listed here |
| [consortium](https://torstees.github.io/ncpi-fhir-ig-2/StructureDefinition-common-data-model-research-study-definitions.html#diff_common-data-model-research-study.consortium) | extension[associatedParty] | R5 provides a more inclusive option for sponsor, investigators, collaborators etcs. I recommend using an extension to eumulate the new approach |
| [acknowledgements](https://torstees.github.io/ncpi-fhir-ig-2/StructureDefinition-common-data-model-research-study-definitions.html#diff_common-data-model-research-study.acknowledgements) | extension[associatedParty] | R5 provides a more inclusive option for sponsor, investigators, collaborators etcs. I recommend using an extension to eumulate the new approach |
| [personnel](https://torstees.github.io/ncpi-fhir-ig-2/StructureDefinition-common-data-model-research-study-definitions.html#diff_common-data-model-research-study.personnel) | extension[associatedPart] | R5 provides a more inclusive option for sponsor, investigators, collaborators etcs. I recommend using an extension to eumulate the new approach |


#### Population Details
> TBD
> Each NCPI Research must have one [Study Group](StructureDefinition-study-group.html) which must, at the very least, indicate the total number of patients enrolled at the time the data was loaded into FHIR. 

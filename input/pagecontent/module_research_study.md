### Research Study

The NCPI Research Study is based upon the core HL7 FHIR ResearchStudy resource (R4) and acts as the umbrella for grouping and describing all other study resources. For the purposes of interoperability, this guide includes recommended practices for the shared data elements required for submission. Please see the research study documentation for in-depth mappings on the R4 version and the necessary extensions needed to ensure interoperability.

#### Added Profile Restrictions

To ensure consistency across all NCPI research studies represented in FHIR, there are some additional requirements which must be enforced. These requirements are derived from the Differential Table section of this document.

##### The following requirements are true for all NCPI Research Studies

* each study should have its accession ID added as an identifier. This is an identifier provided by DbGAP or other organization which represents a common identifier recognized by similar research groups.
* each study should have its study name as the title.
* for those studies which exist as part of a larger study, the parent study should be referenced in the study’s partOf property.
* enrollment must contain 1 reference of type, Study Group.
* category must contain the Coding from NCPI StudyCohort.
* principalInvestigator must be of type Practitioner if present. (Note: we are using practitioner to maintain consistency with existing FHIR structures.)

##### Recommended Practices

To ensure consistency across all NCPI research studies represented in FHIR, there are some additional elements which should be included if applicable to your study. A recommended element is one that is important and will likely have value for those trying to understand the study’s purpose and usefulness but not essential for validation against the profile. Those elements labeled as optional are not central to the fundamental understanding of the study’s content but may play a key role in a study being findable.

[ table related to NCPI shared data elements goes here ]

For a more detailed view of these elements as well as the recommended FHIR mappings please see the research study documentation.

##### Population Details

Each NCPI Research must have one Study Group which must, at the very least, indicate the total number of patients enrolled at the time the data was loaded into FHIR.

Additional Study Groups may be included to describe various aspects of the study’s population.

###### Usage

* Derived from this Resource Profile: Research Study Subject
* Refer to this Resource Profile: Study Summary and Study Variable Summary
* Examples for this Resource Profile: ResearchStudy/cmg-research-study-bhcmg and ResearchStudy/ncpi-research-study-01

Notes:
As mentioned in the section, “Added Profile Restrictions” above, each NCPI Research must have one NCPI Study Group which must, at the very least, indicate the total number of patients enrolled at the time the data was loaded into FHIR.

##### Practices for Summary Only Resources

For Studies loaded into Summary Only FHIR servers, the Study’s Study Group resources must have the quantity. This promotes findability by enabling researchers without current access to the study’s row-level data to get basic study details including the different subject counts.

For studies that exist alongside row-level data, the Study’s Study Group resources should have each corresponding Patient referenced in the Group’s members array.

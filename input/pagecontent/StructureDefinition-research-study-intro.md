The NCPI Research Study is based upon the core HL7 FHIR ResearchStudy resource (R4) and acts as the umbrella for grouping and describing all other study resources..

For the purposes of interoperability, this guide includes recommended practices for the shared data elements required for submission.

Please see the research study documentation for in-depth mappings on the R4 version and the necessary extensions needed to ensure interoperability.

### Added Profile Restrictions

To ensure consistency across all NCPI research studies represented in FHIR, there are some additional requirements which must be enforced. These requirements are derived from the [Differential Table](structuredefinition-ncpi-research-study#profile) section of this document.


#### The following requirements are true for all NCPI Research Studies:

* each study **should** have its _accession ID_ added as an identifier. This is an identifier provided by DbGAP or other organization which represents a common identifier recognized by similar research groups.
* each study **should** have its _study name_ as the title.
* for those studies which exist as part of a larger study, the parent study **should** be referenced in the study’s _partOf_ property.
* enrollment **must** contain 1 reference of type, [Study Group](structuredefinition-research-study-group).
* category **must** contain the Coding from NCPI [StudyCohort](CodeSystem-ncpi).
* _principalInvestigator_ **must** be of type _Practitioner_ if present. (Note: we are using practitioner to maintain consistency with existing FHIR structures.)


### Recommended Practices

To ensure consistency across all NCPI research studies represented in FHIR, there are some additional elements which should be included if applicable to your study. A recommended element is one that is important and will likely have value for those trying to understand the study’s purpose and usefulness but not essential for validation against the profile. Those elements labeled as optional are not central to the fundamental understanding of the study’s content but may play a key role in a study being _findable_.


#### Shared Data Elements


<table>
  <tr>
   <td><strong>NCPI Shared Data Elements</strong>
   </td>
   <td><strong>HL7 FHIR (R4) Element</strong>
   </td>
   <td><strong>Recommended or Optional</strong>
   </td>
   <td><strong>Notes</strong>
   </td>
  </tr>
  <tr>
   <td>Study description
   </td>
   <td>description
   </td>
   <td>Recommended
   </td>
   <td> 
   </td>
  </tr>
  <tr>
   <td>Disease/focus
   </td>
   <td>condition
   </td>
   <td>Recommended
   </td>
   <td>Should also have one or more Codings provided, indicating the disease or phenotypes that were interrogated during the study’s execution
   </td>
  </tr>
  <tr>
   <td>Attribution
   </td>
   <td>relatedArtifact
   </td>
   <td>Recommended
   </td>
   <td>This can include, but not limited to; principal investigators, grant numbers, etc.
   </td>
  </tr>
  <tr>
   <td>Study weblinks
   </td>
   <td>relatedArfifact
   </td>
   <td>Optional
   </td>
   <td>These elements fall under the StudyDescription element located in the <a href="structuredefinition-ncpi-research-study#added-profile-restrictions">Added Profile Restrictions</a> section of this document.
   </td>
  </tr>
  <tr>
   <td>Study design
   </td>
   <td><a href="structuredefinition-research-study-design">studyDesign</a>
   </td>
   <td>Optional
   </td>
   <td>These elements fall under the StudyDescription element located in the <a href="structuredefinition-ncpi-research-study#added-profile-restrictions">Added Profile Restrictions</a> section of this document.
   </td>
  </tr>
  <tr>
   <td>Study type
   </td>
   <td><a href="structuredefinition-research-study-design">studyDesign</a>
   </td>
   <td>Optional
   </td>
   <td>These elements fall under the StudyDescription element located in the <a href="structuredefinition-ncpi-research-study#added-profile-restrictions">Added Profile Restrictions</a> section of this document.
   </td>
  </tr>
  <tr>
   <td>Citation
   </td>
   <td>relatedArtifact
   </td>
   <td>Optional
   </td>
   <td> 
   </td>
  </tr>
  <tr>
   <td>Study documents
   </td>
   <td>relatedArtifact
   </td>
   <td>Optional
   </td>
   <td> 
   </td>
  </tr>
</table>


For a more detailed view of these elements as well as the recommended FHIR mappings please see the research study documentation.


#### Population Details

Each NCPI Research must have one [Study Group](structuredefinition-study-group) which must, at the very least, indicate the total number of patients enrolled at the time the data was loaded into FHIR.

Additional Study Groups may be included to describe various aspects of the study’s population.

**Usage:**



* Derived from this Resource Profile: [Research Study Subject](structuredefinition-research-study-subject)
* Examples for this Resource Profile: [ResearchStudy/cmg-research-study-bhcmg](researchstudy-cmg-research-study-bhcmg) and [ResearchStudy/ncpi-research-study-01](researchstudy-ncpi-research-study-01)


### Notes:

As mentioned in the section, “Added Profile Restrictions” above, each NCPI Research must have one NCPI [Study Group](structuredefinition-study-group) which must, at the very least, indicate the total number of patients enrolled at the time the data was loaded into FHIR.


### Practices for Summary Only Resources

For Studies loaded into Summary Only FHIR servers, the Study’s Study Group resources **must** have the quantity. This promotes findability by enabling researchers without current access to the study’s row-level data to get basic study details including the different subject counts.

For studies that exist alongside row-level data, the Study’s Study Group resources **should** have each corresponding Patient referenced in the Group’s members array.

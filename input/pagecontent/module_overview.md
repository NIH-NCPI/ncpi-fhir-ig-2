While interoperability is a primary objective for using FHIR, research data by it's very nature is quite varied. Much of the data requires approval before access is permitted, yet researchers must know the data exists before they can begin the approval process. Because of issues such as these, the IG itself is broken into modules designed to support specific use cases. For a FHIR server hosting a certain dataset, those building the ETL need only concern themselves with the modules that apply to the use cases describing the datasets they are working with.

<div style="text-align: center;">
    <img style="display: block; margin: 0 auto; margin-bottom: 20px;" width="60%" src="ncpi_modules_relationship_overview.png" alt="Modular IG Design" />
</div>

Some use cases, such as the Data Dictionary component, may be useful across many or even all of the servers implementing the NCPI FHIR IG while others, such as Family Relationships, apply only to a fraction of those servers. Study summary and meta-data would likely lack traditional restrictions on their accessibility and could be hosted on a public server, while row-level, restricted data would be require some sort of authorization to access. 

Administrators for these FHIR servers should selectively apply only those module profiles that apply to the machines expected use cases, providing clear delineation for what sorts of data can be found therein. 

#### Table of Logical Models & Profiles

|**Name**|**Logical Model**|**FHIR Profile**|
|Aliquot|[Shared Data Model for Aliquot](StructureDefinition-SharedDataModelAliquot.html)|[Aliquot Profile](StructureDefinition-ncpi-sample.html)|
|Biospecimen Collection|[Shared Data Model for Biospecimen](StructureDefinition-SharedDataModelBiospecimenCollection.html)|[Biospecimen Profile](StructureDefinition-ncpi-sample.html)|
|Sample|[Shared Data Model for Sample](StructureDefinition-SharedDataModelSample.html)|[Sample Profile](StructureDefinition-ncpi-sample.html)|
|Family Relationship|[Shared Data Model for Family Relationship](StructureDefinition-SharedDataModelFamilyRelationship.html)|[Family Relationship Profile](StructureDefinition-ncpi-family-relationship.html)|
|File|[Shared Data Model for File](StructureDefinition-SharedDataModelFile.html)|[File Profile](StructureDefinition-ncpi-file.html)|
|Participant|[Shared Data Model for Participant](StructureDefinition-SharedDataModelResearchParticipant.html)|[Participant Profile](StructureDefinition-ncpi-participant.html)|
|Person|[Shared Data Model for Person](StructureDefinition-SharedDataModelPerson.html)|[Person Profile](StructureDefinition-ncpi-person.html)|
|Research Collection|[Shared Data Model for Research Collection](StructureDefinition-SharedDataModelResearchCollection.html)|[Research Collection Profile](StructureDefinition-ncpi-research-collection.html)|
|Access Policy|[Shared Data Model for Access Policy](StructureDefinition-SharedDataModelResearchDataAccessPolicy.html)|[Access Policy Profile](StructureDefinition-ncpi-research-access-policy.html)|
|Study Participant|[Shared Data Model for Study Participant](StructureDefinition-SharedDataModelStudyParticipant.html)|[Study Participant Profile](StructureDefinition-ncpi-Study-Participant.html)|
|Study Family|[Shared Data Model for Study Family](StructureDefinition-SharedDataModelStudyFamily.html)|[Study Family Profile](StructureDefinition-ncpi-study-family.html)|
|Research Study|[Shared Data Model for Research Study](StructureDefinition-SharedDataModelResearchStudy.html)|[Research Study Profile](StructureDefinition-ncpi-research-study.html)|
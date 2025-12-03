# Shared Data Model for Research Study - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Shared Data Model for Research Study**

## Logical Model: Shared Data Model for Research Study 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelResearchStudy | *Version*:0.2.0 |
| Draft as of 2025-12-03 | *Computable Name*:CdmResearchStudy |

 
The**Shared Data Model for Research Study**represents the understanding of what a Research Study is from the context of users and authors of the NCPI FHIR IG. 

# ResearchStudy Definition

## Basic Definition

The **ResearchStudy** FHIR resource represents an individual research effort and acts as a grouper or “container” for that effort’s study participants and their related data files. It provides information about the research effort including the purpose, goal, and contact information. In addition to being informational, a ResearchStudy resource describes who has responsibility for and authority to share the associated data files.

### Limits

#### Participant Identifier Context

A top level (parent) ResearchStudy should encompass a single **participant identifier context**. A participant identifier context can be understood as a unique research-based ID for an individual, and is directly related to governance and administration of the participant and their data.

A participant identifier context functions within the research space similarly to how an MRN functions within the healthcare space. One individual may have different MRNs at different institutions. Each of these MRNs is an example of a patient identifier context. This context also conveys aspects of governance and authority, because the systems that use the same MRN will generally fall under the same authority when it comes to protecting or sharing data. A participant identifier context works the same way- it defines a space in which a particular identifier is used for a participant, and is contiguous with the authority to share or responsibility to protect research data gathered about that participant.

Because each parent (top-level) ResearchStudy should represent a single participant identifier context, participants may only belong to one parent ResearchStudy (though they may be grouped into multiple subStudies below the main ResearchStudy).

#### Funding, Protocol, Organization

Usually, a ResearchStudy will align with a set of funds, with an organization, or with a particular protocol. However there may be cases where there is more than one applicable protocol, source of funding, or organization involved in a given instance of ResearchStudy. Always default to the idea of participant identifier context when determining whether an effort that spans multiple protocols, funding sources, or organizations should be considered a single ResearchStudy.

#### Data Files

Participant Specific Data files should always be associated with participants within a particular Participant Identifier Context. As a result, data files can only ever belong to a single parent ResearchStudy. If files from one context are reused in a new, separate analysis, the new ResearchStudy should point back to the original source files in their original ResearchStudy context.

### Structure

#### Parent Study, Child Study

It is common for research efforts to have varied structures. Some may have multiple studies or study arms that together constitute a single effort. When determining how to represent a research effort within the model of ResearchStudy, consider the participant identifier context. If the studies in question all use the same study ID for the participant, and are governed under related protocols or investigator authority, these should be represented by the same parent ResearchStudy. If those studies do not use the same study ID for the participant, and are governed under unrelated protocols or investigator authority, these should be represented by different ResearchStudies.

Studies which all use the same participant identifier context may be represented as individual child studies (also called sub-studies) which all share a common parent ResearchStudy. This allows researchers to represent the important unique characteristics of the individual study, while maintaining the appropriate governance structure for data sharing.

#### Consent Groups, Access Groups, Data Use Groups

Data within a study might be subject to different access or data use limitations depending on local or national governance, protocol documents, consent documents, or more. Items with similar consent, access, or data use controls should be grouped together.

#### Related Studies

Some research efforts may be related to each other in ways that are important to track, even if these studies cover different Participant Identifier Contexts. One example of this might be research efforts that are part of the same consortium. These efforts might share a common funder and organization, and may even share some aspects of methodology or design, but constitute separate ResearchStudy instances. The consortial relationship can be recorded in the Consortium attribute.

> Note: studies could be related via funding, or by sharing of participants - do we need to include the possibility to document this type of relationship?

## Research Study Attributes

### PersistentIdentifier

Each instance of ResearchStudy should have one accession identifier, and can be supplied as a combination of namespace + identifier. This identifier should be globally unique and will be external facing (not an internal ID). An example of an appropriate AccessionNumber value would be a dbgap phs ID.

### ParentStudy

ResearchStudy objects that represent substudies (or child studies) as described above should have a value populated for ParentStudy. SubStudies may have only one immediate ParentStudy.

### Name

Name is a repeatable object that consists of sets of two fields. All ResearchStudy records must have at least one Name object with Name.Type=”formal title”.

#### Name.Text

Name.Text is the string object that is used to document a name used for this research study

#### Name.Type

Name.Type defines the type of name provided in the Name.Text field for this Name object. Name.Type can include formal name, nickname, acronym, alternative name.

### Description

Description should provide a short summary of relevant and important information about the study. For example, this could include the primary purpose of the study, study design and findings, technologies used, and/or content being shared via the study. If possible, the description should use original language. If the description uses copyrighted material, similar to dbGaP requirements please include the following within the description: “Reprinted from [Article Citation], with permission from [Publisher].

### Website

A URL for a website that provides information about the research effort as a whole. This should not be a URL to specific study materials such as data dictionaries, github repos, or other technical documentation - that can be added under AdditionalDocumentation.

### Total Participants

Number of total participants represented by the data in this study. (Optional)

### StudyFocus - Option 2

SubjectFocus is a repeatable object that describes the primary focus(es) of the study. This can include terms related to disease area, intervention, drug, device, or other focus. MeSH terms are preferred, but other terms may be used if there is no appropriate MeSH term. If a non-MeSH term is used, it is preferable that the term be selected from an ontology/controlled vocabulary rather than supplied as free text.

#### StudyFocus.Term

The term used to describe the focus of the study. A valid MeSH is preferred.

#### StudyFocus.TermSource

The source ontology or vocabulary for SubjectFocus.Term.

### ErollmentCriteria

EnrollmentCriteria describes the inclusion and exclusion criteria used to enroll participants in this study. This can be provided as a free text description, but may also be structured using bullets, tables, or other organizational methods.

### Population

Population is a repeatable object that consists of sets of two fields. Population provides an overall description of the general population enrolled in the study, including basic demographics at a minimum and other useful population descriptors as appropriate.

#### PopulationType

A term that specifies the population being described

#### PopulationDescription

A free text field that provides more information about the population specified in PopulationType within the context of this researchStudy.

### Citation

Provide any relevant information regarding how to cite this study. This can be as specific as including a full citation or as simple as a DOI.

### Publications

Provide a list of publications that use this data. This may be updated to include new publications as they are created.

### AdditionalDocumentation

AdditionalDocumentation should be used to provide URLs, citations, or other appropriate references to technical documentation that is important for understanding the data included in this study. This can include data dictionaries, methods descriptions, github repositories, case report forms (CRFs), or any other relevant documentation.

### Consortium

If the data in this study was gathered as part of a consortial effort, list the consortium here.

### Acknowledgements

Acknowledgements describes any attribution or acknowledgements relevant to the study. This can include but is not limited to funding sources, organizational affiliations or sponsors.

### Personnel

Every study must have at least one Primary Contact defined. Additional personnel such as Primary Investigator(s), Administrator(s), Collaborator(s) or other roles may also be included. If there are no appropriate individuals who can serve as primary contact for a study, an organization may be provided.

#### Personnel.Name

The name of the person being described.

#### Personnel.Role

The role of the person being described. This is a controlled list of terms.

#### Personnel.Organization

The organizational affiliation of the person being described.

-------

Additional thoughts:

* Fields we might consider including - please add your thoughts or other fields that you think of 
* Consent codes 
* listed in notes section but not sure if we decided to include this
 
* Short codes 
* What does this mean?
 
* Sponsor orgs 
* this is covered under attribution but could be called out as its own item if we feel that's useful or necessary
 
* Related studies 
* Studies that are related to this one in ways other that parent/child or consortium
* Not sure that we need this, but we could consider it (or add it later)
 
* PI/Study Contact 
* Gather some information about who the primary contact should be for this study
 
* Tax ID - from Mike Feolo in 26 Sep mtg 
* Taxonomy ID
 
 

For other documentation:

* Add best practices for how to create an ID if there is not an appropriate one already available 
* Look for paper about FAIR ID creation
 
* Add total participants elsewhere (perhaps calculated from portal ETL)

**Usages:**

* Use this Logical Model: [Shared Data Model for Research Study](StructureDefinition-SharedDataModelResearchStudy.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/SharedDataModelResearchStudy)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-SharedDataModelResearchStudy.csv), [Excel](StructureDefinition-SharedDataModelResearchStudy.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "SharedDataModelResearchStudy",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelResearchStudy",
  "version" : "0.2.0",
  "name" : "CdmResearchStudy",
  "title" : "Shared Data Model for Research Study",
  "status" : "draft",
  "date" : "2025-12-03T18:37:31+00:00",
  "publisher" : "NCPI FHIR Working Group",
  "contact" : [
    {
      "name" : "NCPI FHIR Working Group",
      "telecom" : [
        {
          "system" : "url",
          "value" : "http://example.org/example-publisher"
        },
        {
          "system" : "email",
          "value" : "ncpi-fhir-ig@googlegroups.com"
        }
      ]
    }
  ],
  "description" : "The **Shared Data Model for Research Study** represents the understanding of what a Research Study is from the context of users and authors of the NCPI FHIR IG.",
  "fhirVersion" : "4.0.1",
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelResearchStudy",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [
      {
        "id" : "SharedDataModelResearchStudy",
        "path" : "SharedDataModelResearchStudy",
        "short" : "Shared Data Model for Research Study",
        "definition" : "The **Shared Data Model for Research Study** represents the understanding of what a Research Study is from the context of users and authors of the NCPI FHIR IG."
      },
      {
        "id" : "SharedDataModelResearchStudy.persistentIdentifier",
        "path" : "SharedDataModelResearchStudy.persistentIdentifier",
        "short" : "External facing, globally unique identifier.",
        "definition" : "External facing, globally unique identifier.",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Identifier"
          }
        ]
      },
      {
        "id" : "SharedDataModelResearchStudy.parentStudy",
        "path" : "SharedDataModelResearchStudy.parentStudy",
        "short" : "Parent study, required only for substudies.",
        "definition" : "Parent study, required only for substudies.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/SharedDataModelResearchStudy"
          }
        ]
      },
      {
        "id" : "SharedDataModelResearchStudy.name",
        "path" : "SharedDataModelResearchStudy.name",
        "short" : "Name is a repeatable object that consists of sets of two fields.  All ResearchStudy records must have at least one Name object with Name.Type=”formal title”.",
        "definition" : "Name is a repeatable object that consists of sets of two fields.  All ResearchStudy records must have at least one Name object with Name.Type=”formal title”.",
        "min" : 1,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "SharedDataModelResearchStudy.name.text",
        "path" : "SharedDataModelResearchStudy.name.text",
        "short" : "The study's name",
        "definition" : "The study's name",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "string"
          }
        ]
      },
      {
        "id" : "SharedDataModelResearchStudy.name.type",
        "path" : "SharedDataModelResearchStudy.name.type",
        "short" : "Type of name or title this name relates to (formal-title, internale-name, familiar-name, etc)",
        "definition" : "Type of name or title this name relates to (formal-title, internale-name, familiar-name, etc)",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "code"
          }
        ],
        "binding" : {
          "strength" : "extensible",
          "valueSet" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/study-name-type-vs"
        }
      },
      {
        "id" : "SharedDataModelResearchStudy.description",
        "path" : "SharedDataModelResearchStudy.description",
        "short" : "short summary of relevant and important information about the study.",
        "definition" : "short summary of relevant and important information about the study.",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "string"
          }
        ]
      },
      {
        "id" : "SharedDataModelResearchStudy.website",
        "path" : "SharedDataModelResearchStudy.website",
        "short" : "A URL for a website that provides information about the research effort as a whole.",
        "definition" : "A URL for a website that provides information about the research effort as a whole.",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "url"
          }
        ]
      },
      {
        "id" : "SharedDataModelResearchStudy.totalParticipants",
        "path" : "SharedDataModelResearchStudy.totalParticipants",
        "short" : "Number of total participants represented by the data in this study.",
        "definition" : "Number of total participants represented by the data in this study.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "integer"
          }
        ]
      },
      {
        "id" : "SharedDataModelResearchStudy.studyFocus",
        "path" : "SharedDataModelResearchStudy.studyFocus",
        "short" : "The primary focus(es) of the study. This can include terms related to disease area, intervention, drug, device, or other focus. MeSH terms are preferred.",
        "definition" : "The primary focus(es) of the study. This can include terms related to disease area, intervention, drug, device, or other focus. MeSH terms are preferred.",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "SharedDataModelResearchStudy.studyFocus.term",
        "path" : "SharedDataModelResearchStudy.studyFocus.term",
        "short" : "The term used to describe the focus of the study. A valid MeSH is preferred.",
        "definition" : "The term used to describe the focus of the study. A valid MeSH is preferred.",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "string"
          }
        ]
      },
      {
        "id" : "SharedDataModelResearchStudy.studyFocus.termSource",
        "path" : "SharedDataModelResearchStudy.studyFocus.termSource",
        "short" : "The source ontology or vocabulary for subjectFocus.Term (optional if term uses curie).",
        "definition" : "The source ontology or vocabulary for subjectFocus.Term (optional if term uses curie).",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "string"
          }
        ]
      },
      {
        "id" : "SharedDataModelResearchStudy.enrollmentCriteria",
        "path" : "SharedDataModelResearchStudy.enrollmentCriteria",
        "short" : "EnrollmentCriteria describes the inclusion and exclusion criteria used to enroll participants in this study. This can be provided as a free text description, but may also be structured using bullets, tables, or other organizational methods.",
        "definition" : "EnrollmentCriteria describes the inclusion and exclusion criteria used to enroll participants in this study. This can be provided as a free text description, but may also be structured using bullets, tables, or other organizational methods.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "markdown"
          }
        ]
      },
      {
        "id" : "SharedDataModelResearchStudy.population",
        "path" : "SharedDataModelResearchStudy.population",
        "short" : "Population is a repeatable object that consists of sets of two fields. Population provides an overall description of the general population enrolled in the study, including basic demographics at a minimum and other useful population descriptors as appropriate.",
        "definition" : "Population is a repeatable object that consists of sets of two fields. Population provides an overall description of the general population enrolled in the study, including basic demographics at a minimum and other useful population descriptors as appropriate.",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "SharedDataModelResearchStudy.population.type",
        "path" : "SharedDataModelResearchStudy.population.type",
        "short" : "A term that specifies the population being described.",
        "definition" : "A term that specifies the population being described.",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "string"
          }
        ]
      },
      {
        "id" : "SharedDataModelResearchStudy.population.description",
        "path" : "SharedDataModelResearchStudy.population.description",
        "short" : "A free text field that provides more information about the population specified in PopulationType within the context of this researchStudy.",
        "definition" : "A free text field that provides more information about the population specified in PopulationType within the context of this researchStudy.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "string"
          }
        ]
      },
      {
        "id" : "SharedDataModelResearchStudy.citation",
        "path" : "SharedDataModelResearchStudy.citation",
        "short" : "Provide any relevant information regarding how to cite this study. This can be as specific as including a full citation or as simple as a DOI.",
        "definition" : "Provide any relevant information regarding how to cite this study. This can be as specific as including a full citation or as simple as a DOI.",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "string"
          }
        ]
      },
      {
        "id" : "SharedDataModelResearchStudy.publications",
        "path" : "SharedDataModelResearchStudy.publications",
        "short" : "Provide a list of publications that use this data. This may be updated to include new publications as they are created.",
        "definition" : "Provide a list of publications that use this data. This may be updated to include new publications as they are created.",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "string"
          }
        ]
      },
      {
        "id" : "SharedDataModelResearchStudy.additionalDocumentation",
        "path" : "SharedDataModelResearchStudy.additionalDocumentation",
        "short" : "AdditionalDocumentation should be used to provide URLs, citations, or other appropriate references to technical documentation that is important for understanding the data included in this study. This can include data dictionaries, methods descriptions, github repositories, case report forms (CRFs), or any other relevant documentation.",
        "definition" : "AdditionalDocumentation should be used to provide URLs, citations, or other appropriate references to technical documentation that is important for understanding the data included in this study. This can include data dictionaries, methods descriptions, github repositories, case report forms (CRFs), or any other relevant documentation.",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "string"
          }
        ]
      },
      {
        "id" : "SharedDataModelResearchStudy.consortium",
        "path" : "SharedDataModelResearchStudy.consortium",
        "short" : "If the data in this study was gathered as part of a consortial effort, list the consortium here.",
        "definition" : "If the data in this study was gathered as part of a consortial effort, list the consortium here.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "string"
          }
        ]
      },
      {
        "id" : "SharedDataModelResearchStudy.acknowledgements",
        "path" : "SharedDataModelResearchStudy.acknowledgements",
        "short" : "Acknowledgements describes any attribution or acknowledgements relevant to the study.  This can include but is not limited to funding sources, organizational affiliations or sponsors.",
        "definition" : "Acknowledgements describes any attribution or acknowledgements relevant to the study.  This can include but is not limited to funding sources, organizational affiliations or sponsors.",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "string"
          }
        ]
      },
      {
        "id" : "SharedDataModelResearchStudy.personnel",
        "path" : "SharedDataModelResearchStudy.personnel",
        "short" : "Every study must have at least one Primary Contact defined. Additional personnel such as Primary Investigator(s), Administrator(s), Collaborator(s) or other roles may also be included. If there are no appropriate individuals who can serve as primary contact for a study, an organization may be provided.",
        "definition" : "Every study must have at least one Primary Contact defined. Additional personnel such as Primary Investigator(s), Administrator(s), Collaborator(s) or other roles may also be included. If there are no appropriate individuals who can serve as primary contact for a study, an organization may be provided.",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "SharedDataModelResearchStudy.personnel.name",
        "path" : "SharedDataModelResearchStudy.personnel.name",
        "short" : "The name of the person being described.",
        "definition" : "The name of the person being described.",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "HumanName"
          }
        ]
      },
      {
        "id" : "SharedDataModelResearchStudy.personnel.role",
        "path" : "SharedDataModelResearchStudy.personnel.role",
        "short" : "The role of the person being described.",
        "definition" : "The role of the person being described.",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "code"
          }
        ],
        "binding" : {
          "strength" : "extensible",
          "valueSet" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/study-personnel-role-vs"
        }
      },
      {
        "id" : "SharedDataModelResearchStudy.personnel.organization",
        "path" : "SharedDataModelResearchStudy.personnel.organization",
        "short" : "The organizational affiliation of the person being described.",
        "definition" : "The organizational affiliation of the person being described.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "string"
          }
        ]
      }
    ]
  }
}

```

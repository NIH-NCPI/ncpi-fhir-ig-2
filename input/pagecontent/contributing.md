### Contributing Guidelines
The NCPI FHIR IG is intended to provide a framework within which research on human subjects of all kinds can be reliably stored and queried using the FHIR Standard APIs. Given the size of the research domain, it is expected that there will be gaps in the current model and to encourage contributions to help to improve the IG for researchers of all kinds. 

The guidelines provided below are intended to make the IG content easier to find as well as helping to ensure consistency across all contributors. 

#### Helpful Resources For Learning FSH and Sushi
* [FSH School](https://fshschool.org/) - This is a great resource for both reference and introductory material
* [Sushi Tutoria](https://fshschool.org/docs/sushi/tutorial/) - Walkthrough guide for creating a sushi project, creating a handful of profiles using sushi and building a formal IG website on your local system.
* [FSH Reference](https://build.fhir.org/ig/HL7/fhir-shorthand/) - Official HL7 Reference Guide 
* [Chat With FSH-ee Folks](https://chat.fhir.org/#narrow/stream/215610-shorthand) - This zulip channel is used by members of the FSH dev team and end-users and is an excellent source of help whenever you get stuck or would like to inquire about a possible feature

#### Contributor Lexicon
The following terms are used throughout this guide:

| Term | Definition | Note |
| ---- | ---------- | ---- |
| Implementer (Role) | The implementer is a technically experienced individual who is interested in the IG to inform them on how to transform data into FHIR resources that conform to the NCPI FHIR IG | |
| Researcher (Role) | A Researcher is someone who is responsible, who is interested in leveraging FHIR for storing a specific set of research data, but is not likely to be directly involved in the actual transformation of the data. | |
| Camel case | https://en.wikipedia.org/wiki/Camel_case | |
| Title case | https://en.wikipedia.org/wiki/Title_case | |
| Pascal case | Variant of [Camel case](https://en.wikipedia.org/wiki/Camel_case) where the first letter of the string is always upper case |  |
| Snake case | https://en.wikipedia.org/wiki/Snake_case | | 

#### IG Best Practices
According to [HL7](https://build.fhir.org/ig/FHIR/ig-guidance/best-practice.html), there are a number of points that should be considered when authoring content for an IG. We'll elaborate on a few outstanding points:

##### Target Audience and Succinct Narrative
According to the Best Practice guidelines linked above, the target audience is generally software developers (Implementers). However, we believe that, in addition to developers, researchers too will be expected to familiarize themselves with this IG to understand FHIR's role within the context of Interoperability. As such, pages describing the actual resources and their direct relationship to one another should target a software developer. Pages describing the research concepts that are being mapped into FHIR should be written for the general research investigator. 

In addition to recognizing the proper audience, it is important to avoid overly verbose narrative that isn't absolutely necessary. It is essential that the concepts are thorough but we must remain mindful of the time the end user will be able to spend using the IG itself. 

##### Preference For Long Pages With Sections
The IG itself is a static website. As such, longer pages allow end users to quickly search over a large amount of content at once by simply using the browsers basic search functionality. 

For the purposes of writing content for this IG which doesn't specifically refer to FHIR artifacts, the objective is to use a single file for each core concept. For instance, all content associated with the "Research Study" module should be captured inside the file, research_study.md file even though there may be a number of concepts discussed as part of that module. 

##### Write Intros for All Contributed Artifacts
These introductions get embedded into the artifact page itself and should clearly indicate what the artifact is intended for and how it relates to other profiles and resources. For some types of artifacts, such as CodeSystems and ValueSets, providing a thorough *Description* in the FSH definition may be sufficient. However, for Profiles, Logical models, Extensions and Examples, an intro.md should always be provided. 

##### Narrative Should be Consistent with Other IGs
TBD

##### Images and Diagrams
HL7 recommends that content should be created using free or inexpensive tools and not websites that may disappear in a few years time. 

TBD

#### Style Guide
##### Background
Contributing to IG content may take several different forms including:
* Markdown describing real-world research study concepts and motivations for some decisions relating to FHIR resource choices. 
* Markdown providing introductory material and notes for IG artifacts.
* FHIR Shorthand used to define IG artifacts including but not limited to: Profiles, Extensions, Terminologies and Examples.

In general, the markdown styles will apply to all markdown files. 

##### Filenames
###### No Spaces in Filenames
Filenames of all kinds should contain no whitespace. There are rules determining how we must name content that gets merged into the various artifact pages which is described over at [fshschool.org](https://fshschool.org/docs/sushi/project/) toward the bottom of that page. In order to clearly differentiate between these artifact components and the text narrative pages, those stand-alone narrative pages *must* exist in files named using [snake case](https://en.wikipedia.org/wiki/Snake_case). 

Sushi will parse the filename and apply [title case](https://en.wikipedia.org/wiki/Title_case) to construct a meaningful starting header and title. For titles where that doesn't work, such as fhir_basics which would incorrectly result in a title, *Fhir Basics*, contributors should add an appropriate entry to the sushi-config pages heading as can be seen in [this example configuration](https://fshschool.org/docs/sushi/configuration/). By assigning the title property for a given page, the contributor can provide any type of case as is appropriate. 

###### Artifact Intro and Notes
For intro and notes content that will be merged into the relevant artifact page, the publisher application itself is very specific: The filename should match the resulting HTML file in Humpback notation minus the extension followed by either "-intro.md" or "-notes.md". The material inside -intro.md files will appear *before* the differential table. Material inside -note.md files will appear afterward inside the header, *Notes". 

> To determine the correct filename corresponding to the artifact of interest, please see the file, fsh-generated/includes/fsh-link-references.md where you can find the resulting HTML filename for each FSH based artifact. 

###### Profiles, Extensions and Standalone Terminologies
All profiles, and any extensions/terminologies which aren't intended solely for the use of a single profile, should be defined inside a file named specifically for that resource according to the following pattern: 

[ *profile* or *logical* or *extension* or *codesystem* or *valueset* ]_[resource id].md

For instance, a profile with the id, ncpi-patient would be defined inside the file named: profile_ncpi-patient.fsh

###### Supporting Extensions, ValueSets, etc
Extensions and ValueSets that exist solely as supporting resources for a profile or other extension should be defined inside the file where the primary resource is defined. As an example, a ValueSet defining the various phenotype terms that are then bound to the profile, ncpi-phenotype, should be defined inside the same file as the ncpi-phenotype profile, profile_ncpi-phenotype.fsh. By keeping supporting resources together, we can minimize the number of clicks a developer will need to use to understand a given profile. 

> It should be noted that CodeSystems will generally warrant being defined in their own file unless their purpose seems intrinsically tied to a profile. For ValueSets which exist largely to realize the contents of a single CodeSystem, the ValueSet should be defined within the same file where the CodeSystem is defined. 

##### Authoring Module Content
Narrative content describing the research data that are to be stored inside FHIR will be aggregated together in *modules*. These modules are intended to represent common, real-world concepts such as the *Research Study* or *Study Summary* which will often be comprised of more than one actual real world entity. For instance, when we discuss a *research study*, we may need to discuss other, closely related things like *Consent*, *Consortia*, *Principle Investigators*, etc. Each of these should be described as completely as possible both in plain text, as well formally represented as a *Logical Model* using FHIR IG resources. This is necessary to clearly define what is is we are describing when discussing how one is expected to use the individual profiles. 

###### Logical Model 
Each distinct concept that necessary to convey the details that are to be captured in FHIR should be defined as a FHIR Logical model. Together, these represent the information model that represents the real-world space as completely as possible. Each field of these models can then be referred to in the profile pages to indicate how each aspect of the real-world model is represented in FHIR. 

###### Logical Model Intro
Similar to profiles, these logical models should have an intro file which contains a high level overview of the information being modelled with all clarifications necessary for a reader to fully understand each of the properties that they can find in the model's differential view. 

###### Logical Model Notes
We strongly recommend an accompanying notes section where the author is expected to describe the relationships of the current logical model component with any other module components. 

##### Use Cases
Use case narrative content is intended to address typical expectations an end user will have regarding a particular module's content once it has been loaded into FHIR. Use case details for a given Module should be stored inside a file named: 

use-case_(Module Name).md

Each individual use case associated with a given module will be enumerated as a level 2 header within the specified file. Use cases should consist of a narrative overview which references example resources defined within part of the IG. If a given use case requires information that isn't supported with the current set of examples, then that should be addressed by providing the necessary information either by adding it to existing examples or by creating additional example resources. 

While the use cases themselves will be highly technical and directed at implementers, a non-technical synopsis should be provided as the first paragraph of each use case to allow researchers to quickly ascertain what capabilities a fully compliant set of FHIR resources can do for them. 

##### Example Narrative
For each module, there should be a complementary example page which provides a high-level description of each example resource that is provided as a part of that module. This will be a mix of narrative and json segments which together, explain exactly how the resource content relates to the real world example upon which it was based. 

##### Artifacts
###### Profiles
EAch profile should be defined inside a file whose name matches the profile's id where the prefix, ncpi, is replaced with profile. Filenames should be written in kebob-case (all lower case with each word separated by the dash, "-"). Any CodeSystems, ValueSets, Extensions, etc which exist solely for use by the profile should be defined alongside the profile. 

**Profile Naming Conventions**
Profile names **must** be prefixed with the letters, "NCPI-". The rest of the name should be concise and informative. For instance, a profile relating to a Human Patient might be named, **NCPI-HumanPatient** which would be defined inside the file, "profile-human_patient.fsh". 

**Provide appropriate short description**
Because our use case doesn't align perfectly with the official FHIR objective of sharing EHR data, we will often be using standard FHIR properties differently 

###### Profile Intro
Each profile **must** contain *intro* content. This is entirely directed at the implementer and should provide that individual all the details they need in order to populate a resources of a given profile. The following subsections are required:

1. Added Profile Restrictions
This should simply be a quick, easy to read summary of the changes listed in the differential table. 

2. Information Model Mapping Table

This will provide a table with fields from the relevant logical model, what they map to inside the profile, whether it is recommended, required or optional, and any notes needed for clarification. 

###### Profile Notes
The notes section is optional but is where you would provide additional context about how this profile relates to resources. 

###### Logical Model Intro
The logical model defines the *information model* describing the current, real world data that is to be mapped into FHIR. Unlike the other *intro* sections, the logical model intro is directed at the researcher and is intended to clarify exactly what this model represents.

###### Logical Model Notes
The notes section is optional and is intended to be used to provide additional context about how this *real world component* fits in with other parts of the larger information model. 

###### Extension Intro
TBD

###### Extension Notes
TBD
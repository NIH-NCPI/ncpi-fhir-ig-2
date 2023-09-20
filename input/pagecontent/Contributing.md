### Contributing Guidelines
The NCPI FHIR IG is intended to provide a framework within which research on human subjects of all kinds can be reliably stored and queried using the FHIR Standard APIs. Given the size of the research domain, it is expected that there will be gaps in the current model and we welcome contributions to help to improve the IG for researchers in all domains. 

The guidelines provided below are intended to make the IG content easier to find as well as helping to ensure consistency across all contributors. 

#### IG Best Practices
According to [HL7](https://build.fhir.org/ig/FHIR/ig-guidance/best-practice.html), there are a number of points that should be considered when authoring content for an IG. We'll elaborate on a few outstanding points:

##### Target Audience
According to the Best Practice guidelines linked above, the target audience is generally software developers. However, we believe that, in addition to developers, researchers too will be expected to familiarize themselves, to some degree, with this IG to understand FHIR's role within the context of Interoperability. As such, pages describing the actual resources and their direct relationship to one another should target a software developer. Pages describing the research concepts that are being mapped into FHIR may be written for the general research investigator. 

##### Preference For Long Pages With Sections
The reasoning behind the preference for longer pages with multiple headers over separate files comes down to the user's ability to use their browser's search functionality to quickly find the exact point of interest. 

For the purposes of writing content for this IG which doesn't specifically refer to FHIR artifacts, the objective is to use a single file for each core concept. For instance, all content associated with the "Research Study" module should be captured inside the file, research_study.md file even though there may be a number of concepts discussed as part of that module. 

##### Write Intros for All Contributed Artifacts
These introductions get embedded into the artifact page itself and should clearly indicate what the artifact is intended for and how it fits into the bigger picture. 

##### Narrative Should be Consistent with Other IGs
TBD

##### Images and Diagrams
HL7 recommends that content should be created using free or inexpensive tools and not websites that may disappear in a few years time. 

#### Style Guide
##### Background
Contributing to IG content may take several different forms including:
* Markdown describing real-world research study concepts and motivations for some decisions relating to FHIR resource choices. 
* Markdown providing introductory material and notes for IG artifacts.
* FHIR Shorthand used to define IG artifacts including but not limited to: Profiles, Extensions, Terminologies and Examples.

In general, the markdown styles will apply to all markdown files. 

##### Filenames
###### No Spaces in Filenames
Filenames of all kinds should contain no whitespace.

###### Specialized Snake Case for Page Content
For content that gets embedded into artifact pages, the filename is prescribed by the publisher application which requires camel case. For everything else, contributors should use a modified version of [snake case](https://en.wikipedia.org/wiki/Snake_case).

The filename itself will be used as the top level heading and capitalization will be adjusted according to standard [Title Case](https://en.wikipedia.org/wiki/Title_case) guidance unless the filename itself uses specific case. For example, the filename, fhir_basics.md, would result in the heading: *# Fhir Basics* which is not ideal. As a result, the filename should be FHIR_Basics.md which will result in proper capitalization of FHIR in the heading. 

Because of situations such as these, we require all filenames that contributors have control over the naming be done using snake case. To make it clearer, it is required that proper case is applied to those filenames as well. 

###### Artifact Intro and Notes
For intro and notes content that will be merged into the relevant artifact page, the publisher application itself is very specific: The filename should match the resulting HTML file in Humpback notation minus the extension followed by either "-intro.md" or "-notes.md". The material inside -intro.md files will appear *before* the differential table. Material inside -note.md files will appear afterward inside the header, *Notes". 

###### Profiles, Extensions and Standalone Terminologies



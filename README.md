# NCPI FHIR Implementation Guide 2

Welcome to NCPI FHIR IG 2. The goal for this repository is to relaunch the IG project
with a clearer focus, an explicit style guide using the current tools including Sushi v3. 

This repository is currently under development.
Feel free to [take a look](https://torstees.github.io/ncpi-fhir-ig-2/) at the working version.

## 👨🏻‍💻 Contributor's Guide 

If you would like to contribute to this project, please take a look at the 
software development lifecycle and standard practices for this project
[here](./.github/contributing.md).

# 📝 IG Development Details 
The contribution content I wrote back during the initial start for IG v2 is somewhat outdated, but I don't have time to correct it for this gathering. So, here are some key points to consider if you are up for contributing:

## Module Content Requirements
### FSH Artifacts
#### Profiles, Logical Model and Extensions
Non-example content specific to a single module should be defined within a single file inside the directory, input/fsh/modules. This file should be named clearly after the module name (such as participant.fsh for participant specific module content.) Content that should be contained within this file should be all terminologies, extensions and profiles that are specific to the module only. All modules should have a complete set of Logical Models defined the reflects the SharedDataModel representation upon which the mappings and profile are based. 

For extensions and terminologies that directly relate to more than one module should be defined elsewhere (such as input/fsh/extensions, input/fsh/terminologies, etc).

#### Non-Profile Multi-Module Content
For terminologies, extensions and other content that is necessary for more than one module, they should be defined inside the corresponding directory (input/fsh/terminologies, etc). For filenames, it should be clear from the filename what is contained inside. 

For tightly coupled entities, such as a ValueSet which includes only terms from a given CodeSystem, the ValueSet should be defined alongside the parent CodeSystem. However, if the ValueSet is comprised of codes from multiple CodeSystems and isn't defined for a singular purpose (such as binding to a specific field within a profile), that ValueSet should be defined inside the terminology directory within its own file. 

#### Examples 
Defining examples for your IG components will eliminate warnings from your QA log, but also allow you to catch tricky issues with your profiles and extensions. It is therefore, expected that all Profiles and Extensions in active use be accompanied by an example resource. 

### Markdown Content

#### Technical Documentation for Profiles and Relationships - Artifact Intro and Notes
For intro and notes content that will be merged into the relevant artifact page, the publisher application itself is very specific: The filename should match the resulting HTML file in Humpback notation minus the extension followed by either "-intro.md" or "-notes.md". The material inside -intro.md files will appear *before* the differential table. Material inside -note.md files will appear afterward inside the header, *Notes". These files will be written into the directory, input/pagecontent.

For profiles, we definitely should define:
*    **Added Profile Restrictions** Where we list all properties as being **should**, **must**, etc. 
*    **Recommended Practices** - We should add bullets for each relevant property under headings of **recommended** and **optional**. 

Also, under **Recommended Practices** and guidance about any special cases such as we are doing with [Population Details](https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition-ncpi-research-study.html#population-details)

**Notes** (sibling to the **Recommended Restrictions**) Should indicate any other general profile relationships that should be discussed.

> To determine the correct filename corresponding to the artifact of interest, please see the file, fsh-generated/includes/fsh-link-references.md where you can find the resulting HTML filename for each FSH based artifact. 

For each profile, there should always be a matching -info file that contains the following information:
* Profile Overview indicating the role the profile is expected to perform
* Mapping table showing how properties from the logical model(s) map into the specified profile
* Relationships between the current profile and other resources and profiles

The -notes.md file is optional and should be used to add clarification for unusual cases or other details that should be called out that don't naturally fit within the typical use cases. 



#### Example Overview
Each module should have at least a single example page as part of the release. This should, at the very least, link each of the associated example profiles with an explanation of how they fit together if the example spans multiple profiles. To provide context within the example page itself, you can provide -info.md and -notes.md pages similarly to profiles, extensions, etc. 

#### Module Overview
High-level documentation written for researchers and non-implementers about the module's purpose should be provided inside an aptly named file, prefixed with module_ inside the input/pagecontent directory. 

#### (TBD) Use-Case Overview
Overview of each of the use cases for which the module was was designed to address. 

These markdown files will be defined inside the input/pagecontent directory with names that begin with *use-case-*.

### Linking Markdown into the Menu
Content inside properly formed -info.md and -notes.md files will be merged into the appropriate pages built around the various FSH artifacts. The other .md files inside input/pagecontent will be compiled into .html but must be manually referenced either by link markup from other pages, or directly to the menu via the root file, sushi-config.yaml. 

We provide a top level menu entry for Modules, Use Case Guides and Examples and authors should link their top level pages accordingly. Profiles will automatically be added to the the Artifacts links. 

// This code system is intended solely for example purposes and should be
// replaced with the different code systems that are managed by those groups
// that currently oversee the relevant ontologies such as dbGaP and GA4GH 
// (DUO). However, until we have a server that contains those code systems
// that can be used as an terminology server, this subset will do. 
CodeSystem: ResearchDataAccessCode
Id: research-data-access-code
Title: "Research Data Access Codes"
Description: "Enumerated list of access codes such as dbGaP consent codes among others."
* ^url = $ncpi-data-access-code
* ^experimental = false
* ^caseSensitive = true
* #GRU "General Research Use"
* #HMB "Health/Medical/Biomedical"
* #DS "Disease-Specific (Disease/Trait/Exposure)"
* #IRB "IRB approval required"
* #PUB "Publication required"
* #COL "Collaboration Required"
* #NPU "Not-for-profit use only"
* #MDS "Methods"
* #GSO "Genetic studies only"

ValueSet: ResearchDataAccessCodeVS
Id: research-data-access-code-vs
Title: "Research Data Access Codes"
Description: "Enumerated list of access codes such as dbGaP consent codes among others."
* ^experimental = false
* include codes from system $ncpi-data-access-code

Logical: CdmResearchDataAccessPolicy
Id: SharedDataModelResearchDataAccessPolicy
Title: "Shared Data Model for Research Data Access Policy"
Description: "The **Shared Data Model for Research Data Access Policy** represent the various Data Use Agreements that govern a researcher's access and use of research data."
* policyCode 1..* code "Enumerated values that describe the policy including: dbGaP consent codes, DUO Terms among others. The bindings to these terms should enable groups to create their own codes."
* policyCode from ResearchDataAccessCodeVS
* description 1..1 string "Free text further describing the policy, including description of necessary steps for gaining access to data"
* website 0..1 url "TBD"
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

ValueSet: MeshTerms
Id: mesh-terms
Title: "MeSH Terms"
Description: "Example terms from Medical Subject Headings (MeSH) Ontology"
* ^version = "0.1.0"
* ^status = #draft
* ^experimental = false
* include codes from system $mesh

Invariant: completed-consent-code
Description: "If category is DS then there must be a ResearchConsentDiseaseAbbreviation"
Expression: "provision.purpose.where(code = 'DS').empty() or provision.extension.where(url='https://nih-ncpi.github.io/ncpi-fhir-ig/StructureDefinition/research-disease-use-limitation').exists()"
Severity: #error

Extension: ResearchDiseaseUseLimitation
Id: research-disease-use-limitation
Title: "Research Usage Limitation Disease Code"
Description: "Coding associated with limitation on what research can be performed this data."
* insert SetContext(Consent.provision) 
* value[x] only CodeableConcept 
* valueCodeableConcept from mesh-terms (example)

Extension: AccessPolicyDescription
Id: access-policy-description
Title: "Access Policy Description"
Description: "Descriptive text summarizing the policy restrictions and other details associated with this access provision."
* insert SetContext(Consent) 
* value[x] only markdown
* valueMarkdown 1..1
* valueMarkdown ^short = "Descriptive text summarizing the policy restrictions and other details associated with this access provision."

Profile: NcpiResearchAccessPolicy
Parent: Consent 
Id: ncpi-research-access-policy
Title: "NCPI Research Access Policy"
Description: "Limitations and/or requirements that define how a user may gain access to a particular set of data."
* ^version = "0.1.0"
* ^status = #draft
* category = http://terminology.hl7.org/CodeSystem/consentcategorycodes#research "Research Information Access" 
* provision.purpose from research-data-access-code-vs (extensible)
* provision.extension contains ResearchDiseaseUseLimitation named diseaseUseLimitation 0..1
* provision.extension[diseaseUseLimitation] ^short = "Consent Code Disease Abbreviation"
* obeys completed-consent-code
* extension contains AccessPolicyDescription named description 0..1
* extension[description] ^short = "Descriptive text summarizing the policy restrictions and other details associated with this access provision."
// This may be somewhat unnecessary
* extension contains ResearchWebLink named website 0..1
* extension[website] ^short = "URL describing the policy restrictions in detail."

Logical: CdmResearchDataAccessPolicy
Id: SharedDataModelResearchDataAccessPolicy
Title: "Shared Data Model for Research Data Access Policy"
Description: "The **Shared Data Model for Research Data Access Policy** represent the various Data Use Agreements that govern a researcher's access and use of research data."
* policyCode 1..* code "Enumerated values that describe the policy including: dbGaP consent codes, DUO Terms among others. The bindings to these terms should enable groups to create their own codes."
* policyCode from ResearchDataAccessCodeVS
* description 1..1 string "Free text further describing the policy, including description of necessary steps for gaining access to data"
* website 0..1 url "TBD"
// These Terminologies are being temporarily housed as part of the IG 
// to eliminate some of the warnings and errors. They can be removed 
// in the event of upgrading to R5 or later

/*
CodeSystem: TitleType
Id: title-type
Title: "TitleType"
Description: "Used to express the reason and specific aspect for the variant title, such as language and specific language."
//* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[=].valueCode = #cds
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[=].valueCode = #trial-use
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 0
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:2.16.840.1.113883.4.642.1.1492"
* ^version = "4.0.1"
* ^status = #draft
* ^experimental = false
* ^publisher = "HL7 (FHIR Project)"
* ^contact.telecom[0].system = #url
* ^contact.telecom[=].value = "http://hl7.org/fhir"
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "fhir@lists.hl7.org"
* ^caseSensitive = true
//* ^valueSet = "http://hl7.org/fhir/ValueSet/title-type"
* ^content = #complete
* #primary "Primary title" "Main title for common use. The primary title used for representation if multiple titles exist."
* #official "Official title" "The official or authoritative title."
* #scientific "Scientific title" "Title using scientific terminology."
* #plain-language "Plain language title" "Title using language common to lay public discourse."
* #subtitle "Subtitle" "Subtitle or secondary title."
* #short-title "Short title" "Brief title (e.g. 'running title' or title used in page headers)"
* #acronym "Acronym" "Abbreviation used as title"
* #earlier-title "Different text in an earlier version" "Alternative form of title in an earlier version such as epub ahead of print."
* #language "Different language" "Additional form of title in a different language."
* #autotranslated "Different language derived from autotranslation" "Machine translated form of title in a different language, language element codes the language into which it was translated by machine."
* #human-use "Human use" "Human-friendly title"
* #machine-use "Machine use" "Machine-friendly title"
* #duplicate-uid "Different text for the same object with a different identifier" "An alternative form of the title in two or more entries, e.g. in multiple medline entries"

ValueSet: TitleTypeVS
Id: title-type-vs
Title: "Title Type"
Description: "Used to express the reason and specific aspect for the variant title, such as language and specific language."
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[=].valueCode = #cds
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[=].valueCode = #trial-use
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 1
* ^url = "http://hl7.org/fhir/ValueSet/title-type"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:2.16.840.1.113883.4.642.3.2974"
* ^version = "4.0.1"
* ^status = #draft
* ^experimental = true
* ^publisher = "HL7 (FHIR Project)"
* ^contact.telecom[0].system = #url
* ^contact.telecom[=].value = "http://hl7.org/fhir"
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "fhir@lists.hl7.org"
* ^jurisdiction = $m49.htm#001 "World"
* ^immutable = true
* include codes from system $title-type


CodeSystem: ResearchStudyPartyRole
Id: research-study-party-role
Title: "Research Study Party Role"
Description: "This is a ResearchStudy's party role."
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[=].valueCode = #brr
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[=].valueCode = #trial-use
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 0
* ^url = "http://hl7.org/fhir/research-study-party-role"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:2.16.840.1.113883.4.642.4.1968"
* ^version = "4.0.1"
* ^status = #active
* ^experimental = false
* ^publisher = "HL7 (FHIR Project)"
* ^contact.telecom[0].system = #url
* ^contact.telecom[=].value = "http://hl7.org/fhir"
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "fhir@lists.hl7.org"
* ^jurisdiction = $m49.htm#001 "World"
* ^caseSensitive = true
// * ^valueSet = "http://hl7.org/fhir/ValueSet/research-study-party-role"
* ^content = #complete
* #sponsor "sponsor" "sponsor"
* #lead-sponsor "lead-sponsor" "lead-sponsor"
* #sponsor-investigator "sponsor-investigator" "sponsor-investigator"
* #primary-investigator "primary-investigator" "primary-investigator"
* #collaborator "collaborator" "collaborator"
* #funding-source "funding-source" "funding-source"
* #general-contact "general-contact" "general-contact"
* #recruitment-contact "recruitment-contact" "recruitment-contact"
* #sub-investigator "sub-investigator" "sub-investigator"
* #study-director "study-director" "study-director"
* #study-chair "study-chair" "study-chair"
* #irb "Institutional Review Board"

ValueSet: ResearchStudyPartyRoleVS
Id: research-study-party-role-vs
Title: "Family Types Codes"
Description: "A value set with all codes used for the expected family types."
* ^version = "0.1.0"
* ^status = #active
* include codes from system http://hl7.org/fhir/research-study-party-role
*/
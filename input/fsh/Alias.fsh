
// US Core Extensions
Alias: $us-core-race = http://hl7.org/fhir/us/core/StructureDefinition/us-core-race
Alias: $us-core-ethnicity = http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity
Alias: $cqf-relativeDateTime = http://hl7.org/fhir/StructureDefinition/cqf-relativeDateTime

Alias: $omb-race-eth = urn:oid:2.16.840.1.113883.6.238 // Race & Ethnicity - CDC
Alias: $admin-gender = http://hl7.org/fhir/administrative-gender

Alias: $ncpi = https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/ncpi
Alias: $study-name-type = https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/study-name-type
Alias: $ncpi-collection-type = https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/collection-type
Alias: $ncpi-data-access-code = https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/research-data-access-code
Alias: $ncpi-data-access-type = https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/research-data-access-type

// EST 2025-04-09 - This causes an error in the QA report. However, we have 
// been using that system for a while now, and DbGAP was using it as well, 
// at least at some point in the past. 
Alias: $mesh = http://terminology.hl7.org/CodeSystem/MSH
// Alias: $mesh = http://id.nlm.nih.gov/mesh/

Alias: $ncpi-dob-method = https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/research-data-date-of-birth-method
Alias: $meta-data-elements = https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/metadata-elements

Alias: $ncit = http://purl.obolibrary.org/obo/ncit.owl
Alias: $ucum = http://unitsofmeasure.org
Alias: $loinc = https://loinc.org
Alias: $body-location-qualifier = http://hl7.org/fhir/us/mcode/ValueSet/mcode-body-location-qualifier-vs
Alias: $laterality-qualifier = http://hl7.org/fhir/us/mcode/ValueSet/mcode-laterality-qualifier-vs
Alias: $storage-method = https://terminology.hl7.org/5.3.0/ValueSet-v2-0493.html

Alias: $spec = https://terminology.hl7.org/5.3.0/ValueSet-v2-0493.html

Alias: $snomedct_us = http://snomed.info/sct
Alias: $family-role-code = http://terminology.hl7.org/CodeSystem/v3-RoleCode|3.0.0
// https://terminology.hl7.org/6.4.0/NamingSystem-v3-nciThesaurus.html
// says that this is the official URL for the NCI Thesaurus.
Alias: $nci-thesaurus = http://terminology.hl7.org/NamingSystem/v3-nciThesaurus
// Another URL for the NCI thesaurus - this one has better behavior for the terminology
// server. It comes from the identifiers section of
// https://terminology.hl7.org/6.4.0/NamingSystem-v3-nciThesaurus.html
Alias: $nci-thesaurus-alt = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl|3.0.0
Alias: $ncpi-family-types = https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/ncpi-family-types
Alias: $ncpi-family-member = http://terminology.hl7.org/ValueSet/v3-FamilyMember|3.0.0
// The purl URL for the kin ontology does not work, though it is the official URL.
// You can find the description of the ontology on GitHub:
// https://ga4gh.github.io/pedigree-fhir-ig/CodeSystem-kin.html
Alias: $ga4gh-kin = http://purl.org/ga4gh/kin.fhir|0.1.0
Alias: $family-patient-record = http://hl7.org/fhir/StructureDefinition/familymemberhistory-patient-record|4.0.1

Alias: $mondo = http://purl.obolibrary.org/obo/mondo.owl
Alias: $edam = http://edamontology.org

Alias: $hpo = http://human-phenotype-ontology.org
Alias: $phenotypic-feature-assertion = https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/phenotypic-feature-assertion
Alias: $condition-type = https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/condition-type
Alias: $assay-strategy = https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/assay-strategy-cs

// We are pulling some R4B and R5 CS and VS into the IG to eliminate some of the warnings/errors. 
// The following aliases are related to those items and can be removed once we migrate the IG to 
// support a newer FHIR version. 
Alias: $title-type = http://hl7.org/fhir/title-type
Alias: $m49.htm = http://unstats.un.org/unsd/methods/m49/m49.htm
Alias: $research-study-party-role = http://hl7.org/fhir/research-study-party-role
// NCPI Research Study
Instance: research-study-gregor
InstanceOf: NcpiResearchStudy
Title: "Example study from GREGoR"
Usage: #example
Description: "Example study from GREGoR"
* identifier[0]
  * value = "AnVIL_GREGoR_GSS_U08_GRU"

* status = #completed

Instance: gregor-research-study-participants
InstanceOf: ResearchStudyGroup
Title: "Participants from the GREGoR research study"
Usage: #example
Description: "Participants from the GREGoR research study"
* identifier[0]
  * system = "https://anvil.terra.bio/"
  * value = "GREGoR Participants"
* name = "Participants from the GREGoR research study GSS U08 GRU"
* quantity = 555
* actual = true
* type = #person
* extension[+] 
  * url = "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study"
  * valueReference = Reference(research-study-gregor)

Instance: gregor-gru-consent
InstanceOf: NcpiResearchAccessPolicy
Title: "GREGoR General Research Use (GRU) Consent"
Usage: #example
Description: "General Research Use (GRU)"
* status = #draft
* scope = http://terminology.hl7.org/CodeSystem/consentscope#research
* category.coding = http://terminology.hl7.org/CodeSystem/consentcategorycodes#research
* policyRule = http://terminology.hl7.org/CodeSystem/consentpolicycodes#cric
* provision.type = http://hl7.org/fhir/consent-provision-type#permit
* provision.purpose[+] = $ncpi-data-access-code#GRU "General Research Use"
* extension[description].valueMarkdown = "Use of the data is limited only by the terms of the model Data Use Certification."
* extension[accessType].valueCodeableConcept = $ncpi-data-access-type#controlled

// NCPI Participant
Instance: GSS654321
InstanceOf: NcpiParticipant
Title: "Example family member based on data from GREGoR"
Usage: #example
Description: "Example family member based on data from GREGoR."
// Notice that we can use the DbGaP study ID for easier searching
* identifier[0]
  * system = "https://anvil.terra.bio/"
  * value = "GSS654321"
* extension[+] 
  * url = "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study"
  * valueReference = Reference(research-study-gregor)

Instance: GSS123456
InstanceOf: NcpiParticipant
Title: "Example patients based on data from GREGoR"
Usage: #example
Description: "Example patients based on data from GREGoR."
// Notice that we can use the DbGaP study ID for easier searching
* identifier[0]
  * system = "https://anvil.terra.bio/"
  * value = "GSS123456"
* extension[usCoreBirthSex].valueCode = #M "Male"
* extension[usCoreRace]
  * extension[ombCategory].valueCoding =  $omb-race-eth#2106-3 "White"
  * extension[text].valueString = "White"
* extension[usCoreEthnicity]
  * extension[ombCategory].valueCoding =  $omb-race-eth#2186-5 "Not Hispanic or Latino"
  * extension[text].valueString = "Not Hispanic or Latino"
* extension[population].valueString = "English|Scottish"
* extension[+] 
  * url = "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study"
  * valueReference = Reference(research-study-gregor)

Instance: gregor-example-person
InstanceOf: NcpiPerson
Title: "Example patients based on data from GREGoR"
Usage: #example
Description: "Example patients based on data from GREGoR"
* identifier
  * system = "https://anvil.terra.bio"
  * value = "PS_000"
* link
  * target = Reference(GSS123456) 
* extension[+] 
  * url = "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study"
  * valueReference = Reference(research-study-gregor)

Instance: gregor-example-participantstudy
InstanceOf: NcpiStudyParticipant
Title: "Example mappings based on data from GREGoR"
Usage: #example
Description: "Example mappings based on data from GREGoR"
* individual = Reference(GSS123456)  
* study = Reference(research-study-gregor)
* status = #candidate
* consent = Reference(gregor-gru-consent)
* extension[+] 
  * url = "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study"
  * valueReference = Reference(research-study-gregor)

// NCPI Family

Instance: GSS5555
InstanceOf: NcpiStudyFamily
Title: "Example patients based on data from GREGoR"
Usage: #example
Description: "Example patients based on data from GREGoR."
* id = "gregor-study-family"
* identifier[0]
  * system = "https://anvil.terra.bio/"
  * value = "GSS5555"
* type = #person // Required by Group with required VS
* actual = true // Required by Group
* extension[familyType].valueCodeableConcept = $ncpi-family-types#Duo "Duo"
* member[0].entity = Reference(GSS123456)
* member[0].entity.extension[familyRole].valueCodeableConcept = $family-role-code#CHILD "child"
* member[1].entity = Reference(GSS654321)
* member[1].entity.extension[familyRole].valueCodeableConcept = $family-role-code#MTH "mother"
* extension[+] 
  * url = "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study"
  * valueReference = Reference(research-study-gregor)

Instance: gregor-family-relationship-mother
InstanceOf: NcpiFamilyRelationship
Title: "An example family relationship based on data from GREGoR"
Usage: #example
Description: "An example family relationship based on data from GREGoR."
* subject = Reference(GSS123456)
* focus = Reference(GSS654321)
* code = $family-role-code#CHILD "child"
* status = #registered
* extension[+] 
  * url = "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study"
  * valueReference = Reference(research-study-gregor)

// NCPI Condition as an assertion
Instance: GSS123456-condition-assertion
InstanceOf: NcpiParticipantAssertion
Title: "Example condition assertion using data from GREGoR"
Usage: #example
Description: "Example condition assertion using data from GREGoR"
* status = #final
* subject = Reference(GSS123456)
* code.coding = $hpo#HP:0006951 /* condition code */
* code.text = "retrocerebellar cyst" /* condition text */
* valueCodeableConcept = $phenotypic-feature-assertion#Present /* assertion */
* category = $condition-type#Disease /* condition type */
* component.code = #ageAtOnset
* component[ageAtOnset].valueQuantity 
  * value = 64
  * unit = "years"
  * system = $ucum
  * code = #a  
* component.code = #otherModifiers
* component[otherModifiers].valueCodeableConcept = $hpo#HP:0012832
* extension[+] 
  * url = "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study"
  * valueReference = Reference(research-study-gregor)

// NCPI Condition as a condition summary
Instance: GSS123456-condition-summary
InstanceOf: NcpiConditionSummary
Title: "Example condition summary using data from GREGoR"
Usage: #example
Description: "Example condition summary using data from GREGoR"
* subject = Reference(GSS123456)
* code.coding = $hpo#HP:0006951 /* condition code */
* code.text = "retrocerebellar cyst" /* condition text */
* category = $condition-type#Disease /* condition type */
* onsetAge
  * value = 64
  * unit = "years"
  * system = $ucum
  * code = #a  
* extension[otherConditionModifiers].valueCodeableConcept = $hpo#HP:0012832
* extension[+] 
  * url = "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study"
  * valueReference = Reference(research-study-gregor)

// NCPI Participant Assertion
Instance: GSS123456-assertion
InstanceOf: NcpiParticipantAssertion
Title: "Example assertion using data from GREGoR"
Usage: #example
Description: "Example assertion using data from GREGoR"
* status = #final
* subject = Reference(GSS123456)
* code.coding = $snomedct_us#271603002 /* assertion code */
* code.text = "Height / growth measure" /* assertion description */
* valueQuantity
  * value = 66 
  * unit = "inches"
  * code = $ucum#[in_us]
  * system = $ucum
* category = $condition-type#Clinical-Finding /* assertion type */
* component.code = #ageAtAssertion
* component[ageAtAssertion].valueQuantity 
  * value = 38
  * unit = "year"
  * code = $ucum#a
  * system = $ucum
* extension[+] 
  * url = "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study"
  * valueReference = Reference(research-study-gregor)

//NCPI Biospecimen
Instance: GSS123456-01-010p /*Collection Event ID can't have underscores*/
InstanceOf: NCPISample
Title: "Example biospecimen based on data from GREGoR"
Usage: #example
Description: "Example biospecimen based on data from GREGoR"
* identifier.value = "GSS123456-s1" /*Sample ID*/
* subject = Reference(GSS123456) /*Participant ID*/
* type.text = "Blood Draw" /*Sample Type*/
* collection.method.text = "Blood"
* extension[+] 
  * url = "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study"
  * valueReference = Reference(research-study-gregor)

//NCPI Biospecimen
Instance: GSS123456-01-010 /*Collection Event ID can't have underscores*/
InstanceOf: NCPISample
Title: "Example biospecimen based on data from GREGoR"
Usage: #example
Description: "Example biospecimen based on data from GREGoR"
* identifier.value = "GSS123456-s1" /*Sample ID*/
* subject = Reference(GSS123456) /*Participant ID*/
* type.text = "DNA" /*Sample Type*/
* parent = Reference(GSS123456-01-010p)
* extension[+] 
  * url = "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study"
  * valueReference = Reference(research-study-gregor)

//NCPI Biospecimen
Instance: GSS123456-01-010x /*Collection Event ID can't have underscores*/
InstanceOf: NCPISample
Title: "Example biospecimen based on data from GREGoR, intentionally breaking the no parent and collection together rule. This should generate a warning."
Usage: #example
Description: "Example biospecimen based on data from GREGoR that will generate a warning"
* identifier.value = "GSS123456-s1" /*Sample ID*/
* subject = Reference(GSS123456) /*Participant ID*/
* type.text = "DNA" /*Sample Type*/
* collection.method.text = "DNA"
* parent = Reference(GSS123456-01-010p)
* extension[+] 
  * url = "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study"
  * valueReference = Reference(research-study-gregor)

// NCPI File
Instance: GSS123456-01-010-SG-2
InstanceOf: NcpiFile
Title: "Example file based on GREGoR"
Usage: #example
Description: "Use case of file information from GREGor"
* identifier.value = "GSS123456-01-010-SG-2"
* subject = Reference(GSS123456)
* description = "Aligned DNA short read"
* type = $edam#operation_3198 "Read mapping"
* extension[content-version].valueString = "V1"
* status = #current
* content[+]
  * attachment.url = "gs://fc-secure-a1f0e28d-c9d9-43bb-b4ba-5e0h81784fb1/GSS123456/SR_GS/GSS123456.bam"
  * extension[locationAccess].valueReference = Reference(kf-gru-dac-consent)
* extension[fileFormat].valueCodeableConcept.coding = $edam#format_2572 "BAM"
* extension[fileSize]
  * valueQuantity
    * value = 1044770380
    * unit = "bytes"
* extension[hash]
  * extension[hashValue].valueString = "9c2460c4647fdc57261f040042863fa0"
  * extension[hashType].valueCode = #md5
* extension[+] 
  * url = "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study"
  * valueReference = Reference(research-study-gregor)

// NCPI File Metadata
Instance: gregor-example-metadata
InstanceOf: NcpiBAMCRAM
Title: "Example file metadata for a BAM-CRAM file from GREGoR"
Usage: #example
Description: "Example file metadata for a BAM-CRAM file from GREGoR"
* focus = Reference(GSS123456)
* status = #final
* code = $edam#format_2572 /*for a BAM file | $edam#format_3462 for CRAM*/
* specimen = Reference(GSS123456-01-010) /*using specimen is a placeholder for using a slice of component for related samples*/
* component[assay_strategy].valueCodeableConcept = $obi#0002117 "whole genome sequencing assay"
* component[platform_instrument].valueCodeableConcept = $obi#0002001 "Illumina HiSeq 2000"
* component[library_prep].valueCodeableConcept = #polyA
* component[library_selection].valueCodeableConcept = #PolyTEnrichment
* component[target_region].valueCodeableConcept.text = "Not Applicable"
* component[strandedness].valueCodeableConcept = #stranded
* component[reference_genome].valueCodeableConcept = #GRCh38
* component[is_paired_end].valueBoolean = false
* component[workflow_tool].valueCodeableConcept = #bammem
* component[workflow_type].valueCodeableConcept = #alignment
* extension[+] 
  * url = "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/part-of-study"
  * valueReference = Reference(research-study-gregor)

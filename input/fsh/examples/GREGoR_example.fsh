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

Instance: GSS123456
InstanceOf: NcpiParticipant
Title: "Example patients based on data from GREGoR"
Usage: #example
Description: "Example patients based on data from GREGoR."
// Notice that we can use the DbGaP study ID for easier searching
* identifier[0]
  * system = "https://anvil.terra.bio/"
  * value = "GSS123456"
* extension[us-core-birth-sex].valueCode = #M "Male"
* extension[us-core-race]
  * extension[ombCategory].valueCoding =  $omb-race-eth#2106-3 "White"
  * extension[text].valueString = "White"
* extension[us-core-ethnicity]
  * extension[ombCategory].valueCoding =  $omb-race-eth#2186-5 "Not Hispanic or Latino"
  * extension[text].valueString = "Not Hispanic or Latino"
* extension[population].valueString = "English|Scottish"

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

Instance: gregor-example-participantstudy
InstanceOf: NcpiStudyParticipant
Title: "Example mappings based on data from GREGoR"
Usage: #example
Description: "Example mappings based on data from GREGoR"
* individual = Reference(GSS123456)
* study = Reference(research-study-gregor)
* status = #candidate
* consent = Reference(gregor-gru-consent)

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
* extension[family-type].valueCodeableConcept = $ncpi-family-types#Duo "Duo"
* member[0].entity = Reference(GSS123456)
* member[0].entity.extension[family-role].valueCodeableConcept = $family-role-code#CHILD "child"
* member[1].entity = Reference(GSS654321)
* member[1].entity.extension[family-role].valueCodeableConcept = $family-role-code#MTH "mother"

Instance: gregor-family-relationship-mother
InstanceOf: NcpiFamilyRelationship
Title: "An example family relationship based on data from GREGoR"
Usage: #example
Description: "An example family relationship based on data from GREGoR."
* subject = Reference(GSS123456)
* focus = Reference(GSS654321)
* code = $family-role-code#CHILD "child"
* status = #registered

// NCPI Condition
Instance: GSS123456-condition
InstanceOf: NcpiCondition
Title: "Example condition using data from GREGoR"
Usage: #example
Description: "Example condition using data from GREGoR"
* status = #final
* subject = Reference(GSS123456)
* code.coding = $hpo#HP:0006951 /* condition code */
* code.text = "retrocerebellar cyst" /* condition text */
* valueCodeableConcept = $condition-assertion#Present /* assertion */
* category = $condition-type#Disease /* condition type */
* component.code = #ageAtOnset
* component[ageAtOnset].valueCodeableConcept = $hpo#HP:0011463 /* age at onset */
* component.code = #otherModifiers
* component[otherModifiers].valueCodeableConcept = $hpo#HP:0012832

//NCPI Biospecimen
Instance: GSS123456-01-010 /*Collection Event ID can't have underscores*/
InstanceOf: NCPICollectedSample
Title: "Example biospecimen based on data from GREGoR"
Usage: #example
Description: "Example biospecimen based on data from GREGoR"
* identifier.value = "GSS123456-s1" /*Sample ID*/
* subject = Reference(GSS123456) /*Participant ID*/
* type.text = "DNA" /*Sample Type*/
* collection.method.text = "DNA"

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
  * extension[location-access].valueReference = Reference(kf-gru-dac-consent)
* extension[file-format].valueCodeableConcept.coding = $edam#format_2572 "BAM"
* extension[file-size]
  * valueQuantity
    * value = 1044770380
    * unit = "bytes"
* extension[hash]
  * extension[hash-value].valueString = "9c2460c4647fdc57261f040042863fa0"
  * extension[hash-type].valueCode = #md5

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
* component[assay_strategy].valueCodeableConcept = #WGS
* component[platform_instrument].valueCodeableConcept = #IlluminaHiSeq2000
* component[library_prep].valueCodeableConcept = #polyA
* component[library_selection].valueCodeableConcept = #PolyTEnrichment
* component[target_region].valueCodeableConcept.text = "Not Applicable"
* component[strandedness].valueCodeableConcept = #stranded
* component[reference_genome].valueCodeableConcept = #GRCh38
* component[is_paired_end].valueBoolean = false
* component[workflow_tool].valueCodeableConcept = #bammem
* component[workflow_type].valueCodeableConcept = #alignment

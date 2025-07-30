
Instance: rs1
InstanceOf: NcpiResearchStudy
Title: "Example study"
Usage: #example
Description: "Example study"
* status = #active
* identifier[0]
  * system = "https://example.org/"
  * value = "study-001"


// NCPI Participant
Instance: p1
InstanceOf: NcpiParticipant
Title: "Example patient"
Usage: #example
Description: "Example patient"
* identifier[0]
  * system = "https://example.org/"
  * value = "patient-001"

// NCPI Participant
Instance: p2
InstanceOf: NcpiParticipant
Title: "Example patient"
Usage: #example
Description: "Example patient"
* identifier[0]
  * system = "https://example.org/"
  * value = "patient-002"

// NCPI Biospecimen
Instance: s1
InstanceOf: NCPISample
Title: "Example biospecimen"
Usage: #example
Description: "Example biospecimen"
* identifier[0]
  * system = "https://example.org/"
  * value = "specimen-001"
* subject = Reference(Patient/p1)
* type = #BLD

// NCPI Biospecimen
Instance: s2
InstanceOf: NCPISample
Title: "Example biospecimen"
Usage: #example
Description: "Example biospecimen"
* identifier[0]
  * system = "https://example.org/"
  * value = "specimen-002"
* subject = Reference(Patient/p2)
* type = #BLD


// Group
Instance: rs1-g1
InstanceOf: ResearchStudyGroup
Title: "Example study group"
Usage: #example
Description: "Example study group"
* identifier[0]
  * system = "https://example.org/"
  * value = "study-group-001"
* name = "Participants from the Example research study"
* quantity = 2
* actual = true
* type = #person
* member[+]
  * entity = Reference(Patient/p1)
* member[+]
  * entity = Reference(Patient/p2)

// Software "ActivityDefinition" See:
// * https://build.fhir.org/definition.html#8.18.1.12
// * https://hl7.org/fhir/R4/device-DeviceDefinitions.html#Device.version

// ========= 1. BWA Identified by GIT =========
Instance: BWA-GIT-ActivityDefinition
InstanceOf: ActivityDefinition
Title: "BWA definition by GIT"
Description: "BWA software tool defined using GIT repository"
Usage: #example
* url = "https://github.com/lh3/bwa"
* status = #active
// produces: 	Unknown code from in the CodeSystem 'http://snomed.info/sct' version 'http://snomed.info/sct/900000000000207008/version/20250201
// * code = $snomedct_us#461571000124105 "Whole genome sequencing"
// * code = $snomedct_us#731000124108 "Nucleic acid sequencing"

// measure "anything"
* code = $snomedct_us#122869004 "Measurement procedure (procedure)"
// measure "substance"
// * code = $snomedct_us#430925007 "Measurement of substance (procedure)"
// measure "Nucleic acid"
// * code = $snomedct_us#398545005 "Nucleic acid assay (procedure)"

* version = "0.7.19"
* identifier[0].system = "https://github.com"
* identifier[0].value = "lh3/bwa"

// ========= 2. Submitted Data =========
Instance: Submitted-Data-ActivityDefinition
InstanceOf: ActivityDefinition
Title: "Data uploaded as part of Research Study"
Description: "A priori data uploaded as part of Research Study"
Usage: #example
* status = #active
* url = "https://nih-ncpi.github.io/ncpi-fhir-ig-2/ActivityDefinition/Submitted-Data-ActivityDefinition"
// https://loinc.org/74735-2/ Health data repository
// https://loinc.org/100924-0 "Safe and secure healthcare data"
* code = $loinc#77544-5 "Data collected"
// * identifier[0].system = "https://loinc.org"
// * identifier[0].value = "77544-5"


// NCPI Assay
Instance: a1
InstanceOf: NcpiAssay
Usage: #example
Title: "Example assay simple association of Patient and Specimen, WGS performed by BWA"
* status = #active
* intent = #order
* instantiatesUri[+] = "https://github.com/lh3/bwa"
* subject = Reference(Patient/p1)
* specimen[+] = Reference(Specimen/s1)
// A shifted datetime
* authoredOn = "2025-04-30T09:00:00Z"
* reasonCode.text = "Investigating suspected hereditary condition"


// NCPI Assay
Instance: a2
InstanceOf: NcpiAssay
Usage: #example
Title: "Example assay association of with Group of participants and set of specimens"
* status = #active
* intent = #order
* instantiatesUri[+] = "https://nih-ncpi.github.io/ncpi-fhir-ig-2/ActivityDefinition/Submitted-Data-ActivityDefinition"
* subject = Reference(Group/rs1-g1)
* specimen[+] = Reference(Specimen/s1)
* specimen[+] = Reference(Specimen/s2)
* reasonCode.text = "Investigating suspected hereditary condition"
* authoredOn = "2025-04-30T10:00:00Z"
// 3 hours past a reference time
* extension[age].valueAge = 3 'h'

// NCPI Assay
Instance: a3
InstanceOf: NcpiAssay
Usage: #example
Title: "Example assay association of with Group of participants and set of specimens, provenance"
* status = #active
* intent = #order
* instantiatesUri[+] = "https://nih-ncpi.github.io/ncpi-fhir-ig-2/ActivityDefinition/Submitted-Data-ActivityDefinition"
* subject = Reference(Group/rs1-g1)
* specimen[+] = Reference(Specimen/s1)
* specimen[+] = Reference(Specimen/s2)
* reasonCode.text = "Identify single nucleotide changes (SNPs), insertions, deletions (indels), and larger structural variations"
* authoredOn = "2025-04-30T10:00:00Z"
// 3 hours past a reference time
* extension[age].valueAge = 3 'h'


CodeSystem: WGSParameters
Description: "Parameters for WGS Task Input example"
Title: "WGS Task Input Parameters"
Id: wgs-parameters
* #fastq-format "FASTQ Format"
* #read-length "Read Length"
* #paired-end "Paired End"
* #adapter-sequence "Adapter Sequence"
* #min-base-quality "Minimum Base Quality"
* #reference-genome "Reference Genome"
* #mark-duplicates "Mark Duplicates"
* #variant-caller "Variant Caller"
* #variant-caller-mode "Variant Caller Mode"
* #ploidy "Ploidy"
* #population-database "Population Database"
* #annotation-tool "Annotation Tool"
* #target-region "Target Region"

Alias: $wgs-parameters = https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/wgs-parameters


Instance: t1
InstanceOf: Task
Title: "Example Task based on assay a1"
Usage: #example
Description: "Optional, detailed provenance referencing assay a1"
* status = #requested
* intent = #order
* basedOn = Reference(ServiceRequest/a2)
* focus = Reference(Patient/p1)


Instance: t2
InstanceOf: Task
Title: "Example Task based on assay a2"
Usage: #example
Description: "Optional, detailed provenance referencing assay a2 with example inputs"
* status = #requested
* intent = #order
* basedOn = Reference(ServiceRequest/a1)
* focus = Reference(Group/rs1-g1)

* input[0].type = $wgs-parameters#fastq-format "FASTQ Format"
* input[0].valueString = "Phred+33"

* input[1].type = $wgs-parameters#read-length "Read Length"
* input[1].valueInteger = 150

* input[2].type = $wgs-parameters#paired-end "Paired End"
* input[2].valueBoolean = true

* input[3].type = $wgs-parameters#adapter-sequence "Adapter Sequence"
* input[3].valueString = "AGATCGGAAGAGC"

* input[4].type = $wgs-parameters#min-base-quality "Minimum Base Quality"
* input[4].valueInteger = 20

* input[5].type = $wgs-parameters#reference-genome "Reference Genome"
* input[5].valueString = "GRCh38"

* input[6].type = $wgs-parameters#mark-duplicates "Mark Duplicates"
* input[6].valueBoolean = true

* input[7].type = $wgs-parameters#variant-caller "Variant Caller"
* input[7].valueString = "GATK HaplotypeCaller"

* input[8].type = $wgs-parameters#variant-caller-mode "Variant Caller Mode"
* input[8].valueString = "gVCF"

* input[9].type = $wgs-parameters#ploidy "Ploidy"
* input[9].valueInteger = 2

* input[10].type = $wgs-parameters#population-database "Population Database"
* input[10].valueString = "gnomAD v3"

* input[11].type = $wgs-parameters#annotation-tool "Annotation Tool"
* input[11].valueString = "Ensembl VEP"

* input[12].type = $wgs-parameters#target-region "Target Region"
* input[12].valueString = "Whole genome"


// NCPI File
Instance: f1
InstanceOf: NcpiFile
Title: "Example file created by assay a1"
Usage: #example
Description: "Example file created by assay a1"
* identifier.value = "f1"
* subject = Reference(Patient/p1)
* status = #current
// R4
* context
  * related[+] = Reference(ServiceRequest/a1)
  * related[+] = Reference(DiagnosticReport/dr1)
// R5,R6
// * basedOn = Reference(ServiceRequest/a1)
* content[+]
  * attachment.url = "s3://foobar/example.bam"
* extension[file-format].valueCodeableConcept.coding = $edam#format_2572 "BAM"
* extension[file-size]
  * valueQuantity
    * value = 1044770380
    * unit = "bytes"
* extension[hash]
  * extension[hash-value].valueString = "9c2460c4647fdc57261f040042863fa0"
  * extension[hash-type].valueCode = #md5


// NCPI File
Instance: f2
InstanceOf: NcpiFile
Title: "Example file created by assay a2"
Usage: #example
Description: "Example file created by assay a2, associated with a group"
* identifier.value = "f2"
* subject = Reference(Group/rs1-g1)
* status = #current
// R4
* context
  * related[+] = Reference(ServiceRequest/a2)
  * related[+] = Reference(DiagnosticReport/dr2)
// R5,R6
// * basedOn = Reference(ServiceRequest/a1)
* content[+]
  * attachment.url = "s3://foobar/example2.bam"
* extension[file-format].valueCodeableConcept.coding = $edam#format_2572 "BAM"
* extension[file-size]
  * valueQuantity
    * value = 1044770381
    * unit = "bytes"
* extension[hash]
  * extension[hash-value].valueString = "9c2460c4647fdc57261f040042863fa2"
  * extension[hash-type].valueCode = #md5


// DiagnosticReport
Instance: dr1
InstanceOf: DiagnosticReport
Title: "Example Diagnostic Report for assay a1"
Usage: #example
Description: "Example Diagnostic Report for assay a1"
* basedOn = Reference(ServiceRequest/a1)
* status = #final
* code = $loinc#47045-0 "Study report"
* subject = Reference(Patient/p1)
// R5, R6
// * media[+]
//  * link = Reference(DocumentReference/f1)

Instance:  dr2
InstanceOf: DiagnosticReport
Title: "Example Diagnostic Report for assay a2"
Usage: #example
Description: "Example Diagnostic Report for assay a2"
* basedOn = Reference(ServiceRequest/a2)
* status = #final
* code = $loinc#47045-0 "Study report"
* subject = Reference(Group/rs1-g1)
// R5, R6
// * media[+]
//  * link = Reference(DocumentReference/f2)

// R4 back link from DocumentReference.context to DiagnosticReport
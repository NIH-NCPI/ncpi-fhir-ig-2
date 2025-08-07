
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
* text
  * div = "<div>BWA software tool defined using GIT repository</div>"
  * status = #additional
* url = "https://github.com/lh3/bwa"
* status = #active

// measure "anything"
// * code = $snomedct_us#122869004 "Measurement procedure (procedure)"
// measure "substance"
// * code = $snomedct_us#430925007 "Measurement of substance (procedure)"
// measure "Nucleic acid"
// * code = $snomedct_us#398545005 "Nucleic acid assay (procedure)"

* code = $edam#operation_3182 "Genome alignment"
* version = "0.7.19"

// ========= 2. Submitted Data =========
Instance: Submitted-Data-ActivityDefinition
InstanceOf: ActivityDefinition
Title: "Data submission"
Description: "A priori data uploaded as part of Research Study"
Usage: #example
* text
  * div = "<div>Data uploaded as part of Research Study submission</div>"
  * status = #additional
* status = #active
* url = Canonical(Submitted-Data-ActivityDefinition)
* code = $edam#topic_0219 "Data submission, annotation and curation"



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
InstanceOf: NcpiAssayTask
Title: "Example AssayTask with 2 Specimens and 2 Outputs"
Usage: #example

* status = #completed
* intent = #order
* code = $edam#operation_3670 "RNA-seq analysis"
* for = Reference(Patient/p1)
* instantiatesCanonical = Canonical(BWA-GIT-ActivityDefinition)
* executionPeriod.start = "2024-10-01"
* executionPeriod.end = "2024-10-02"
* note.text = "Paired tumor/normal assay with two outputs."
* extension[age].valueAge = 3 'h'

// Input specimens
* input[specimen][+].valueReference = Reference(Specimen/s1)
* input[specimen][+].valueReference = Reference(Specimen/s2)

// Input parameters
* input[+].type = $wgs-parameters#fastq-format "FASTQ Format"
* input[=].valueString = "Phred+33"

* input[+].type = $wgs-parameters#read-length "Read Length"
* input[=].valueInteger = 150

* input[+].type = $wgs-parameters#paired-end "Paired End"
* input[=].valueBoolean = true

* input[+].type = $wgs-parameters#adapter-sequence "Adapter Sequence"
* input[=].valueString = "AGATCGGAAGAGC"

* input[+].type = $wgs-parameters#min-base-quality "Minimum Base Quality"
* input[=].valueInteger = 20

* input[+].type = $wgs-parameters#reference-genome "Reference Genome"
* input[=].valueString = "GRCh38"

* input[+].type = $wgs-parameters#mark-duplicates "Mark Duplicates"
* input[=].valueBoolean = true

* input[+].type = $wgs-parameters#variant-caller "Variant Caller"
* input[=].valueString = "GATK HaplotypeCaller"

* input[+].type = $wgs-parameters#variant-caller-mode "Variant Caller Mode"
* input[=].valueString = "gVCF"

* input[+].type = $wgs-parameters#ploidy "Ploidy"
* input[=].valueInteger = 2

* input[+].type = $wgs-parameters#population-database "Population Database"
* input[=].valueString = "gnomAD v3"

* input[+].type = $wgs-parameters#annotation-tool "Annotation Tool"
* input[=].valueString = "Ensembl VEP"

* input[+].type = $wgs-parameters#target-region "Target Region"
* input[=].valueString = "Whole genome"

// Output document references
* output[result][+].valueReference = Reference(DocumentReference/f1)
* output[result][+].valueReference = Reference(DocumentReference/f2)


Instance: task-observation
InstanceOf: Observation
Title: "Task Observation Example"
Usage: #example
Description: "Observation related to a Task"
* status = #final
* code = $edam#data_1394 "Alignment score or penalty"
* focus = Reference(Task/t1)
* effectiveDateTime = "2025-05-01T09:00:00Z"
* valueQuantity = 42.0 '{score}'

Instance: t2
InstanceOf: NcpiAssayTask
Title: "AssayTask for assay a2"
Usage: #example
Description: "AssayTask for a group with 1 output"
* status = #completed
* intent = #order
* instantiatesUri[+] = Canonical(Submitted-Data-ActivityDefinition)
* code = $edam#topic_0219 "Data submission, annotation and curation"
* for = Reference(Group/rs1-g1)
* output[result][+].valueReference = Reference(DocumentReference/f3)
// 3 hours past a reference time
* extension[age].valueAge = 3 'h'


// NCPI File
Instance: f1
InstanceOf: NcpiFile
Title: "Example file created by assay t1"
Usage: #example
Description: "Example file created by assay t1, associated with a patient"
* identifier.value = "f1"
* subject = Reference(Patient/p1)
* status = #current
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
Title: "Example file created by assay t1"
Usage: #example
Description: "Example file created by assay t1, associated with a patient"
* identifier.value = "f2"
* subject = Reference(Patient/p1)
* status = #current
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

// NCPI File
Instance: f3
InstanceOf: NcpiFile
Title: "Example file created by assay t2"
Usage: #example
Description: "Example file created by assay t2, associated with a group"
* identifier.value = "f3"
* subject = Reference(Group/rs1-g1)
* status = #current
* content[+]
  * attachment.url = "s3://foobar/example3.bam"
* extension[file-format].valueCodeableConcept.coding = $edam#format_2572 "BAM"
* extension[file-size]
  * valueQuantity
    * value = 1044770381
    * unit = "bytes"
* extension[hash]
  * extension[hash-value].valueString = "9c2460c4647fdc57261f040042863fa2"
  * extension[hash-type].valueCode = #md5


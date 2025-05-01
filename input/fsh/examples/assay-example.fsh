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
* actual = true
* type = #person
* member[+]
  * entity = Reference(Patient/p1)
* member[+]
  * entity = Reference(Patient/p2)


// NCPI Assay
Instance: a1
InstanceOf: NcpiAssay
Usage: #example
Title: "Example assay simple association of Patient and Specimen"
* status = #active
* intent = #order
* subject = Reference(Patient/p1)
* specimen[+] = Reference(Specimen/s1)
* authoredOn = "2025-04-30T09:00:00Z"
* reasonCode.text = "Investigating suspected hereditary condition"


// NCPI Assay
Instance: a2
InstanceOf: NcpiAssay
Usage: #example
Title: "Example assay association of with Group of participants and set of specimens"
* status = #active
* intent = #order
* subject = Reference(Group/rs1-g1)
* specimen[+] = Reference(Specimen/s1)
* specimen[+] = Reference(Specimen/s2)
* reasonCode.text = "Investigating suspected hereditary condition"

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
Description: "Detailed provenance referencing assay a1"
* status = #requested
* intent = #order
* basedOn = Reference(ServiceRequest/a1)
* focus = Reference(Patient/p1)


Instance: t2
InstanceOf: Task
Title: "Example Task based on assay a2"
Usage: #example
Description: "Detailed provenance referencing assay a2 with example inputs"
* status = #requested
* intent = #order
* basedOn = Reference(ServiceRequest/a2)
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
* context
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
* context
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

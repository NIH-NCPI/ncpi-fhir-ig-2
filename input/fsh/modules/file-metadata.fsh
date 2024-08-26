CodeSystem: MetadataElements
Id: metadata-elements
Title: "NCPI Metadata slices"
Description: "NCPI Metadata slices"
* #AssayStrategy "Assay strategy"
* #PlatformInstrument "Platform instrument"
* #RelatedSamples "Related samples"
* #LibraryPrep "Library preparation"
* #LibrarySelection "Library selection"
* #Strandedness "Strandedness"
* #TargetRegion "Target region"
* #ReferenceGenome "Reference genome"
* #IsPairedEnd "Is paired end"
* #WorkflowType "Workflow type"
* #WorkflowTool "Workflow tool"
* #AdaptorTrimmed "Adaptor trimmed"

CodeSystem: AssayStrategyCS
Id: assay-strategy-cs
Title: "Assay strategy options"
Description: "Assay strategy options"
* #WGS "Whole Genome Sequencing"

CodeSystem: PlatformInstrumentCS
Id: platform-instrument-cs
Title: "Platform instrument options"
Description: "Platform instrument options"
* #IlluminaHiSeq2000 "Illumina HiSeq2000"

CodeSystem: LibraryPrepCS
Id: library-prep-cs
Title: "Library prep options"
Description: "Library prep options"
* #polyA "polyA"

CodeSystem: LibrarySelectionCS
Id: library-selection-cs
Title: "Library selection options"
Description: "Library selection options"
* #PolyTEnrichment "Poly-T Enrichment"

CodeSystem: StrandednessCS
Id: strandedness-cs
Title: "Strandedness options"
Description: "Strandedness options"
* #stranded "Stranded"
* #unstranded "Unstranded"

CodeSystem: AdaptorTrimmedCS
Id: adaptor-trimmed-cs
Title: "Adaptor trimmed options"
Description: "Adaptor trimmed options"
* #yes "Yes"
* #no "No"

CodeSystem: WorkflowTypeCS
Id: workflow-type-cs
Title: "Workflow type options"
Description: "Workflow type options"
* #alignment "Alignment"
* #somatic "Somatic"

CodeSystem: WorkflowToolCS
Id: workflow-tool-cs
Title: "Workflow tool options"
Description: "Workflow tool options"
* #bammem "BAM-MEM"
* #GATKHaplotypeCaller "GATK-Haplotype Caller"

CodeSystem: ReferenceGenomeCS
Id: reference-genome-cs
Title: "Reference genome examples"
Description: "Reference genome examples"
* #GRCh37 "GRCh37"
* #GRCh38 "GRCh38"

Profile: NcpiFileMetadata
Parent: Observation
Id: ncpi-file-metadata
Title: "NCPI File Meta Data"
Description: "Representation of file metadata for NCPI"
* ^version = "0.0.1"
* ^status = #draft
* focus 1..1 /*Parent_file*/

Profile: NcpiAssayFile
Parent: NcpiFileMetadata
Id: ncpi-assay-file
Title: "NCPI Assay File"
Description: "Representation of assay file"
* ^version = "0.0.1"
* ^status = #draft
* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.ordered = false
* component ^slicing.description = "Slice pattern for component.code"
* component contains
  assay_strategy 1..1 and
  platform_instrument 1..1 and
  related_samples 1..*
* component[assay_strategy].code = #AssayStrategy
* component[assay_strategy].value[x] only CodeableConcept
* component[platform_instrument].code = #PlatformInstrument
* component[platform_instrument].value[x] only CodeableConcept
* component[related_samples].code = #RelatedSamples
* component[related_samples].value[x] only string /*Related samples cannot be a reference*/

Profile: NcpiSequencingFile
Parent: NcpiAssayFile
Id: ncpi-sequencing-file
Title: "NCPI sequencing file"
Description: "NCPI sequencing file"
* ^version = "0.0.1"
* ^status = #draft
* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.ordered = false
* component ^slicing.description = "Slice pattern for component.code"
* component contains
  workflow_type 0..1 and
  workflow_tool 0..1
* component[workflow_type].code = #WorkflowType
* component[workflow_type].value[x] only CodeableConcept
* component[workflow_tool].code = #WorkflowTool
* component[workflow_tool].value[x] only CodeableConcept

Profile: NcpiRawFile
Parent: NcpiSequencingFile
Id: ncpi-raw-file
Title: "NCPI raw file"
Description: "NCPI raw file"
* ^version = "0.0.1"
* ^status = #draft
* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.ordered = false
* component ^slicing.description = "Slice pattern for component.code"
* component contains
  library_prep 1..1 and
  library_selection 1..1 and
  strandedness 1..1 and
  target_region 0..1
* component[library_prep].code = #LibraryPrep
* component[library_prep].value[x] only CodeableConcept
* component[library_selection].code = #LibrarySelection
* component[library_selection].value[x] only CodeableConcept
* component[strandedness].code = #Strandedness
* component[strandedness].value[x] only CodeableConcept
* component[target_region].code = #TargetRegion
* component[target_region].value[x] only CodeableConcept

Profile: NcpiAnalysisFile
Parent: NcpiSequencingFile
Id: ncpi-analysis-file
Title: "NCPI analysis file"
Description: "NCPI analysis file"
* ^version = "0.0.1"
* ^status = #draft
* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.ordered = false
* component ^slicing.description = "Slice pattern for component.code"
* component contains
  library_prep 0..1 and
  library_selection 0..1 and
  strandedness 0..1 and
  target_region 0..1
* component[library_prep].code = #LibraryPrep
* component[library_prep].value[x] only CodeableConcept
* component[library_selection].code = #LibrarySelection
* component[library_selection].value[x] only CodeableConcept
* component[strandedness].code = #Strandedness
* component[strandedness].value[x] only CodeableConcept
* component[target_region].code = #TargetRegion
* component[target_region].value[x] only CodeableConcept

Profile: NcpiFASTQ
Parent: NcpiRawFile
Id: ncpi-fastq
Title: "NCPI FASTQ File"
Description: "NCPI FASTQ File"
* ^version = "0.0.1"
* ^status = #draft
* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.ordered = false
* component ^slicing.description = "Slice pattern for component.code"
* component contains
  is_paired_end 1..1 and
  adaptor_trimmed 1..1 and
  reference_genome 0..1
* component[is_paired_end].code = #IsPairedEnd
* component[is_paired_end].value[x] only CodeableConcept or boolean
* component[workflow_type].code = #WorkflowType
* component[workflow_type].value[x] only CodeableConcept
* component[adaptor_trimmed].code = #AdaptorTrimmed
* component[adaptor_trimmed].value[x] only CodeableConcept or boolean
* component[reference_genome].code = #ReferenceGenome
* component[reference_genome].value[x] only CodeableConcept

Profile: NcpiBAMCRAM
Parent: NcpiRawFile
Id: ncpi-bamcram
Title: "BAM or CRAM file profile"
Description: "BAM or CRAM file profile"
* ^version = "0.0.1"
* ^status = #draft
* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.ordered = false
* component ^slicing.description = "Slice pattern for component.code"
* component contains
  is_paired_end 0..1 and
  adaptor_trimmed 1..1 and
  reference_genome 1..1
* component[is_paired_end].code = #IsPairedEnd
* component[is_paired_end].value[x] only CodeableConcept or boolean
* component[adaptor_trimmed].code = #AdaptorTrimmed
* component[adaptor_trimmed].value[x] only CodeableConcept or boolean
* component[reference_genome].code = #ReferenceGenome
* component[reference_genome].value[x] only CodeableConcept

Profile: NcpiVCF
Parent: NcpiAnalysisFile
Id: ncpi-vcf
Title: "VCF or gVCF file profile"
Description: "VCF or gVCF file profile"
* ^version = "0.0.1"
* ^status = #draft
* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.ordered = false
* component ^slicing.description = "Slice pattern for component.code"
* component contains
  is_paired_end 0..1 and
  reference_genome 0..1
* component[is_paired_end].code = #IsPairedEnd
* component[is_paired_end].value[x] only CodeableConcept or boolean
* component[reference_genome].code = #ReferenceGenome
* component[reference_genome].value[x] only CodeableConcept
Logical: CdmFileMetadata
Id: SharedDataModelFileMetadata
Title: "Shared data model for File Metadata"
Description: "The **Shared Data Model for File Metadata**"
* parentFile 1..1 Reference "The file which this metadata refers to"
* assayStrategy 0..1 CodeableConcept "Assay strategy employed for this file"
* platformInstrument 0..1 CodeableConcept "The platform instrument employed for this file"
* relatedSamples 0..* Reference "Any samples (biospecimen) related to the file"
* libraryPrep 0..1 CodeableConcept "The library preparation employed for this file"
* librarySelection 0..1 CodeableConcept "The library selection employed for this file"
* strandedness 0..1 CodeableConcept "The strandedness of the file"
* targetRegion 0..1 CodeableConcept "The target region employed for this file"
* referenceGenome 0..1 CodeableConcept "The reference genome employed for this file"
* isPairedEnd 0..1 boolean "Does this file represent paired end data?"
* workflowType 0..1 CodeableConcept "The workflow type employed for this file"
* workflowTool 0..1 CodeableConcept "The workflow tool employed for this file"
* adaptorTrimmed 0..1 boolean "Does this file indicate that an adaptor is trimmed?"

CodeSystem: MetadataElements
Id: metadata-elements
Title: "NCPI Metadata slices"
Description: "NCPI Metadata slices"
* ^experimental = false
* ^caseSensitive = true
* ^status = #active
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

ValueSet: AssayStrategyVS
Id: assay-strategy-vs
Title: "Assay strategy options"
Description: "Assay strategy options"
* ^status = #draft
* ^publisher = "NCPI FHIR IG WG"
* include codes from system $obi where concept is-a #OBI_0000070
/** Some examples explicitly provided */
* $obi#0002117 "whole genome sequencing assay" 
* $obi#0002118 "exome sequencing assay"
* $obi#0001274 "genotyping by array assay"
* $obi#0003090 "bulk RNA-Seq assay"
* $obi#0002571 "polyA-selected RNA sequencing assay"
* $obi#0002631 "single-cell RNA sequencing assay"
* $obi#0002764 "single-cell ATAC-seq"

CodeSystem: PlatformInstrumentCS
Id: platform-instrument-cs
Title: "Platform instrument options"
Description: "Platform instrument options"
* ^experimental = false
* ^caseSensitive = true
* ^status = #active
* #IlluminaHiSeq2000 "Illumina HiSeq2000"
* #unknown "Unknown"

CodeSystem: LibraryPrepCS
Id: library-prep-cs
Title: "Library prep options"
Description: "Library prep options"
* ^experimental = false
* ^caseSensitive = true
* ^status = #active
* #polyA "polyA"
* #unknown "Unknown"

CodeSystem: LibrarySelectionCS
Id: library-selection-cs
Title: "Library selection options"
Description: "Library selection options"
* ^experimental = false
* ^caseSensitive = true
* ^status = #active
* #PolyTEnrichment "Poly-T Enrichment"
* #unknown "Unknown"

CodeSystem: StrandednessCS
Id: strandedness-cs
Title: "Strandedness options"
Description: "Strandedness options"
* ^experimental = false
* ^caseSensitive = true
* ^status = #active
* #stranded "Stranded"
* #unstranded "Unstranded"
* #unknown "Unknown"

CodeSystem: AdaptorTrimmedCS
Id: adaptor-trimmed-cs
Title: "Adaptor trimmed options"
Description: "Adaptor trimmed options"
* ^experimental = false
* ^caseSensitive = true
* ^status = #active
* #yes "Yes"
* #no "No"
* #unknown "Unknown"

CodeSystem: WorkflowTypeCS
Id: workflow-type-cs
Title: "Workflow type options"
Description: "Workflow type options"
* ^experimental = false
* ^caseSensitive = true
* ^status = #active
* #alignment "Alignment"
* #somatic "Somatic"
* #unknown "Unknown"

CodeSystem: WorkflowToolCS
Id: workflow-tool-cs
Title: "Workflow tool options"
Description: "Workflow tool options"
* ^experimental = false
* ^caseSensitive = true
* ^status = #active
* #bammem "BAM-MEM"
* #GATKHaplotypeCaller "GATK-Haplotype Caller"
* #unknown "Unknown"

CodeSystem: ReferenceGenomeCS
Id: reference-genome-cs
Title: "Reference genome examples"
Description: "Reference genome examples"
* ^experimental = false
* ^caseSensitive = true
* ^status = #active
* #GRCh37 "GRCh37"
* #GRCh38 "CRCh38"
* #GRCh38p13 "GRCh38.p13"
* #GRCh38p14 "GRCh38.p14"
* #unknown "Unknown"

Profile: NcpiFileMetadata
Parent: Observation
Id: ncpi-file-metadata
Title: "NCPI File Meta Data"
Description: "Representation of file metadata for NCPI"
* ^version = "0.0.1"
* ^status = #draft
* focus 1..1 /*Parent_file*/

Profile: NcpiSpecimenCollection
Parent: List
Id: ncpi-specimen-NcpiSpecimenCollection
Title: "Linkage for related samples"
Description: "Linkage for related samples"
* subject 0..1 /*Related_samples*/
* subject ^short = "Reference to any subjects or other samples related to a subject"

Extension: SpecimenCollection
Id: specimen-collection
Title: "Linkage for related samples"
Description: "Linkage for related samples"
* insert SetContext(NcpiSpecimenCollection.subject)
* value[x] only Reference
* valueReference ^short = "Reference to other samples related to this sample"

Profile: NcpiFASTQ
Parent: NcpiFileMetadata
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
  assay_strategy 1..1 and
  platform_instrument 1..1 and
  library_prep 1..1 and
  library_selection 1..1 and
  strandedness 1..1 and
  target_region 0..1 and
  is_paired_end 1..1 and
  adaptor_trimmed 1..1 and
  reference_genome 0..1 and  
  workflow_type 0..1 and
  workflow_tool 0..1
* component[assay_strategy].code = $meta-data-elements#AssayStrategy
* component[assay_strategy].value[x] only CodeableConcept
* component[platform_instrument].code = $meta-data-elements#PlatformInstrument
* component[platform_instrument].value[x] only CodeableConcept
* component[library_prep].code = $meta-data-elements#LibraryPrep
* component[library_prep].value[x] only CodeableConcept
* component[library_selection].code = $meta-data-elements#LibrarySelection
* component[library_selection].value[x] only CodeableConcept
* component[strandedness].code = $meta-data-elements#Strandedness
* component[strandedness].value[x] only CodeableConcept
* component[target_region].code = $meta-data-elements#TargetRegion
* component[target_region].value[x] only CodeableConcept
* component[is_paired_end].code = $meta-data-elements#IsPairedEnd
* component[is_paired_end].value[x] only CodeableConcept or boolean
* component[adaptor_trimmed].code = $meta-data-elements#AdaptorTrimmed
* component[adaptor_trimmed].value[x] only CodeableConcept or boolean
* component[reference_genome].code = $meta-data-elements#ReferenceGenome
* component[reference_genome].value[x] only CodeableConcept
* component[workflow_type].code = $meta-data-elements#WorkflowType
* component[workflow_type].value[x] only CodeableConcept
* component[workflow_tool].code = $meta-data-elements#WorkflowTool
* component[workflow_tool].value[x] only CodeableConcept
* extension contains SpecimenCollection named collection 0..* /*realated_samples*/
* extension[collection] ^short = "Linkage for related samples"

Profile: NcpiBAMCRAM
Parent: NcpiFileMetadata
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
  assay_strategy 1..1 and
  platform_instrument 1..1 and
  library_prep 1..1 and
  library_selection 1..1 and
  strandedness 1..1 and
  target_region 0..1 and
  is_paired_end 0..1 and
  adaptor_trimmed 0..1 and
  reference_genome 1..1 and  
  workflow_type 1..1 and
  workflow_tool 1..1
* component[assay_strategy].code = $meta-data-elements#AssayStrategy
* component[assay_strategy].value[x] only CodeableConcept
* component[platform_instrument].code = $meta-data-elements#PlatformInstrument
* component[platform_instrument].value[x] only CodeableConcept
* component[library_prep].code = $meta-data-elements#LibraryPrep
* component[library_prep].value[x] only CodeableConcept
* component[library_selection].code = $meta-data-elements#LibrarySelection
* component[library_selection].value[x] only CodeableConcept
* component[strandedness].code = $meta-data-elements#Strandedness
* component[strandedness].value[x] only CodeableConcept
* component[target_region].code = $meta-data-elements#TargetRegion
* component[target_region].value[x] only CodeableConcept
* component[is_paired_end].code = $meta-data-elements#IsPairedEnd
* component[is_paired_end].value[x] only CodeableConcept or boolean
* component[adaptor_trimmed].code = $meta-data-elements#AdaptorTrimmed
* component[adaptor_trimmed].value[x] only CodeableConcept or boolean
* component[reference_genome].code = $meta-data-elements#ReferenceGenome
* component[reference_genome].value[x] only CodeableConcept
* component[workflow_type].code = $meta-data-elements#WorkflowType
* component[workflow_type].value[x] only CodeableConcept
* component[workflow_tool].code = $meta-data-elements#WorkflowTool
* component[workflow_tool].value[x] only CodeableConcept
* extension contains SpecimenCollection named collection 0..* /*realated_samples*/
* extension[collection] ^short = "Linkage for related samples"

Profile: NcpiVCF
Parent: NcpiFileMetadata
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
  assay_strategy 1..1 and
  platform_instrument 1..1 and
  library_prep 0..1 and
  library_selection 0..1 and
  strandedness 0..1 and
  target_region 0..1 and
  is_paired_end 0..1 and
  adaptor_trimmed 0..1 and
  reference_genome 1..1 and  
  workflow_type 1..1 and
  workflow_tool 1..1
* component[assay_strategy].code = $meta-data-elements#AssayStrategy
* component[assay_strategy].value[x] only CodeableConcept
* component[platform_instrument].code = $meta-data-elements#PlatformInstrument
* component[platform_instrument].value[x] only CodeableConcept
* component[library_prep].code = $meta-data-elements#LibraryPrep
* component[library_prep].value[x] only CodeableConcept
* component[library_selection].code = $meta-data-elements#LibrarySelection
* component[library_selection].value[x] only CodeableConcept
* component[strandedness].code = $meta-data-elements#Strandedness
* component[strandedness].value[x] only CodeableConcept
* component[target_region].code = $meta-data-elements#TargetRegion
* component[target_region].value[x] only CodeableConcept
* component[is_paired_end].code = $meta-data-elements#IsPairedEnd
* component[is_paired_end].value[x] only CodeableConcept or boolean
* component[adaptor_trimmed].code = $meta-data-elements#AdaptorTrimmed
* component[adaptor_trimmed].value[x] only CodeableConcept or boolean
* component[reference_genome].code = $meta-data-elements#ReferenceGenome
* component[reference_genome].value[x] only CodeableConcept
* component[workflow_type].code = $meta-data-elements#WorkflowType
* component[workflow_type].value[x] only CodeableConcept
* component[workflow_tool].code = $meta-data-elements#WorkflowTool
* component[workflow_tool].value[x] only CodeableConcept
* extension contains SpecimenCollection named collection 0..* /*realated_samples*/
* extension[collection] ^short = "Linkage for related samples"

Profile: NcpiMAF
Parent: NcpiFileMetadata
Id: ncpi-maf
Title: "MAF (Somatic Mutation) file profile"
Description: "MAF (Somatic Mutation) file profile"
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
  library_prep 0..1 and
  library_selection 0..1 and
  strandedness 0..1 and
  target_region 0..1 and
  is_paired_end 0..1 and
  adaptor_trimmed 0..1 and
  reference_genome 1..1 and  
  workflow_type 1..1 and
  workflow_tool 1..1
* component[assay_strategy].code = $meta-data-elements#AssayStrategy
* component[assay_strategy].value[x] only CodeableConcept
* component[platform_instrument].code = $meta-data-elements#PlatformInstrument
* component[platform_instrument].value[x] only CodeableConcept
* component[library_prep].code = $meta-data-elements#LibraryPrep
* component[library_prep].value[x] only CodeableConcept
* component[library_selection].code = $meta-data-elements#LibrarySelection
* component[library_selection].value[x] only CodeableConcept
* component[strandedness].code = $meta-data-elements#Strandedness
* component[strandedness].value[x] only CodeableConcept
* component[target_region].code = $meta-data-elements#TargetRegion
* component[target_region].value[x] only CodeableConcept
* component[is_paired_end].code = $meta-data-elements#IsPairedEnd
* component[is_paired_end].value[x] only CodeableConcept or boolean
* component[adaptor_trimmed].code = $meta-data-elements#AdaptorTrimmed
* component[adaptor_trimmed].value[x] only CodeableConcept or boolean
* component[reference_genome].code = $meta-data-elements#ReferenceGenome
* component[reference_genome].value[x] only CodeableConcept
* component[workflow_type].code = $meta-data-elements#WorkflowType
* component[workflow_type].value[x] only CodeableConcept
* component[workflow_tool].code = $meta-data-elements#WorkflowTool
* component[workflow_tool].value[x] only CodeableConcept
* extension contains SpecimenCollection named collection 0..* /*realated_samples*/
* extension[collection] ^short = "Linkage for related samples"

Profile: NcpiGeneFusionOrExpression
Parent: NcpiFileMetadata
Id: ncpi-gene-fusion-expression
Title: "Gene fusion or gene expression file profile"
Description: "Gene fusion or gene expression file profile"
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
  library_prep 1..1 and
  library_selection 1..1 and
  strandedness 1..1 and
  target_region 0..1 and
  is_paired_end 0..1 and
  adaptor_trimmed 0..1 and
  reference_genome 1..1 and  
  workflow_type 1..1 and
  workflow_tool 1..1
* component[assay_strategy].code = $meta-data-elements#AssayStrategy
* component[assay_strategy].value[x] only CodeableConcept
* component[platform_instrument].code = $meta-data-elements#PlatformInstrument
* component[platform_instrument].value[x] only CodeableConcept
* component[library_prep].code = $meta-data-elements#LibraryPrep
* component[library_prep].value[x] only CodeableConcept
* component[library_selection].code = $meta-data-elements#LibrarySelection
* component[library_selection].value[x] only CodeableConcept
* component[strandedness].code = $meta-data-elements#Strandedness
* component[strandedness].value[x] only CodeableConcept
* component[target_region].code = $meta-data-elements#TargetRegion
* component[target_region].value[x] only CodeableConcept
* component[is_paired_end].code = $meta-data-elements#IsPairedEnd
* component[is_paired_end].value[x] only CodeableConcept or boolean
* component[adaptor_trimmed].code = $meta-data-elements#AdaptorTrimmed
* component[adaptor_trimmed].value[x] only CodeableConcept or boolean
* component[reference_genome].code = $meta-data-elements#ReferenceGenome
* component[reference_genome].value[x] only CodeableConcept
* component[workflow_type].code = $meta-data-elements#WorkflowType
* component[workflow_type].value[x] only CodeableConcept
* component[workflow_tool].code = $meta-data-elements#WorkflowTool
* component[workflow_tool].value[x] only CodeableConcept
* extension contains SpecimenCollection named collection 0..* /*realated_samples*/
* extension[collection] ^short = "Linkage for related samples"

Profile: NcpiProteomics
Parent: NcpiFileMetadata
Id: ncpi-proteomics
Title: "Proteomics file profile"
Description: "Proteomics file profile"
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
  library_prep 0..1 and
  library_selection 0..1 and
  strandedness 0..1 and
  target_region 0..1 and
  is_paired_end 0..1 and
  adaptor_trimmed 0..1 and
  reference_genome 1..1 and  
  workflow_type 1..1 and
  workflow_tool 1..1
* component[assay_strategy].code = #AssayStrategy
* component[assay_strategy].value[x] only CodeableConcept
* component[platform_instrument].code = #PlatformInstrument
* component[platform_instrument].value[x] only CodeableConcept
* component[library_prep].code = #LibraryPrep
* component[library_prep].value[x] only CodeableConcept
* component[library_selection].code = #LibrarySelection
* component[library_selection].value[x] only CodeableConcept
* component[strandedness].code = #Strandedness
* component[strandedness].value[x] only CodeableConcept
* component[target_region].code = #TargetRegion
* component[target_region].value[x] only CodeableConcept
* component[is_paired_end].code = #IsPairedEnd
* component[is_paired_end].value[x] only CodeableConcept or boolean
* component[adaptor_trimmed].code = #AdaptorTrimmed
* component[adaptor_trimmed].value[x] only CodeableConcept or boolean
* component[reference_genome].code = #ReferenceGenome
* component[reference_genome].value[x] only CodeableConcept
* component[workflow_type].code = #WorkflowType
* component[workflow_type].value[x] only CodeableConcept
* component[workflow_tool].code = #WorkflowTool
* component[workflow_tool].value[x] only CodeableConcept
* extension contains SpecimenCollection named collection 0..* /*realated_samples*/
* extension[collection] ^short = "Linkage for related samples"
Instance: FASTQ-example
InstanceOf: NcpiFASTQ
Title: "Example file metadata for a FASTQ file"
Usage: #example
Description: "Example file metadata for a FASTQ file"
* focus = Reference(ParentFile)
* status = #final
* code = $edam#format_1930
* component.code = #AssayStrategy
* component[assay_strategy].valueCodeableConcept = #WGS
* component.code = #PlatformInstrument
* component[platform_instrument].valueCodeableConcept = #IlluminaHiSeq2000
* component.code = #RelatedSamples
* component[related_samples].valueString = "SA-000"
* component.code = #LibraryPrep
* component[library_prep].valueCodeableConcept = #polyA
* component.code = #LibrarySelection
* component[library_selection].valueCodeableConcept = #PolyTEnrichment
* component.code = #Strandedness
* component[strandedness].valueCodeableConcept = #unstranded
* component.code = #IsPairedEnd
* component[is_paired_end].valueBoolean = false
* component.code = #AdaptorTrimmed
* component[adaptor_trimmed].valueBoolean = true


Instance: BAM-CRAM-example
InstanceOf: NcpiBAMCRAM
Title: "Example file metadata for a BAM-CRAM file"
Usage: #example
Description: "Example file metadata for a BAM-CRAM file"
* focus = Reference(ParentFile)
* status = #final
* code = $edam#format_2572 /*for a BAM file | $edam#format_3462 for CRAM*/
* component.code = #AssayStrategy
* component[assay_strategy].valueCodeableConcept = #WGS
* component.code = #PlatformInstrument
* component[platform_instrument].valueCodeableConcept = #IlluminaHiSeq2000
* component.code = #RelatedSamples
* component[related_samples].valueString = "SA-000"
* component.code = #LibraryPrep
* component[library_prep].valueCodeableConcept = #polyA
* component.code = #LibrarySelection
* component[library_selection].valueCodeableConcept = #PolyTEnrichment
* component.code = #Strandedness
* component[strandedness].valueCodeableConcept = #unstranded
* component.code = #ReferenceGenome
* component[reference_genome].valueCodeableConcept = #GRCh37
* component.code = #IsPairedEnd
* component[is_paired_end].valueBoolean = false
* component.code = #WorkflowTool
* component[workflow_tool].valueCodeableConcept = #bammem
* component.code = #WorkflowType
* component[workflow_type].valueCodeableConcept = #alignment

Instance: VCF-example
InstanceOf: NcpiVCF
Usage: #example
Title: "Example file metadata for a VCF file"
Description: "Example file metadata for a VCF file"
* focus = Reference(ParentFile)
* status = #final
* code = $edam#format_3016
* component.code = #AssayStrategy
* component[assay_strategy].valueCodeableConcept = #WGS
* component.code = #PlatformInstrument
* component[platform_instrument].valueCodeableConcept = #IlluminaHiSeq2000
* component.code = #RelatedSamples
* component[related_samples].valueString = "SA-000"
* component.code = #LibraryPrep
* component[library_prep].valueCodeableConcept = #polyA
* component.code = #LibrarySelection
* component[library_selection].valueCodeableConcept = #PolyTEnrichment
* component.code = #Strandedness
* component[strandedness].valueCodeableConcept = #unstranded
* component.code = #ReferenceGenome
* component[reference_genome].valueCodeableConcept = #GRCh38
* component.code = #IsPairedEnd
* component[is_paired_end].valueBoolean = false
* component.code = #WorkflowTool
* component[workflow_tool].valueCodeableConcept = #GATKHaplotypeCaller
* component.code = #WorkflowType
* component[workflow_type].valueCodeableConcept = #somatic
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
* component[related_samples].valueReference = Reference(Example) /*Does not resolve because related samples cannot be a reference*/
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
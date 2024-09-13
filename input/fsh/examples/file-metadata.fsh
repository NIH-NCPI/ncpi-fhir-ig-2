



/*
Instance: VCF-example
InstanceOf: NcpiVCF
Usage: #example
Title: "Example file metadata for a VCF file"
Description: "Example file metadata for a VCF file"
* focus = Reference(PT_006SP660)
* status = #final
* code = $edam#format_3016
* specimen = Reference(SA-000) /*using specimen is a placeholder for using a slice of component for related samples
* component.code = #AssayStrategy
* component[assay_strategy].valueCodeableConcept = #WGS
* component.code = #PlatformInstrument
* component[platform_instrument].valueCodeableConcept = #IlluminaHiSeq2000
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
*/
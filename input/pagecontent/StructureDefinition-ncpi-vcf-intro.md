### VCF File Metadata

|**Logical Model Property**|**NCPI FHIR Resource**|**Cardinality**|**Value Set or Example**|
|parent_file|Observation.focus|1..1|[NCPI File Metadata](StructureDefinition-ncpi-file-metadata.html)|
|assay_strategy|Observation.component|1..1|e.g., Whole Genome Sequencing|
|platform_instrument|Observation.component|1..1|e.g., Illumina HiSeq2000|
|library_prep|Observation.component|0..1|e.g., polyA|
|library_selection|Observation.component|0..1|e.g., |
|strandedness|Observation.component|0..1|stranded, unstranded|
|target_region|Observation.component|1..1|e.g., |
|is_paired_end|Observation.component|0..1|True, False|
|adaptor_trimmed|Observation.component|0..1|True, False|
|reference_genome|Observation.component|1..1| GRCh37, GRCh38|
|workflow_type|Observation.component|1..1|e.g., alignment, somatic|
|workflow_tool|Observation.component|1..1|e.g., BAM-MEM, GATK-Haplotype Caller|
|related_samples|Extension Reference(Any)|0..*|e.g., Reference(Participant_ID)|
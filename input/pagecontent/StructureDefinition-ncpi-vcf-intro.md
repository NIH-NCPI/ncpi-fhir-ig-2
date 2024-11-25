### VCF File Metadata

|**Logical Model Property**|**Cardinality**|**NCPI FHIR Resource**|**Value Set or Example**|
|parent_file|1..1|Observation.focus|[NCPI File Metadata](StructureDefinition-ncpi-file-metadata.html)|
|assay_strategy|1..1|Observation.component|e.g., Whole Genome Sequencing|
|platform_instrument|1..1|Observation.component|e.g., Illumina HiSeq2000|
|library_prep|0..1|Observation.component|e.g., polyA|
|library_selection|0..1|Observation.component||
|strandedness|0..1|Observation.component|stranded, unstranded|
|target_region|1..1|Observation.component||
|is_paired_end|0..1|Observation.component|True, False|
|adaptor_trimmed|0..1|Observation.component|True, False|
|reference_genome|1..1|Observation.component| GRCh37, GRCh38|
|workflow_type|1..1|Observation.component|e.g., alignment, somatic|
|workflow_tool|1..1|Observation.component|e.g., BAM-MEM, GATK-Haplotype Caller|
|related_samples|0..*|Extension Reference(Any)|e.g., Reference(Participant_ID)|
### VCF File Metadata

|**Component Slice**|**Cardinality**|**Value Set or Example**|
|assay_strategy|1..1|e.g., Whole Genome Sequencing|
|platform_instrument|1..1|e.g., Illumina HiSeq2000|
|library_prep|0..1|e.g., polyA|
|library_selection|0..1|e.g., |
|strandedness|0..1|stranded, unstranded|
|target_region|1..1|e.g., |
|is_paired_end|0..1|True, False|
|adaptor_trimmed|0..1|True, False|
|reference_genome|1..1| GRCh37, GRCh38|
|workflow_type|1..1|e.g., alignment, somatic|
|workflow_tool|1..1|e.g., BAM-MEM, GATK-Haplotype Caller|
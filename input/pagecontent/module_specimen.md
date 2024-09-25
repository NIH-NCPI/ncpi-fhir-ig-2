### Specimen

The specimen model is intended to represent both historical biospecimen and sample information related to derived data files and information about physical biospecimens and samples that may be available for request by researchers.

#### Scope and Usage

The specimen model is intended to represent three meaningful concepts:

* Sample Origins (Collection)
* Sample Processing and Lineage (Sample)
* Sample Storage (Aliquot/Container/Tube)

While most LIMS or specimen management systems track inventory and the aliquot/container level, many researcher questions or use cases exist at the sample or collection level. For example, if a DNA sample is portioned into three tubes (containers), a researcher may not be concerned with which tube was used, but may be interested to know that it is the same DNA (Sample) that was used in a methylation analysis, and that it was derived from a tissue sample (Collection). In cases where samples are made available for request, it is also important to represent not just the individual containers thesmelves, but the grouping of containers (Sample) that represent the total requestable amount of a specimen.

Via these three aspects, this model attempts to represent the real world conceptualization of specimen use in biomedical research.

#### Collection

The collection entity describes the collection procedure that generated the biospecimen.  This can contain minimal metadata (for example, just the age at collection), no metadata (if none is known), or robust information including procedure, location, and laterality.  Collection details are not required, but when possible, it should be indicated if a sample was the original, collected sample.

#### Sample

The Sample entity is intended to describe groupings of "biologically equivalent" biospecimen or containers.  In many cases, this may be an abstraction of real-world concepts, but provide a helpful tool for simpliflying complex data recorded in LIMS systems. For example, a particular collection of blood may be stored in several EDTA tubes. While these tubes will be tracked separately in a LIMS system, a primary researcher may care only that a blood sample exists, and whether or not the total volume is adequate for their research purposes.

Samples can be derived from other samples, or from a collection event.  Using the parent-child relationships within Specimen, it is possible to describe detailed a processing lineage, for example, a collection of Whole Blood processed into a sample of White Blood Cells processed into a sample of DNA. Ultimately, however, only the collected biospecimen (if known) and any biospecimen diretly related to analysis outputs MUST be recorded.

#### Aliquot

The Aliquot entity, also referred to as 'container', is intended to describe specific portions of a sample stored in coded and tracked containers, such as tubes.  This entity can be used to represent the exact containers present in the real-world sample, or the aliquot entity can be used simply to indicate the total amount of sample available.


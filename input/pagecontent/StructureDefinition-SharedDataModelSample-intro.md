### NCPI Sample
#### Introduction
These entities are intended to present to users the history of samples used in a research study. They may also indicate potential availability of samples for request by other researchers. This model is specifically intended to express sample origins (Collection), sample flow and processing (Sample), and even specific stored tubes/slides (Aliquot). Conceptually, these represent the procedure at which the Biospecimen was collected (Collection), “biologically equivalent” samples in the path of processing (Sample), and specific tubes which may have a role in some circumstances (Aliquot).

A high level requirement from our common use cases is to understand “what sample was collected” and “what sample went into the assay”. This is important in genomics given “whole blood” vs “saliva” DNA analysis.

#### Sample
Samples are ideally “biologically equivalent” biospecimen. This may be an abstraction from real-world samples, but provide a helpful tool for simplifying potentially complex data recorded in LIMS. For example, a protocol may include several edta tubes of whole blood: those would be tracked separately in a LIMS, but a secondary data research consumer doesn’t need to know those details in most cases. 

Samples can be derived from other samples or from a collection event. It’s possible to describe detailed processing chains, for example tracking Whole Blood -> WBCs -> DNA, but this is not required. *Only the collected biospecimen and any biospecimen used in analysis NEED to be recorded.

There are cases where tube contamination may present challenges that a user of this data may not be able to track without further information, but this is out of scope for our use case. 
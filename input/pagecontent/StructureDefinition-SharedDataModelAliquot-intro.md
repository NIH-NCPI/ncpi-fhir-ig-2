### NCPI Sample
#### Introduction
These entities are intended to present to users the history of samples used in a research study. They may also indicate potential availability of samples for request by other researchers. This model is specifically intended to express sample origins (Collection), sample flow and processing (Sample), and even specific stored tubes/slides (Aliquot). Conceptually, these represent the procedure at which the Biospecimen was collected (Collection), “biologically equivalent” samples in the path of processing (Sample), and specific tubes which may have a role in some circumstances (Aliquot).

A high level requirement from our common use cases is to understand “what sample was collected” and “what sample went into the assay”. This is important in genomics given “whole blood” vs “saliva” DNA analysis.

#### Aliquot
Some studies may provide detailed information about biospecimen-in-tubes. They may be available for analysis by others, for example. These can represent exact tubes or total amounts available of a Sample.
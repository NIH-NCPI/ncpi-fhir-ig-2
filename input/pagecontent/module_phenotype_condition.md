# Phenotype/Condition

## Overview

The Condition Module is based on the standard FHIR resource type, [Observation](https://hl7.org/fhir/r4/observation.html) and is used to represent a condition or phenotype linked to a patient in a study. This means that the patient must have an assertion (status) for the given diagnosis. 

The distinction is one of “record of asserted status” and “Details of positively asserted status”. We make these distinctions to support general use cases of “longitudinal, catch all records” and “curated summaries of features”. This distinction is focused on the interoperability utility over the “direct representation of reality”. There is overlap in these data; many assertions about status and onset might be coalesced into a single description of an affected status. In other studies, the “summary” may be derived from a single “assertion” and appear mostly duplicative.

> This distinction is similar to those in OMOP and FHIR, though it does not map precisely. Critically in OMOP and FHIR, `Condition_occurrence` and `Condition` are **ALWAYS** a positive assertion (though they may be wrong). “Assertions of history of disease” are observations in OMOP, eg, ICD9CM V-codes like “Personal history of malignant neoplasm of breast” go in Observation. 

### Condition Assertion
Condition Assertions are records of a present or absent condition status for a participant. They reflect support for ongoing longitudinal records, and enable the ability to make explicit whether a feature was recorded or not for a participant. The assertion may carry with it additional data, such as age of onset, but it’s not required. 

Condition Assertions may be contradictory over time- the goal is to represent faithfully what was reported by the study. Consumers of this data should expect to need to aggregate this longitudinal record or reconcile data captured at different granularity. For example, it’s common to capture broad negative categories (No Heart Conditions) but also specific positive assertions (Atrial Septal Defect).

### Condition Asserter
Condition Asserter is used to represent the source for the condition/phenotype diagnosis. For example, this field can be used to document whether the condition was pulled from an EHR or found in other clinical documentation. 

## Conventions
We do not set a distinction in entities here about “Phenotypes” vs “Diseases” as often used in a rare disease setting (eg, in Phenopackets). There is utility in indicating the intent of the submitter where possible, but this is not represented as separate entities.

## Relevant Artifacts
- [NCPI Condition](StructureDefinition-ncpi-condition.html)
- [Condition Assertion](ValueSet-condition-assertion-vs.html)
- [Condition Asserter](StructureDefinition-condition-asserter.html)
- [Condition Location](StructureDefinition-condition-location.html)
- [Condition Laterality](StructureDefinition-condition-laterality.html)
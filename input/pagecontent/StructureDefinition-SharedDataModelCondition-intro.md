### NCPI Condition

#### Conditions / Phenotypes / Diseases
These entities describe phenotypes or diseases of Participants. The distinction is one of “record of asserted status” and “Details of positively asserted status”. We make these distinctions to support general use cases of “longitudinal, catch all records” and “curated summaries of features”. This distinction is focused on the interoperability utility over the “direct representation of reality”. There is overlap in these data; many assertions about status and onset might be coalesced into a single description of an affected status. In other studies, the “summary” may be derived from a single “assertion” and appear mostly duplicative.

This distinction is similar to those in OMOP and FHIR, though it does not map precisely. Critically in OMOP and FHIR, Condition_occurrence and Condition are ALWAYS a positive assertion (though they may be wrong). “Assertions of history of disease” are observations in OMOP, eg, ICD9CM V-codes like “Personal history of malignant neoplasm of breast” go in Observation. 

We do not set a distinction in entities here about “Phenotypes” vs “Diseases” as often used in a rare disease setting (eg, in Phenopackets). There is utility in indicating the intent of the submitter where possible, but this is not represented as separate entities.

#### Condition Assertion
Condition Assertions are records of a present or absent condition status for a participant. They reflect support for ongoing longitudinal records, and enable the ability to make explicit whether a feature was recorded or not for a participant. The assertion may carry with it additional data, such as age of onset, but it’s not required. Condition Assertions may be contradictory over time- the goal is to represent faithfully what was reported by the study. Consumers of this data should expect to need to aggregate this longitudinal record or reconcile data captured at different granularity. For example, it’s common to capture broad negative categories (No Heart Conditions) but also specific positive assertions (Atrial Septal Defect).

#### Condition Summary
Condition Summaries are intended to present users / consumers with an integrated summary view of condition data. This is a “higher level” product that may not be available in all circumstances, but provides a convenient way for users to understand what conditions might affect participants. 


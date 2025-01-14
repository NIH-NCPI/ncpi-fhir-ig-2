# Family

<div style="text-align: center;">
    <img style="display: block; margin: 0 auto; margin-bottom: 20px;" width="60%" src="ncpi_family_module_relationships.png" alt="Family Model Diagram" />
</div>
## Overview
This module describes family groups and family relationships, often used in genomic analyses to aid in identification of causal variants. We include several articulations of these: Family Study is an entity that describes a collection of participants in the context of a research study. Family Relationships describe the relationship of two Participants, and should be sufficient for generating a pedigree if the source information is present.`

This does not include specific methods for managing reports of “family history”. Those elements can either be encoded as specific “Participants” for which data are recorded as assertions and their family relationship to the Participant are recorded OR encoded as assertions from the Participant (eg, “family history of hypertension” or “Maternal history of hypertension”).

We are aware of the work done by GA4GH to model family health history and family relationships via the [Pedigree IG](https://ga4gh.github.io/pedigree-fhir-ig/), including their development of the [KIN ontology](https://github.com/ga4gh/pedigree_family_history_terminology). We are engaging to ensure compatibility and meeting needs our family, family relationship, and family history modeling with the efforts of the Pedigree IG while still supporting the needs of the NCPI partner groups.

### Family Study
Family Study describes a group of Participants that are related. This is not an expression of all individuals in a “family”, but a tool to identify “family members of interest” that were studied. For example, a family trio in a rare disease study does not exclude the existence of other siblings. Family Studies do not require much detail, but there are often attributes of those families that may be of use to researchers.

### Family Relationship
Family Relationships describe the relationship between two Participants. The core use case is to present biological parentage of a participant to support family / pedigree analyses. In this spirit, platforms should seek to provide minimally the information in a “ped” file: if known, a Participant should have a Family Relationship to their biological mother and father. Twins are also a high priority item for reporting. Further extended relationships can be made available using Family Relationship, but may not be as widely supported as they are harder to interpret.


## Relevant Artifacts
- [NCPI Study Family](StructureDefinition-ncpi-study-family.html)
- [Family Relationship](StructureDefinition-ncpi-family-relationship.html)
- [Family Type](StructureDefinition-family-type.html)
- [Study Family Description](StructureDefinition-description.html)
- [Consanguinity](StructureDefinition-consanguinity.html)
- [Study Family Focus](StructureDefinition-study-family-focus.html)
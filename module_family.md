# Module Family - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* **Module Family**

## Module Family

# Family

## Overview

This module describes family groups and family relationships, often used in genomic analyses to aid in identification of causal variants. We include several articulations of these: Family Study is an entity that describes a collection of participants in the context of a research study. Family Relationships describe the relationship of two Participants, and should be sufficient for generating a pedigree if the source information is present.

This does not include specific methods for managing reports of “family history”. Those elements can either be encoded as specific “Participants” for which data are recorded as assertions and their family relationship to the Participant are recorded OR encoded as assertions from the Participant (eg, “family history of hypertension” or “Maternal history of hypertension”).

We align with the work done by GA4GH to model family relationships via the [Pedigree IG](https://ga4gh.github.io/pedigree-fhir-ig/). Our NcpiFamilyRelationship profile derives from the GA4GH PedigreeRelationship profile and uses codes from the [KIN ontology](https://ga4gh.github.io/pedigree-fhir-ig/CodeSystem-kin.html). While all 55 KIN codes are available for full GA4GH compatibility, NCPI recommends a canonical approach using three core codes (`KIN:027` (`isBiologicalMotherOf`), `KIN:028` (`isBiologicalFatherOf`), `KIN:010` (`isMonozygoticMultipleBirthSiblingOf`)) that can express all pedigree relationships when combined with inferred individuals.

### Family Study

[NCPI Study Family](StructureDefinition-ncpi-study-family.md) describes a group of Participants that are related. This is not an expression of all individuals in a “family”, but a tool to identify “family members of interest” that were studied. For example, a family trio in a rare disease study does not exclude the existence of other siblings. Family Studies do not require much detail, but there are often attributes of those families that may be of use to researchers.

### Family Relationship

[Family Relationship](StructureDefinition-ncpi-family-relationship.md) describe the relationship between two Participants. The core use case is to present biological parentage of a participant to support family / pedigree analyses. In this spirit, platforms should seek to provide minimally the information in a "ped" file: if known, a Participant should have a Family Relationship to their biological mother and father using `KIN:027` (`isBiologicalMotherOf`) and `KIN:028` (`isBiologicalFatherOf`) from the KIN ontology. Monozygotic twins and higher-order multiples are also a high priority item for reporting using `KIN:010` (`isMonozygoticMultipleBirthSiblingOf`). Extended relationships (such as grandparents, aunts, uncles, cousins) can be expressed using these three codes with inferred individuals to represent the relationship chain, providing a canonical representation that eases data consumption. While other KIN codes may be used when needed, this canonical approach with three codes ensures maximum NCPI interoperability.

## Relevant Artifacts

* [NCPI Study Family](StructureDefinition-ncpi-study-family.md)
* [Family Relationship](StructureDefinition-ncpi-family-relationship.md)
* [Family Type](StructureDefinition-family-type.md)
* [Study Family Description](StructureDefinition-description.md)
* [Consanguinity](StructureDefinition-consanguinity.md)
* [Study Family Focus](StructureDefinition-study-family-focus.md)


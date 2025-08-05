
We chose the direction of the relationship to match PED files ([plink Harvard Medical School definition](https://zzz.bwh.harvard.edu/plink/data.shtml#ped), [Broad Institute definition](https://gatk.broadinstitute.org/hc/en-us/articles/360035531972-PED-Pedigree-format)),
which go from the individual to the mother and father.

#### Key Guidelines
Family Relationships describe the relationship between two Participants. The core use case is to present biological parentage of a participant to support family / pedigree analyses. In this spirit, platforms should seek to provide minimally the information in a [PED file](https://gatk.broadinstitute.org/hc/en-us/articles/360035531972-PED-Pedigree-format):
- If known, a Participant should have a Family Relationship to their biological mother and father.
- Twins and other multiples are also a high-priority item for reporting.

Further extended relationships can be made available using Family Relationship, but may not be as widely supported as they are harder to interpret.

#### Recommended Practices
To ensure an unambiguous representation of family relationships, we recommend that the following guidelines be followed:
- For each parent-child relationship, create a `FamilyRelationship` resource with the child as the `patient` and the parent as the `relative`.
- For all identical-sibling relationships, create two `FamilyRelationship` resources. That is, if three participants are triplets, create six `FamilyRelationship` resources. One with the `patient` as the first participant and the `relative` as the second participant, and one with the `patient` as the second participant and the `relative` as the first participant, one with the `patient` as the second participant and the `relative` as the third participant, and so on.
- For other genetic relationships, (like grandparents), create `FamilyRelationship` resources for each parent-child relationship.
  - This may require inferred individuals to be created to fill in gaps.
  - Use the [Patient Knowledge Source Extension](StructureDefinition-patient-knowledge-source.html) to mark the inferred individuals as such.
- For non-genetic relationships, such as a spouse, an adoptive parent, or surrogate mother, create one `FamilyRelationship` with each participant as the `patient` and the other as the `relative`. So, "spouse" would require two `FamilyRelationship` resources. Prefer non-gendered and sexless codes for the relationship because gender and sex are properties of the individual. For example, prefer "spouse" over "husband" or "wife."
- It is acceptable to create several `FamilyRelationship` resources for the same `patient` and `relative` pair. For example, two participants may be spouses but also third cousins. That would require four `FamilyRelationship` resources.

#### Relationship to other implementation guides

##### GA4GH Family Relationships
GA4GH Family Relationships are defined in the [GA4GH Family Relationships](https://github.com/ga4gh-duri/ga4gh-family-relationships) specification.

This `FamilyRelationship` resource is almost compatible
with the GA4GH Family Relationships specification. However, we cannot include it in the profile because the GA4GH specification restricts relationships to the (codes defined in that standard)[https://ga4gh.github.io/pedigree-fhir-ig/ValueSet-PedigreeRelationshipTypes.html]. Unfortunately, that set of codes does not meet our use cases or interoperability requirements. If the binding had been extensible, we could have inherited from the GA4GH Family Relationships profile and encouraged the use of better codes. However, software written for that profile might be able to read our `FamilyRelationship` resources as long as it does not rely on the "required" binding.

##### FHIR Mappings
The following fields from the shared data model are to be mapped into the NCPI Participant as shown below:

| **Logical Model Property**                                                                                                                 | **Cardinality** | **NCPI Family Relationship Mapping** | **Usage Guidance** | **Notes** |
|--------------------------------------------------------------------------------------------------------------------------------------------|-----------------|--------------------------------------|--------------------|-----------|
| [subject](StructureDefinition-SharedDataModelFamilyRelationship-definitions.html#diff_SharedDataModelFamilyRelationship.subject)           | 1..1            | extension[relative]                  | Required           |           |
| [target](StructureDefinition-SharedDataModelFamilyRelationship-definitions.html#diff_SharedDataModelFamilyRelationship.target)             | 1..1            | patient                              |                    |           |
| [relationship](StructureDefinition-SharedDataModelFamilyRelationship-definitions.html#diff_SharedDataModelFamilyRelationship.relationship) | 1..1            | relationship                         |                    |           |

[ped_plink]: https://zzz.bwh.harvard.edu/plink/data.shtml#ped
[ped_broad]: https://gatk.broadinstitute.org/hc/en-us/articles/360035531972-PED-Pedigree-format
[g_overview]: https://ga4gh.github.io/pedigree-fhir-ig/index.html
[g_rel_types]: https://ga4gh.github.io/pedigree-fhir-ig/ValueSet-PedigreeRelationshipTypes.html
[l_overview]: StructureDefinition-SharedDataModelFamilyRelationship.html
[l_subject]: StructureDefinition-SharedDataModelFamilyRelationship-definitions.html#key_SharedDataModelFamilyRelationship.subject
[l_target]: StructureDefinition-SharedDataModelFamilyRelationship-definitions.html#key_SharedDataModelFamilyRelationship.target
[l_relationship]: StructureDefinition-SharedDataModelFamilyRelationship-definitions.html#key_SharedDataModelFamilyRelationship.relationship
[p_knowledge]: StructureDefinition-patient-knowledge-source.html
[n_overivew]: StructureDefinition-ncpi-family-relationship.html
[n_patient]: StructureDefinition-ncpi-family-relationship-definitions.html#key_FamilyMemberHistory.patient
[n_relative]: StructureDefinition-ncpi-family-relationship-definitions.html#key_FamilyMemberHistory.extension:relative
[n_relationship]: StructureDefinition-ncpi-family-relationship-definitions.html#key_FamilyMemberHistory.relationship
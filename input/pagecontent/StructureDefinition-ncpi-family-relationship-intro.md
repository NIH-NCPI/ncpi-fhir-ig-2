
We chose the direction of the relationship to match PED files ([plink Harvard Medical School definition][ped_plink], [Broad Institute definition][ped_broad]),
which go from the individual to the mother and father.

#### Key Guidelines
Family Relationships describe the relationship between two Participants. The core use case is to present biological parentage of a participant to support family / pedigree analyses. In this spirit, platforms should seek to provide minimally the information in a [PED file][ped_broad]:
- If known, a Participant should have a Family Relationship to their biological mother and father using `KIN:027` (isBiologicalMother) and `KIN:028` (isBiologicalFather).
- Monozygotic twins and other multiples are also a high-priority item for reporting using `KIN:010` (isMonozygoticTwin).

Further extended relationships can be made available using Family Relationship, but may not be as widely supported as they are harder to interpret.

#### Recommended Practices
To ensure an unambiguous representation of family relationships, we recommend that the following guidelines be followed:
- For each parent-child relationship, create a `FamilyRelationship` resource with the child as the `patient` and the parent as the `relative`.
- Treat rarer genetic relationships (for example, `isMitochondrialDonor` or `isOvumDonor`) like the parent-child relationship. The receiver of the genetic or cellular material is the `patient` and the donor is the `relative`.
- For all monozygotic sibling relationships, create pairwise `FamilyRelationship` resources using `KIN:010`. For triplets, create six `FamilyRelationship` resources (one for each direction of each pair: A→B, B→A, A→C, C→A, B→C, C→B). For quadruplets, create twelve resources, and so on.
- For other genetic relationships, (like grandparents), create `FamilyRelationship` resources for each parent-child relationship.
  - This may require inferred individuals to be created to fill in gaps.
  - Use the [Patient Knowledge Source Extension][p_knowledge] to mark the inferred individuals as such.
- For non-genetic relationships, such as a partner, an adoptive parent, or a surrogate mother, create one `FamilyRelationship` with each participant as the `patient` and the other as the `relative`. So, "partner" would require two `FamilyRelationship` resources. Prefer non-gendered and sexless codes for the relationship because gender and sex are properties of the individual. For example, prefer "partner" over "husband" or "wife." The KIN ontology lacks many terms for precise inverse relationships, so one direction may be `isAdoptiveParent` (KIN:022) and the other `isSocialLegalRelative` (KIN:019).
- It is acceptable to create several `FamilyRelationship` resources for the same `patient` and `relative` pair. For example, two participants may be spouses but also third cousins. That would require two `FamilyRelationship` resources for the mutual isPartner relationships and several more to map back to their common great-great-grandparent. In this case, you may not know the sex of the inferred figures, so you'd use KIN:003, `isBiologicalParent` for the ancestors of unknown sex.

#### Relationship to other implementation guides

##### GA4GH Family Relationships
GA4GH Family Relationships are defined in the [GA4GH Pedigree FHIR IG][g_overview] specification.

This `NcpiFamilyRelationship` profile **derives from** the [GA4GH PedigreeRelationship][g_pedigree] profile and uses codes from the [GA4GH KIN ontology][g_kin]. The profile includes all 55 KIN codes in its ValueSet and maintains the parent's required binding for full GA4GH compatibility.

NCPI recommends using a canonical approach with three core codes (`KIN:027`, `KIN:028`, `KIN:010`) plus inferred individuals to express all pedigree relationships. This provides a complete, unambiguous representation that eases data consumption. While all KIN codes remain available for use when needed, we cannot machine-encode the preference for these three codes due to the required binding strength &mdash; doing so would require extensible binding restricted to the KIN ontology, a constraint not expressible in FHIR R4. If future FHIR versions (R5/R6) provide mechanisms to express "extensible within a required parent set," we would adopt that approach. For now, this canonical approach is documented as guidance in the profile definition and ValueSet description.

##### FHIR Mappings
The following fields from [the shared data model][l_overview] map into the NCPI Participant as shown below:

| **[Logical Model][l_overview] Property** | **[NCPI Family Relationship][n_overview] Instantiation** |
|------------------------------------------|----------------------------------------------------------|
| [subject][l_subject]                     | [patient][n_patient]                                     |
| [target][l_target]                       | [extension[relative]][n_relative]                        |
| [relationship][l_relationship]           | [relationship][n_relationship]                           |

[ped_plink]: https://zzz.bwh.harvard.edu/plink/data.shtml#ped
[ped_broad]: https://gatk.broadinstitute.org/hc/en-us/articles/360035531972-PED-Pedigree-format
[g_overview]: https://ga4gh.github.io/pedigree-fhir-ig/index.html
[g_pedigree]: https://ga4gh.github.io/pedigree-fhir-ig/StructureDefinition-PedigreeRelationship.html
[g_kin]: https://ga4gh.github.io/pedigree-fhir-ig/CodeSystem-kin.html
[g_rel_types]: https://ga4gh.github.io/pedigree-fhir-ig/ValueSet-PedigreeRelationshipTypes.html
[l_overview]: StructureDefinition-SharedDataModelFamilyRelationship.html
[l_subject]: StructureDefinition-SharedDataModelFamilyRelationship-definitions.html#key_SharedDataModelFamilyRelationship.subject
[l_target]: StructureDefinition-SharedDataModelFamilyRelationship-definitions.html#key_SharedDataModelFamilyRelationship.target
[l_relationship]: StructureDefinition-SharedDataModelFamilyRelationship-definitions.html#key_SharedDataModelFamilyRelationship.relationship
[p_knowledge]: StructureDefinition-patient-knowledge-source.html
[n_overview]: StructureDefinition-ncpi-family-relationship.html
[n_patient]: StructureDefinition-ncpi-family-relationship-definitions.html#key_FamilyMemberHistory.patient
[n_relative]: StructureDefinition-ncpi-family-relationship-definitions.html#key_FamilyMemberHistory.extension:relative
[n_relationship]: StructureDefinition-ncpi-family-relationship-definitions.html#key_FamilyMemberHistory.relationship
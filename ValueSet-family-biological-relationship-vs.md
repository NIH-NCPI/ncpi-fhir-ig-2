# Biological Relationship Codes - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Biological Relationship Codes**

## ValueSet: Biological Relationship Codes 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/family-biological-relationship-vs | *Version*:0.2.0 |
| Draft as of 2026-03-09 | *Computable Name*:FamilyBiologicalRelationshipVS |

 
All codes from the GA4GH KIN ontology for family relationships. This ValueSet duplicates the GA4GH PedigreeRelationshipTypes ValueSet to maintain compatibility with the GA4GH PedigreeRelationship profile while documenting NCPI-specific guidance. 

# NCPI-Recommended Codes for Maximum Interoperability

 
For maximum interoperability with other NCPI systems, prefer these three codes for genetic relationships in pedigrees ([PED files](https://gatk.broadinstitute.org/hc/en-us/articles/360035531972-PED-Pedigree-format)): 
* [`KIN:027` (**"isBiologicalMotherOf"**)](https://ga4gh.github.io/pedigree-fhir-ig/CodeSystem-kin.html#kin-KIN.58027): The relative is the biological mother of the patient.
* [`KIN:028` (**"isBiologicalFatherOf"**)](https://ga4gh.github.io/pedigree-fhir-ig/CodeSystem-kin.html#kin-KIN.58028): The relative is the biological father of the patient.
* [`KIN:010` (**"isMonozygoticMultipleBirthSiblingOf"**)](https://ga4gh.github.io/pedigree-fhir-ig/CodeSystem-kin.html#kin-KIN.58010): The relative and patient are monozygotic twins. For higher-order multiples (triplets, quadruplets, etc.), create KIN:010 relationships between every pair of individuals in the multiple. Since this is a non-directed relationship, each pair requires two FamilyRelationship resources (A→B and B→A).
 
Relationships are expressed from relative (parent) to patient (child): `relative`=parent, `patient`=child, , `relationship`="isBiologicalMotherOf" or "isBiologicalFatherOf". 
For other genetic relationships (grandparents, aunts, uncles, cousins), use these three codes with inferred individuals to represent the relationship chain. 

# Additional KIN Codes

 
The full [KIN ontology](https://ga4gh.github.io/pedigree-fhir-ig/CodeSystem-kin.html) provides 55 relationship codes including adoptive parents, step-relations, grandparents, and more. While all codes are available for use, NCPI systems may not fully support relationships beyond the three core codes listed above. 

# Future Enhancement

 
When FHIR R5/R6 support is added, we plan to use additional binding features to better express the preference for the three core codes while maintaining the full KIN ontology as an option. 

 **References** 

* [Family Relationship](StructureDefinition-ncpi-family-relationship.md)

### Logical Definition (CLD)

 

### Expansion

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R4/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "family-biological-relationship-vs",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/family-biological-relationship-vs",
  "version" : "0.2.0",
  "name" : "FamilyBiologicalRelationshipVS",
  "title" : "Biological Relationship Codes",
  "status" : "draft",
  "experimental" : false,
  "date" : "2026-03-09T20:11:59+00:00",
  "publisher" : "NCPI FHIR Working Group",
  "contact" : [{
    "name" : "NCPI FHIR Working Group",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.ncpi-acc.org/about/working-groups"
    },
    {
      "system" : "email",
      "value" : "ncpi-fhir-ig@googlegroups.com"
    }]
  }],
  "description" : "All codes from the GA4GH KIN ontology for family relationships. This ValueSet\nduplicates the GA4GH PedigreeRelationshipTypes ValueSet to maintain compatibility\nwith the GA4GH PedigreeRelationship profile while documenting NCPI-specific guidance.\n\n# NCPI-Recommended Codes for Maximum Interoperability\n\nFor maximum interoperability with other NCPI systems, prefer these three codes for\ngenetic relationships in pedigrees ([PED files](https://gatk.broadinstitute.org/hc/en-us/articles/360035531972-PED-Pedigree-format)):\n\n- [`KIN:027` (**\"isBiologicalMotherOf\"**)](https://ga4gh.github.io/pedigree-fhir-ig/CodeSystem-kin.html#kin-KIN.58027):\n   The relative is the biological mother of the patient.\n- [`KIN:028` (**\"isBiologicalFatherOf\"**)](https://ga4gh.github.io/pedigree-fhir-ig/CodeSystem-kin.html#kin-KIN.58028):\n   The relative is the biological father of the patient.\n- [`KIN:010` (**\"isMonozygoticMultipleBirthSiblingOf\"**)](https://ga4gh.github.io/pedigree-fhir-ig/CodeSystem-kin.html#kin-KIN.58010):\n   The relative and patient are monozygotic twins. For higher-order multiples\n   (triplets, quadruplets, etc.), create KIN:010 relationships between every\n   pair of individuals in the multiple. Since this is a non-directed relationship,\n   each pair requires two FamilyRelationship resources (A→B and B→A).\n\nRelationships are expressed from relative (parent) to patient (child):\n`relative`=parent, `patient`=child, , `relationship`=\"isBiologicalMotherOf\" or \"isBiologicalFatherOf\".\n\nFor other genetic relationships (grandparents, aunts, uncles, cousins), use these\nthree codes with inferred individuals to represent the relationship chain.\n\n# Additional KIN Codes\n\nThe full [KIN ontology](https://ga4gh.github.io/pedigree-fhir-ig/CodeSystem-kin.html)\nprovides 55 relationship codes including adoptive parents, step-relations, grandparents,\nand more. While all codes are available for use, NCPI systems may not fully support\nrelationships beyond the three core codes listed above.\n\n# Future Enhancement\n\nWhen FHIR R5/R6 support is added, we plan to use additional binding features to better\nexpress the preference for the three core codes while maintaining the full KIN ontology\nas an option.",
  "compose" : {
    "include" : [{
      "system" : "http://purl.org/ga4gh/kin.fhir",
      "version" : "0.1.0"
    }]
  }
}

```

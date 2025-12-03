# Assay strategy options - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Assay strategy options**

## ValueSet: Assay strategy options 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/assay-strategy-vs | *Version*:0.2.0 |
| Draft as of 2025-12-03 | *Computable Name*:AssayStrategyVS |

 
Assay strategy options 

 **References** 

* [BAM or CRAM file profile](StructureDefinition-ncpi-bamcram.md)
* [NCPI FASTQ File](StructureDefinition-ncpi-fastq.md)
* [Gene fusion or gene expression file profile](StructureDefinition-ncpi-gene-fusion-expression.md)
* [MAF (Somatic Mutation) file profile](StructureDefinition-ncpi-maf.md)
* [Proteomics file profile](StructureDefinition-ncpi-proteomics.md)
* [VCF or gVCF file profile](StructureDefinition-ncpi-vcf.md)

### Logical Definition (CLD)

 

### Expansion

No Expansion for this valueset (not supported by Publication Tooling)

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
  "id" : "assay-strategy-vs",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/assay-strategy-vs",
  "version" : "0.2.0",
  "name" : "AssayStrategyVS",
  "title" : "Assay strategy options",
  "status" : "draft",
  "experimental" : false,
  "date" : "2025-12-03T22:26:51+00:00",
  "publisher" : "NCPI FHIR Working Group",
  "contact" : [
    {
      "name" : "NCPI FHIR Working Group",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://www.ncpi-acc.org/about/working-groups"
        },
        {
          "system" : "email",
          "value" : "ncpi-fhir-ig@googlegroups.com"
        }
      ]
    }
  ],
  "description" : "Assay strategy options",
  "compose" : {
    "include" : [
      {
        "system" : "http://purl.obolibrary.org/obo/obi.owl",
        "filter" : [
          {
            "property" : "concept",
            "op" : "is-a",
            "value" : "0000070"
          }
        ]
      },
      {
        "system" : "http://purl.obolibrary.org/obo/obi.owl",
        "concept" : [
          {
            "code" : "0002117",
            "display" : "whole genome sequencing assay"
          },
          {
            "code" : "0002118",
            "display" : "exome sequencing assay"
          },
          {
            "code" : "0001274",
            "display" : "genotyping by array assay"
          },
          {
            "code" : "0003090",
            "display" : "bulk RNA-Seq assay"
          },
          {
            "code" : "0002571",
            "display" : "polyA-selected RNA sequencing assay"
          },
          {
            "code" : "0002631",
            "display" : "single-cell RNA sequencing assay"
          },
          {
            "code" : "0002764",
            "display" : "single-cell ATAC-seq"
          }
        ]
      }
    ]
  }
}

```

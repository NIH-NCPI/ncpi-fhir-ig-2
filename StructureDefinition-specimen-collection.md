# Linkage for related samples - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Linkage for related samples**

## Extension: Linkage for related samples 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/specimen-collection | *Version*:0.2.0 |
| Draft as of 2026-01-13 | *Computable Name*:SpecimenCollection |

Linkage for related samples

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [BAM or CRAM file profile](StructureDefinition-ncpi-bamcram.md), [NCPI FASTQ File](StructureDefinition-ncpi-fastq.md), [Gene fusion or gene expression file profile](StructureDefinition-ncpi-gene-fusion-expression.md), [MAF (Somatic Mutation) file profile](StructureDefinition-ncpi-maf.md)...Show 2 more,[Proteomics file profile](StructureDefinition-ncpi-proteomics.md)and[VCF or gVCF file profile](StructureDefinition-ncpi-vcf.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/specimen-collection)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-specimen-collection.csv), [Excel](StructureDefinition-specimen-collection.xlsx), [Schematron](StructureDefinition-specimen-collection.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "specimen-collection",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/specimen-collection",
  "version" : "0.2.0",
  "name" : "SpecimenCollection",
  "title" : "Linkage for related samples",
  "status" : "draft",
  "date" : "2026-01-13T18:03:13+00:00",
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
  "description" : "Linkage for related samples",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    }
  ],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [
    {
      "type" : "element",
      "expression" : "NcpiSpecimenCollection.subject"
    }
  ],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Extension",
        "path" : "Extension",
        "short" : "Linkage for related samples",
        "definition" : "Linkage for related samples"
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/specimen-collection"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "short" : "Reference to other samples related to this sample",
        "type" : [
          {
            "code" : "Reference"
          }
        ]
      }
    ]
  }
}

```

# NCPI Sample - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NCPI Sample**

## Resource Profile: NCPI Sample 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-sample | *Version*:0.2.0 |
| Draft as of 2026-03-09 | *Computable Name*:NCPISample |

 
FHIR Profile for NCPI Sample 

### Basic Information

#### Key Guidelines

The NCPI Sample profile is based on the standard resource type, [Specimen](https://hl7.org/fhir/R4/specimen.html) and encompasses biospecimen collection, sample information, and aliquot information. Biospecimen collection information can be excluded if unavailable. However, if there is no parent sample, collection information must be included, even if the value is `unknown`.

##### Added Profile Restrictions

* There are **3 Unique Identifiers** in the collected sample profile: one for Biospecimen Collection, Sample, and Aliquot, respectively. These IDs are different than the **participant** from whom this sample was derived.

#### Recommended Practices

* The NCPI Sample profile includes collection information. If this data is unavailable, you should set collection method to "unknown".

##### FHIR Mappings

The following fields from the shared data model are to be mapped into the NCPI Collected Sample as follows:

**Biospecimen Collection:**

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| **Logical Model Property** | **Cardinality** | **NCPI Sample Mapping** | **Usage Guidance** | **Notes** |
| [sampleGenerated](StructureDefinition-SharedDataModelBiospecimenCollection-definitions.md#diff_SharedDataModelBiospecimenCollection.sampleGenerated) | 1..1 | **MISSING** | Sample that was generated from this collection event |   |
| [participant](StructureDefinition-SharedDataModelBiospecimenCollection-definitions.md#diff_SharedDataModelBiospecimenCollection.participant) | 1..1 | subject | The participant from whom the biospecimen was taken |   |
| [ageAtCollection](StructureDefinition-SharedDataModelBiospecimenCollection-definitions.md#diff_SharedDataModelBiospecimenCollection.ageAtCollection) | 0..1 | collection.collected | The age at which this biospecimen was collected. Could be expressed with a term, an age, or an age range. |   |
| [method](StructureDefinition-SharedDataModelBiospecimenCollection-definitions.md#diff_SharedDataModelBiospecimenCollection.method) | 0..1 | collection.method | The approach used to collect the biospecimen | Recommended to use[LOINC](https://loinc.org) |
| [site](StructureDefinition-SharedDataModelBiospecimenCollection-definitions.md#diff_SharedDataModelBiospecimenCollection.site) | 0..1 | collection.bodySite | The location of the specimen collection |   |
| [spatial](StructureDefinition-SharedDataModelBiospecimenCollection-definitions.md#diff_SharedDataModelBiospecimenCollection.spatial) | 0..1 | extension[biospecimen-spatial] | Any spatial/location qualifiers | URL: https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/biospecimen-spatial |
| [laterality](StructureDefinition-SharedDataModelBiospecimenCollection-definitions.md#diff_SharedDataModelBiospecimenCollection.laterality) | 0..1 | extension[biospecimen-laterality] | Laterality information for the site | URL: https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/biospecimen-laterality |

**Sample:**

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| **Logical Model Property** | **Cardinality** | **NCPI Sample Mapping** | **Usage Guidance** | **Notes** |
| [sampleId](StructureDefinition-SharedDataModelSample-definitions.md#diff_SharedDataModelSample.sampleId) | 1..1 | identifier | Unique ID for this sample |   |
| [participant](StructureDefinition-SharedDataModelSample-definitions.md#diff_SharedDataModelSample.participant) | 1..1 | subject | The participant from whom the biospecimen was taken |   |
| [parentSample](StructureDefinition-SharedDataModelSample-definitions.md#diff_SharedDataModelSample.parentSample) | 0..* | parent | The Sample from which this Sample was derived |   |
| [type](StructureDefinition-SharedDataModelSample-definitions.md#diff_SharedDataModelSample.type) | 1..1 | type | The type of material of which this Sample is comprised |   |
| [processing](StructureDefinition-SharedDataModelSample-definitions.md#diff_SharedDataModelSample.processing) | 0..* | processing.procedure | Processing that was applied to the Parent Sample or from the Biospecimen Collection that yielded this distinct sample |   |
| [availabilityStatus](StructureDefinition-SharedDataModelSample-definitions.md#diff_SharedDataModelSample.availabilityStatus) | 0..1 | status | Can this Sample be requested for further analysis? | URL: https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/aliquot-availability |
| [storageMethod](StructureDefinition-SharedDataModelSample-definitions.md#diff_SharedDataModelSample.storageMethod) | 0..1 | condition | How is the Sample stored, eg, Frozen or with additives | Recommended to use[Hl7VSSpecimenCondition](https://terminology.hl7.org/5.3.0/ValueSet-v2-0493.html) |
| [quantity](StructureDefinition-SharedDataModelSample-definitions.md#diff_SharedDataModelSample.quantity) | 0..1 | collection.quantity | The total quantity of the specimen |   |

**Aliquot:**

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| **Logical Model Property** | **Cardinality** | **NCPI Sample Mapping** | **Usage Guidance** | **Notes** |
| [aliquotId](StructureDefinition-SharedDataModelAliquot-definitions.md#diff_SharedDataModelAliquot.aliquotId) | 1..1 | container.identifier | Unique ID for this aliquot |   |
| [sample](StructureDefinition-SharedDataModelAliquot-definitions.md#diff_SharedDataModelAliquot.sample) | 1..1 | sample.id (of parent) | The sample of which this tube is a part. |   |
| [availabilityStatus](StructureDefinition-SharedDataModelAliquot-definitions.md#diff_SharedDataModelAliquot.availabilityStatus) | 0..1 | extension[aliquot-availability] | Can this Sample be requested for further analysis? | URL: https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/aliquot-availability |
| [volume](StructureDefinition-SharedDataModelAliquot-definitions.md#diff_SharedDataModelAliquot.volume) | 0..1 | container.specimenQuantity | What is the volume of the Aliquot? |   |
| [concentration](StructureDefinition-SharedDataModelAliquot-definitions.md#diff_SharedDataModelAliquot.concentration) | 0..1 | extension[aliquot-concentration] | What is the concentration of the analyte in the Aliquot? | URL: https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/aliquot-concentration |

**Usages:**

* Refer to this Profile: [Shared Data Model for Aliquot](StructureDefinition-SharedDataModelAliquot.md)
* Examples for this Profile: [Specimen/GSS123456-01-010](Specimen-GSS123456-01-010.md), [Specimen/GSS123456-01-010p](Specimen-GSS123456-01-010p.md) and [Specimen/SA-000](Specimen-SA-000.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ncpi-fhir-implementation-guide-v2|current/StructureDefinition/ncpi-sample)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ncpi-sample.csv), [Excel](StructureDefinition-ncpi-sample.xlsx), [Schematron](StructureDefinition-ncpi-sample.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ncpi-sample",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-sample",
  "version" : "0.2.0",
  "name" : "NCPISample",
  "title" : "NCPI Sample",
  "status" : "draft",
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
  "description" : "FHIR Profile for NCPI Sample",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Specimen",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Specimen",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Specimen",
      "path" : "Specimen",
      "constraint" : [{
        "key" : "collection-xor-parent",
        "severity" : "warning",
        "human" : "If there is a parent sample, there should be no collection information. If there is collection information present, there should be no parent sample.",
        "expression" : "parent.exists().not() or collection.exists().not()",
        "source" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/ncpi-sample"
      }]
    },
    {
      "id" : "Specimen.identifier",
      "path" : "Specimen.identifier",
      "short" : "Unique ID for this sample"
    },
    {
      "id" : "Specimen.status",
      "path" : "Specimen.status",
      "short" : "Can this Sample be requested for further analysis?"
    },
    {
      "id" : "Specimen.type",
      "path" : "Specimen.type",
      "short" : "The type of material of which this Sample is comprised",
      "min" : 1
    },
    {
      "id" : "Specimen.subject",
      "path" : "Specimen.subject",
      "short" : "The participant from whom the biospecimen was taken",
      "min" : 1
    },
    {
      "id" : "Specimen.parent",
      "path" : "Specimen.parent",
      "short" : "The Sample from which this Sample was derived"
    },
    {
      "id" : "Specimen.collection",
      "path" : "Specimen.collection",
      "short" : "Information about how the biospecimen was collected. Collection information may be unknown, but must be included when there is no parent sample"
    },
    {
      "id" : "Specimen.collection.extension",
      "path" : "Specimen.collection.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "Specimen.collection.extension:biospecimenSpatial",
      "path" : "Specimen.collection.extension",
      "sliceName" : "biospecimenSpatial",
      "short" : "Any spatial/location qualifiers",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/biospecimen-spatial"]
      }]
    },
    {
      "id" : "Specimen.collection.extension:biospecimenLaterality",
      "path" : "Specimen.collection.extension",
      "sliceName" : "biospecimenLaterality",
      "short" : "Laterality information for the site",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/biospecimen-laterality"]
      }]
    },
    {
      "id" : "Specimen.collection.collected[x]",
      "path" : "Specimen.collection.collected[x]",
      "short" : "The age at which this biospecimen was collected. Could be expressed with a term, an age, or an age range. (for ages use http://hl7.org/fhir/StructureDefinition/cqf-relativeDateTime)",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "Specimen.collection.quantity",
      "path" : "Specimen.collection.quantity",
      "short" : "The total quantity of the specimen"
    },
    {
      "id" : "Specimen.collection.method",
      "path" : "Specimen.collection.method",
      "short" : "The approach used to collect the biospecimen (unknown if not provided)"
    },
    {
      "id" : "Specimen.collection.bodySite",
      "path" : "Specimen.collection.bodySite",
      "short" : "The location of the specimen collection"
    },
    {
      "id" : "Specimen.processing.procedure",
      "path" : "Specimen.processing.procedure",
      "short" : "Processing that was applied to the Parent Sample or from the Biospecimen Collection that yielded this distinct sample",
      "min" : 1
    },
    {
      "id" : "Specimen.container.extension",
      "path" : "Specimen.container.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "Specimen.container.extension:biospecimenAvailability",
      "path" : "Specimen.container.extension",
      "sliceName" : "biospecimenAvailability",
      "short" : "Can this Sample be requested for further analysis?",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/aliquot-availability"]
      }]
    },
    {
      "id" : "Specimen.container.extension:aliquotConcentration",
      "path" : "Specimen.container.extension",
      "sliceName" : "aliquotConcentration",
      "short" : "What is the concentration of the analyte in the Aliquot?",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/aliquot-concentration"]
      }]
    },
    {
      "id" : "Specimen.container.identifier",
      "path" : "Specimen.container.identifier",
      "short" : "Unique ID for this aliquot"
    },
    {
      "id" : "Specimen.container.specimenQuantity",
      "path" : "Specimen.container.specimenQuantity",
      "short" : "What is the volume of the Aliquot?"
    },
    {
      "id" : "Specimen.condition",
      "path" : "Specimen.condition",
      "short" : "How is the Sample stored, eg, Frozen or with additives"
    }]
  }
}

```

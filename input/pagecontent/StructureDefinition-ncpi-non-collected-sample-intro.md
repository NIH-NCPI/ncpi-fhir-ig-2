### Basic Information

#### Key Guidelines
The NCPI Sample profile is based on the standard resource type, [Specimen](https://hl7.org/fhir/R4/specimen.html) and encompasses biospecimen collection, sample information, and aliquot information. The NCPI Collected Sample is based on the [NCPI Sample](StructureDefinition-ncpi-sample) Profile. The main difference between a collected and non-collected sample involves inclusion or exclusion of container information for a sample as "NCPI Sample" is comprised of Sample, Aliquot, and Biospecimen Collection.

##### Added Profile Restrictions

* There are **2 Unique Identifiers** in the collected sample profile: one for Sample and Aliquot, respectively. These IDs are different than the *participant* from whom this sample was derived.

#### Recommended Practices

* The NCPI Sample profile is broken up into "NCPI Collected Sample" and "NCPI Non-collected Sample"; be mindful of selecting the right kind of sample to represent your data!

##### FHIR Mappings
The following fields from the shared data model are to be mapped into the NCPI Non-Collected Sample as follows:

**Sample:**

| **Logical Model Property** | **Cardinality** |  **NCPI Sample Mapping** |**Usage Guidance** | **Notes** |
|[sampleId](StructureDefinition-SharedDataModelSample-definitions.html#diff_SharedDataModelSample.sampleId)|1..1|identifier|Unique ID for this sample||
|[participant](StructureDefinition-SharedDataModelSample-definitions.html#diff_SharedDataModelSample.participant)|1..1|subject|The participant from whom the biospecimen was taken||
|[parentSample](StructureDefinition-SharedDataModelSample-definitions.html#diff_SharedDataModelSample.parentSample)|0..*|parent|The Sample from which this Sample was derived||
|[type](StructureDefinition-SharedDataModelSample-definitions.html#diff_SharedDataModelSample.type)|1..1|type|The type of material of which this Sample is comprised||
|[processing](StructureDefinition-SharedDataModelSample-definitions.html#diff_SharedDataModelSample.processing)|0..*|processing|Processing that was applied to the Parent Sample or from the Biospecimen Collection that yielded this distinct sample||
|[availabilityStatus](StructureDefinition-SharedDataModelSample-definitions.html#diff_SharedDataModelSample.availabilityStatus)|0..1|status|Can this Sample be requested for further analysis?|URL: https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/aliquot-availability|
|[storageMethod](StructureDefinition-SharedDataModelSample-definitions.html#diff_SharedDataModelSample.storageMethod)|0..1|collection.method|The approach used to collect the biospecimen|Recommended to use [Hl7VSSpecimenCondition](https://terminology.hl7.org/5.3.0/ValueSet-v2-0493.html)|
|[quantity](StructureDefinition-SharedDataModelSample-definitions.html#diff_SharedDataModelSample.quantity)|0..1|collection.quantity|The total quantity of the specimen||

**Aliquot:**

| **Logical Model Property** | **Cardinality** |  **NCPI Sample Mapping** |**Usage Guidance** | **Notes** |
|[aliquotId](StructureDefinition-SharedDataModelAliquot-definitions.html#diff_SharedDataModelAliquot.aliquotId)|1..1|container.identifier|Unique ID for this aliquot||
|[sample](StructureDefinition-SharedDataModelAliquot-definitions.html#diff_SharedDataModelAliquot.sample)|1..1|**MISSING**|The sample of which this tube is a part.||
|[availabilityStatus](StructureDefinition-SharedDataModelAliquot-definitions.html#diff_SharedDataModelAliquot.availabilityStatus)|0..1|extension[aliquot-availability]|Can this Sample be requested for further analysis?|URL: https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/aliquot-availability|
|[volume](StructureDefinition-SharedDataModelAliquot-definitions.html#diff_SharedDataModelAliquot.volume)|0..1|container.specimenQuantity|What is the volume of the Aliquot?||
|[concentration](StructureDefinition-SharedDataModelAliquot-definitions.html#diff_SharedDataModelAliquot.concentration)|0..1|extension[aliquot-concentration]|What is the concentration of the analyte in the Aliquot?|URL: https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/aliquot-concentration|
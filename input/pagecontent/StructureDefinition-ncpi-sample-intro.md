### Basic Information

#### Key Guidelines
The NCPI Sample profile is based on the standard resource type, [Specimen](https://hl7.org/fhir/R4/specimen.html) and encompasses biospecimen collection, sample information, and aliquot information. Biospecimen collection information can be excluded if unavailable. However, if there is no parent sample, collection information must be included, even if the value is `unknown`.

##### Added Profile Restrictions

* There are **3 Unique Identifiers** in the collected sample profile: one for Biospecimen Collection, Sample, and Aliquot, respectively. These IDs are different than the *participant* from whom this sample was derived.


#### Recommended Practices

* The NCPI Sample profile includes collection information. If this data is unavailable, you should set collection method to "unknown".

##### FHIR Mappings
The following fields from the shared data model are to be mapped into the NCPI Collected Sample as follows:

**Biospecimen Collection:**

| **Logical Model Property** | **Cardinality** |  **NCPI Sample Mapping** |**Usage Guidance** | **Notes** |
|[sampleGenerated](StructureDefinition-SharedDataModelBiospecimenCollection-definitions.html#diff_SharedDataModelBiospecimenCollection.sampleGenerated)|1..1|**MISSING**|Sample that was generated from this collection event||
|[participant](StructureDefinition-SharedDataModelBiospecimenCollection-definitions.html#diff_SharedDataModelBiospecimenCollection.participant)|1..1|subject|The participant from whom the biospecimen was taken||
|[ageAtCollection](StructureDefinition-SharedDataModelBiospecimenCollection-definitions.html#diff_SharedDataModelBiospecimenCollection.ageAtCollection)|0..1|collection.collected|The age at which this biospecimen was collected. Could be expressed with a term, an age, or an age range.||
|[method](StructureDefinition-SharedDataModelBiospecimenCollection-definitions.html#diff_SharedDataModelBiospecimenCollection.method)|0..1|collection.method|The approach used to collect the biospecimen|Recommended to use [LOINC](https://loinc.org)|
|[site](StructureDefinition-SharedDataModelBiospecimenCollection-definitions.html#diff_SharedDataModelBiospecimenCollection.site)|0..1|collection.bodySite|The location of the specimen collection||
|[spatial](StructureDefinition-SharedDataModelBiospecimenCollection-definitions.html#diff_SharedDataModelBiospecimenCollection.spatial)|0..1|extension[biospecimen-spatial]|Any spatial/location qualifiers|URL: https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/biospecimen-spatial|
|[laterality](StructureDefinition-SharedDataModelBiospecimenCollection-definitions.html#diff_SharedDataModelBiospecimenCollection.laterality)|0..1|extension[biospecimen-laterality]|Laterality information for the site|URL: https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/biospecimen-laterality|

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

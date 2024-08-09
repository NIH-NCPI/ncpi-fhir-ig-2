### Basic Definition
The collection element allows for high level organization of objects into various related groups. One common type of collection is a consortium, but other collections can also be established.  Items in a collection can include studies, datasets, or other collections (for example, if consortium A becomes a member of consortium B, the collection that represents consortium A can be added as an item in the collection representing consortium B).  

#### Primary Profile Restrictions and Enhancements
* title **must** be defined in order for users to understand the purpose of the collection. 
* code **must** be defined and **should** be one of the codes from the CodeSystem, [CollectionType](CodeSystem-collection-type.html), when possible.
* note **should** contain a meaningful description whenever possible. 
* there **must** be one or more entries referencing the "contained" resources. 
* When possible, a [website](StructureDefinition-research-web-Link.html) should be provided. For Consortium, programs and other entities with formal websites, this should be the one that provides the best overview of the group. For adhoc collections, or those collections that are less formally defined, an online document may be sufficient. 

#### Key Guidelines
The NCPI Sample profile is based on the standard resource type, [Specimen](https://hl7.org/fhir/R4/specimen.html) and encompasses biospecimen collection, sample information, and aliquot information.

##### Added Profile Restrictions



#### Recommended Practices

* The NCPI Sample profile is broken up into "NCPI Collected Sample" and "NCPI Non-collected Sample".

TODO: continue recommended practices

##### FHIR Mappings
The following fields from the shared data model are to be mapped into the NCPI Biospecimen as follows:

| **Logical Model Property** | **Cardinality** |  **NCPI Sample Mapping** |**Usage Guidance** | **Notes** |
|Sample|0..*|Specimen|Sample for analysis||
|spatial|0..1|extension[biospecimen-spatial]|Any spatial/location qualifiers|URL: https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/biospecimen-spatial|
|laterality|0..1|extension[biospecimen-laterality]|Laterality information for the site|URL: https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/biospecimen-laterality|
|availablityStatus (aliquot)|0..1|extension[aliqout-availability]|Can this Sample be requested for further analysis?|URL: https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/aliquot-availability|
|concentration|0..1|extension[aliquot-concentration]|What is the concentration of the analyte in the Aliquot?|URL: https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/aliquot-concentration|
|sampleId|1..1|Identifier|Unique ID for this sample||
|availabilityStatus (sample)|0..1|Can this Sample be requested for further analysis?||
|type|1..1|type|The type of material of which this Sample is comprised||
|participant|1..1|subject|The participant from whom the biospecimen was taken||
|parentSample|0..*|parent|The Sample from which this Sample was derived||
|quantity|0..1|collection.quantity|The total quantity of the specimen||
|storageMethod|0..1|collection.method|The approach used to collect the biospecimen||
|site|0..1|collection.bodySite|The location of the specimen collection||
|processing|0..*|processing|Processing that was applied to the Parent Sample or from the Biospecimen Collection that yielded this distinct sample||				
|aliquotId|1..1|container.identifier|Unique ID for this aliquot||
|volume|0..1|container.specimenQuantity|What is the volume of the Aliquot?||
|storageMethod|0..*|condition|How is the Sample stored, eg, Frozen or with additives||
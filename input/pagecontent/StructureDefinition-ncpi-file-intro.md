#### Key Guidelines
The NCPI File profile is based on the standard resource type, [DocumentReference](https://hl7.org/fhir/r4/documentreference.html) and is intended to represent the files associated with a participant in a research study.

##### Added Profile Restrictions
In order to ensure that our resources are interoperable across studies, we have employed a number of restrictions that should make consuming Patient resources more consistent.


* participantID **should** be a globally unique identifier associated with the patient. This practice is intended to make constructing queries for the same patient compatible across different servers (such as QA vs PROD) but also to make the resource URLs more meaningful.

* fileExternalID **should** have all appropriate Identifiers with a meaningful system/value pair. Such identifiers may include DbGAP accession IDs, global and external IDs, etc. 

* format and relatedFile.type **should** use [EDAM](https://edamontology.org/) terminology (i.e., codes) when available. Othe file type code systems are allowed if a suitable EDAM code does not exist.


#### Recommended Practices
TDOD: Write Recommended Practices

##### FHIR Mappings
The following fields from the shared data model are to be mapped to the NCPI File as shown below:

| **Logical Model Property** | **Cardinality** | **NCPI FHIR Mapping** | **Usage Guidance** | **Notes**|
|[participantID](StructureDefinition-SharedDataModelFile-definitions.html#diff_SharedDataModelFile.participantID)|1..1|identifier.value|The participant(s) for whom this file contains data|
|[fileExternalID](StructureDefinition-SharedDataModelFile-definitions.html#diff_SharedDataModelFile.fileExternalID)|0..1|subject|A related identifier of this file|
|[format](StructureDefinition-SharedDataModelFile-definitions.html#diff_SharedDataModelFile.format)|1..1|extension[file-format].valueCodeableConcept.coding|The file format used|
|[location](StructureDefinition-SharedDataModelFile-definitions.html#diff_SharedDataModelFile.location)|1..*|content|List of locations where this data can be accessed|
|[location.uri](StructureDefinition-SharedDataModelFile-definitions.html#diff_SharedDataModelFile.location.uri)|1..1|content.attachment.url|The URI at which this data can be accessed|
|[location.accessPolicy](StructureDefinition-SharedDataModelFile-definitions.html#diff_SharedDataModelFile.location.accessPolicy)|0..*|content.extension[location-access].valueReference|If present, only those under the specific Access Policy can access the file in this location.|
|[fileSize](StructureDefinition-SharedDataModelFile-definitions.html#diff_SharedDataModelFile.fileSize)|1..1|extension[file-size].valueQuantity.value, extension[file-size].valueQuantity.unit|The size of the file, e.g., in bytes.|
|[hash](StructureDefinition-SharedDataModelFile-definitions.html#diff_SharedDataModelFile.hash)|0..*|extension[hash]|Provides a list of hashes for confirming file transfers|
|[hash.type](StructureDefinition-SharedDataModelFile-definitions.html#diff_SharedDataModelFile.hash.type)|0..1|extension[hash-type].valueCode|Algorithm used to calculate the hash (and size, where applicable)|
|[hash.value](StructureDefinition-SharedDataModelFile-definitions.html#diff_SharedDataModelFile.hash.value)|1..1|extension[hash-value].valueString|Value of hashing the file|
|[contentVersion](StructureDefinition-SharedDataModelFile-definitions.html#diff_SharedDataModelFile.contentVersion)|0..1|extension[content-version].valueString|Version of the file content|
|[description](StructureDefinition-SharedDataModelFile-definitions.html#diff_SharedDataModelFile.description)|0..1|description|A description of the file|
|[type](StructureDefinition-SharedDataModelFile-definitions.html#diff_SharedDataModelFile.type)|1..1|type|The type of data contained in this file. Should be as detailed as possible, e.g., Whole Exome Variant Calls.|
|[relatedFile](StructureDefinition-SharedDataModelFile-definitions.html#diff_SharedDataModelFile.relatedFile)|0..1|TODO|Provides a reference to another file that is related to this one|
|[relatedFile.file](StructureDefinition-SharedDataModelFile-definitions.html#diff_SharedDataModelFile.relatedFile.file)|0..1|TODO|The file to which this related file is related|
|[relatedFile.type](StructureDefinition-SharedDataModelFile-definitions.html#diff_SharedDataModelFile.relatedFile.type)|0..1|TODO|The relationship of the file to the parent file in reference|

##### Note on Related Files
The fields of related files are under the scope of file metadata and that module has yet to be written at the time of the definition of Files. Once a file metadata module is written, the FHIR mappings for related file in this IG should be updated.
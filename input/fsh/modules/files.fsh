/*
Files Module profiles and logical Model
*/

Logical: CdmFile
Id: SharedDataModelFile
Title: "Shared Data Model for File"
Description: "The **Shared Data Model for File**"
* participantID 1..1 reference "The participant(s) for whom this file contains data"
* fileExternalID 0..1 string "A related identifier of this file"
* format 1..1 code "The file format used"
* location 1..* List "List of locations where this data can be accessed"
* location.uri 1..1 uri "The URI at which this data can be accessed"
* location.accessPolicy 0..* reference "If present, only those under the specific Access Policy can access the file in this location."
* fileSize 1..1 Quantity "The size of the file, e.g., in bytes."
* hash 0..* List "Provides a list of hashes for confirming file transfers"
* hash.type 1..1 code "Algorithm used to calculate the hash (and size, where applicable)"
* hash.value 1..1 string "Value of hashing the file"
* contentVersion 0..1 string "Version of the file content"
* description 0..1 string "A description of the file"
* type 1..1 code "The type of data contained in this file. Should be as detailed as possible, e.g., Whole Exome Variant Calls."
* relatedFile 0..1 List "Provides a reference to another file that is related to this one"
* relatedFile.file 0..1 reference "The file to which this related file is related"
* relatedFile.type 0..1 code "The relationship of the file to the parent file in reference"

/* TODO Add Related file to metadata - AH 2024-07-30 */ 

CodeSystem: HashTypeCS
Id: example-hash-type-code-system
Title: "Hash Types Code System"
Description: "Algorithm used to calculate the hash (and size, where applicable)"
* #md5 "md5 hash type"
* #sha256 "sha256 hash type"
* #sha512 "sha512 hash type"
* #sha1 "sha1 hash type"
* #crc32 "crc32 hash type"
* #crc32c "crc32c hash type"
* #etag "etag hash type"

CodeSystem: RelatedFileTypeCS
Id: related-file-type-code-system
Title: "Related File Type Code System"
Description: "Explains the relationship of this file to the file of reference"
* #index_of "Index of"
* #has_index "Has index"
* #data_dictionary_of "Data dictionary of"
* #has_data_dictionary "Has data dictionary"
* #plink-type-associated-files "Plink-type associated files"

ValueSet: EDAMOntologyTerms
Id: edam-ontology-terms
Title: "Enumerations for the EDAM ontology"
Description: "Enumerations for the EDAM ontology"
* include codes from system $edam

Extension: FileFormat
Id: file-format
Title: "The file format used"
Description: "The file format used"
* insert SetContext(DocumentReference)
* value[x] only CodeableConcept
* valueCodeableConcept from $edam (extensible)

Extension: LocationAccess
Id: location-access
Title: "If present, only those under the specific Access Policy can access the file in this location."
Description: "If present, only those under the specific Access Policy can access the file in this location."
* insert SetContext(DocumentReference.content)
* value[x] only Reference
* valueReference ^short = "If present, only those under the specific Access Policy can access the file in this location."

Extension: FileSize
Id: file-size
Title: "The size of the file, e.g., in bytes."
Description: "The size of the file, e.g., in bytes."
* insert SetContext(DocumentReference)
* value[x] only Quantity
* valueQuantity ^short = "Indicate the size of the file in reference"

Extension: ContentVersion 
Id: content-version
Title: "Version of the contents of the file"
Description: "Version of the contents of the file"
* insert SetContext(DocumentReference)
* value[x] only string
* valueString ^short = "Indicate the version (e.g., V1) for the contents of this file"

Extension: HashValue
Id: hash-value
Title: "Value of hashing the file"
Description: "Value of hashing the file"
* insert SetContext(DocumentReference.extension)
* value[x] only string
* valueString ^short = "Value of hashing the file"

Extension: HashType
Id: hash-type
Title: "Algorithm used to calculate the hash (and size, where applicable)"
Description: "Algorithm used to calculate the hash (and size, where applicable)"
* insert SetContext(DocumentReference.extension)
* value[x] only code
* valueCode ^short = "Algorithm used to calculate the hash (and size, where applicable)"

Extension: HashExtension
Id: hash-extension
Title: "Provides a list of hashes for confirming file transfers"
Description: "Provides a list of hashes for confirming file transfers"
* insert SetContext(DocumentReference)
* extension contains HashValue named hash-value 1..1
* extension[hash-value] ^short = "Value of hashing the file"
* extension contains HashType named hash-type 1..1
* extension[hash-type] ^short = "Algorithm used to calculate the hash (and size, where applicable)"

/** TODO Add Related file to metadata - AH 2024-07-30 */ 

Profile: NcpiFile
Parent: DocumentReference
Id: ncpi-file
Title: "NCPI File"
Description: "Information about a file related to a research participant"
* ^version = "0.0.1"
* ^status = #draft
* identifier 0..1 /*File External ID*/
* identifier ^short = "A related external file ID"
* subject 1..1 /*Participant*/
* subject ^short = "The participant(s) for whom this file contains data (i.e., ParticipantID)"
* extension contains FileFormat named file-format 1..1 /*File Format*/
* extension[file-format] ^short = "The file format used (EDAM is preferred)"
* content.attachment.url 1..1 /*Location uri*/
* content.attachment.url ^short = "The URI at which this data can be accessed"
* extension contains LocationAccess named location-access 0..* /*Location Access Policy*/
* extension[location-access] ^short = "If present, only those under the specific Access Policy can access the file in this location."
* extension contains FileSize named file-size 1..1 /*File Size*/
* extension[file-size] ^short = "Indicate the size of the file in reference"
* extension contains HashExtension named hash 0..* /*Hash (contains type and value)*/
* extension contains ContentVersion named content-version 0..1 /*Content Version*/
* extension[content-version] ^short = "The version of the content in the file"
* description 0..1 /*Description*/
* description ^short = "A description of the file"
* type 0..1 /*File Type*/
* type from edam-ontology-terms (extensible) 
* type ^short = "The type of data contained in this file."
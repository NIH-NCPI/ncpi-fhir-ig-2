/*Biospecimen Collection Module*/

Logical: CdmBiospecimenCollection
Id: SharedDataModelBiospecimenCollection
Title: "Shared Data Model for Biospecimen Collection"
Description: "Shared Data Model for Biospecimen Collection"
* sampleGenerated 1..1 reference "Sample that was generated from this collection event"
* participant 1..1 reference "The participant from whom the biospecimen was taken"
* ageAtCollection 0..1 Quantity "The age at which this biospecimen was collected. Could be expressed with a term, an age, or an age range."
* method 0..1 code "The approach used to collect the biospecimen"
* site 0..1 code "The location of the specimen collection"
* spatial 0..1 code "Any spatial/location qualifiers"
* laterality 0..1 code "Any spatial/location qualifiers"

Extension: BiospecimenSpatial
Id: biospecimen-spatial
Title: "Spatial Information"
Description: "Spatial Information"
* insert SetContext(Specimen.collection)
* value[x] only code

Extension: BiospecimenLaterality
Id: biospecimen-laterality
Title: "Laterality Information"
Description: "Laterality Information"
* insert SetContext(Specimen.collection)
* value[x] only code

/*For spatial and laterality information, there are proposed codes in the $body-location-qualifer and
$laterality-qualifer URLs in the Alias.fsh file for this project. We may want to revisit which set of terms
we use for both of these extensions
AH 08 August 2024*/

/*Sample Module*/

Logical: CdmSample
Id: SharedDataModelSample
Title: "Shared Data Model for Sample"
Description: "Shared Data Model for Sample"
* sampleId 1..1 string "Unique ID for this sample"
* participant 1..1 reference "The participant from whom the biospecimen was taken"
* parentSample 0..* reference "The Sample from which this Sample was derived"
* type 1..1 code "The type of material of which this Sample is comprised"
* processing 0..* code "Processing that was applied to the Parent Sample or from the Biospecimen Collection that yielded this distinct sample"
* availabilityStatus 0..1 code "Can this Sample be requested for further analysis?"
* storageMethod 0..* code "How is the Sample stored, eg, Frozen or with additives"
* quantity 0..1 Quantity "The total quantity of the specimen"

/*Regarding sample processing method, we need a codesystem that will describe the method of processing
applied to the sample from which a user can select.
AH 08 August 2024*/

CodeSystem: BiospecimenAvailability
Id: biospecimen-availability
Title: "Sample availability for Sample and Aliquot modules"
Description: "Sample availability for Sample and Aliquot modules"
* ^experimental = false
* ^caseSensitive = true
* ^status = #active
* #available "Available"
* #unavailable "Unavailable" 

/*Aliquot Module*/

Logical: CmdAliquot
Id: SharedDataModelAliquot
Title: "Shared Data Model for Aliquot"
Description: "Shared Data Model for Aliquot"
* aliquotId 1..1 string "Unique ID for this aliquot"
* sample 1..1 reference "The sample of which this tube is a part."
* availabilityStatus 0..1 code "Can this Sample be requested for further analysis?"
* volume 0..1 Quantity "What is the volume of the Aliquot?"
* concentration 0..1 Quantity "What is the concentration of the analyte in the Aliquot?"

Extension: AliquotAvailability
Id: aliquot-availability
Title: "Availability Status of Aliquot"
Description: "Availability Status of Aliquot"
* insert SetContext(Specimen.container)
* value[x] only code
* valueCode ^short = "Can this Sample be requested for further analysis?"

Extension: AliquotConcentration
Id: aliquot-concentration
Title: "Concentration of the Aliquot"
Description: "Concentration of the Aliquot"
* insert SetContext(Specimen.container)
* value[x] only Quantity
* valueQuantity ^short = "Specify the concentration of the aliquot"


/* Invariant to require collection for parent samples*/
Invariant:   collection-no-parent
Description: "If there is no parent sample, collection information must be present. If there is collection information present, there should be no parent sample."
Expression:  "parent.empty() implies collection.exists() and collection.exists() implies parent.empty()"
Severity:    #error

/* Invariant to require collection for parent samples*/
Invariant:   parent-no-collection
Description: "If there is no collection information, a parent sample must be present. If there is a parent sample present, there should be no collection information."
Expression:  "collection.empty() implies parent.exists() and parent.exists() implies collection.empty()"
Severity:    #error

/*NCPI Sample Profile*/
Profile: NCPISample
Parent: Specimen
Id: ncpi-sample
Title: "NCPI Sample"
Description: "FHIR Profile for NCPI Sample"
* ^version = "0.1.0"
* ^status = #draft
* obeys collection-no-parent
* obeys parent-no-collection
* identifier ^short = "Unique ID for this sample"
* subject 1..1 /*Sample.Participant*/
* subject ^short = "The participant from whom the biospecimen was taken"
* parent 0..* /*Sample.ParentSample*/
* parent ^short = "The Sample from which this Sample was derived"
* type 1..1 /*Sample.Type*/
* type ^short = "The type of material of which this Sample is comprised"
* processing.procedure 1..1 /*Sample.Processing*/
* processing.procedure ^short = "Processing that was applied to the Parent Sample or from the Biospecimen Collection that yielded this distinct sample"
* status 0..1 /*Sample.AvailabilityStatus*/
* status ^short = "Can this Sample be requested for further analysis?"
* condition 0..* /*Sample.StorageMethod*/
* condition ^short = "How is the Sample stored, eg, Frozen or with additives"
* collection ^short = "Information about how the biospecimen was collected. Collection information may be unknown, but must be included when there is no parent sample"
* collection.collected[x] only dateTime /*Age at collection*/
* collection.collectedDateTime ^short = "The age at which this biospecimen was collected. Could be expressed with a term, an age, or an age range. (for ages use http://hl7.org/fhir/StructureDefinition/cqf-relativeDateTime)"
* collection.quantity 0..1 /*Sample.Quantity*/
* collection.quantity ^short = "The total quantity of the specimen"
* collection.method 1..1 /*Biospecimen.StorageMethod*/
* collection.method ^short = "The approach used to collect the biospecimen (unknown if not provided)"
* collection.bodySite 0..1 /*Biospecimen.Site*/
* collection.bodySite ^short = "The location of the specimen collection"
* collection.extension contains BiospecimenSpatial named biospecimen-spatial 0..1 /*Biospecimen.Spatial*/
* collection.extension[biospecimen-spatial] ^short = "Any spatial/location qualifiers"
* collection.extension contains BiospecimenLaterality named biospecimen-laterality 0..1 /*Biospecimen.Laterality*/
* collection.extension[biospecimen-laterality] ^short = "Laterality information for the site"
* container.identifier ^short = "Unique ID for this aliquot"
* container.extension contains AliquotAvailability named aliquot-availability 0..1 /*Aliquot.AvailabilityStatus*/
* container.extension[aliquot-availability] ^short = "Can this Sample be requested for further analysis?"
* container.specimenQuantity 0..1 /*Aliquot.Volume*/
* container.specimenQuantity ^short = "What is the volume of the Aliquot?"
* container.extension contains AliquotConcentration named aliquot-concentration 0..1 /*Aliquot.Concentration*/
* container.extension[aliquot-concentration] ^short = "What is the concentration of the analyte in the Aliquot?"

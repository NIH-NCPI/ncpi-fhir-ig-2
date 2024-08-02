/*Biospecimen Collection Module*/

Logical: CdmBiospecimenCollection
Id: SharedDataModelBiospecimenCollection
Title: "Shared Data Model for Biospecimen Collection"
Description: "Shared Data Model for Biospecimen Collection"
* sampleGenerated 1..1 reference "Sample that was generated from this collection event"
* participant 1..1 reference "The participant from whom the biospecimen was taken"
* ageAtCondition 0..1 Quantity "The age at which this biospecimen was collected. Could be expressed with a term, an age, or an age range."
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
/*Add a value set?*/

Extension: BiospecimenLaterality
Id: biospecimen-laterality
Title: "Laterality Information"
Description: "Laterality Information"
* insert SetContext(Specimen.collection)
* value[x] only code
/*Add a value set?*/

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

/* CodeSystem: BiospecimenAvailability
Id: biospecimen-availability
Title: "Sample availability for Sample and Aliquot modules"
Description: "Sample availability for Sample and Aliquot modules"
* ^url = $bio-available
* #available "Available"
* #unavailable "Unavailable" */

/*Aliquot Module*/

Logical: CmdAliquot
Id: SharedDataModelAliquot
Title: "Shared Data Model for Aliquot"
Description: "Shared Data Model for Aliquot"
* aliquotId 1..1 string "Unique ID for this aliquot"
* sample 1..1 reference "The sample of which this tube is a part."
* availabilityStatus 0..1 code "Can this Sample be requested for further analysis?"
* quantity 0..1 Quantity "What is the volume of the Aliquot?"
* concentration 0..1 Quantity "What is the concentration of the analyte in the Aliquot?"

Extension: AliquotAvailability
Id: aliquot-availability
Title: "Availability Status of Aliquot"
Description: "Availability Status of Aliquot"
* insert SetContext(Specimen.container)
* value[x] only code
/* * include codes from system $bio-available */

Extension: AliquotConcentration
Id: aliquot-concentration
Title: "Concentration of the Aliquot"
Description: "Concentration of the Aliquot"
* insert SetContext(Specimen.container)
* value[x] only Quantity
* valueQuantity ^short = "Specify the concentration of the aliquot"

/*Combined Profile*/

Profile: NCPIBiospecimen
Parent: Specimen
Id: ncpi-biospecimen
Title: "NCPI biospecimen definition"
Description: "NCPI biospecimen definition"
* ^version = "0.1.0"
* ^status = #draft
* identifier 1..1 /*Sample.SampleID*/
* identifier ^short = "Unique ID for this sample"
* subject 1..1 /*Sample.Participant*/
* subject ^short = "The participant from whom the biospecimen was taken"
* type 1..1 /*Sample.Type*/
* type ^short = "The type of material of which this Sample is comprised"
* processing 0..* /*Sample.Processing*/
* processing ^short = "Processing that was applied to the Parent Sample or from the Biospecimen Collection that yielded this distinct sample"
* status 0..1 /*Sample.AvailabilityStatus*/
* status ^short = "Can this Sample be requested for further analysis?"
* condition 0..* /*Sample.StorageMethod*/
* condition ^short = "How is the Sample stored, eg, Frozen or with additives"
* collection.quantity 0..1 /*Sample.Quantity*/
* collection.quantity ^short = "The total quantity of the specimen"
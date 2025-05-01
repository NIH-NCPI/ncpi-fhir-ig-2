Profile: NcpiAssay
Parent: ServiceRequest
Id: ncpi-informatics-assay-request
Title: "NCPI Informatics Assay Request"
Description: "Profile to represent informatics assay requests within NCPI, such as WGS, RNA-seq, etc."

* status 1..1
* intent = #order
* code 1..1 MS
* code from $loinc (preferred)
// * subject only Reference(Patient)
// * specimen 1..* MS
// * specimen only Reference(Specimen)
// * requester only Reference(Practitioner or PractitionerRole or Organization)
* reasonCode MS
* supportingInfo MS

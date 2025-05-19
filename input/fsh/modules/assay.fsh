Profile: NcpiAssay
Parent: ServiceRequest
Id: ncpi-informatics-assay-request
Title: "NCPI Informatics Assay Request"
Description: "Profile to represent informatics assay requests within NCPI, such as WGS, RNA-seq, etc."

* status 1..1
* intent = #order
* code 1..1 MS
// $loinc (preferred): This keeps the existing binding to LOINC as the preferred code system.
// $ncit: Adds NCIT as an another code system, allowing codes from NCIT to be used in addition.
* code from $loinc (preferred)
* code from $ncit (preferred)
* reasonCode MS
* supportingInfo MS

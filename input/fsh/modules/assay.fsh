
Profile: NcpiAssay
Parent: ActivityDefinition
Id: ncpi-informatics-assay
Title: "NCPI Informatics Assay"
Description: "Profile to represent informatics assay definitions within NCPI, such as Submitted Data, WGS, RNA-seq, etc."
* code from $edam (example)
* url 1..1 MS

Profile: NcpiAssayRequest
Parent: ServiceRequest
Id: ncpi-informatics-assay-request
Title: "NCPI Informatics Assay Request"
Description: "Profile to represent informatics assay requests within NCPI, such as WGS, RNA-seq, etc."
* instantiatesUri 1..* MS
* status 1..1
* intent = #order
* reasonCode MS
* supportingInfo MS
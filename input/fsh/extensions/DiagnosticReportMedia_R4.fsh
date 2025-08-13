// FHIR R4 does not natively allow DiagnosticReport.media to reference DocumentReference (this is supported in R5).
Extension: DiagnosticReportMedia_R4
Id: diagnosticReportMedia-R4
Title: "Diagnostic Report Media R4"
Description: "Adds a DocumentReference extension to DiagnosticReport for media links in R4."
* ^context[+].type = #element
* ^context[=].expression = "DiagnosticReport"
* value[x] only Reference(DocumentReference)
* valueReference ^short = "A reference to the data or image source."

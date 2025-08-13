
Profile: NcpiAssay
Parent: ActivityDefinition
Id: ncpi-informatics-assay
Title: "NCPI Informatics Assay"
Description: "Profile to represent informatics assay definitions within NCPI, such as Submitted Data, WGS, RNA-seq, etc."
* code from $obi (preferred) // alternatively, use $edam
* url 1..1 MS

Profile: NcpiAssayRequest
Parent: ServiceRequest
Id: ncpi-informatics-assay-request
Title: "NCPI Informatics Assay Request"
Description: "Profile to represent informatics assay requests within NCPI, such as WGS, RNA-seq, etc."
* instantiatesUri 1..* MS // A list of URIs that point to the ActivityDefinition instances or external processes
* status 1..1
* intent = #order
* reasonCode MS
* supportingInfo MS


Instance: DiagnosticReportDocumentReferenceR4
InstanceOf: SearchParameter
Title: "Search by DiagnosticReportDocumentReference"
Description: "Search DiagnosticReport resources by the DiagnosticReportMedia_R4 extension."
Usage: #definition
* name = "document-reference"
* status = #active
* description = "Search DiagnosticReport by DiagnosticReportMedia_R4 extension"
* code = #media
* base = #DiagnosticReport
* type = #reference
* expression = "DiagnosticReport.extension('https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/diagnosticReportMedia-R4').value"
* target = #DocumentReference
* url = "https://nih-ncpi.github.io/ncpi-fhir-ig-2/SearchParameter/DiagnosticReportDocumentReference-R4-SearchParameter"

Profile: NcpiDiagnosticReport
Parent: DiagnosticReport
Id: ncpi-informatics-diagnostic-report
Title: "NCPI Informatics Diagnostic Report"
Description: "Profile to represent informatics diagnostic reports within NCPI, supporting DocumentReference for media links."
* extension contains DiagnosticReportMedia_R4 named media 0..* // Extension to capture media links for R4 based profiles
* media 0..0                           // retire core Media link



Profile: NcpiAssayTask
Parent: Task
Id: ncpi-assay-task
Title: "Condensed Assay Task"
Description: "Profile to represent informatics assay definitions within NCPI, such as Submitted Data, WGS, RNA-seq, etc.  A single resource to represent the intent, execution, and results of a research assay."

* code 1..1 MS
* code from $edam (preferred)
* for 1..1 MS
* instantiatesCanonical 0..1
// * instantiatesUri 1..* MS
* status 1..1 MS
* executionPeriod 0..1 MS
* note 0..* MS

// Define slicing for input
* input ^slicing.discriminator.type = #pattern
* input ^slicing.discriminator.path = "type"
* input ^slicing.rules = #open

// Define slicing for input
* output ^slicing.discriminator.type = #pattern
* output ^slicing.discriminator.path = "type"
* output ^slicing.rules = #open

// Create a slice for specimen input
* input contains specimen 0..* MS
* input[specimen].type = #Specimen
* input[specimen].valueReference only Reference(Specimen)

// Create a slice for specimen input
* output contains result 0..* MS
* output[result].type = #DocumentReference
* output[result].valueReference only Reference(DocumentReference)

* output contains observation 0..* MS
* output[observation].type = #Observation
* output[observation].valueReference only Reference(Observation)


Instance: assaytask-input
InstanceOf: SearchParameter
Title: "AssayTask Input SearchParameter"
Usage: #definition

* name = "assaytask-input"
* status = #active
* description = "Search by input reference (e.g., Specimen, Group) on AssayTask."
* code = #input
* base = #Task
* type = #reference
* expression = "Task.input.value.as(Reference)"
* target[+] = #Specimen
* target[+] = #Group
* target[+] = #Patient
* target[+] = #DocumentReference
* multipleOr = true
* multipleAnd = true
* chain[+] = "identifier"
* chain[+] = "subject"
* chain[+] = "patient"
* chain[+] = "type"
* chain[+] = "context"


//  need to create a new SearchParameter instance of type string, since FHIR search types are tied to the datatype of the value.
Instance: assaytask-input-string
InstanceOf: SearchParameter
Title: "AssayTask Input Value (String) SearchParameter"
Usage: #definition
* name = "assaytask-input-string"
* status = #active
* description = "Search AssayTask input by string value (Task.input.valueString)"
* code = #input-string
* base = #Task
* type = #string
* expression = "Task.input.value.as(String)"

//  need to create a new SearchParameter instance of type Quantity, since FHIR search types are tied to the datatype of the value.
Instance: assaytask-input-quantity
InstanceOf: SearchParameter
Title: "AssayTask Input Value (Quantity) SearchParameter"
Usage: #definition
* name = "assaytask-input-quantity"
* status = #active
* description = "Search AssayTask input by quantity value (Task.input.valueQuantity)"
* code = #input-quantity
* base = #Task
* type = #quantity
* expression = "Task.input.value.as(Quantity)"

//  need to create a new SearchParameter instance of type Integer, since FHIR search types are tied to the datatype of the value.
Instance: assaytask-input-integer
InstanceOf: SearchParameter
Title: "AssayTask Input Value (Integer) SearchParameter"
Usage: #definition
* name = "assaytask-input-integer"
* status = #active
* description = "Search AssayTask input by Integer value (Task.input.valueInteger)"
* code = #input-integer
* base = #Task
* type = #number
* expression = "Task.input.value.as(Integer)"


Instance: assaytask-output
InstanceOf: SearchParameter
Title: "AssayTask Output SearchParameter"
Usage: #definition

* name = "assaytask-output"
* status = #active
* description = "Search by output reference (e.g., DocumentReference, Observation) on AssayTask."
* code = #output
* base = #Task
* type = #reference
* expression = "Task.output.value.as(Reference)"
* target[+] = #DocumentReference
* target[+] = #Observation
* multipleOr = true
* multipleAnd = true
* chain[+] = "identifier"
* chain[+] = "subject"
* chain[+] = "patient"
* chain[+] = "basedOn"
* chain[+] = "type"
// * url = "http://example.org/fhir/SearchParameter/assaytask-output"

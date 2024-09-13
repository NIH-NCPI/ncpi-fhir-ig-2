/*

Examples for:
* NcpiStudyFamily
* NcpiFamilyRelationship

*/ 


// Example 1

Instance: FM-00C8Y7DG
InstanceOf: NcpiStudyFamily
Title: "Example patients based on data from CBTN"
Usage: #example
Description: "Example patients based on data from CBTN."
* id = "cbtn-study-family"
* identifier[0]
  * system = "https://cbtn.org/"
  * value = "FM-00C8Y7DG"
* type = #person // Required by Group with required VS
* actual = true // Required by Group

* extension[family-type].valueCodeableConcept = $ncpi-family-types#Trio "Trio"
// * extension[description].valueMarkdown = "Potential inheritance details"
// * extension[consanguinity].valueCodeableConcept = $snomedct_us#261665006  "Unknown"
* extension[study-family-focus].valueCodeableConcept = $mondo#0004992 "Cancer"
* member[0].entity = Reference(PT-KZG2CZ95)
* member[0].entity.extension[family-role].valueCodeableConcept = $family-role-code#MTH "mother"
* member[1].entity = Reference(PT-005B7CZ4)
* member[1].entity.extension[family-role].valueCodeableConcept = $family-role-code#SON "natural son"

Instance: cbtn-family-relationship-mother
InstanceOf: NcpiFamilyRelationship
Title: "An example family relationship based on data from CBTN"
Usage: #example
Description: "An example family relationship based on data from CBTN."
* subject = Reference(PT-KZG2CZ95)
* focus = Reference(PT-005B7CZ4)
* code = $family-role-code#MTH "mother"
* status = #registered


// Example 2



Instance: cbtn-family-relationship-son
InstanceOf: NcpiFamilyRelationship
Title: "An example family relationship based on data from CBTN"
Usage: #example
Description: "An example family relationship based on data from CBTN."
* subject = Reference(PT-005B7CZ4)
* focus = Reference(PT-KZG2CZ95)
* code = $family-role-code#SON "natural son"
* status = #registered
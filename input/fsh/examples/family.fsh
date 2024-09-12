/*

Examples for:
* NcpiStudyFamily
* NcpiFamilyRole
* NcpiFamilyRelationship

*/ 

Instance: GSS5555
InstanceOf: NcpiStudyFamily
Title: "Example patients based on data from GREGoR"
Usage: #example
Description: "Example patients based on data from GREGoR."
* id = "gregor-study-family"
* identifier[0]
  * system = "https://anvil.terra.bio/"
  * value = "GSS5555"
* type = #person // Required by Group with required VS
* actual = true // Required by Group
* extension[family-type].valueCodeableConcept = $ncpi-family-types#Duo "Duo"

Instance: gregor-family-role-child
InstanceOf: NcpiFamilyRole
Title: "An example family role based on data from CBTN"
Usage: #example
Description: "An example family role based on data from CBTN."
* member.entity = Reference(GSS123456)
* extension[study-family].valueReference = Reference(GSS5555)
* extension[family-role].valueCodeableConcept = $family-role-code#CHILD "child"
* type = #person // Required by Group with required VS
* actual = true // Required by Group

Instance: cbtn-family-relationship-mother
InstanceOf: NcpiFamilyRelationship
Title: "An example family relationship based on data from CBTN"
Usage: #example
Description: "An example family relationship based on data from CBTN."
* subject = Reference(GSS123456)
* focus = Reference(GSS654321)
* code = $family-role-code#CHILD "child"
* status = #registered



// Example 1
/*
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
// * extension[desctiption].valueMarkdown = "Potential inheritance details"
// * extension[consanguinity].valueCodeableConcept = $snomedct_us#261665006  "Unknown"
* extension[study-family-focus].valueCodeableConcept = $mondo#0004992 "Cancer"

Instance: cbtn-family-role-mother
InstanceOf: NcpiFamilyRole
Title: "An example family role based on data from CBTN"
Usage: #example
Description: "An example family role based on data from CBTN."
* member.entity = Reference(PT-KZG2CZ95)
* extension[study-family].valueReference = Reference(FM-00C8Y7DG)
* extension[family-role].valueCodeableConcept = $family-role-code#MTH "mother"
* type = #person // Required by Group with required VS
* actual = true // Required by Group

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

// This example uses the Study Family defined above.

Instance: cbtn-family-role-son
InstanceOf: NcpiFamilyRole
Title: "An example family role based on data from CBTN"
Usage: #example
Description: "An example family role based on data from CBTN."
* member.entity = Reference(PT-005B7CZ4)
* extension[study-family].valueReference = Reference(FM-00C8Y7DG)
* extension[family-role].valueCodeableConcept = $family-role-code#SON "natural son"
* type = #person // Required by Group with required VS
* actual = true // Required by Group

Instance: cbtn-family-relationship-son
InstanceOf: NcpiFamilyRelationship
Title: "An example family relationship based on data from CBTN"
Usage: #example
Description: "An example family relationship based on data from CBTN."
* subject = Reference(PT-005B7CZ4)
* focus = Reference(PT-KZG2CZ95)
* code = $family-role-code#SON "natural son"
* status = #registered */
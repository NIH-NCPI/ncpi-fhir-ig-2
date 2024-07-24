/*

CBTN, PCGC, and eMERGE examples for:
* NcpiFamilyStudy
* NcpiFamilyRole
* NcpiFamilyRelationship

*/ 


// Example 1

Instance: FM_00C8Y7DG
InstanceOf: NcpiFamilyStudy
Title: "Example patients based on data from CBTN"
Usage: #example
Description: "Example patients based on data from CBTN."
* id = "cbtn-family-study"
* identifier[0]
  * system = "https://cbtn.org/"
  * value = "FM_00C8Y7DG"
* type = #person // Required by Group with required VS
* actual = true

* extension[family-type].valueCodeableConcept = $ncpi-family-types#Trio "Trio"
// * extension[desctiption].valueMarkdown = "Potential inheritance details"
// * extension[consanguinity].valueCodeableConcept = $SNOMEDCT_US#261665006  "Unknown"
* extension[family-study-focus].valueCodeableConcept = $mondo#0004992 "Cancer"

Instance: cbtn-family-role-mother
InstanceOf: NcpiFamilyRole
Title: "An example family role based on data from CBTN"
Usage: #example
Description: "An example family role based on data from CBTN."
* member.entity = Reference(PT-KZG2CZ95)
* FamilyStudy = Reference(FM_00C8Y7DG)
* extension[family-role].valueCodeableConcept = $family-role-code#MTH "mother"

Instance: cbtn-family-relationship-mother
InstanceOf: NcpiFamilyRelationship
Title: "An example family relationship based on data from CBTN"
Usage: #example
Description: "An example family relationship based on data from CBTN."
* subject = Reference(PT-KZG2CZ95)
* focus = Reference(PT_005B7CZ4)
// TODO correct use of family role vs family relationship codesystems
* code = $family-role-code#MTH "mother"
* status = #registered


// Example 2

// This example uses the Family Study defined above.

Instance: cbtn-family-role-son
InstanceOf: NcpiFamilyRole
Title: "An example family role based on data from CBTN"
Usage: #example
Description: "An example family role based on data from CBTN."
* member.entity = Reference(PT_005B7CZ4)
* FamilyStudy = Reference(FM_00C8Y7DG)
* extension[family-role].valueCodeableConcept = $family-role-code#SON "natural son"

Instance: cbtn-family-relationship-son
InstanceOf: NcpiFamilyRelationship
Title: "An example family relationship based on data from CBTN"
Usage: #example
Description: "An example family relationship based on data from CBTN."
* subject = Reference(PT_005B7CZ4)
* focus = Reference(PT-KZG2CZ95)
// TODO correct use of family role vs family relationship codesystems
* code = $family-role-code#SON "natural son"
* status = #registered
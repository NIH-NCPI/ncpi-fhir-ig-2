
Instance: condition-example
InstanceOf: NcpiCondition
Title: "Example condition using data from Kids First"
Usage: #example
Description: "Example condition using data from Kids First."
* subject = Reference(PT-006SP660)
/* condition code */
* code.coding = $mondo#MONDO:0002203
/* condition text */
* code.text = "ventricular ectopy"
/* age at assertion */
* effectiveDateTime = 4931 'days'
/* assertion */
* valueCodeableConcept = $condition-assertion#Present
/* condition type */
* category = $condition-type#Disease

// /* age at onset */
// * component = 
// /* age at resolution */
// * component =
// /* other modifiers */
// * component = 
// /* stage */
// * component =
// /* location */
// * bodySite =
// /* assertion source */
// * method =
// /* asserter */
// * extension[condition-asserter].valueCode = $condition-asserter

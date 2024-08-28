
Instance: PT-006SP660-condition
InstanceOf: NcpiCondition
Title: "Example condition using data from Kids First"
Usage: #example
Description: "Example condition using data from Kids First."
* status = #final
// had to change reference participant so sushi doesn't get errors
* subject = Reference(PT-005B7CZ4)
/* condition code */
* code.coding = $mondo#MONDO:0002203
/* condition text */
* code.text = "ventricular ectopy"
/* age at assertion */
* effectiveDateTime.extension[+]
  * url = $cqf-relativeDateTime
  * extension[+]
    * url = "target"
// had to change reference participant so sushi doesn't get errors
    * valueReference = Reference(PT-005B7CZ4)
  * extension[+]
    * url = "targetPath"
    * valueString = "None"
  * extension[+]
    * url = "relationship"
    * valueCode = #after
  * extension[+]
    * url = "offset"
    * valueDuration = 4931 'days'
    * valueDuration.unit = "d"
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

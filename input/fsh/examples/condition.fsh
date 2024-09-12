
Instance: PT-006SP660-condition
InstanceOf: NcpiCondition
Title: "Example condition using data from CBTN"
Usage: #example
Description: "Example condition using data from CBTN."
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

Instance: GSS123456-condition
InstanceOf: NcpiCondition
Title: "Example condition using data from GREGoR"
Usage: #example
Description: "Example condition using data from GREGoR"
* status = #final
* subject = Reference(GSS123456)
* code.coding = $hpo#HP:0006951 /* condition code */
* code.text = "retrocerebellar cyst" /* condition text */
* valueCodeableConcept = $condition-assertion#Present /* assertion */
* category = $condition-type#Disease /* condition type */
* component.code = #ageAtOnset
* component[ageAtOnset].valueCodeableConcept = $hpo#HP:0011463 /* age at onset */
* component.code = #otherModifiers
* component[otherModifiers].valueCodeableConcept = $hpo#HP:0012832
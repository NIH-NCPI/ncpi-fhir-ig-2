/*Example for Sample*/

Instance: SA-000 /*Collection Event ID can't have underscores*/
InstanceOf: NCPICollectedSample
Title: "Example biospecimen based on data from CBTN"
Usage: #example
Description: "Example biospecimen based on data from CBTN"
* identifier.value = "SA_RV52EY7S" /*Sample ID*/
* subject = Reference(PT_006SP660) /*Participant ID*/
* type.text = "Peripheral Whole Blood" /*Sample Type*/
/*Add type.coding with some code system, maybe edam?*/
* collection.method.text = "Blood Draw" /*Biospecimen Method*/
/*Add collection.method with some code system, maybe edam?*/
* container.identifier.value = "BS_9QM8EXG3"
* collection.collectedDateTime.extension[+]
  * url = $cqf-relativeDateTime
  * extension[+]
    * url = "target"
    * valueReference = Reference(PT_006SP660)
  * extension[+]
    * url = "relationship"
    * valueCode = #after
  * extension[+]
    * url = "offset"
    * valueDuration = 4931 'days'
    * valueDuration.unit = "d"


/*https://github.com/include-dcc/include-model-forge/blob/main/input/fsh/codesystems/CodeSystem-SampleTypes.fsh use this codesystem for now but
we defintely need a real ontology for describing things like blood draws etc.*/

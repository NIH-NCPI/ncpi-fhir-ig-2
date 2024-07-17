
Instance: PT-KZG2CZ95
InstanceOf: NcpiParticipant
Title: "Example patients based on data from CBTN"
Usage: #example
Description: "Example patients based on data from CBTN."
// Notice that we can use the DbGaP study ID for easier searching
* identifier[0]
  * system = "https://cbtn.org/"
  * value = "C21156"
* identifier[1]
  * system = "https://data.kidsfirstdrc.org"
  * value = "PT_KZG2CZ95"
* birthDate.extension[+]
  * url = $cqf-relativeDateTime
  * extension[+]
    * url = "target"
    * valueReference = Reference(PT-KZG2CZ95)
  * extension[+]
    * url = "targetPath"
    * valueString =  "birthDate"
  * extension[+]
    * url = "relationship"
    * valueCode = #after
  * extension[+]
    * url = "offset"
    * valueDuration = 2006 'days'
    * valueDuration.unit = "d"
* extension[us-core-birth-sex].valueCode = #F "Female"
* extension[us-core-race]
  * extension[ombCategory].valueCoding =  $omb-race-eth#2106-3 "White"
  * extension[text].valueString = "White"
* extension[us-core-ethnicity]
  * extension[ombCategory].valueCoding =  $omb-race-eth#2186-5 "Not Hispanic or Latino"
  * extension[text].valueString = "Not Hispanic or Latino"
* extension[dob-method].valueCoding = $ncpi-dob-method#year-only
* extension[age-at-last-vital-status].valueQuantity
  * value = 6314
  * unit = "days"
  * system = $ucum
  * code = #d "days"
/*

* extension[age-at-last-vital-status].valueDate = 1991-01-23
  * extension[+]
    * url = $cqf-relativeDateTime 
    * extension[+]
      * url = "target"
      * valueReference = Reference(PT-KZG2CZ95)
    * extension[+]
      * url = "targetPath"
      * valueString =  "birthDate"
    * extension[+]
      * url = "relationship"
      * valueCode = #after
    * extension[+]
      * url = "offset"
      * valueDuration = 6314 'days'
      * valueDuration.unit = "d"


*/
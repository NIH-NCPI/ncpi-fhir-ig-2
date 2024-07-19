/*
Participant Examples

CBTN, PCGC, and eMERGE examples for:
* NcpiParticipant
* NcpiPerson
* NcpiParticipantStudy

*/ 

// NcpiParticipant Examples

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

Instance: PT-005B7CZ4
InstanceOf: NcpiParticipant
Title: "Example patients based on data from PCGC"
Usage: #example
Description: "Example patients based on data from PCGC."
* identifier[0]
  * system = "http://chdgenes.org/"
  * value = "20757"
* identifier[1]
  * system = "http://chdgenes.org/"
  * value = "PT_005B7CZ4"
  // TODO I don't understand this. What birthdate extension?
* birthDate.extension[+]
  * url = $cqf-relativeDateTime
  * extension[+]
    * url = "target"
    * valueReference = Reference(PT-005B7CZ4)
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
  * extension[ombCategory].valueCoding =  $omb-race-eth#2135-2 "Hispanic or Latino"
  * extension[text].valueString = "Hispanic or Latino"


Instance: 6812345
InstanceOf: NcpiParticipant
Title: "Example patients based on data from eMERGE"
Usage: #example
Description: "Example patients based on data from eMERGE"
* identifier[0]
  * system = "https://emerge-network.org/"
  * value = "12345"
* identifier[1]
  * system = "https://emerge-network.org/"
  * value = "6812345"
* birthDate.extension[+]
  * url = $cqf-relativeDateTime
  * extension[+]
    * url = "target"
    * valueReference = Reference(6812345)
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
  * extension[ombCategory].valueCoding =  $omb-race-eth#1002-5 "American Indian or Alaska Native"
  * extension[text].valueString = "American Indian or Alaska Native"
* extension[us-core-ethnicity]
  * extension[ombCategory].valueCoding =  $omb-race-eth#2186-5 "Not Hispanic or Latino"
  * extension[text].valueString = "Not Hispanic or Latino"
* extension[dob-method].valueCoding = $ncpi-dob-method#decade-only



// NcpiPerson Examples

Instance: cbtn-example-person
InstanceOf: NcpiPerson
Title: "Example patients based on data from CBTN"
Usage: #example
Description: "Example patients based on data from CBTN"
* identifier
  * system = "https://data.kidsfirstdrc.org"
  * value = "PS_123"
* link
  * target = Reference(PT-KZG2CZ95)  


Instance: pcgc-example-person
InstanceOf: NcpiPerson
Title: "Example patients based on data from PCGC"
Usage: #example
Description: "Example patients based on data from PCGC"
* identifier
  * system = "http://chdgenes.org/"
  * value = "PS_123"
* link
  * target = Reference(PT-005B7CZ4) 


Instance: emerge-example-person
InstanceOf: NcpiPerson
Title: "Example patients based on data from eMERGE"
Usage: #example
Description: "Example patients based on data from eMERGE"
* identifier
  * system = "https://emerge-network.org/"
  * value = "PS_321"
* link
  * target = Reference(6812345) 

// NcpiParticipantStudy Examples

Instance: cbtn-example-participantstudy
InstanceOf: NcpiStudyParticipant
Title: "Example mappings based on data from CBTN"
Usage: #example
Description: "Example mappings based on data from CBTN"
* individual = Reference(PT-KZG2CZ95)  
* study = Reference(SD-BHJXBDQK)
* status = #candidate
* consent = Reference(AP-GRU)  

Instance: pcgc-example-participantstudy
InstanceOf: NcpiStudyParticipant
Title: "Example mappings based on data from PCGC"
Usage: #example
Description: "Example mappings based on data from PCGC"
* individual = Reference(PT-005B7CZ4)  
* study = Reference(SD-PREASA7S)  
* status = #candidate
* consent = Reference(AP-HMB) 

Instance: emerge-example-participantstudy
InstanceOf: NcpiStudyParticipant
Title: "Example mappings based on data from eMERGE"
Usage: #example
Description: "Example mappings based on data from eMERGE"
* individual = Reference(6812345)  
* study = Reference(phv00407460.v2)
* status = #candidate
* consent = Reference(AP-GRU) 

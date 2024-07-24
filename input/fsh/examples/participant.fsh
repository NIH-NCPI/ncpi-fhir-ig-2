/*

CBTN, PCGC, and eMERGE examples for:
* NcpiParticipant
* NcpiPerson
* stub AccessPolicy
* stub ResearchStudy
* NcpiParticipantStudy

*/ 


// Example 1

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

Instance: AP-GRU
InstanceOf: NcpiResearchAccessPolicy
Title: "Mock consent based on kf-gru-dac-consent"
Usage: #example
Description: "General Research Use (GRU)"
* status = #draft
* scope = http://terminology.hl7.org/CodeSystem/consentscope#research
* category.coding = http://terminology.hl7.org/CodeSystem/consentcategorycodes#research
* policyRule = http://terminology.hl7.org/CodeSystem/consentpolicycodes#cric
* provision.type = http://hl7.org/fhir/consent-provision-type#permit
* provision.purpose[+] = $ncpi-data-access-code#GRU "General Research Use"
* extension[description].valueMarkdown = "Use of the data is limited only by the terms of the model Data Use Certification."
* extension[website].valueUrl = "https://redcap.chop.edu/surveys/?s=A7M873HMN8"
* extension[accessType].valueCodeableConcept = $ncpi-data-access-type#controlled

Instance: SD-BHJXBDQK
InstanceOf: ResearchStudySubject
Title: "Mock study based on kf-research-study-subject-gru-dac"
Usage: #example
Description: "GRU data access via DAC"
* identifier[0]
  * system = "https://cbtn.org/"
  * value = "SD-BHJXBDQK"
* title = "GRU-DAC Study Subject"
* description = "General Research Use data access via DAC"
* status = #completed
* partOf = Reference(kf-research-study-cbtn)
* extension[consent].valueReference = Reference(kf-gru-dac-consent)
* enrollment = Reference(kf-research-study-cbtn-participants)

Instance: cbtn-example-participantstudy
InstanceOf: NcpiStudyParticipant
Title: "Example mappings based on data from CBTN"
Usage: #example
Description: "Example mappings based on data from CBTN"
* individual = Reference(PT-KZG2CZ95)  
* study = Reference(SD-BHJXBDQK)
* status = #candidate
* consent = Reference(AP-GRU)  



// Example 2

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

Instance: AP-HMB
InstanceOf: NcpiResearchAccessPolicy
Title: "Mock consent based on kf-gru-dbgap-consent"
Usage: #example
Description: "General Research Use (GRU)"
* status = #draft
* scope = http://terminology.hl7.org/CodeSystem/consentscope#research
* category.coding = http://terminology.hl7.org/CodeSystem/consentcategorycodes#research
* policyRule = http://terminology.hl7.org/CodeSystem/consentpolicycodes#cric
* provision.type = http://hl7.org/fhir/consent-provision-type#permit
* provision.purpose[+] = $ncpi-data-access-code#GRU "General Research Use"
* extension[description].valueMarkdown = "Use of the data is limited only by the terms of the model Data Use Certification."
* extension[website].valueUrl = "https://www.ncbi.nlm.nih.gov/projects/gap/cgi-bin/study.cgi?study_id=phs002517"
* extension[accessType].valueCodeableConcept = $ncpi-data-access-type#controlled

Instance: SD-PREASA7S
InstanceOf: ResearchStudySubject
Title: "Mock Study based on kf-research-study-subject-gru-dbgap"
Usage: #example
Description: "GRU data access via dbGaP"
* identifier[0]
  * system = "https://cbtn.org/"
  * value = "GRU-dbGaP"
* title = "GRU-dbGaP Study Subject"
* description = "General Research Use data access via dbGaP"
* status = #completed
* partOf = Reference(kf-research-study-cbtn)
* extension[consent].valueReference = Reference(kf-gru-dbgap-consent)
* enrollment = Reference(kf-research-study-cbtn-participants)

Instance: pcgc-example-participantstudy
InstanceOf: NcpiStudyParticipant
Title: "Example mappings based on data from PCGC"
Usage: #example
Description: "Example mappings based on data from PCGC"
* individual = Reference(PT-005B7CZ4)  
* study = Reference(SD-PREASA7S)  
* status = #candidate
* consent = Reference(AP-HMB) 



// Example 3

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

// Example uses AP-GRU for consent seen in example 2

Instance: phv00407460.v2
InstanceOf: ResearchStudySubject
Title: "Mock study based on kf-research-study-subject-gsr-allowed"
Usage: #example
Description: "Genomic Summary Results (GSR) Allowed Access"
* identifier[0]
  * system = "https://cbtn.org/"
  * value = "GSR-ALLOWED"
* title = "GSR-ALLOWED Study Subject"
* description = "Genomic Summary Results (GSR) Allowed Access"
* status = #completed
* partOf = Reference(kf-research-study-cbtn)
* extension[consent].valueReference = Reference(kf-gsr-allowed-access)
* enrollment = Reference(kf-research-study-cbtn-participants)

Instance: emerge-example-participantstudy
InstanceOf: NcpiStudyParticipant
Title: "Example mappings based on data from eMERGE"
Usage: #example
Description: "Example mappings based on data from eMERGE"
* individual = Reference(6812345)  
* study = Reference(phv00407460.v2)
* status = #candidate
* consent = Reference(AP-GRU) 

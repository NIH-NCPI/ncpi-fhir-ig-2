// Participant Module

Logical: CdmResearchParticipant
Id: SharedDataModelResearchParticipant
Title: "Shared Data Model for Research Participants"
Description: "The **Shared Data Model for Research Participants**"
* participantID 1..1 string "Unique participant identifier. System identifier used for internal references."
* externalID 0..* code "Unique participant identifier. System identifier used for internal references."
* population 0..* code "Population, Race, and/or Ethnicity information."
* ombRace 0..* code "OMB coded Race for backwards compatibility"
* ombEth 0..* code "OMB coded Ethnicity for backwards compatibility"
* sex 1..1 code "Sex assigned at birth (or pre-natal observed sex)"
* dateOfBirth 0..1 date "Date of Birth of the participant. Details of privacy method should be included in DOBMethod"
* dobMethod 0..1 code "Specifies method used to alter DOB for research sharing. Details should be available in the study protocols."
* ageAtLastVitalStatus 0..1 date "Age at last vital status"
* vitalStatus 0..1 code "Vital Status"

CodeSystem: ResearchDataDateOfBirthMethod
Id: research-data-date-of-birth-method 
Title: "Enumerations for how DOB was constructed"
Description: "Enumerations for how DOB was constructed"
* ^url = $ncpi-dob-method 
* ^experimental = false
* ^caseSensitive = true
* #exact "Exact"
* #year-only "Year Only"
* #shifted "Shifted"
* #decade-only "Decade Only"
* #other "Other"

ValueSet: ResearchDataDateOfBirthMethodVS
Id: research-data-date-of-birth-method-vs
Title: "Enumerations for how DOB was constructed"
Description: "Enumerations for how DOB was constructed"
* include codes from system $title-type

Extension: ResearchPopulation
Id: research-population
Title: "Research Population"
Description: "Code describing the population (CDC)"
* insert SetContext(Patient)
* value[x] only CodeableConcept
// * valueCodeableConcept from research-population-vs

Extension: ResearchDateOfBirthMethod
Id: research-date-of-birth-method
Title: "Research Date of Birth Method"
Description: "Code indicating method of the DOB construction"
* insert SetContext(Patient)
* value[x] only Coding
* valueCoding from research-data-date-of-birth-method-vs (extensible)

Extension: AgeAtLastVitalStatus 
Id: research-age-at-last-vital-status
Title: "Age at Last Vital Status Extension"
Description: "Age at Last Vital Status Extension"
* insert SetContext(Patient)
// * value[x] only date
* value[x] only Quantity
* valueQuantity ^short = "Indicate age via relative date time extension or official date of when last vital status was assessed."

Profile: NcpiParticipant
Parent: Patient
Id: ncpi-participant 
Title: "NCPI Participant"
Description: "Research oriented patient"
* ^version = "0.1.0"
* ^status = #draft
* id 1..1 
* id ^short = "ParticipantID - Unique participant identifier. System identifier used for internal references."
* identifier 0..* 
* identifier ^short = "External IDs for this participant. Requires scoping."
* birthDate ^short = "Date of Birth of the participant. Details of privacy method should be included in DOBMethod"
* deceased[x] ^short = "Implementers can provide relativeDateTime or actual date or T/F, depending on data available."

* extension contains USCoreBirthSexExtension named us-core-birth-sex 0..1
* extension[us-core-birth-sex] ^short = "Sex assigned at birth (or pre-natal observed sex)"
* extension contains USCoreRaceExtension named us-core-race 0..1
* extension[us-core-race] ^short = "US Core Race"
* extension contains USCoreEthnicityExtension named us-core-ethnicity 0..1
* extension[us-core-ethnicity] ^short = "US Core Ethnicity"
* extension contains ResearchPopulation named population 0..1
* extension[population] ^short = "Population, Race, and/or Ethnicity information."
* extension contains ResearchDateOfBirthMethod named dob-method 0..1
* extension[dob-method] ^short = "Specifies method used to alter DOB for research sharing. Details should be available in the study protocols."
* extension contains AgeAtLastVitalStatus named age-at-last-vital-status 0..1
* extension[age-at-last-vital-status] ^short = "Age or date of last vital status"



//  Person Module

Logical: CdmPerson
Id: SharedDataModelPerson
Title: "Shared Data Model for Research Persons"
Description: "The **Shared data model for Person**"
* identifier 1..1 string "Unique Person identifier."
* participant 1..1 reference "The participant we are describing"

Extension: AccessPolicy
Id: access-policy
Title: "Access policy"
Description: "Access Policy Extension"
* insert SetContext(ResearchSubject)
* value[x] only Reference
* valueReference 1..1
* valueReference only Reference(Consent)

Profile: NcpiPerson
Parent: Person
Id: ncpi-person 
Title: "NCPI Person"
Description: "Person"
* ^version = "0.1.0"
* ^status = #draft
* id 0..1 
* id ^short = "Unique participant identifier"
* link.target only Reference(NcpiParticipant)
* link.target ^short = "The participant we are describing"


//  Study Participant Module

Logical: CdmStudyParticipant
Id: SharedDataModelStudyParticipant
Title: "Shared Data Model for Research Participant and Study Mapping"
Description: "The **Shared data model for StudyParticipant**"
* participant 1..1 reference "The participant we are describing"
* researchStudy 0..1 reference "The Research Study this participant has a relationship with"
* accessPolicy 0..* reference "The Access Policy that may apply to this participant's data from this study. Not canonical, ie, one must rely on the row level AP."

Profile: NcpiStudyParticipant
Parent: ResearchSubject
Id: ncpi-Study-Participant 
Title: "NCPI Participant Study"
Description: "Research Study"
* ^version = "0.1.0"
* ^status = #draft
* individual only Reference(NcpiParticipant)
* individual ^short = "The participant we are describing"
* study only Reference(ResearchStudy)
* study ^short = "The Research Study this participant has a relationship with"
* extension contains AccessPolicy named access-policy 0..*
* extension[access-policy] ^short = "The Access Policy that may apply to this participant's data from this study. Not canonical, ie, one must rely on the row level AP."

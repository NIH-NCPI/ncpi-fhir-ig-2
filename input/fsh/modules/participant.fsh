// Participant Module

Logical: CdmResearchParticipant
Id: SharedDataModelResearchParticipant
Title: "Shared Data Model for Research Participants"
Description: "The **Shared Data Model for Research Participants**"
* ParticipantID 1..1 string "Unique participant identifier. System identifier used for internal references."
* ExternalID 0..* code ""
* Population 0..* code ""
* OmbRace 0..* code ""
* OmbEth 0..* code ""
* Sex 1..1 code ""
* DateOfBirth 0..1 date ""
* DOBMethod 0..1 code ""
* AgeAtLastVitalStatus 0..1 date ""
* VitalStatus 0..1 code ""

Logical: CdmPerson
Id: SharedDataModelPerson
Title: "Shared Data Model for Research Persons"
Description: "The **Shared data model for Person**"
* identifier 1..1 string ""
* participant 1..1 reference ""


CodeSystem: ResearchDataDateOfBirthMethod
Id: research-data-date-of-birth-method 
Title: "Enumerations for how DOB was constructed"
Description: "Enumerations for how DOB was constructed"
* ^url = $ncpi-dob-method 
* ^experimental = false
* ^caseSensitive = true
* #Exact "Exact"
* #YearOnly "Year Only"
* #Shifted "Shifted"
* #DecadeOnly "Decade Only"
* #Other "Other"

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
* value[x] only date
* valueDate ^short = "Indicate age via relative date time extension or official date of when last vital status was assessed."



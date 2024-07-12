

Profile: NcpiParticipant
Parent: Patient
Id: ncpi-patient 
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

* extension contains ResearchPopulation named population 0..1
* extension[population] ^short = "Population, Race, and/or Ethnicity information."
* extension contains ResearchDateOfBirthMethod named dob-method 0..1
* extension[dob-method] ^short = "Specifies method used to alter DOB for research sharing. Details should be available in the study protocols."
* extension contains AgeAtLastVitalStatus named age-at-last-vital-status 0..1
* extension[age-at-last-vital-status] ^short = "Age or date of last vital status"

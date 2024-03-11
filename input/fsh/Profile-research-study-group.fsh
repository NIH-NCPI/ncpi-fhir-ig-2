Profile: ResearchStudyGroup
Parent: Group
Id: study-group
Title: "NCPI Research Study Group"
Description: "Grouping subject participation within a research study is helpful to provide definitive lists of participants that fit a specific criteria such as *All Participants* or *Participants From a Particular Consent Group*, etc. "
* ^version = "0.0.1"
* ^status = #draft
* code = $ncit#C142710 "Study Participant"
* quantity 1..1
* actual = true
* type = #person
* member.entity only Reference(Patient)


# Participant

## Overview
### Participant
Participants are a scoped entity that represents the anchor for all data for a specific real-world entity. Typically, this is a person involved in a research study and all of their data collected for that study (or set of studies). This entity has direct attributes (eg, demographics), so if two studies that share an identifier space present conflicting information, it may be necessary to have multiple participants.

Participants (ie, data about an entity that is scope constrained) can be linked with a Person.
Participants can be associated with different substudies (and with different data sharing restrictions) via Study Participation.

### Person
In situations where a person participates in multiple studies that have participant data scoped in an exclusive way within one or more projects, we have a Person entity. It is functionally a “group” of Participants that are all describing one “actual” person. This is especially to support situations where access policies about that participant might be conflicting and cases where the data itself about the participant might conflict but cannot be adjudicated by the repository.

### Study Participation
Study Participation ([ResearchSubject](https://hl7.org/fhir/researchsubject.html)) describes the relationship between a specific Participant and a Research Study that collects and is sharing data on that Participant. A single Participant may have this “Study Participation” relationship with multiple Research Studies, and each relationship may have a different sharing restriction. These relationships are primarily illustrative, as the Access Policy details of any given element are documented within that element. 

### Study Arm / Sub-Cohort
Some groups, eg, Immport, use a sub-grouping within a study to describe in more detail the relationship of Participant and Study. This could be a new entity, it could be “just” a sub-Study, or it could be an attribute of the Study Participation.


## Conventions
- ResearchSubject provides the linkage between a [Patient](https://hl7.org/fhir/R4/patient.html) and a [ResearchStudy](https://hl7.org/fhir/researchstudy.html).
- NCPI Participant is based on the standard resource type, Patient and is intended to represent an individual participating in a specific research study.
- A single NCPI Participant can be a part of more than one NCPI Study group
- A single person can appear in multiple studies via separate NCPI Participant resources


## Relevant Artifacts
[NCPI Participant](StructureDefinition-ncpi-participant.html)
[NCPI Person](StructureDefinition-ncpi-person.html)
[NCPI Study Participant](StructureDefinition-ncpi-Study-Participant.html)

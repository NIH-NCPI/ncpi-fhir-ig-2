### NCPI Participant
#### Participant
Participants are a scoped entity that represents the anchor for all data for a specific real-world entity. Typically, this is a person involved in a research study and all of their data collected for that study (or set of studies). This entity has direct attributes (eg, demographics), so if two studies that share an identifier space present conflicting information, it may be necessary to have multiple participants.

Participants (ie, data about an entity that is scope constrained) can be linked with a Person.
Participants can be associated with different substudies (and with different data sharing restrictions) via Study Participation.

#### Person
In situations where a person participates in multiple studies that have participant data scoped in an exclusive way within one or more projects, we have a Person entity. It is functionally a “group” of Participants that are all describing one “actual” person. This is especially to support situations where access policies about that participant might be conflicting and cases where the data itself about the participant might conflict but cannot be adjudicated by the repository.

### Study Participation
Study Participation (ResearchSubject) describes the relationship between a specific Participant and a Research Study that collects and is sharing data on that Participant. A single Participant may have this “Study Participation” relationship with multiple Research Studies, and each relationship may have a different sharing restriction. These relationships are primarily illustrative, as the Access Policy details of any given element are documented within that element. 

### NCPI Sample
#### Biospecimen Collection
The Collection entity describes the collection procedure that generated the biospecimen. This can be very lightweight, for example just describing the age at collection and pointing to the Sample that was collected, or it can have robust information about the procedure, location, and laterality. Collection details are not required, but it should be indicated if a Sample was the “collected sample” (if known).

#### Sample
Samples are ideally “biologically equivalent” biospecimen. This may be an abstraction from real-world samples, but provide a helpful tool for simplifying potentially complex data recorded in LIMS. For example, a protocol may include several edta tubes of whole blood: those would be tracked separately in a LIMS, but a secondary data research consumer doesn’t need to know those details in most cases. 

Samples can be derived from other samples or from a collection event. It’s possible to describe detailed processing chains, for example tracking Whole Blood -> WBCs -> DNA, but this is not required. *Only the collected biospecimen and any biospecimen used in analysis NEED to be recorded.*

There are cases where tube contamination may present challenges that a user of this data may not be able to track without further information, but this is out of scope for our use case. 

#### Aliquot
Some studies may provide detailed information about biospecimen-in-tubes. They may be available for analysis by others, for example. These can represent exact tubes or total amounts available of a Sample.

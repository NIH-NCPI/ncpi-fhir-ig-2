### Conformance
The NCPI FHIR IG is broken into modules in order to allow hosts to determine which parts of the IG apply to the data they expect to be loading. Some servers will not be serving row-level data, and, as such, will not be expected to support the row-level module's profiles. 

For each module, a list of artifacts will be provided which define the nature of that portion of the IG. Any system that purports to be compliant to one or more modules **shall** have these profiles and resources loaded and their constraints **shall** be validated against for all data that has been loaded. 

# ncpi-fhir-ig-2
Welcome to NCPI FHIR IG 2. The goal for this repository is to relaunch the IG project with a clearer focus, an explicit style guide using the current tools including Sushi v3. 

# Contributing Quick Updates
The contribution content I wrote back during the initial start for IG v2 is somewhat outdated, but I don't have time to correct it for this gathering. So, here are some key points to consider if you are up for contributing:

## Module Content Requirements
### Profiles and Extensions
Non-example content specific to a single module should be defined within a single file inside the directory, input/fsh/modules. This file should be named clearly after the module name (such as participant.fsh for participant specific module content.) Content that should be contained within this file should be all terminologies, extensions and profiles that are specific to the module only. 

For extensions and terminologies that directly relate to more than one module should be defined elsewhere. 


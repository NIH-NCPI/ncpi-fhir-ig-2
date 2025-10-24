### Basic Definition
The collection element allows for high level organization of objects into various related groups. One common type of collection is a consortium, but other collections can also be established.  Items in a collection can include studies, datasets, or other collections (for example, if consortium A becomes a member of consortium B, the collection that represents consortium A can be added as an item in the collection representing consortium B).  

#### Primary Profile Restrictions and Enhancements
* title **must** be defined in order for users to understand the purpose of the collection. 
* code **must** be defined and **should** be one of the codes from the CodeSystem, [CollectionType](CodeSystem-collection-type.html), when possible.
* note **should** contain a meaningful description whenever possible. 
* there **must** be one or more entries referencing the "contained" resources. 
* When possible, a [website](StructureDefinition-research-web-link.html) should be provided. For Consortium, programs and other entities with formal websites, this should be the one that provides the best overview of the group. For adhoc collections, or those collections that are less formally defined, an online document may be sufficient. 

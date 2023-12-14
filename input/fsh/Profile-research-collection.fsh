
CodeSystem: CollectionType
Id: collection-type
Title: "Collection Type"
Description: "Enumerated list of collection types"
* ^url = $ncpi-collection-type
* ^experimental = false
* ^caseSensitive = true
* #consortium "Consortium"
* #program "Program"
* #user-defined "User Defined"

ValueSet: CollectionTypeVS
Id: collection-type-vs
Title: "Collection Type"
Description: "Enumerated list of Collection types"
* ^experimental = false
* include codes from system $ncpi-collection-type

Logical: CdmResearchCollection
Id: SharedDataModelResearchCollection
Title: "Shared Data Model for Research Collection"
Description: "The **Shared Data Model for Research Collection** represent various collections of research data including, but not limited, to Consortia, Programs, adhoc collections of Studies and datasets among other types of collections."
* name 1..1 string "The title of the collection."
* description 0..1 string "The description of the collection."
* type 1..1 code "The type of collection being described."
* type  from CollectionTypeVS (extensible)
* website 0..1 url "A URL for a website, document, or other reference that provides more information as an authoritative source of information about the collection."
* items 1..* Reference "List of references to items included in the list. These can be studies, datasets, etc. "

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

Profile: NcpiResearchCollection
Parent: List
Id: ncpi-research-collection
Title: "NCPI Research Collection"
Description: "Collections of research data including, but not limited, to Consortia, Programs, adhoc collections of Studies and datasets among other types of collections."
* title 1..1
* title ^short = "The collection's title."
* note ^short = "The description of the collection."
* code ^short = "The type of collection being described."
* code from collection-type-vs (extensible) 
* code 1..1
* entry 1..* 
* entry ^short = "List of references to items included in the list."
* extension contains 
    ResearchWebLink named website 0..1 and
    Label named label 0..* 
* extension[website] ^short = "URL describing the research collection, this can include a formal website, such as the Consortium or Program's website, or to an online document describing the collection."
* extension[label] ^short = "Alias such as acronym and alternate names."

Logical: CdmResearchCollection
Id: SharedDataModelResearchCollection
Title: "Shared Data Model for Research Collection"
Description: "The **Shared Data Model for Research Collection** represent various collections of research data including, but not limited, to Consortia, Programs, adhoc collections of Studies and datasets among other types of collections."
* name 1..1 string "The title of the collection."
* description 0..1 string "The description of the collection."
* type 1..1 code "The type of collection being described."
* type  from CollectionTypeVS (extensible)
* website 0..1 url "A URL for a website, document, or other reference that provides more information as an authoritative source of information about the collection."
* items 1..* Reference "List of references to items included in the list. These can be studies, datasets, etc."
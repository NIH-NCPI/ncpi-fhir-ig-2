Extension: Label
Id: label-extension
Title: "Label"
Description: "A text label accompanied by a code indicating the label type (such as Acronym, subtitle, etc)"
* insert SetContext(List) 
* extension contains 
    type 0..1 MS and
    label 0..1 MS
* extension[type] ^short = "primary|official|scientific|plain-language|subtitle|acronym|earlier-title|language|autotranslated|human-use|machine-use|duplicate-uid"
* extension[type].value[x] only CodeableConcept
* extension[type].valueCodeableConcept from https://nih-ncpi.github.io/ncpi-fhir-ig-2/ValueSet/title-type (required)
* extension[label] ^short = "The name"
* extension[label].value[x] only string
# FHIR Basics - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* **FHIR Basics**

## FHIR Basics

While this IG assumes that the reader is already proficient with FHIR resources and the overall model, basic overview will be provided here for key concepts that are heavily relied upon throughout the IG itself.

### External Resources To Learn more

FHIR is a sophisticated API and the documentation may be a bit opaque on the first pass. There are resources available to help those interested in learning more to get up to speed.

* [FHIR 101](https://github.com/NIH-NCPI/fhir-101) is a tutorial inside a Jupyter notebook that was put together by some folks at the Kids First Resource Center.
* [FHIR Drills](https://fhir-drills.github.io/index.html)
* [Office FHIR Docs](https://hl7.org/fhir/)

### FHIR Terminologies

Terminology has always been a fundamental part of knowledge exchange and it's importance is even more salient than ever. FHIR addresses the need with a handful of resources:

#### CodeSystem

FHIR defines related codes by enumerating them inside a [CodeSystem](https://hl7.org/fhir/codesystem.html). The CodeSystem will have a unique **url** property to establish it's functional identity, and codes from that CodeSystem will typically carry that url as the code's **system** property to establish the code's origins (and thus it's true meaning). Many times, each code will be accompanied by a **display** which provides a more **human readable** representation of the code and possibly a **definition** which may provide additional clarity about the code's intended use.

Codes within a CodeSystem can optionally be arranged hierarchically.

#### ValueSet

A CodeSystem acts as the definition of a set of codes which have a common system (the **url**). A ValueSet, on the other hand, is a collection of codes that is defined for a specific purpose (binding). The members of a ValueSet do not have to originate from the same CodeSystem. One might want to bind a specific Condition profile's code property to a fixed set of codes from one or more public ontologies. This would be done by adding the members to a specific ValueSet and binding it to the code property in the profile.

#### Coding

A [Coding](https://hl7.org/fhir/datatypes.html#Coding) is a FHIR data type that describes a single code. In addition to the **code** property, it will usually include a **system** and possibly the code's **display** property.

#### CodeableConcept

A [CodeableConcept](https://hl7.org/fhir/datatypes.html#CodeableConcept) is a common data type in FHIR that allows a resource to attach one or more Codings. A typical use for multiple Codings is to provide terms from other ontologies that represent the same concept.

#### ConceptMap

The [ConceptMap](https://hl7.org/fhir/conceptmap.html) provides the FHIR server with mappings from a source code to one or more related codes. Client applications can then utilize the $translate function to list all codes mapped to a particular code.


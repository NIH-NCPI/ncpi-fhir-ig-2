# TitleType - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **TitleType**

## CodeSystem: TitleType 

| | | |
| :--- | :--- | :--- |
| *Official URL*:http://hl7.org/fhir/title-type | *Version*:0.2.0 | |
| * Standards status: *[Trial-use](http://hl7.org/fhir/R4/versions.html#std-process) | [Maturity Level](http://hl7.org/fhir/versions.html#maturity): 0 | *Computable Name*:TitleType |
| *Other Identifiers:*OID:2.16.840.1.113883.4.642.1.1492 | | |

 
Used to express the reason and specific aspect for the variant title, such as language and specific language. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [TitleTypeVS](ValueSet-title-type-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "title-type",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status",
      "valueCode" : "trial-use"
    },
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm",
      "valueInteger" : 0
    }
  ],
  "url" : "http://hl7.org/fhir/title-type",
  "identifier" : [
    {
      "system" : "urn:ietf:rfc:3986",
      "value" : "urn:oid:2.16.840.1.113883.4.642.1.1492"
    }
  ],
  "version" : "0.2.0",
  "name" : "TitleType",
  "title" : "TitleType",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-02-06T18:07:39+00:00",
  "publisher" : "NCPI FHIR Working Group",
  "contact" : [
    {
      "name" : "NCPI FHIR Working Group",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://www.ncpi-acc.org/about/working-groups"
        },
        {
          "system" : "email",
          "value" : "ncpi-fhir-ig@googlegroups.com"
        }
      ]
    }
  ],
  "description" : "Used to express the reason and specific aspect for the variant title, such as language and specific language.",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 13,
  "concept" : [
    {
      "code" : "primary",
      "display" : "Primary title",
      "definition" : "Main title for common use. The primary title used for representation if multiple titles exist."
    },
    {
      "code" : "official",
      "display" : "Official title",
      "definition" : "The official or authoritative title."
    },
    {
      "code" : "scientific",
      "display" : "Scientific title",
      "definition" : "Title using scientific terminology."
    },
    {
      "code" : "plain-language",
      "display" : "Plain language title",
      "definition" : "Title using language common to lay public discourse."
    },
    {
      "code" : "subtitle",
      "display" : "Subtitle",
      "definition" : "Subtitle or secondary title."
    },
    {
      "code" : "short-title",
      "display" : "Short title",
      "definition" : "Brief title (e.g. 'running title' or title used in page headers)"
    },
    {
      "code" : "acronym",
      "display" : "Acronym",
      "definition" : "Abbreviation used as title"
    },
    {
      "code" : "earlier-title",
      "display" : "Different text in an earlier version",
      "definition" : "Alternative form of title in an earlier version such as epub ahead of print."
    },
    {
      "code" : "language",
      "display" : "Different language",
      "definition" : "Additional form of title in a different language."
    },
    {
      "code" : "autotranslated",
      "display" : "Different language derived from autotranslation",
      "definition" : "Machine translated form of title in a different language, language element codes the language into which it was translated by machine."
    },
    {
      "code" : "human-use",
      "display" : "Human use",
      "definition" : "Human-friendly title"
    },
    {
      "code" : "machine-use",
      "display" : "Machine use",
      "definition" : "Machine-friendly title"
    },
    {
      "code" : "duplicate-uid",
      "display" : "Different text for the same object with a different identifier",
      "definition" : "An alternative form of the title in two or more entries, e.g. in multiple medline entries"
    }
  ]
}

```

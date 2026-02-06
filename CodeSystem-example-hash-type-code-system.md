# Hash Types Code System - NCPI FHIR Implementation Guide v2 v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Hash Types Code System**

## CodeSystem: Hash Types Code System 

| | |
| :--- | :--- |
| *Official URL*:https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/example-hash-type-code-system | *Version*:0.2.0 |
| Draft as of 2026-02-06 | *Computable Name*:HashTypeCS |

 
Algorithm used to calculate the hash (and size, where applicable) 

 This Code system is referenced in the content logical definition of the following value sets: 

* This CodeSystem is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "example-hash-type-code-system",
  "url" : "https://nih-ncpi.github.io/ncpi-fhir-ig-2/CodeSystem/example-hash-type-code-system",
  "version" : "0.2.0",
  "name" : "HashTypeCS",
  "title" : "Hash Types Code System",
  "status" : "draft",
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
  "description" : "Algorithm used to calculate the hash (and size, where applicable)",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 7,
  "concept" : [
    {
      "code" : "md5",
      "display" : "md5 hash type"
    },
    {
      "code" : "sha256",
      "display" : "sha256 hash type"
    },
    {
      "code" : "sha512",
      "display" : "sha512 hash type"
    },
    {
      "code" : "sha1",
      "display" : "sha1 hash type"
    },
    {
      "code" : "crc32",
      "display" : "crc32 hash type"
    },
    {
      "code" : "crc32c",
      "display" : "crc32c hash type"
    },
    {
      "code" : "etag",
      "display" : "etag hash type"
    }
  ]
}

```

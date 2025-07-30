# Informatics Assay Requests

* The `NcpiAssayRequest` profile is based on the `ServiceRequest` resource and is used to represent informatics assay orders such as whole genome sequencing or RNA-seq. It enables traceability and linkages to specimens, patients, and supporting evidence.
* Each assay request must be associated with a url that defines the assay. The url MAY point to a `NcpiAssay` profile based on the `ActivityDefinition` resource, which provides a reusable template for the assay definition.
  * The `url` of the `NcpiAssay` profile captures the specific assay definition.
  * The `code` of the `NcpiAssay` profile captures the assay type, such as "Whole Genome Sequencing" or "RNA Sequencing" - ideally specified by the [EDAM ontology](https://edamontology.github.io/edam-browser/). 
* Assay results are captured in the `DiagnosticReport` resource, which summarizes the findings and MAY include links to structured results in the `Observation` resource.
  * Temporal ordering of assay results is captured in the `DiagnosticReport.extension.age`property, which is an `Age` type.
  * For R4 implementations, the `DocumentReference.context` resource is used to the DiagnosticReport and ServiceRequest. 
  * In R5+ implementations, links to the DocumentReference are captured in the `DiagnosticReport.media`field

## 🧬 Modeling Assays in FHIR - Key Features of `NcpiAssay`


The assay—including the order, the structured results, and linked raw outputs—is represented in FHIR using a set of interconnected resources.

### Core Resource Mapping

| Concept                  | FHIR Resource           | Role in the Model                                          |
|--------------------------|--------------------------|------------------------------------------------------------|
| Patient                  | `Patient`               | Recipient of assay                                         |
| Specimen                 | `Specimen`              | Biological sample being tested                             |
| Assay definition         | `ActivityDefinition`    | Template for assay configuration                           |
| Assay request            | `ServiceRequest`        | Formal order for the assay                                 |
| Assay result             | `DiagnosticReport`      | Summary and interpretation container                       |
| Structured findings      | `Observation`           | Genomic variants, implications, annotations, scalar values |
| Raw/complementary files | `DocumentReference`     | Linked external files like VCFs or PDFs                    |

> ⚠️ **Use `Task` for workflow tracking only. For searchable and traceable data, use `ServiceRequest`, `Observation`, and `DiagnosticReport`.**

---

## 📌 Resource Descriptions

### `Patient`
Represents the individual receiving care or study. Connects to all clinical or assay-related resources.

### `Specimen`
Represents the collected biological material. Includes collection method, processing, and origin.

### `Group`
Represents a cohort of patients or specimens. Useful for studies involving multiple subjects or samples.

### `ActivityDefinition`
Defines what an assay *is*: specimen requirements, outputs, performers. Reusable, protocol-based template.
The `ActivityDefinition.code` value should be a SNOMED CT code that describes the assay type. Examples include:

* measure "anything"
```
* code = $snomedct_us#122869004 "Measurement procedure (procedure)"
```

* measure "any substance"
```
* code = $snomedct_us#430925007 "Measurement of substance (procedure)"
```
* measure "Nucleic acid"
```x
* code = $snomedct_us#398545005 "Nucleic acid assay (procedure)"
```


### `ServiceRequest`
Instantiates a request for an assay, linking `Patient`, `Specimen`, and `ActivityDefinition`.

### `DiagnosticReport`
Summarizes assay results. Links to the ordering `ServiceRequest`, source `Patient`, `Group`, `Specimen`, and `Observations`.

### `Observation`
The `Observation` resource in FHIR is highly extensible and can be used to capture a wide range of assay results—not limited to genomics.
By standardizing assay outputs using `Observation`, systems gain improved **searchability**, **cross-modality analytics**, and **longitudinal comparisons**.

> Use `Observation.code` and `Observation.method` to semantically distinguish result types across assays.

The use of `Observation` is optional, but is useful to expose findings that are otherwise embedded in `DocumentReference`. It allows for more granular querying and analysis of assay results.

### `DocumentReference`
Links external data artifacts (e.g., VCFs, BAMs, PDFs) to the clinical context.

---

## 🔄 Task Resource: Workflow Management Caveats

The `Task` resource supports execution and state transitions across workflow steps. However:

- **Inputs/outputs are not searchable**
- **Not suitable for data-level chaining or query**
- **Intended for backend processing, not provenance**

Recommendation: Optionally, use `Task` to model actions like “sequence this sample,” but **not** for linking files to Patient, Specimen, etc.

---

## 🧭 FHIR Workflow Pattern

FHIR organizes activities into three layers:

| Pattern         | FHIR Resource        | Assay Example                             |
|-----------------|----------------------|---------------------------------------------------|
| Definition      | `ActivityDefinition` | BRCA1 sequencing protocol                         |
| Request         | `ServiceRequest`     | Order to run BRCA1 test for Patient X            |
| Event           | `Observation`, `DiagnosticReport` | Results and interpretations              |

Links like `basedOn`, `result`, and `subject` enable full traceability across these stages.

---

## 🔍 Search & Chaining Examples

### Query IG example resources

If the submitter has not provided any `Assay` resources, you can query the "core" resources directly. For example:

```
GET '/Patient?_id=p1&_revinclude=Specimen:subject&_revinclude=DocumentReference:subject' | jq '.entry[] | .fullUrl'
"http://localhost:8080/fhir/Patient/p1"
"http://localhost:8080/fhir/Specimen/s1"
"http://localhost:8080/fhir/DocumentReference/f1"

```


To retrieve all resources associated with a specific Diagnostic Report provided in examples:

```
GET /DiagnosticReport?_id=dr1&_include=DiagnosticReport:based-on&_include=DiagnosticReport:subject&_revinclude:iterate=DocumentReference:related  | jq '.entry[] | .fullUrl'
```
Will return:
```

"http://localhost:8080/fhir/DiagnosticReport/dr1"
"http://localhost:8080/fhir/Patient/p1"
"http://localhost:8080/fhir/ServiceRequest/a1"
"http://localhost:8080/fhir/DocumentReference/f1"

```

To find all `ServiceRequest` resources that instantiate a specific `ActivityDefinition` and are associated with a given `Patient`, you can use the following query:
```
GET '/fhir/ServiceRequest?instantiates-uri=https://github.com/lh3/bwa&subject=Patient/p1&_revinclude:iterate=DocumentReference:related&_revinclude:iterate=DiagnosticReport:based-on'  | jq '.entry[] | .fullUrl'
"http://localhost:8080/fhir/ServiceRequest/a1"
"http://localhost:8080/fhir/DiagnosticReport/dr1"
"http://localhost:8080/fhir/DocumentReference/f1"

```


### General FHIR Search

FHIR search allows powerful, relationship-based querying:


```http
# 1. Find all reports for patient named "Sarah"
GET /DiagnosticReport?subject:Patient.name=Sarah

# 2. Find Observations from a specific report
GET /Observation?based-on=DiagnosticReport/123

# 3. Find reports related to BRCA1 testing
GET /DiagnosticReport?result:Observation.code=LA6706-1

# 4. Find patients with a variant
GET /Patient?_has:DiagnosticReport:subject:result.value-concept=XYZ
```

An 'end-to-end' query for all documents associated with a given Assay and Group would look like this:


* The `ActivityDefinition` is instantiated into a `ServiceRequest`
* That `ServiceRequest.subject` is a `Group/{groupId}`
* We want all `DiagnosticReport` and `DocumentReference` resources resulting from that `ServiceRequest` (via `basedOn`, `context.related`, etc.)

---

## 🧭 Goal

> Find all `DiagnosticReport` and `DocumentReference` resources that are **based on a `ServiceRequest`** for a given `ActivityDefinition`, where **that `ServiceRequest` references a Group**.

---

## 🔍 Query Flow

### **Step 1: Find `ServiceRequest`s for the `ActivityDefinition` and `Group`**

```http
GET /ServiceRequest?instantiates-canonical=ActivityDefinition/{activityDefId}&subject=Group/{groupId}
```

This returns a list of matching `ServiceRequest` resources.

Example response:

```json
{
  "resourceType": "Bundle",
  "entry": [
    {
      "resource": {
        "resourceType": "ServiceRequest",
        "id": "sr-001",
        "subject": { "reference": "Group/heart-cohort" },
        "instantiatesCanonical": ["ActivityDefinition/covid-test"]
      }
    }
  ]
}
```

---

### **Step 2: Find `DiagnosticReport`s based on those `ServiceRequest`s**

Suppose you got `ServiceRequest/sr-001`:

```http
GET /DiagnosticReport?based-on=ServiceRequest/sr-001
```

> Each report is tied to a specific `Patient`, even though the request was for a `Group`.

---

### **Step 3: Find `DocumentReference`s based on the same `ServiceRequest`**

Check for `basedOn` or `context.related` for R4 vs R5+ implementations:

```http
GET /DocumentReference?based-on=ServiceRequest/sr-001
```

or:

```http
GET /DocumentReference?context.related=ServiceRequest/sr-001
```

> Many servers index only `context.related`, so both are worth trying.

---

## 🧪 Combined Query (if supported)

Some servers support chaining with `_type`:

```http
GET /?_type=DiagnosticReport,DocumentReference&based-on=ServiceRequest/sr-001
```

---

## ✅ Summary Table

| Resource            | Filter                                                                  |
| ------------------- | ----------------------------------------------------------------------- |
| `ServiceRequest`    | `instantiates-canonical=ActivityDefinition/{id}` + `subject=Group/{id}` |
| `DiagnosticReport`  | `based-on=ServiceRequest/{id}`                                          |
| `DocumentReference` | `based-on=` or `context.related=ServiceRequest/{id}`                    |


### Example Usage

<div style="text-align: center;">
    <img style="display: block; margin: 0 auto; margin-bottom: 20px;" width="100%" src="assay-usage.png" alt="Example Assay Diagram" />
</div>

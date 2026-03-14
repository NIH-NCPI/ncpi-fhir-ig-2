# Informatics Assay Requests

## 🧬 Modeling Assays in FHIR - Key Features of `NcpiAssay`


The assay—including the order, the structured results, and linked raw outputs—is represented in FHIR using a set of interconnected resources.

### Core Resource Mapping

| Concept                  | FHIR Resource           | Role in the Model                           |
|--------------------------|--------------------------|---------------------------------------------|
| Patient                  | `Patient`               | Recipient of assay                          |
| Specimen                 | `Specimen`              | Biological sample being tested              |
| Assay definition         | `ActivityDefinition`    | Template for assay configuration            |
| Assay request            | `ServiceRequest`        | Formal order for the assay                  |
| Assay result             | `DiagnosticReport`      | Summary and interpretation container        |
| Structured findings      | `Observation`           | Genomic variants, implications, annotations, scalar values |
| Raw/complementary files | `DocumentReference`     | Linked external files like VCFs or PDFs     |

> ⚠️ **Use `Task` for workflow tracking only. For searchable and traceable data, use `ServiceRequest`, `Observation`, and `DiagnosticReport`.**

---

## 📌 Resource Descriptions


* Assay results are captured in the `DiagnosticReport` resource, which summarizes the findings and MAY include links to structured results in the `Observation` resource.
  * Temporal ordering of assay results is captured in the `DiagnosticReport.extension.age`property, which is an `Age` type.
  * For R4 implementations, the `DocumentReference.context` resource is used to the DiagnosticReport and ServiceRequest. 
  * In R5+ implementations, links to the DocumentReference are captured in the `DiagnosticReport.media`field

### `Patient`
Represents the individual receiving care or study. Connects to all clinical or assay-related resources.

### `Specimen`
Represents the collected biological material. Includes collection method, processing, and origin.

### `Group`
Represents a cohort of patients or specimens. Useful for studies involving multiple subjects or samples.

### `ActivityDefinition`
Defines what an assay *is*: a reusable, protocol-based template, specifies *what* was done..
* The `url` of the `NcpiAssay` profile captures the specific assay definition.
* The `code` of the `NcpiAssay` profile captures the assay type, such as "Whole Genome Sequencing" or "RNA Sequencing" - ideally specified by the [EDAM ontology](https://edamontology.github.io/edam-browser/). 


### `ServiceRequest`
* The `NcpiAssayRequest` profile is based on the `ServiceRequest` resource and is used to represent informatics assay orders such as whole genome sequencing or RNA-seq. It enables traceability and linkages to specimens, patients, and supporting evidence.
* Instantiates a request for an assay, linking `Patient`, `Specimen`, and `ActivityDefinition`.
* Each assay request must be associated with a url that defines the assay.
  * The url MAY point to a `NcpiAssay` profile based on the `ActivityDefinition` resource, which provides a reusable template for the assay definition.

### `DiagnosticReport`
Summarizes assay results. Links to the ordering `ServiceRequest`, source `Patient`, `Group`, `Specimen`, and optional `Observations`.

### `Observation`
The optional `Observation` resource in FHIR is highly extensible and can be used to capture a wide range of assay results—not limited to genomics.  While the use of `Observation` is optional, but is useful to expose findings that are otherwise embedded in `DocumentReference`. It allows for more granular querying and analysis of assay results.

> Use `Observation.code` and `Observation.method` to semantically distinguish result types across assays.



### `DocumentReference`
Links external data artifacts (e.g., VCFs, BAMs, PDFs) to the clinical context.

---

## 🔄 Task Resource: Workflow Management Caveats

> Why not use `Task` for assay data?

The `Task` resource supports execution and state transitions across workflow steps. However:

- **Inputs/outputs are not searchable**
- **Not suitable for data-level chaining or query**
- **Intended for backend processing, not provenance**

Recommendation: Optionally, use `Task` to model actions like “assay parameters” but **not** for linking files to Patient, Specimen, etc.

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

## Implementation
This approach adds a **FHIR SearchParameter** that enables `_include` and `_revinclude` searches between `DiagnosticReport` and `DocumentReference` in **R4** implementations.  
It supports the `DiagnosticReportMedia_R4` extension, which links `DocumentReference` resources as media attachments to a `DiagnosticReport`.

### Background
- **FHIR R4** does not natively allow `DiagnosticReport.media` to reference `DocumentReference` (supported in **R5**).
- To align R4 with R5 semantics, we introduced the `DiagnosticReportMedia_R4` extension:
- Without a SearchParameter, these extension-based references cannot be traversed in `_include` / `_revinclude` queries.

### Design Approach for SearchParameter
1. **Code Alignment with R5**
   - Use `code = media` so client queries are identical across R4 and R5.

2. **FHIRPath Expression**
   - Target the extension explicitly:
     ```fhirpath
     DiagnosticReport.extension.where(
       url = 'https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/diagnosticReportMedia-R4'
     ).value.as(Reference)
     ```

3. **Version-Specific Inclusion**
   - Include this SearchParameter only in the **R4** IG build; omit in **R5** where native behavior exists.

4. **Example Queries (Same in R4 & R5)**
   ```
   GET /DiagnosticReport?_include=DiagnosticReport:media
   GET /DocumentReference?_revinclude=DiagnosticReport:media
   ```
   - **Transparent to clients**: the same query works on both versions.
     - Without the SearchParameter, clients would need to handle version-specific logic.
     ```
     GET /DiagnosticReport?_id=dr1&_include=DiagnosticReport:based-on&_include=DiagnosticReport:subject&_revinclude:iterate=DocumentReference:related  | jq '.entry[] | .fullUrl'
      ```
   

5. **Authoring Differences in FSH**
   - **R4 (via extension)**  
     ```fsh
     Instance: dr-r4-1
     InstanceOf: DiagnosticReport
     * status = #final
     * code.text = "Example report"
     * subject = Reference(Patient/p1)
     * extension[diagnosticReportMedia-R4].valueReference = Reference(DocumentReference/doc-123)
     ```
   - **R5 (native)**  
     ```fsh
     Instance: dr-r5-1
     InstanceOf: DiagnosticReport
     * status = #final
     * code.text = "Example report"
     * subject = Reference(Patient/p1)
     * media[0].link = Reference(DocumentReference/doc-123)
     ```
   - **Result:** The client’s query remains the same (`_include=DiagnosticReport:media`); only the authoring pattern differs.


### Benefits
- **Transparent client experience** — same query (`media`) in R4 and R5.
- **Interoperability & migration** — aligns behavior, minimizes client conditionals.
- **Maintainability** — version-specific behavior isolated to IG authoring, not client code.

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
GET /DiagnosticReport?_id=dr1&_include=DiagnosticReport:based-on&_include=DiagnosticReport:subject&_include=DiagnosticReport:media  | jq '.entry[] | .fullUrl'
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


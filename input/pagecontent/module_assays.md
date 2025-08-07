# Informatics Assay Requests
# 🧬 Modeling Informatics Assays with NcpiAssayTask

## Overview

The `NcpiAssayTask` resource is a condensed FHIR representation of research assay events. It integrates **what was performed**, **on whom**, **using what parameters**, and **producing what results** — all within a single Task-derived structure.

This model eliminates the need for separate `ServiceRequest` and `DiagnosticReport` resources, while making use of `ActivityDefinition` as an optional reusable reference.

---

## 🔑 Core Resource Roles

| Concept              | FHIR Resource        | Purpose                                     |
|----------------------|----------------------|---------------------------------------------|
| Patient              | `Patient`            | Participant from whom specimens are collected |
| Specimen             | `Specimen`           | Biological material input into the assay    |
| Group                | `Group`              | Cohort of subjects (optional)              |
| Assay Task           | `NcpiAssayTask`      | Encapsulates assay execution and output     |
| Assay definition     | `ActivityDefinition` | (Optional) Defines a reusable assay protocol |
| File outputs         | `DocumentReference`  | Data outputs from the assay (e.g. BAM, VCF) |
| Observations         | `Observation`        | (Optional) Scalar or interpreted results     |

---

## 📄 NcpiAssayTask Structure

`NcpiAssayTask` captures:

- `code`: The assay performed (EDAM term recommended)
- `for`: The `Patient` or `Group` the assay is performed on
- `input`: One or more `Specimen` and optional parameters
- `output`: One or more `DocumentReference` resources pointing to files or structured results
- `instantiatesCanonical`: (Optional) An `ActivityDefinition` representing the assay protocol
- `executionPeriod`: When the assay occurred
- `note`, `status`, `intent`: Execution metadata

---

## 🔍 SearchParameters

Custom SearchParameters enable linking and inclusion:

* `assaytask-input` Search by input reference (e.g., Specimen, Group, Patient or DocumentReference)
* `assaytask-input-string` Search by string input (e.g., parameter)
* `assaytask-input-integer` Search by integer input (e.g., numeric parameter)
* `assaytask-input-quantity` Search by quantity input

* `assaytask-output` Search by output reference (e.g., DocumentReference, Observation)

---

## 🔎 Example Queries

### 1. Find AssayTasks by Specimen

```http
GET /Task?input=Specimen/s1
```

### 2. Find DocumentReferences produced by Tasks using a given Specimen

```http
GET /Task?input=Specimen/s1&_include=Task:output
```

### 3. Find all tasks for a given assay type

```http
GET /Task?code=operation_3670
```

### 4. Search by string input (e.g., parameter)

```http
GET /Task?input-string=Phred+33
```

(Requires `assaytask-input-string` SearchParameter)

### 5. Find all tasks for a specific group

```http
GET /Task?for=Group/rs1-g1&_include=Task:output
```
### 6. Find all tasks instantiating a specific ActivityDefinition

```http
GET /Task?instantiates-canonical=
```

### 7. Find all tasks with a specific output DocumentReference

```http
GET /Task?output=DocumentReference/f3
```

### 8. Find all tasks with a specific code (e.g., BWA alignment)

```http
GET /Task?code=http://edamontology.org/operation_3670
```

### 9. Find all tasks with a specific numeric input parameter

```http
GET /Task?input-integer=150
```
(Requires `assaytask-input-integer` SearchParameter)
---

## 🔗 Group and ActivityDefinition Example

Find all `NcpiAssayTask` resources:

- Based on a specific `ActivityDefinition` (e.g., BWA alignment)
- Performed for members of a specific `Group`

```http
GET /Task?instantiates-canonical=https://github.com/lh3/bwa&for=Group/rs1-g1&_include=Task:output
```

---

## 🧪 Output Example

Returns:

- `NcpiAssayTask/t2`
- `Group/rs1-g1`
- `DocumentReference/f3`

---

## ✅ Summary

`NcpiAssayTask` provides a **compact, queryable, and interoperable** representation of assay events in research and clinical settings, supporting:

- EDAM-coded assay types
- Parameterized execution
- Multiple inputs and outputs
- Optional protocol definitions

This model promotes clean chaining, backward compatibility, and simplifies both retrospective and prospective data capture.


### Example Usage

<div style="text-align: center;">
    <img style="display: block; margin: 0 auto; margin-bottom: 20px;" width="100%" src="assay-usage.png" alt="Example Assay Diagram" />
</div>

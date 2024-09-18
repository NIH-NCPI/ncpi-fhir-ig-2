### File Metadata

File metadata describes information about the experimental or investigative process and input material that is relevant to the creation, discovery, and reuse of the file.

#### Scope and Usage

As a general rule, file metadata should populated for any files which are produced by experiment processes or which are considered "study data".

Specifically scoped file metadata profiles based on file type and input material are available to further clarify which fields within the file metadata module are relevant to particular data types.

##### Released File Profiles

* Bam or Cram file profile
* Gene fusion or gene expression file profile
* FASTQ file profile
* MAF (Somatic Mutation) file profile
* VCF or gVCF file profile

##### In Progress File Profiles or Focus Areas

* Proteomics
* Radiological Imaging (Image Studies)
* Pathology Imaging (Slide Images)
* Metabolomics

### Background

The file metadata model is intended as a mechanism for providing useful and relevant information related to the creation and use of data files. File metadata was created to provide a "home" for important file-related assay information while the assay model is still under revision. Technical metadata such as file size, file location, and hash are not include in file metadata but can be found directly on the file resource.

The file metadata model is intended to be modular and flexible in response to the varying descriptive requirements for different data types.  While the overall model contains all fields that may be relevant to any file data type, implementation of the model should be done via profiles, which subset the larger list of file metadata fields into just those that are relevant to the file type in question.  This allows for standardization across data types for shared fields while still providing the flexibility to data-type specific fields when needed.
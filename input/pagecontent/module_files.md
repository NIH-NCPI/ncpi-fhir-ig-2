### Files

The file module is used to describe files used for or created by investigative processes.

#### Scope and Usage

The file entity is used primarily to provide technical information relevant to the management and administration of a file.  Metadata about what is contained in the file or how the content was generated should be described with other etities such as data dictionaries, summaries, or specific file metadata profiles.

File contains basic technical metadata about file location, access, and contents.  Files are typically associated with one or more participants, but files may also be study documents assocaited to the research study in general.

Files may contain multiple file location references, (such as a DRS link and an s3 bucket URL) though the access approaches for those locations should be reasonably apparent through the Access Policy for the file content. For example, if a data file is ONLY accessible through DRS, the underlying bucket location should not be included as no user would be able to access it directly. However, if there are multiple Access Policies that provide routes to access the data through different URIs, those may be included. For example, if a file is accessible both via controlled access release through DRS, and with a consortium access model permitting direct bucket access, the DRS and bucket URI both be stated here to permit consistent reference to the File irrespective of the access mechanism.

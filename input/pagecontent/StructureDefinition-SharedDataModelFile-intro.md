### NCPI File
#### Introduction
Files are a common research product. In this straightforward representation, we provide basic details of the file and how to access it. Details about what is contained in the file or how the content was generated should be described with other entities, such as data dictionaries, summaries, or assays.

#### File Definitions
File contains basic file metadata about the file location and contents. Files are typically associated with one or more participants, though they can also include general study documents. The file content may have different access control restrictions when compared to this entity, which is only the file metadata. 

There can be multiple file location references, for example DRS and cloud storage references, though the access approaches for those locations should be reasonably apparent through the Access Policy for the file content.

#### Example
If a data file is ONLY accessible through DRS, the underlying bucket locations should not be included here as no user would be able to access them directly. However, if there are multiple Access Policies that provide routes to access the data through different URIs, those can be included. Controlled access release via DRS with a consortium access model permitting direct bucket access could both be stated here to permit consistent reference to the File irrespective of the access mechanism.
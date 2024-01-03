### Basic Definition
Access policy communicates the limitations and/or requirements that define how a user may gain access to a particular set of data.  

Access policy is limited to describing restrictions that respect the privacy and rights of the participants arising from consents, protocols, or other official documents. It should not be used to describe technical requirements for accessing data.

Access policy is defined using a standard set of codes, with one policy per set of codes that apply to a specified portion of the data. Each Access Policy element also includes a free text field that allows for further description of the policy and necessary steps for gaining access.

For Summary-only submissions, Access Policy elements should be included in order to describe the various data use limitations present in the dataset.  For submissions which include data and/or participant records, Access Policy should be associated with the participants and data files to appropriately describe the applicable limitations.

#### Primary Profile Restrictions and Enhancements
* category **must** be assigned __research__. 
* a meaningful **description** must be provided using the [Access Policy Description](StructureDefinition-access-policy-description.html) extension.
* a provision.purpose **must** be defined for each distinct research constraint associated with this policy. These codes **must** be selected from the ValueSet representing the codes found in [ResearchDataAccessCodes](CodeSystem-research-data-access-code.html). 
* For those policies that are disease specific, the code, DS, **shall** be used and **must** be accompanied by a properly defined [Disease Use Limitation](StructureDefinition-research-disease-use-limitation.html). 

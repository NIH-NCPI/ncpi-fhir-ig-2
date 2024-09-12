Instance: research-study-gregor
InstanceOf: NcpiResearchStudy
Title: "Example study from GREGoR"
Usage: #example
Description: "Example study from GREGoR"
* identifier[0]
  * value = "AnVIL_GREGoR_GSS_U08_GRU"

* status = #completed

Instance: gregor-research-study-participants
InstanceOf: ResearchStudyGroup
Title: "Participants from the CBTN research study"
Usage: #example
Description: "Participants from the CBTN research study"
* identifier[0]
  * system = "https://anvil.terra.bio/"
  * value = "GREGoR Participants"
* name = "Participants from the GREGoR research study GSS U08 GRU"
* quantity = 555
* actual = true
* type = #person

Instance: gregor-gru-consent
InstanceOf: NcpiResearchAccessPolicy
Title: "GREGoR General Research Use (GRU) Consent"
Usage: #example
Description: "General Research Use (GRU)"
* status = #draft
* scope = http://terminology.hl7.org/CodeSystem/consentscope#research
* category.coding = http://terminology.hl7.org/CodeSystem/consentcategorycodes#research
* policyRule = http://terminology.hl7.org/CodeSystem/consentpolicycodes#cric
* provision.type = http://hl7.org/fhir/consent-provision-type#permit
* provision.purpose[+] = $ncpi-data-access-code#GRU "General Research Use"
* extension[description].valueMarkdown = "Use of the data is limited only by the terms of the model Data Use Certification."
* extension[accessType].valueCodeableConcept = $ncpi-data-access-type#controlled
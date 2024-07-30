Instance: PT-006SP660
InstanceOf: NcpiFile
Title: "Example file based on CBTN"
Usage: #example
Description: "Use case of file information from CBTN"
* identifier.value = "PT_006SP660"
* subject = Reference(GF_6BAD9S7D)
* description = "Annotated Variant Call"
* type = $edam#operation_3227 "Variant calling"
* status = #current
* content.attachment.url = "s3://kf-strides-study-us-east-1-prd-sd-54g4wg4r/harmonized-data/family-variants/155bb529-2e7b-474f-ba24-cd0656d5f3d0.CGP.filtered.deNovo.vep.vcf.gz"
* extension[location-access].valueReference = Reference(NcpiResearchAccessPolicy.accessType)
* extension[file-format].valueCodeableConcept.coding = $edam#format_3016 "VCF"
* extension[file-size]
  * valueQuantity
    * value = 1044770380
    * unit = "bytes"
* extension[hash]
  * extension[hash-value].valueString = "8f107912d862cf91fbfb77bf9c1bab36-4"
  * extension[hash-type].valueCode = #etag
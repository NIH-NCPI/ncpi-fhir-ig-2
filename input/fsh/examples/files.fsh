Instance: PT-006SP660
InstanceOf: NcpiFile
Title: "Example file based on CBTN"
Usage: #example
Description: "Use case of file information from CBTN"
* identifier.value = "PT_006SP660"
* subject = Reference(GF_6BAD9S7D)
* description = "Annotated Variant Call"
* type = $edam#operation_3227 "Variant calling"
* extension[content-version].valueString = "V1"
* status = #current
* content[+]
  * attachment.url = "s3://kf-strides-study-us-east-1-prd-sd-54g4wg4r/harmonized-data/family-variants/155bb529-2e7b-474f-ba24-cd0656d5f3d0.CGP.filtered.deNovo.vep.vcf.gz"
  * extension[location-access].valueReference = Reference(kf-gru-dac-consent)
* extension[file-format].valueCodeableConcept.coding = $edam#format_3016 "VCF"
* extension[file-size]
  * valueQuantity
    * value = 1044770380
    * unit = "bytes"
* extension[hash]
  * extension[hash-value].valueString = "8f107912d862cf91fbfb77bf9c1bab36-4"
  * extension[hash-type].valueCode = #etag

Instance: GSS123456-file
InstanceOf: NcpiFile
Title: "Example file based on CBTN"
Usage: #example
Description: "Use case of file information from CBTN"
* identifier.value = "GSS123456"
* subject = Reference(GSS123456-01-010-SG-2)
* description = "Aligned DNA short read"
* type = $edam#operation_3198 "Read mapping"
* extension[content-version].valueString = "V1"
* status = #current
* content[+]
  * attachment.url = "gs://fc-secure-a1f0e28d-c9d9-43bb-b4ba-5e0h81784fb1/GSS123456/SR_GS/GSS123456.bam"
  * extension[location-access].valueReference = Reference(kf-gru-dac-consent)
* extension[file-format].valueCodeableConcept.coding = $edam#format_2572 "BAM"
* extension[file-size]
  * valueQuantity
    * value = 1044770380
    * unit = "bytes"
* extension[hash]
  * extension[hash-value].valueString = "9c2460c4647fdc57261f040042863fa0"
  * extension[hash-type].valueCode = #md5
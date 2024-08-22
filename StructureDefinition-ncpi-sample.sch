<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile Specimen
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:Specimen</sch:title>
    <sch:rule context="f:Specimen">
      <sch:assert test="count(f:extension[@url = 'https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/biospecimen-spatial']) &lt;= 1">extension with URL = 'https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/biospecimen-spatial': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/biospecimen-laterality']) &lt;= 1">extension with URL = 'https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/biospecimen-laterality': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/aliquot-availability']) &lt;= 1">extension with URL = 'https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/aliquot-availability': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/aliquot-concentration']) &lt;= 1">extension with URL = 'https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/aliquot-concentration': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &gt;= 1">identifier: minimum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:type) &gt;= 1">type: minimum cardinality of 'type' is 1</sch:assert>
      <sch:assert test="count(f:subject) &gt;= 1">subject: minimum cardinality of 'subject' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Specimen/f:processing</sch:title>
    <sch:rule context="f:Specimen/f:processing">
      <sch:assert test="count(f:procedure) &gt;= 1">procedure: minimum cardinality of 'procedure' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Specimen/f:container</sch:title>
    <sch:rule context="f:Specimen/f:container">
      <sch:assert test="count(f:identifier) &gt;= 1">identifier: minimum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>

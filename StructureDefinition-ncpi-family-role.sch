<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile Group
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:Group</sch:title>
    <sch:rule context="f:Group">
      <sch:assert test="count(f:extension[@url = 'https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/study-family']) &gt;= 1">extension with URL = 'https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/study-family': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/study-family']) &lt;= 1">extension with URL = 'https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/study-family': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/family-role']) &lt;= 1">extension with URL = 'https://nih-ncpi.github.io/ncpi-fhir-ig-2/StructureDefinition/family-role': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
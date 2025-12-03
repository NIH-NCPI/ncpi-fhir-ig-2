<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile FamilyMemberHistory
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:FamilyMemberHistory</sch:title>
    <sch:rule context="f:FamilyMemberHistory">
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/familymemberhistory-patient-record|4.0.1']) &gt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/familymemberhistory-patient-record|4.0.1': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/familymemberhistory-patient-record|4.0.1']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/familymemberhistory-patient-record|4.0.1': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:name) &lt;= 0">name: maximum cardinality of 'name' is 0</sch:assert>
      <sch:assert test="count(f:sex) &lt;= 0">sex: maximum cardinality of 'sex' is 0</sch:assert>
      <sch:assert test="count(f:born[x]) &lt;= 0">born[x]: maximum cardinality of 'born[x]' is 0</sch:assert>
      <sch:assert test="count(f:age[x]) &lt;= 0">age[x]: maximum cardinality of 'age[x]' is 0</sch:assert>
      <sch:assert test="count(f:estimatedAge) &lt;= 0">estimatedAge: maximum cardinality of 'estimatedAge' is 0</sch:assert>
      <sch:assert test="count(f:deceased[x]) &lt;= 0">deceased[x]: maximum cardinality of 'deceased[x]' is 0</sch:assert>
      <sch:assert test="count(f:reasonCode) &lt;= 0">reasonCode: maximum cardinality of 'reasonCode' is 0</sch:assert>
      <sch:assert test="count(f:reasonReference) &lt;= 0">reasonReference: maximum cardinality of 'reasonReference' is 0</sch:assert>
      <sch:assert test="count(f:condition) &lt;= 0">condition: maximum cardinality of 'condition' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>

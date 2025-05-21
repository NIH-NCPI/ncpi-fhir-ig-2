#!/usr/bin/env ruby

# Just a simple script to copy the fsh-generated files over to output and build a very simple index.html file linking to the various files inside the resources directory. 

system("cp -r fsh-generated output")
File.open("output/fsh-generated/index.html", 'w') { |outf|
  outf.write("<!DOCTYPE html>  
<html>

  <body style=\"font-size: 100%;\">
")

"CodeSystem
Condition
Consent
DocumentReference
Group
ImplementationGuide
List
Observation
Organization
Patient
Person
PractitionerRole
ResearchStudy
ResearchSubject
Specimen
StructureDefinition
ValueSet".split("\n").each { |rtype|
    outf.write("\n    <h2>#{rtype}</h2>\n    <ul style='list-style-type: none;'>\n")

    Dir.glob("fsh-generated/resources/#{rtype}-*.json") do |fn|
      outf.write("      <li><a href='#{fn.sub 'fsh-generated/', ''}'>#{fn.sub 'fsh-generated/resources/', ''}</a></li>\n")
    end
    
    outf.write(    "</ul>\n")
  }

outf.write("  </body>\n")
outf.write("</html>\n")
}


#!/usr/bin/env ruby

# Just a simple script to copy the fsh-generated files over to output and build a very simple index.html file linking to the various files inside the resources directory. 

system("cp -r fsh-generated output")
File.open("output/fsh-generated/index.html", 'w') { |outf|
  outf.write(%Q|<!DOCTYPE html>  
<html>


  <head>
    <title>FSH Generated Artificts</title>
    <link rel="stylesheet" type="text/css" href="../fhir.css">

    <!-- Bootstrap core CSS -->
    <link href="../assets/css/bootstrap-fhir.css" rel="stylesheet"/>

    <!-- Project extras -->
    <link href="../assets/css/project.css" rel="stylesheet"/>
    <link href="../assets/css/pygments-manni.css" rel="stylesheet"/>
    <link href="../assets/css/jquery-ui.css" rel="stylesheet"/>
  	<link href="../assets/css/prism.css" rel="stylesheet" />
  	<link href="../assets/css/cqf.css" rel="stylesheet" />
    <!-- Placeholder for child template CSS declarations -->

    <script type="text/javascript" src="fhir-table-scripts.js"> </script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="assets/js/html5shiv.js"></script>
    <script src="assets/js/respond.min.js"></script>
    <![endif]-->

    <!-- Favicons -->
    <link rel="fhir-logo" sizes="144x144" href="../assets/ico/icon-fhir-144.png"/>
    <link rel="fhir-logo" sizes="114x114" href="../assets/ico/icon-fhir-114.png"/>
    <link rel="fhir-logo" sizes="72x72" href="../assets/ico/icon-fhir-72.png"/>
    <link rel="fhir-logo" href="../assets/ico/icon-fhir-57.png"/>
    <link rel="shortcut icon" href="../assets/ico/favicon.png"/>
  </head>
  <body style="font-size: 100%;">


    <div id="segment-breadcrumb" class="segment">  <!-- segment-breadcrumb -->
      <div class="container">  <!-- container -->
        <ul class="breadcrumb">
          <li><a href='../index.html'><b>Home</b></a></li>

        </ul>
      </div>  <!-- /container -->
    </div>  <!-- /segment-breadcrumb -->

    <a name="top"> </a>
    <div id="segment-content" class="segment">  <!-- segment-content -->
      <div class="container">  <!-- container -->
        <div class="row">
          <div class="inner-wrapper">

            <style type="text/css">
            h2:before{color:silver;counter-increment:section;content:var(--heading-prefix) " ";}
            h3:before{color:silver;counter-increment:sub-section;content:var(--heading-prefix) "." counter(sub-section) " ";}
            h4:before{color:silver;counter-increment:composite;content:var(--heading-prefix) "." counter(sub-section) "." counter(composite) " ";}
            h5:before{color:silver;counter-increment:detail;content:var(--heading-prefix) "." counter(sub-section) "." counter(composite) "." counter(detail) " ";}
            h6:before{color:silver;counter-increment:more-detail;content:var(--heading-prefix) "." counter(sub-section) "." counter(composite) "." counter(detail) "." counter(more-detail)" ";}
            </style>

            <div class="col-12">
|)

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

outf.write("

            </div>
          </div>    
        </div>
      </div>
    </div>
  </body>
</html>\n")
}


/**
  * Center for Medelian Genetics-Baylor Hopkins (BH-CMG)
  */

/**
 * To represent the actual CMG Consortium, we create a study collection 
 * based on the profile, NcpiResearchCollection
 * 
 * For this example set, we'll create the following artifacts:
 * 	* Example ResearchStudy		- An example of a single study
	* Example of ResearchGroup 	- 1 ResearchGroup for all members of the study
	* Examples for ResearchSubjects
	* Examples of Patients
 */

Instance: cmg-research-study-bhcmg
InstanceOf: NcpiResearchStudy
Title: "Baylor Hopkins Center for Mendelian Genomics (BH CMG)"
Usage: #example
Description: "The Centers for Mendelian Genomics project uses next-generation sequencing and computational approaches to discover the genes and variants that underlie Mendelian conditions. By discovering genes that cause Mendelian conditions, we will expand our understanding of their biology to facilitate diagnosis and new treatments."
// Notice that we can use the DbGaP study ID for easier searching
* identifier[0]
  * system = "http://mendelian.org/fhir"
  * value = "BH-CMG"
* identifier[1]
  * system = "https://www.ncbi.nlm.nih.gov/projects/gap/cgi-bin/study.cgi?study_id="
  * value = "phs000711"
* title = "Baylor Hopkins Center for Mendelian Genomics (BH CMG)"
* description = "The Centers for Mendelian Genomics project uses next-generation sequencing and computational approaches to discover the genes and variants that underlie Mendelian conditions. By discovering genes that cause Mendelian conditions, we will expand our understanding of their biology to facilitate diagnosis and new treatments."
* focus.coding[+] = $mesh#D057182 "Mendelian Randomization Analysis"
* focus.coding[+] = $mesh#D056769 "Alstrom Syndrome"
* focus.coding[+] = $mesh#D019571 "Arrhythmogenic Right Ventricular Dysplasia"
* focus.coding[+] = $mesh#D013576 "Syndactyly"
* focus.coding[+] = $mesh#D019465 "Craniofacial Abnormalities"
* relatedArtifact[0].type = #documentation
* relatedArtifact[0].label = "acronym"
* relatedArtifact[0].display = "BH-CMG"
* relatedArtifact[1].type = #documentation
* relatedArtifact[1].label = "Website"
* relatedArtifact[1].url = "https://mendeliangenomics.org/"
* relatedArtifact[2].type = #citation 
* relatedArtifact[2].citation = "National Institutes of Health (NIH) support was provided in part by a grant from the National Human Genome Research Institute and the National Heart, Lung, and Blood Institute (1U54HG006542) to Dr. David Valle for the Baylor Hopkins Center for Mendelian Genomics program. The dataset(s) used for the analyses described in this manuscript was obtained from the database of Genotype and Phenotype (dbGaP) found at http://www.ncbi.nlm.nih.gov/gap through dbGaP accession number phs000711.v7.p2."
* relatedArtifact[3].type = #citation 
* relatedArtifact[3].label = "Publication"
* relatedArtifact[3].citation = "Gonzaga-Jauregui C, Lupski JR, Gibbs RA\nHuman genome sequencing in health and disease.\nAnnu Rev Med. 2012; 63:35-61.\nPMID: 22248320"
* relatedArtifact[4].type = #citation 
* relatedArtifact[4].label = "Publication"
* relatedArtifact[4].citation = "Bamshad MJ, Shendure JA, Valle D, Hamosh A, Lupski JR, Gibbs RA, Boerwinkle E, Lifton RP, Gerstein M, Gunel M, Mane S, Nickerson DA, Centers for Mendelian Genomics\nThe Centers for Mendelian Genomics: a new large-scale initiative to identify the genes underlying rare Mendelian conditions.\nAm J Med Genet A. 2012 Jul; 158A(7):1523-5.\nPMID: 22628075"
* relatedArtifact[5].type = #citation 
* relatedArtifact[5].label = "Publication"
* relatedArtifact[5].citation = "Boone PM, Campbell IM, Baggett BC, Soens ZT, Rao MM, Hixson PM, Patel A, Bi W, Cheung SW, Lalani SR, Beaudet AL, Stankiewicz P, Shaw CA, Lupski JR\nDeletions of recessive disease genes: CNV contribution to carrier states and disease-causing alleles.\nGenome Res. 2013 Sep; 23(9):1383-94.\nPMID: 23685542"
* relatedArtifact[6].type = #citation 
* relatedArtifact[6].label = "Publication"
* relatedArtifact[6].citation = "Cheung YH, Gayden T, Campeau PM, LeDuc CA, Russo D, Nguyen VH, Guo J, Qi M, Guan Y, Albrecht S, Moroz B, Eldin KW, Lu JT, Schwartzentruber J, Malkin D, Berghuis AM, Emil S, Gibbs RA, Burk DL, Vanstone M, Lee BH, Orchard D, Boycott KM, Chung WK, Jabado N\nA recurrent PDGFRB mutation causes familial infantile myofibromatosis.\nAm J Hum Genet. 2013 Jun 06; 92(6):996-1000.\nPMID: 23731537"
* relatedArtifact[7].type = #citation 
* relatedArtifact[7].label = "Publication"
* relatedArtifact[7].citation = "Campeau PM, Kasperaviciute D, Lu JT, Burrage LC, Kim C, Hori M, Powell BR, Stewart F, Félix TM, van den Ende J, Wisniewska M, Kayserili H, Rump P, Nampoothiri S, Aftimos S, Mey A, Nair LD, Begleiter ML, De Bie I, Meenakshi G, Murray ML, Repetto GM, Golabi M, Blair E, Male A, Giuliano F, Kariminejad A, Newman WG, Bhaskar SS, Dickerson JE, Kerr B, Banka S, Giltay JC, Wieczorek D, Tostevin A, Wiszniewska J, Cheung SW, Hennekam RC, Gibbs RA, Lee BH, Sisodiya SM\nThe genetic basis of DOORS syndrome: an exome-sequencing study.\nLancet Neurol. 2014 Jan; 13(1):44-58.\nPMID: 24291220"
* relatedArtifact[8].type = #documentation
* relatedArtifact[8].label = "AdditionalDocumentation"
* relatedArtifact[8].url = "https://app.terra.bio/#workspaces/anvil-datastorage/AnVIL_CMG_BaylorHopkins_HMB-IRB-NPU_WES"
* relatedArtifact[9].type = #documentation
* relatedArtifact[9].label = "Grant"
* relatedArtifact[9].display = "1U54HG006542. National Human Genome Research Institute and National Heart, Lung, and Blood Institute, National Institutes of Health, Bethesda, MD, USA."
* status = #completed
* extension[research-study-associated-party].extension[name].valueString = "1U54HG006542 National Human Genome Research Institute and National Heart, Lung, and Blood Institute, National Institutes of Health, Bethesda, MD, USA."
* extension[research-study-associated-party].extension[role].valueCodeableConcept = #funding-source
* extension[research-study-associated-party].extension[classifier].valueCodeableConcept = #nih



Instance: hmb-npu-consent
InstanceOf: NcpiResearchAccessPolicy
Title: "HMB-NPU Consent"
Usage: #example
Description: "Consented with Health/Medical/Biomedical + Not for profit use"
* status = #draft
* scope = #research
* category.coding = http://terminology.hl7.org/CodeSystem/consentcategorycodes#research
* policyRule = http://terminology.hl7.org/CodeSystem/consentpolicycodes#cric
* provision.type = http://hl7.org/fhir/consent-provision-type#permit
* provision.purpose[+] = $ncpi-data-access-code#HMB "Health/Medical/Biomedical"
* provision.purpose[+] = $ncpi-data-access-code#NPU "Not-for-profit use only"
/* * provision.purpose[+].text = "HMB-NPU" */
* extension[description].valueMarkdown = "Health/Medical/Biomedical, Not for profit use"
* extension[website].valueUrl = "https://dbgap.ncbi.nlm.nih.gov/aa/wga.cgi?page=DUC&view_pdf&stacc=phs000711.v7.p2"


Instance: hmb-irb-npu-consent
InstanceOf: NcpiResearchAccessPolicy
Title: "HMB-IRB-NPU Consent"
Usage: #example
Description: "Consented with Health/Medical/Biomedical + IRB Required + Not for profit use"
* status = #draft
* scope = #research
* category.coding = http://terminology.hl7.org/CodeSystem/consentcategorycodes#research
* policyRule = http://terminology.hl7.org/CodeSystem/consentpolicycodes#cric
* provision.type = http://hl7.org/fhir/consent-provision-type#permit
* provision.purpose[+] = $ncpi-data-access-code#HMB "Health/Medical/Biomedical"
* provision.purpose[+] = $ncpi-data-access-code#IRB "IRB approval required"
* provision.purpose[+] = $ncpi-data-access-code#NPU "Not-for-profit use only"
/* * provision.purpose[+].text = "HMB-IRB-NPU" */
* extension[description].valueMarkdown = "Health/Medical/Biomedical, IRB Approval Required, Not for profit use"
* extension[website].valueUrl = "https://dbgap.ncbi.nlm.nih.gov/aa/wga.cgi?page=DUC&view_pdf&stacc=phs000711.v7.p2"

Instance: cmg-research-study-bhcmg-consent-group-hmb-npu
InstanceOf: ResearchStudyGroup
Title: "Participants consented under HMB-NPU"
Usage: #example
Description: "BH-CMG study's population consented under Health/Medical/Biomedical + Not for profit use"
* identifier[0]
  * system = "http://mendelian.org/fhir/Group"
  * value = "HMB-NPU-Participants"
* name = "BM-CMG Study HMB-NPU Participants"
* quantity = 1665
* actual = true
* type = #person

Instance: cmg-research-study-subject-cmg-hmb-npu
InstanceOf: ResearchStudySubject
Title: "Participants consented under HMB-NPU"
Usage: #example
Description: "CMG Consent Group, Health/Medical/Biomedical + Not for profit use"
* identifier[0]
  * system = "http://mendelian.org/fhir"
  * value = "BH-CMG-HMB-NPU"
* title = "BH-CMG HMB-NPU Consent Study Subject"
* description = "CMG Consent Group, Health/Medical/Biomedical + Not for profit use"
* status = #completed
* partOf = Reference(cmg-research-study-bhcmg)
* extension[consent].valueReference = Reference(hmb-npu-consent)
* enrollment = Reference(cmg-research-study-bhcmg-consent-group-hmb-npu)

Instance: ncpi-research-collection-cmg
InstanceOf: NcpiResearchCollection
Usage: #example
Description: "The Centers for Medelian Genetics"
* title = "The Centers for Medelian Genetics"
* code = $ncpi-collection-type#consortium "Consortium"
* note[0].text = "The Centers for Mendelian Genomics project uses next-generation sequencing and computational approaches to discover the genes and variants that underlie Mendelian conditions. By discovering genes that cause Mendelian conditions, we will expand our understanding of their biology to facilitate diagnosis and new treatments."
* status = http://hl7.org/fhir/list-status#current 
* mode = http://hl7.org/fhir/list-mode#snapshot
* extension[website].valueUrl = "https://mendeliangenomics.org/"
* extension[label][0].extension[type].valueCodeableConcept = $title-type#acronym
* extension[label][0].extension[label].valueString = "CMG"
* entry[0].item = Reference(cmg-research-study-bhcmg)


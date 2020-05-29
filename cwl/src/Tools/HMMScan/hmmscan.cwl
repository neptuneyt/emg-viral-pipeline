#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

label: hmmscan wrapper

hints:
 DockerRequirement:
   dockerFile: Dockerfile

requirements:
  InlineJavascriptRequirement: {}

baseCommand: ["hmmscan_wrapper.sh"]

inputs:
  database:
    type: Directory
  aa_fasta_file:
    type: File?
    format: edam:format_1929    
    inputBinding:
      position: 5
      separate: true

arguments:
  - prefix: -E
    valueFrom: "0.001"
    position: 2
  - prefix: --domtblout
    valueFrom: $(inputs.aa_fasta_file.nameroot)_hmmscan.tbl
    position: 3
  - valueFrom: $(inputs.database.path)/vpHMM_database
    position: 4
  - valueFrom: --noali
    position: 1

outputs:
  output_table:
    type: File
    outputBinding:
      glob: "*hmmscan.tbl"

stdout: stdout.txt

doc: Biosequence analysis using profile hidden Markov models

$namespaces:
 edam: http://edamontology.org/
 s: http://schema.org/
$schemas:
 - http://edamontology.org/EDAM_1.16.owl
 - https://schema.org/docs/schema_org_rdfa.html

s:license: "https://www.apache.org/licenses/LICENSE-2.0"
s:copyrightHolder: "EMBL - European Bioinformatics Institute"
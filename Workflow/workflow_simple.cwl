class: Workflow
cwlVersion: v1.0

requirements:
  SubworkflowFeatureRequirement: {}
  MultipleInputFeatureRequirement: {}
  InlineJavascriptRequirement: {}
  StepInputExpressionRequirement: {}
  ScatterFeatureRequirement: {}

inputs:
  input_fasta_file:
    type: File

outputs:
  output_antismash:
    outputSource: antismash/output_antismash
    type: Directory

steps:
  antismash:
    in:
      input_fasta: input_fasta_file
    out:
      - output_antismash
    run: ../Tools/antismash/antismash.cwl
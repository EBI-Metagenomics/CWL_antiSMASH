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
  output_antismash_css:
    outputSource: antismash/output_css
    type: Directory
  output_antismash_images:
    outputSource: antismash/output_images
    type: Directory
  output_antismash_js:
    outputSource: antismash/output_js
    type: Directory
  output_antismash_knownclusterblast:
    outputSource: antismash/output_knownclusterblast
    type: Directory
  output_antismash_svg:
    outputSource: antismash/output_svg
    type: Directory
  output_antismash_separate_files:
    outputSource: antismash/output_files
    type:
      type: array
      items: File
steps:
  antismash:
    in:
      input_fasta: input_fasta_file
    out:
      - output_css
      - output_images
      - output_js
      - output_knownclusterblast
      - output_svg
      - output_files
    run: ../Tools/antismash/antismash.cwl
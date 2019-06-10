class: Workflow
cwlVersion: v1.0

requirements:
  SubworkflowFeatureRequirement: {}
  MultipleInputFeatureRequirement: {}
  InlineJavascriptRequirement: {}
  StepInputExpressionRequirement: {}
  ScatterFeatureRequirement: {}
  DockerRequirement:
    dockerPull: antismash/standalone:5.0.0

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
    out: [folders]

    run:
      class: ExpressionTool
      id: 'organise'
      arguments:
        - valueFrom: ..$(inputs.input_fasta.path)
          position: 1
        - valueFrom: prodigal
          prefix: --genefinding-tool
          separate: true
          position: 3
        - valueFrom: --cb-knownclusters
          position: 4
        - valueFrom: $(runtime.outdir)/output
          prefix: --output-dir
          position: 5
      inputs:
        input_fasta: File
      outputs:
        folders: Directory
      expression: |
        ${
          return {'antismash':
          {
          'class': 'Directory',
          'basename': 'output',
          'listing':[

          ]
          }}

        }




    ../Tools/antismash/antismash.cwl
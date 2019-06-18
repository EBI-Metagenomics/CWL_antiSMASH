#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

label: "antiSMASH"

requirements:
  DockerRequirement:
    dockerPull: antismash/standalone:5.0.0
  InlineJavascriptRequirement: {}


inputs:
  input_fasta:
    type: File


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


stdout: stdout.txt
stderr: stderr.txt

outputs:
  stdout: stdout
  stderr: stderr

  output_css:
    type: Directory
    outputBinding:
      glob: 'output/css'

  output_images:
    type: Directory
    outputBinding:
      glob: 'output/images'

  output_js:
    type: Directory
    outputBinding:
      glob: 'output/js'

  output_knownclusterblast:
    type: Directory
    outputBinding:
      glob: 'output/knownclusterblast'

  output_svg:
    type: Directory
    outputBinding:
      glob: 'output/svg'

  output_files:
    type:
      type: array
      items: File
    outputBinding:
      glob: output/*.*

      #glob: 'output' - for full folder
      #$(runtime.outdir)

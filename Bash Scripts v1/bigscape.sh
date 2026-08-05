#!/bin/bash

#ANTISMASH

#SBATCH --account=def-grandha8-ab_cpu
#SBATCH --time=05:00:00
#SBATCH --cpus-per-task=16
#SBATCH --mem=32G
#SBATCH --job-name=bigscape
#SBATCH --output=logs4/bigscape_%j.log

mkdir -p logs4 
mkdir -p ~/projects/def-grandha8-ab/nadira/bigscape_results_mibig4

source ~/miniconda3/bin/activate
conda activate bigscape

bigscape cluster \
    -i ~/projects/def-grandha8-ab/nadira/bigscape_input_named/ \
    -o ~/projects/def-grandha8-ab/nadira/bigscape_results_mibig4/ \
    -p ~/projects/def-grandha8-ab/nadira/bigscape/pfamdb/Pfam-A.hmm \
    --mix \
    --cores 16 \
    --gcf-cutoffs 0.3 \
    -m 4.0

#GECCO

#SBATCH --account=def-grandha8-ab_cpu
#SBATCH --time=06:00:00
#SBATCH --cpus-per-task=16
#SBATCH --mem=32G
#SBATCH --job-name=bigscape_gecco
#SBATCH --output=logsG/bigscape_%j.log

mkdir -p logsG
mkdir -p ~/projects/def-grandha8-ab/nadira/bigscape_gecco_results

source ~/miniconda3/bin/activate
conda activate bigscape

bigscape cluster \
    -i ~/projects/def-grandha8-ab/nadira/gecco_input_named/ \
    -o ~/projects/def-grandha8-ab/nadira/bigscape_gecco_results/ \
    -p ~/projects/def-grandha8-ab/nadira/bigscape/pfamdb/Pfam-A.hmm \
    --mix \
    --cores 16 \
    --gcf-cutoffs 0.1,0.2,0.3 \
    --force-gbk \
    -m 4.0


#!/bin/bash
#SBATCH --account=def-grandha8-ab_cpu
#SBATCH --time=00:15:00
#SBATCH --cpus-per-task=8
#SBATCH --mem=16G
#SBATCH --job-name=rgi
#SBATCH --output=Nlogs/rgi_%A_%a.log
#SBATCH --array=0-344

mkdir -p Nlogs rgi_results

source ~/miniconda3/bin/activate
conda activate RGI

OLD=/home/nadira/projects/def-grandha8-ab/nadira/ecoli
NEW=/home/nadira/projects/def-grandha8-ab/nadira/new_ecoli/ecoliJun/jordyn_contigs

OLDFILES=($OLD/*.fasta)
NEWFILES=($NEW/*.fa)
ALLFILES=("${OLDFILES[@]}" "${NEWFILES[@]}")

f=${ALLFILES[$SLURM_ARRAY_TASK_ID]}
SAMPLE=$(basename $f | sed 's/\.final\.filtered\.assembly\.fasta$//' | sed 's/\.fa$//')

mkdir -p rgi_results/${SAMPLE}

rgi main \
    -i $f \
    -o rgi_results/${SAMPLE}/${SAMPLE} \
    -t contig \
    -a DIAMOND \
    -n 8 \
    --clean \
    --local
#!/bin/bash
#SBATCH --account=def-grandha8-ab_cpu
#SBATCH --time=02:00:00
#SBATCH --cpus-per-task=8
#SBATCH --mem=16G
#SBATCH --job-name=bakta
#SBATCH --output=logs/bakta_%A_%a.log
#SBATCH --array=0-82

mkdir -p logs baktares

source ~/miniconda3/bin/activate
conda activate bakta

ASSEMBLIES=/home/nadira/projects/def-grandha8-ab/nadira/ecoli
FILES=($ASSEMBLIES/*.fasta)
f=${FILES[$SLURM_ARRAY_TASK_ID]}
SAMPLE=$(basename $f .final.filtered.assembly.fasta)

bakta \
    --db /home/nadira/projects/def-grandha8-ab/nadira/bakta/db \
    --output baktares/${SAMPLE} \
    --prefix ${SAMPLE} \
    --threads 8 \
    --genus Escherichia \
    --species coli \
    --gram - \
    --keep-contig-headers \
    $f

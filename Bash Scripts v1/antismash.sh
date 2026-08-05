#!/bin/bash
#SBATCH --account=def-grandha8-ab_cpu
#SBATCH --time=02:00:00
#SBATCH --cpus-per-task=8
#SBATCH --mem=16G
#SBATCH --job-name=antismash
#SBATCH --output=logs/antismash_%A_%a.log
#SBATCH --array=0-82

mkdir -p logs antismashres

source ~/miniconda3/bin/activate
conda activate antismash

BAKTA=/home/nadira/projects/def-grandha8-ab/nadira/bakta/baktares
FILES=($BAKTA/*/*.gbff)
f=${FILES[$SLURM_ARRAY_TASK_ID]}
SAMPLE=$(basename $f .gbff)

mkdir -p antismashres/${SAMPLE}

antismash \
    --taxon bacteria \
    --cpus 8 \
    --output-dir antismashres/${SAMPLE} \
    --genefinding-tool none \
    --cc-mibig \
    --cb-general \
    --cb-knownclusters \
    --cb-subclusters \
    --asf \
    --clusterhmmer \
    --tigrfam \
    --pfam2go \
    --rre \
    --smcog-trees \
    $f


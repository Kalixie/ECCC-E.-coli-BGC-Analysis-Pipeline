#!/bin/bash
#SBATCH --account=def-grandha8-ab_cpu
#SBATCH --time=00:20:00
#SBATCH --cpus-per-task=8
#SBATCH --mem=16G
#SBATCH --job-name=mobsuite
#SBATCH --output=Nlogs/mobsuite_%A_%a.log
#SBATCH --array=0-344

mkdir -p Nlogs
mkdir -p ~/projects/def-grandha8-ab/nadira/mobsuite/mobsuite_results

source ~/miniconda3/bin/activate
conda activate mob_suite

OLD=/home/nadira/projects/def-grandha8-ab/nadira/ecoli
NEW=/home/nadira/projects/def-grandha8-ab/nadira/new_ecoli/ecoliJun/jordyn_contigs

OLDFILES=($OLD/*.fasta)
NEWFILES=($NEW/*.fa)
ALLFILES=("${OLDFILES[@]}" "${NEWFILES[@]}")

f=${ALLFILES[$SLURM_ARRAY_TASK_ID]}
SAMPLE=$(basename $f | sed 's/\.final\.filtered\.assembly\.fasta$//' | sed 's/\.fa$//')

mob_recon \
    --infile $f \
    --outdir ~/projects/def-grandha8-ab/nadira/mobsuite/mobsuite_results/${SAMPLE} \
    --num_threads 8 \
    --sample_id ${SAMPLE} \
    --force



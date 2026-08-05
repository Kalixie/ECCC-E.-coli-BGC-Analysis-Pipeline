#!/bin/bash
#SBATCH --account=def-grandha8-ab_cpu
#SBATCH --time=01:00:00
#SBATCH --cpus-per-task=8
#SBATCH --mem=8G
#SBATCH --job-name=mlst
#SBATCH --output=logs/mlst_%j.log

mkdir -p logs

source ~/miniconda3/bin/activate
conda activate mlst

ASSEMBLIES=/home/nadira/projects/def-grandha8-ab/nadira/ecoli

mlst \
    --scheme ecoli_achtman_4 \
    --threads 8 \
    --csv \
    --full \
    $ASSEMBLIES/*.fa \
    > mlst_results.csv


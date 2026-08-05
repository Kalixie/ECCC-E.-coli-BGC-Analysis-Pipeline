#!/bin/bash
#SBATCH --account=def-grandha8-ab_cpu
#SBATCH --time=01:00:00
#SBATCH --cpus-per-task=8
#SBATCH --mem=16G
#SBATCH --job-name=quast_ecoli
#SBATCH --output=logs/quast_%j.log

mkdir -p logs
mkdir -p quastresult

module load StdEnv/2020 gcc/9.3.0 quast/5.2.0

ASSEMBLIES=/home/nadira/projects/def-grandha8-ab/nadira/ecoli

quast.py $ASSEMBLIES/*.fasta.gz \
         --output-dir quastresult/ \
         --threads 8 \
         --min-contig 500 \
         --contig-thresholds 0,1000,5000,10000,25000,50000





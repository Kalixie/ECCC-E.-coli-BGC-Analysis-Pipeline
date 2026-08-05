#!/bin/bash
#SBATCH --account=def-grandha8-ab_cpu
#SBATCH --time=12:00:00
#SBATCH --cpus-per-task=16
#SBATCH --mem=120G
#SBATCH --job-name=kraken2ecoli
#SBATCH --output=logs/kraken2_%j.log

mkdir -p logs
mkdir -p kraken2res

module load kraken2/2.1.6

DATABASE=/cvmfs/bio.data.computecanada.ca/content/databases/Core/kraken2_dbs/2026_02_15/k2_standard_20251015

ASSEMBLIES=/home/nadira/projects/def-grandha8-ab/nadira/ecoli

for f in $ASSEMBLIES/*.fasta.gz; do
    SAMPLE=$(basename $f .final.filtered.assembly.fasta.gz)
    
    kraken2 --db $DATABASE \
            --threads 16 \
            --confidence 0.1 \
            --output kraken2res/${SAMPLE}.kraken \
            --report kraken2res/${SAMPLE}.report \
            --use-names \
            --gzip-compressed \
            $f
done


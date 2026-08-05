#!/bin/bash
#SBATCH --account=def-grandha8-ab_cpu
#SBATCH --time=02:00:00
#SBATCH --cpus-per-task=16
#SBATCH --mem=32G
#SBATCH --job-name=fastani
#SBATCH --output=logs/fastani_%j.log

mkdir -p logs fastani_results

module load StdEnv/2020 gcc/9.3.0 fastani/1.32

ls ~/projects/def-grandha8-ab/nadira/ecoli/*.fasta.gz \
    > fastani_results/query_list.txt

fastANI --ql fastani_results/query_list.txt \
        --ref ~/projects/def-grandha8-ab/nadira/fastANI/GCF_000005845.2_ASM584v2_genomic.fna \
        --threads 8 \
        -o fastani_results/fastani_output.txt
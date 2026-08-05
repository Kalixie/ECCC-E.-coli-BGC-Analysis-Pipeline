#!/bin/bash
#SBATCH --account=def-grandha8-ab_cpu
#SBATCH --time=02:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G
#SBATCH --job-name=ezclermont
#SBATCH --output=Nlogs/ezclermont_%j.log

mkdir -p Nlogs Nezclermontres

source ~/miniconda3/bin/activate
conda activate Clermont

ASSEMBLIES=/home/nadira/projects/def-grandha8-ab/nadira/new_ecoli/ecoliJun/jordyn_contigs

for f in $ASSEMBLIES/*.fa; do
    SAMPLE=$(basename $f .fa)
    ezclermont $f > Nezclermontres/${SAMPLE}.txt
done
#!/bin/bash -l

#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 15:00:00
#SBATCH -J 01_01_assembly_canu
#SBATCH --mail-type=ALL
#SBATCH --mail-user moa.qvarnlof.4873@student.uu.se

# Load modules
module load bioinfo-tools canu

# Assembly
canu \
-p 01_01_assembly_canu \
-d /home/moaqva/Genome-Analysis-Project/analyses/01_genome_assembly \
genomeSize=2.4m \
useGrid=false \
maxThreads=4 \
-pacbio /home/moaqva/GENOMEANALYSIS/raw_data/DNA_raw_data/*

#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 1:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user moa.qvarnlof.4873@student.uu.se

# Load modules
module load bioinfo-tools artemis

comparison="/home/moaqva/Genome-Analysis-Project/analyses/04_homology/homology.crunch"
genome="/home/moaqva/Genome-Analysis-Project/analyses/01_genome_assembly/01_01_assembly_canu.contigs.fasta"
reference="/home/moaqva/GENOMEANALYSIS/raw_data/reference/OBMB01.fasta"

echo "act $genome $comparison $reference"
act $genome $comparison $reference

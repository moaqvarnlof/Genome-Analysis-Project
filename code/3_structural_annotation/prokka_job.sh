#!/bin/bash -l

#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 6
#SBATCH -t 1:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user moa.qvarnlof.4873@student.uu.se

# Load modules
module load bioinfo-tools prokka

output_directory="/home/moaqva/Genome-Analysis-Project1/analyses/03_structural_annotation/prokka2"
file="/home/moaqva/Genome-Analysis-Project1/analyses/01_genome_assembly/01_01_assembly_canu.contigs.fasta"

#prokka --outdir $output_directory --force $file
prokka --outdir $output_directory --force --addgenes --genus Leptospirillum --species ferriphilum --gram neg --usegenus --prefix Leptospirillum $file

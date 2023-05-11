#!/bin/bash -l

#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 1:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user moa.qvarnlof.4873@student.uu.se


# Load modules
module load bioinfo-tools FastQC

RNA_reads="/home/moaqva/GENOMEANALYSIS/raw_data/RNA_raw_data/*"
output="/home/moaqva/Genome-Analysis-Project/analyses/05_reads_preprocessing/before_trim_RNA_reads_quality"

fastqc -t 2 $RNA_reads -o $output

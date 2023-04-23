#!/bin/bash -l

#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 15:00
#SBATCH -J 02_02_assembly_evaluation_MUMmerplot
#SBATCH --mail-type=ALL
#SBATCH --mail-user moa.qvarnlof.4873@student.uu.se

# Load modules
module load bioinfo-tools MUMmer

output="/home/moaqva/Genome-Analysis-Project/analyses/02_assembly_evaluation"

file="/home/moaqva/Genome-Analysis-Project/analyses/01_genome_assembly/01_01_assembly_canu.contigs.fasta"
ref="/home/moaqva/GENOMEANALYSIS/raw_data/reference/OBMB01.fasta"

mummer -mum -b -c $ref $file > $output/mummer_output.mums

cd $output

mummerplot \
-Q $file \
-R $ref \
$output/mummer_output.mums \
-p mummer_output --png

gnuplot mummer_output.gp

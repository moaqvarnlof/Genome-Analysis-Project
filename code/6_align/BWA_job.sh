#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 8:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user moa.qvarnlof.4873@student.uu.se

module load bioinfo-tools bwa samtools

trimmed=/home/moaqva/GENOMEANALYSIS/raw_data/RNA_trimmed_reads/
genome=/home/moaqva/Genome-Analysis-Project1/analyses/01_genome_assembly/01_01_assembly_canu.contigs.fasta

cd $SNIC_TMP/

output=/proj/genomeanalysis2023/nobackup/work/moaqva/bwa_result/

bwa index $genome -p indexed

for file in ERR2036629 ERR2036630 ERR2036631 ERR2036632 ERR2036633 ERR2117288 ERR2117289 ERR2117290 ERR2117291 ERR2117292
do
bwa mem -t 4 indexed $trimmed${file}_P1.trim.fastq.gz $trimmed${file}_P2.trim.fastq.gz |
samtools view -S -b | samtools sort -o $output${file}.sorted.bam
done

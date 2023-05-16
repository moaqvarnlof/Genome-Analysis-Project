#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 10:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user moa.qvarnlof.4873@student.uu.se

module load bioinfo-tools htseq samtools

GENOME="/home/moaqva/Genome-Analysis-Project1/analyses/03_structural_annotation/PROKKA.gff"
BAM="/proj/genomeanalysis2023/nobackup/work/moaqva/bwa_result"
OUTPUT="/proj/genomeanalysis2023/nobackup/work/moaqva/"
SEQ="ERR2036629 ERR2036630 ERR2036631 ERR2036632 ERR2036633 ERR2117288 ERR2117289 ERR2117290 ERR2117291 ERR2117292"

$SNIC_TMP
cd $SNIC_TMP

for file in $SEQ
do 
(
htseq-count -f bam -r pos -s reverse -t CDS -i ID $BAM/${file}.sorted.bam $GENOME > ${file}.txt
) &
done
wait

cp $SNIC_TMP/*.txt $OUTPUT

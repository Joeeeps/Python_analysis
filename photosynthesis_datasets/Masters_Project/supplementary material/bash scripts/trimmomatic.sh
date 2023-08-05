#!/bin/bash
#$ -l h_rt=0:30:00
#$ -l rmem=2G
#$ -j y
#$ -o trimmomatic.log
#$ -t 1-12


source /usr/local/extras/Genomics/.bashrc

#set the path to trimmomatic
ProgramPath="/usr/local/extras/Genomics/apps/trimmomatic/current"

#get a list of all the forward reads
SAMPLE1=($(ls raw/*R1_001.fastq.gz))  
#get a list of all the reverse reads
SAMPLE2=($(ls raw/*R2_001.fastq.gz))

#set up an index for the reads/tasks
INDEX=$((SGE_TASK_ID-1))

# run trimmomatic on the 3 sets

java -jar $ProgramPath/trimmomatic-0.38.jar PE -phred33 ${SAMPLE1[$INDEX]} ${SAMPLE2[$INDEX]} ${SAMPLE1[$INDEX]}.out_paired_50bp.fastq.gz ${SAMPLE1[$INDEX]}.out_unpaired_50bp.fastq.gz ${SAMPLE2[$INDEX]}.out_paired_50bp.fastq.gz ${SAMPLE2[$INDEX]}.out_unpaired_50bp.fastq.gz ILLUMINACLIP:$ProgramPath/adapters/TruSeq2-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36


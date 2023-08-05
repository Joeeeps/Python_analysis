#!/bin/bash
#$ -l h_rt=0:30:00 
#$ -l rmem=2G 
#$ -j y 
#$ -o fastqc.log 
#$ -pe smp 8 

source /usr/local/extras/Genomics/.bashrc

DIR="/fastdata/boa18jp/masters/RNAseq-alloteropsis/accessions"
DIR2= "{PWD##*}"
inputString=""
space=" "
for i in $DIR/$DIR2 trimmed/*.fastq.gz
  do

  inputString=$inputString$i$space
  done

fastqc -o /fastdata/boa18jp/masters/RNAseq-alloteropsis/accessions/THE/trimmed_fastqc/ -t 4 $inputString 


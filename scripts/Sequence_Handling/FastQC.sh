#!/bin/sh

#PBS -l mem=4000mb,nodes=1:ppn=4,walltime=6:00:00
#PBS -m abe
#PBS -M liux1299@umn.edu 
#PBS -q lab

set -e
set -u
set -o pipefail

module load parallel

#   List of samples to be processed
#   Need to hard code the file path for qsub jobs
SAMPLE_INFO=${HOME}/Projects/Inversion_loci/Liana_Samples/Sample_List_Liana_06-09-2015.txt

#   Full path to out directory
#       Requires quotes around directory path
OUT="${HOME}/Projects/Inversion_loci/Liana_Samples"


#   Load FastQC Module
module load fastqc

#   Run FastQC in parallel
cat ${SAMPLE_INFO} | parallel "fastqc {} -o ${OUT}"

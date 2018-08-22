#!/bin/bash
#PBS -P ku3
#PBS -q express
#PBS -l walltime=03:00:00
#PBS -l mem=128GB
#PBS -l ncpus=1
## For licensed software, you have to specify it to get the job running. For unlicensed software, you should also specify it to help us analyse the software usage on our system.
#PBS -l software=ERDS
## The job will be executed from current working directory instead of home.
#PBS -l wd 

module load BWA/0.7.17
module load gcc/4.9.0
module load samtools/0.1.18

#directory hierarchy
numcores=1

homeDir="/g/data1a/ku3/jt3341/"
projectDir="$homeDir/projects/hgsoc_repeats/genome/"
resultsDir="$projectDir/results/"
mkdir -p $resultsDir

genomeDir="/g/data1a/ku3/jt3341/genomes/hg19_ercc/"
inDir="$resultsDir/bwa/"
outDir="$resultsDir/erds/"
mkdir -p $outDir

#scripts directory
scriptsDir="$projectDir/scripts"

inFile="$inDir/AOCS-075-1-0_chr1.bam"
sampleName=`basename $inFile | sed s/.bam//`

echo perl /home/913/jt3341/local/lib/erds1.1/erds_pipeline.pl -b $inFile -o $outDir -r $genomeDir/hg19_ercc.fa

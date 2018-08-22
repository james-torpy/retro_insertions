#!/bin/bash
#PBS -P ku3
#PBS -q normal
#PBS -l other=gdata1a
#PBS -l walltime=12:00:00
#PBS -l mem=32GB
#PBS -l ncpus=10
## For licensed software, you have to specify it to get the job running. For unlicensed software, you should also specify it to help us analyse the software usage on our system.
#PBS -l software=svaba
## The job will be executed from current working directory instead of home.
#PBS -l wd 

module load BWA/0.7.17
module load gcc/4.9.0
module load samtools/0.1.18

#directory hierarchy
numcores=2

homeDir="/g/data1a/ku3/jt3341/"
projectDir="$homeDir/projects/hgsoc_repeats/genome/"
resultsDir="$projectDir/results/"
mkdir -p $resultsDir

genomeDir="/g/data1a/ku3/jt3341/genomes/hg19_ercc/"
inDir="$resultsDir/bwa/"
outDir="$resultsDir/svaba/"
mkdir -p $outDir

#scripts directory
scriptsDir="$projectDir/scripts"

inFile="$inDir/AOCS-075-1-0.bam"
sampleName=`basename $inFile | sed s/.bam//`

echo svaba run -t $inFile -G $genomeDir/hg19_ercc.fa -a $outDir/$sampleName -p $numcores
svaba run -t $inFile -G $genomeDir/hg19_ercc.fa -a $outDir/$sampleName -p $numcores

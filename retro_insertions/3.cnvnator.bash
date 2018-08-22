#!/bin/bash
#PBS -P ku3
#PBS -q normal
#PBS -l other=gdata1a
#PBS -l walltime=12:00:00
#PBS -l mem=32GB
#PBS -l ncpus=1
## For licensed software, you have to specify it to get the job running. For unlicensed software, you should also specify it to help us analyse the software usage on our system.
#PBS -l software=cnvnator
## The job will be executed from current working directory instead of home.
#PBS -l wd 

# link dependencies:
export ROOTSYS=/home/913/jt3341/local/lib/root
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${ROOTSYS}/lib
export PATH=$PATH:$ROOTSYS/bin

# directory hierarchy:

homeDir="/g/data1a/ku3/jt3341/"
projectDir="$homeDir/projects/hgsoc_repeats/genome/"
resultsDir="$projectDir/results/"
mkdir -p $resultsDir

inDir="$resultsDir/bwa/"
outDir="$resultsDir/cnvnator/"
mkdir -p $outDir

#scripts directory
scriptsDir="$projectDir/scripts"

inFile="$inDir/AOCS-076-1-3.bam"
sampleName=`basename $inFile | sed s/.bam//`

echo cnvnator -genome hg19 -root /g/data1a/ku3/jt3341/projects/hgsoc_repeats/genome/results/cnvnator/$sampleName.out.root -chrom chr22 -tree /g/data1a/ku3/jt3341/projects/hgsoc_repeats/genome/results/bwa/$inFile
cnvnator -genome hg19 -root /g/data1a/ku3/jt3341/projects/hgsoc_repeats/genome/results/cnvnator/$sampleName.out.root -chrom chr22 -tree /g/data1a/ku3/jt3341/projects/hgsoc_repeats/genome/results/bwa/$inFile


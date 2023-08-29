#!/bin/sh

#SBATCH --ntasks=1 
#SBATCH --mem=64000
#SBATCH --cpus-per-task=1
#SBATCH -p hns,schumer,normal
#SBATCH --time=48:00:00
#SBATCH --job-name=rfmt

module load biology
module load bwa
module load samtools
module load java
module load bcftools


for f in data/*.vcf

do

        filename=${f:6}

        perl /home/groups/schumer/shared_bin/Lab_shared_scripts/print_alleles_depth_freq_chi_per_site_GWAS.pl data/$filename 30 > data/${filename}.summary

done

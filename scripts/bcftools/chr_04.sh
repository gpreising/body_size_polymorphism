#!/bin/sh

#SBATCH --ntasks=1
#SBATCH --mem=64000
#SBATCH --cpus-per-task=1
#SBATCH -p normal,hns,schumer
#SBATCH --time=48:00:00
#SBATCH --job-name=chr_04

ml biology bcftools

perl /home/groups/schumer/shared_bin/Lab_shared_scripts/run_mpileup_bcftools_GWAS.pl $2 $1 data/ref_genome_files/xmul-TABQ-V-22-M_v2023.1_forgabe_XY.fasta /home/groups/schumer/shared_bin/ chr_04

#!/bin/sh

#SBATCH --ntasks=1
#SBATCH --mem=64000
#SBATCH --cpus-per-task=1
#SBATCH -p normal,hns,schumer
#SBATCH --time=48:00:00
#SBATCH --job-name=xmul_sample_kr

ml biology bwa samtools java bcftools

perl /home/groups/schumer/shared_bin/Lab_shared_scripts/run_samtools_only_parental_v2.pl data/split_reads/xmul_sample_kr data/ref_genome_files/xmul-TABQ-V-22-M_v2023.1_forgabe_XY.fasta PE

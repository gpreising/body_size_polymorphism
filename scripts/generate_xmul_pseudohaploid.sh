#!/bin/bash

#SBATCH --ntasks=1
#SBATCH --mem=64000
#SBATCH --cpus-per-task=1
#SBATCH -p schumer
#SBATCH --time=160:00:00
#SBATCH --job-name=gen_pseudohaps

ml biology samtools bcftools perl

cpanm Math::Random

perl /home/groups/schumer/shared_bin/Lab_shared_scripts/generate_pseudohaploid_calls_from_bams.pl data/xmul_bamlist.txt data/ref_genome_files/xmul-TABQ-V-22-M_v2023.1_forgabe_XY.fasta data/readlist_PEindivs.allindiv.allchroms.vcf.summary.dedupheaders.mapfilt.mafAFfilt.reformatted.gz

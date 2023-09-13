#!/bin/bash

#SBATCH --ntasks=1
#SBATCH --mem=64000
#SBATCH --cpus-per-task=1
#SBATCH -p hns,schumer
#SBATCH --time=48:00:00
#SBATCH --job-name=geno_plink_filt

ml biology plink

plink --noweb --file xmul_pseudohap_list_data_frame.txt.geno --pca --allow-extra-chr --out xmul_pseudohap_list_data_frame.txt.geno

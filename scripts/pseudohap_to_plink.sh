#!/bin/bash

#SBATCH --ntasks=1
#SBATCH --mem=64000
#SBATCH --cpus-per-task=1
#SBATCH -p hns,schumer
#SBATCH --time=48:00:00
#SBATCH --job-name=pseudohap2plink

perl /home/groups/schumer/shared_bin/Lab_shared_scripts/convert_pseudohap_to_plink_pheno.pl xmul_pseudohap_list_data_frame.txt all_case_control_plink_20230913.txt

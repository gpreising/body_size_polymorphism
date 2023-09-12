#!/bin/bash

#SBATCH --ntasks=1
#SBATCH --mem=64000
#SBATCH --cpus-per-task=1
#SBATCH -p schumer
#SBATCH --time=96:00:00
#SBATCH --job-name=combine_pseudohaps

perl /home/groups/schumer/shared_bin/Lab_shared_scripts/combine_pseudohaploid_files_pop_structure_analysis.pl xmul_pseudohap_list

while read -r x
do
    echo -e "#!/bin/sh\n\n#SBATCH --ntasks=1\n#SBATCH --mem=64000\n#SBATCH --cpus-per-task=1\n#SBATCH -p normal,hns,schumer\n#SBATCH --time=48:00:00\n#SBATCH --job-name=${x}\n\nml biology bcftools\n\nperl /home/groups/schumer/shared_bin/Lab_shared_scripts/run_mpileup_bcftools_GWAS.pl \$2 \$1 data/ref_genome_files/xmul-TABQ-V-22-M_v2023.1_forgabe_XY.fasta /home/groups/schumer/shared_bin/ ${x}" > scripts/bcftools/${x}.sh
done < data/ref_genome_files/xmul_scaff_names

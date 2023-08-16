#!/bin/bash

mkdir scripts/samtools

for f in data/split_reads/xmul_sample_*

do

        filename=${f:17}
        echo -e "#!/bin/sh\n\n#SBATCH --ntasks=1\n#SBATCH --mem=64000\n#SBATCH --cpus-per-task=1\n#SBATCH -p normal,hns,schumer\n#SBATCH --time=48:00:00\n#SBATCH --job-name=${filename}\n\nml biology bwa samtools java bcftools\n\nperl /home/groups/schumer/shared_bin/Lab_shared_scripts/run_samtools_only_parental_v2.pl data/split_reads/$filename data/ref_genome_files/xmul-TABQ-V-22-M_v2023.1_forgabe_XY.fa PE" > scripts/samtools/${filename}.sh

done
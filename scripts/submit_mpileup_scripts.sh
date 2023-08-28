for f in scripts/bcftools/chr_*.sh

do

        filename=${f:17}
        sbatch scripts/bcftools/$filename

done

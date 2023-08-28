for f in scripts/bcftools/chr_*.sh

do

        filename=${f:17}
        sbatch scripts/bcftools/$filename data/readlist_PE data/all_case_control_20230823.txt 

done

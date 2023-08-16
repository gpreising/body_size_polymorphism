for f in scripts/samtools/xmul_sample_*.sh

do
        
        filename=${f:17} 
        sbatch $filename

done
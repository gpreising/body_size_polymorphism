for f in samtools/xmul_sample_*.sh

do
        
        filename=${f:17} 
        sbatch $filename

done
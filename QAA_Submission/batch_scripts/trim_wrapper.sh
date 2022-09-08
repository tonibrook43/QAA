#!/bin/bash
#SBATCH --account=bgmp 
#SBATCH --partition=bgmp              
#SBATCH --job-name=Trim    
#SBATCH --output=Trimmomatic_%j.out      ## File to store output
#SBATCH --time=0-15:00:00       
#SBATCH --nodes=1               
#SBATCH --cpus-per-task=8  


cd /projects/bgmp/tonib/bioinfo/Bi623/FastQC
conda activate QAA

trimmomatic PE out_undR1.f.fastq out_undR2.r.fastq und_out_1P.fq.gz und_out_1U.fq.gz und_out_2P.fq.gz und_out_2U.fq.gz LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35

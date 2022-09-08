#!/bin/bash
#SBATCH --account=bgmp         ### SLURM account which will be charged for the job
#SBATCH --job-name=STAR     ### Job Name
#SBATCH --output=STAR_mdna-%j.out         ### File in which to store job output
#SBATCH --error=STAR_mdna-%j.err          ### File in which to store job error messages
#SBATCH --time=0-15:00:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1               ### Node count required for the job
#SBATCH --ntasks-per-node=1     ### Nuber of tasks to be launched per Node
#SBATCH --cpus-per-task=8       ### Number of cpus (cores) per task
#SBATCH --partition=bgmp          ### partition to run things

#the RNA sequence data that we are aligning:
# R1='/projects/bgmp/tonib/bioinfo/Bi623/FastQC/Trim_Output/und_out_1P.fq.gz'
# R2='/projects/bgmp/tonib/bioinfo/Bi623/FastQC/Trim_Output/und_out_2P.fq.gz'

conda activate QAA 
# /usr/bin/time -v STAR --runThreadN 8 --runMode genomeGenerate --genomeDir Mus_musculus.GRCm39.dna.ens107.STAR_2.7.10a/ --genomeFastaFiles /projects/bgmp/tonib/bioinfo/Bi623/FastQC/Alignment_mouse/Mus_musculus.GRCm39.dna.primary_assembly.fa --sjdbGTFfile Mus_musculus.GRCm39.107.gtf

/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
    --outFilterMultimapNmax 3 \
    --outSAMunmapped Within KeepPairs \
    --alignIntronMax 1000000 --alignMatesGapMax 1000000 \
    --readFilesIn /projects/bgmp/tonib/bioinfo/Bi623/FastQC/Trim_Output/und_out_1P.fq  /projects/bgmp/tonib/bioinfo/Bi623/FastQC/Trim_Output/und_out_2P.fq \
    --genomeDir Mus_musculus.GRCm39.dna.ens107.STAR_2.7.10a \
    --outFileNamePrefix aligned_genome_und.

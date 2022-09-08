#!/bin/bash
#SBATCH -A bgmp                ###
#SBATCH --partition=bgmp       ### Partition
#SBATCH --job-name=Wrapper         ### Job Name
#SBATCH --time=24:00:00        ### WallTime
#SBATCH --nodes=1              ### Number of Nodes
#SBATCH --cpus-per-task=1           ### Number of CPU cores per task, same as saying 8 cores

conda activate base 

# R1= "/projects/bgmp/shared/2017_sequencing/demultiplexed/29_4E_fox_S21_L008_R1_001.fastq.gz"
# R2= "/projects/bgmp/shared/2017_sequencing/demultiplexed/29_4E_fox_S21_L008_R2_001.fastq.gz"
# R3= "/projects/bgmp/shared/2017_sequencing/demultiplexed/Undetermined_S0_L008_R1_001.fastq.gz"
# R4= "/projects/bgmp/shared/2017_sequencing/demultiplexed/Undetermined_S0_L008_R2_001.fastq.gz"


#./plot_script.py -f /projects/bgmp/shared/2017_sequencing/demultiplexed/29_4E_fox_S21_L008_R1_001.fastq.gz -n 363246735 -r 101 -o R1.output
./plot_script.py -f /projects/bgmp/shared/2017_sequencing/demultiplexed/29_4E_fox_S21_L008_R2_001.fastq.gz -n 363246735 -r 8 -o 29_R2.output
#./plot_script.py -f /projects/bgmp/shared/2017_sequencing/demultiplexed/Undetermined_S0_L008_R1_001.fastq.gz -n 363246735 -r 8 -o R3.output
#./plot_script.py -f /projects/bgmp/shared/2017_sequencing/demultiplexed/Undetermined_S0_L008_R2_001.fastq.gz -n 363246735 -r 101 -o R4.output
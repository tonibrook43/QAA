--- PART ONE ---
1. Using FastQC via the command line on Talapas, produce plots of quality score distributions for R1 and R2 reads. Also, produce plots of the per-base N content, and comment on whether or not they are consistent with the quality score plots.
    -In the quality score plot, we can see that the lowest quality score is around 30 in the forward samples, which is expected since we only wanted a qs of 30 or above to make sure we have high quality data. However, the reverse plots for both sample 29 and sample undetermines, the quality scores dip below 30. This suggests that there is more variability in the reverse samples than the forward samples. In the N plots, you can see that we also get what is expected which is a slight increase in N content in the beginning then a zero N content after that peak. This is consistent with the qs plots because we are only looking for detectable quality scores over 30. 

2. Run your quality score plotting script from your Demultiplexing assignment. (Make sure you're using the "running sum" strategy!!) Describe how the FastQC quality score distribution plots compare to your own. If different, propose an explanation. Also, does the runtime differ? If so, why?
    -The plots for 29_R1 and the other three plots do not differ greatly. We can see the quality scores do not go lower than 30-ish. However, the fastQC plot gives us more insight into what variability each read position has but we are unable to see what cutoff score they used since the lowest qs I see is 26 which is lower than the qs threshold I set in my script. The runtime did differ, FastQC was substantially faster which I assume is because it has built in parameters that allows it to perform faster than my sbatch and python script. 

3. Comment on the overall data quality of your two libraries.
    -Overall, the N content (bases with low confidence) is low in both libraries as well as the average qs being over 30 (threshhold I set in my python script). I can confidently say that our data quality is high. 

--- PART TWO ---
4. What proportion of reads (both R1 and R2) were trimmed?
    -For 29_R1, the proportion of trimmed reads were 7.5%. For 29_R2, the proportion of trimmed reads were 8.3%
    -For undetermined_R1, the proportion of trimmed reads were 3.7%. For undetermined_R2, the proportion of trimmed reads were 4.1%.

5. Comment on whether you expect R1s and R2s to be adapter-trimmed at different rates.
    -R2 should be trimmed at a different rate because R2s are being trimmed at a higher proportion (i.e., answer to question 4). I assume this is because R2 has some lower quality scores than R1. 

6. Use your Unix skills to search for the adapter sequences in your datasets and confirm the expected sequence orientations. Report the commands you used, the reasoning behind them, and how you confirmed the adapter sequences.
    I used this command: 
    zcat /projects/bgmp/shared/2017_sequencing/demultiplexed/29_4E_fox_S21_L008_R1_001.fastq.gz |  awk '/AGATCGGAAGAGCACACGTCTGAACTCCAGTCA/ {print index($0, "AGATCGGAAGAGCACACGTCTGAACTCCAGTCA" )}' | head -5 
    
    I used this command to check my trimmed filed:
    cat /projects/bgmp/tonib/bioinfo/Bi623/FastQC/Trim_Output/29_out_1P.fq |  awk '/AGATCGGAAGAGCACACGTCTGAACTCCAGTCA/ {print index($0, "AGATCGGAAGAGCACACGTCTGAACTCCAGTCA" )}' | head -5

    from this resource: 
    https://stackoverflow.com/questions/53180311/using-awk-to-print-index-of-a-pattern-in-a-file. 
    
    I chose this because it is looking for my adapter sequence as a pattern in my original fastq file and returning the base that my adapter starts on in a read. When it returns something, that lets me know there is an adapter present. I also used this same logic to check my trimmed file for adapter sequences and it returned an empty index which is what we hoped for. 

--- PART THREE ---
6. Demonstrate convincingly whether or not the data are from “strand-specific” RNA-Seq libraries. Include any comands/scripts used. Briefly describe your evidence, using quantitative statements (e.g. "I propose that these data are/are not strand-specific, because X% of the reads are y, as opposed to z.").
    -Undertermined Aligned % of mapped reads:
        Number of mapped reads: 15584505
        Number of unmapped reads: 8735637
        Total Number of Reads: 25188716
        (15584505/25188716)*100% = 61.87% of mapped reads
    -29 Aligned % of mapped reads:
        Number of mapped reads: 8883012
        Number of unmapped reads: 260796
        Total Number of Reads: 9598610
        (8883012/9598610)*100% = 92.54% of mapped reads
    -With the above data, we can see that for the Undetermined Aligned sample, there were 61.8% of mapped reads. Meanwhile, 29 Aligned sample has 92.54% of mapped reads. I assumed that having over 50% of mapped reads for our aligned files also assumes that we have strand specific RNA libraries. This is because when we have stranded data, we expect for a large portion of the reads to read in one direction. With unstranded data, we expect for 50% of our reads to read in one direction and 50% of the reads read in the other direction. With this, I propose that my data is strand-specific because the mapped reads are over 50%.

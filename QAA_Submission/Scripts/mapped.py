#!/usr/bin/env python3

# --Parse through the new SAM folder to make sure reads were mapped--
import argparse
import re

#file used for parsing: aligned_genome.Aligned.out.sam
# R1= '/projects/bgmp/shared/Bi621/dre_WT_ovar12_R1.qtrim.fq.gz'
# R2= '/projects/bgmp/shared/Bi621/dre_WT_ovar12_R2.qtrim.fq.gz'

def get_args():
	parser = argparse.ArgumentParser(description="A program.")
	parser.add_argument("-f", "--file", help="File name", required=True)
	parser.add_argument("-o", "--output", help="Ouput File") #dont think i need this but its here 
	return parser.parse_args()
args=get_args()

#empty lists needed:
read_count = 0
reads_unmapped = 0
reads_mapped = 0

with open(args.file, 'r') as file:
    for line in file:
        if line[0] != '@':    #if the line(header) does not start with '@', increment the number of reads (aka read count) by 1
            read_count += 1
            line = line.split('\t') #we have to split the lines first in order to specify the index-- in this case we want index one because that is associated with the FLAG integers
            flag = int(line[1]) 
            #before we can check if our reads are mapped or unmapped, we have to make sure our file is not showing a read more than once (this happens when there is more than one alignment for one read). we do NOT want this.
            #to check for secondary alignment, we check for reads with a FLAG of 256 and/or 272 (aka forward and reverse strands)
            #to check for unmapped reads, we check for reads with a FLAG of 4
            if((flag & 256) != 256):
                #if the FLAG is not equal to 256 (aka secondary alignment), continue through the loop pls and thank you
                if((flag & 4) == 4):  
                #if the FLAG gives us something other than 4, we can assume our read is mapped and store it as such.
                    reads_unmapped += 1	
                else:
                    reads_mapped +=1
print(f'Number of mapped reads: {reads_mapped}\nNumber of unmapped reads: {reads_unmapped}\nTotal Number of Reads: {read_count}') #Leslie said do NOT use tabs for this one...and it just looks better

'''
Output:
Number of mapped reads: 21851108
Number of unmapped reads: 1645850
Total Number of Reads: 24953202
'''
#command to run script: ./PS8.py -f aligned_genome.Aligned.out.sam

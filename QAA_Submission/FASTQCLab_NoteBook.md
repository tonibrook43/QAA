Assignment:
    Toni    29_4E_fox_S21_L008      Undetermined_S0_L008

/projects/bgmp/shared/2017_sequencing/demultiplexed/29_4E_fox_S21_L008_R1_001.fastq.gz
/projects/bgmp/shared/2017_sequencing/demultiplexed/29_4E_fox_S21_L008_R2_001.fastq.gz

/projects/bgmp/shared/2017_sequencing/demultiplexed/Undetermined_S0_L008_R1_001.fastq.gz
/projects/bgmp/shared/2017_sequencing/demultiplexed/Undetermined_S0_L008_R2_001.fastq.gz

Pathway output folder:
/projects/bgmp/tonib/bioinfo/Bi623/FastQC/Output_Fastqc

--------------------------------------- PART ONE ---------------------------------

How to download fastqc:
module spider fastqc
module load fastqc/0.11.5
echo $PATH to make sure its there

command for saving output files:
fastqc -o /projects/bgmp/tonib/bioinfo/Bi623/FastQC/Output_Fastqc /projects/bgmp/shared/2017_sequencing/demultiplexed/29_4E_fox_S21_L008_R2_001.fastq.gz

command to download files to my personal laptop:
scp -r tonib@talapas-ln1.uoregon.edu:/gpfs/projects/bgmp/tonib/bioinfo/Bi623/FastQC/Output_Fastqc /Users/tonibrooks/bioinfo/Bi623/FASTQC

Wrapper Notes:
Its a bash script that calls my python script
we write a wrapper to pass sbash commands and do conda activate (or anything else we need to do bash wise before we run our python script)

command to open interactive envi: srun --account=bgmp --partition=bgmp --nodes=1 --ntasks-per-node=1 --time=2:00:00 --cpus-per-task=1 --pty bash
command to run: sbatch wrapper.sh
command to check its running: squeue -u tonib

-------------------------------------- PART TWO --------------------------
* Making a conda environment
------resource: https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#creating-an-environment-with-commands --------
* Creating conda environment call QAA
  conda create --name QAA than select y

* Installing cutadapt --version (should be 4.1)
  conda install -n QAA cutadapt
  activate QAA environment prior to installing packages
  conda activate QAA
  cutadapt --version
  4.1

* Installing trimmomatic -version (should be 0.39)
  conda install -n QAA trimmomatic=0.39
  conda list
  0.39 


-----resource: https://cutadapt.readthedocs.io/en/stable/guide.html#trimming-paired-end-reads ----
for trimming the sequences:

R1: AGATCGGAAGAGCACACGTCTGAACTCCAGTCA

R2: AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT

commands to run cutadapt with paired ends:
cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -o out_29R1.fastq -p out_29R2.fastq /projects/bgmp/shared/2017_sequencing/demultiplexed/29_4E_fox_S21_L008_R1_001.fastq.gz /projects/bgmp/shared/2017_sequencing/demultiplexed/29_4E_fox_S21_L008_R2_001.fastq.gz

cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -o out_undR1.fastq -p out_undR2.fastq /projects/bgmp/shared/2017_sequencing/demultiplexed/Undetermined_S0_L008_R1_001.fastq.gz /projects/bgmp/shared/2017_sequencing/demultiplexed/Undetermined_S0_L008_R2_001.fastq.gz

----Cutadapt Summary for 29_4E_fox_S21_L008_R1_001 and 29_4E_fox_S21_L008_R2_001-----

=== Summary ===

Total read pairs processed:          4,827,433
  Read 1 with adapter:                 361,886 (7.5%)
  Read 2 with adapter:                 400,819 (8.3%)
Pairs written (passing filters):     4,827,433 (100.0%)

Total basepairs processed:   975,141,466 bp
  Read 1:   487,570,733 bp
  Read 2:   487,570,733 bp
Total written (filtered):    963,930,893 bp (98.9%)
  Read 1:   482,046,570 bp
  Read 2:   481,884,323 bp

=== First read: Adapter 1 ===

Sequence: AGATCGGAAGAGCACACGTCTGAACTCCAGTCA; Type: regular 3'; Length: 33; Trimmed: 361886 times

Minimum overlap: 3
No. of allowed errors:
1-9 bp: 0; 10-19 bp: 1; 20-29 bp: 2; 30-33 bp: 3

Bases preceding removed adapters:
  A: 14.8%
  C: 27.0%
  G: 42.5%
  T: 15.3%
  none/other: 0.4%

Overview of removed sequences
length  count   expect  max.err error counts
3       91906   75428.6 0       91906
4       26913   18857.2 0       26913
5       13735   4714.3  0       13735
6       9742    1178.6  0       9742
7       9377    294.6   0       9377
8       8970    73.7    0       8970
9       9016    18.4    0       8897 119
10      8908    4.6     1       8590 318
11      8578    1.2     1       8333 245
12      8332    0.3     1       8103 229
13      8363    0.1     1       8139 224
14      7947    0.0     1       7697 250
15      7840    0.0     1       7615 225
16      7688    0.0     1       7469 219
17      7329    0.0     1       7063 266
18      7232    0.0     1       6974 252 6
19      7001    0.0     1       6754 241 6
20      6733    0.0     2       6465 235 33
21      6464    0.0     2       6220 217 27
22      6387    0.0     2       6131 226 30
23      5960    0.0     2       5700 223 37
24      5954    0.0     2       5659 267 28
25      5802    0.0     2       5539 224 39
26      5217    0.0     2       4940 236 41
27      5184    0.0     2       4929 220 32 3
28      4870    0.0     2       4604 223 42 1
29      4675    0.0     2       4422 226 26 1
30      4459    0.0     3       4193 222 29 15
31      4209    0.0     3       3954 217 27 11
32      3869    0.0     3       3643 181 36 9
33      3530    0.0     3       3331 161 27 11
34      3540    0.0     3       3339 168 26 7
35      3173    0.0     3       3008 127 28 10
36      2962    0.0     3       2792 155 11 4
37      2804    0.0     3       2657 125 19 3
38      2591    0.0     3       2469 105 11 6
39      2324    0.0     3       2202 100 17 5
40      2197    0.0     3       2073 104 15 5
41      1974    0.0     3       1869 82 19 4
42      1882    0.0     3       1779 86 14 3
43      1545    0.0     3       1473 63 6 3
44      1369    0.0     3       1305 55 9
45      1323    0.0     3       1251 60 10 2
46      1118    0.0     3       1073 35 6 4
47      1079    0.0     3       1042 34 3
48      970     0.0     3       925 39 4 2
49      839     0.0     3       790 43 1 5
50      785     0.0     3       740 39 5 1
51      644     0.0     3       608 29 3 4
52      579     0.0     3       548 28 3
53      552     0.0     3       525 22 5
54      442     0.0     3       424 17 1
55      392     0.0     3       369 19 2 2
56      354     0.0     3       340 10 2 2
57      300     0.0     3       286 13 0 1
58      281     0.0     3       273 7 1
59      248     0.0     3       235 11 0 2
60      269     0.0     3       257 11 1
61      213     0.0     3       201 11 1
62      192     0.0     3       184 6 1 1
63      156     0.0     3       147 8 1
64      136     0.0     3       125 9 0 2
65      139     0.0     3       136 3
66      114     0.0     3       106 7 1
67      108     0.0     3       105 3
68      95      0.0     3       90 4 1
69      107     0.0     3       106 1
70      79      0.0     3       74 4 1
71      65      0.0     3       62 3
72      62      0.0     3       58 3 1
73      57      0.0     3       55 0 1 1
74      48      0.0     3       45 1 2
75      30      0.0     3       27 3
76      28      0.0     3       27 0 0 1
77      20      0.0     3       18 0 2
78      17      0.0     3       15 2
79      13      0.0     3       13
80      9       0.0     3       9
81      9       0.0     3       9
82      11      0.0     3       10 1
83      8       0.0     3       7 1
84      4       0.0     3       4
85      11      0.0     3       11
86      6       0.0     3       6
87      7       0.0     3       7
88      7       0.0     3       7
89      8       0.0     3       7 0 1
90      4       0.0     3       4
91      5       0.0     3       5
92      1       0.0     3       1
93      2       0.0     3       1 0 1
94      5       0.0     3       5
95      3       0.0     3       2 1
96      4       0.0     3       4
97      8       0.0     3       8
98      6       0.0     3       5 1
99      3       0.0     3       3
100     5       0.0     3       5
101     1355    0.0     3       3 1093 244 15


=== Second read: Adapter 2 ===

Sequence: AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT; Type: regular 3'; Length: 33; Trimmed: 400819 times

Minimum overlap: 3
No. of allowed errors:
1-9 bp: 0; 10-19 bp: 1; 20-29 bp: 2; 30-33 bp: 3

Bases preceding removed adapters:
  A: 16.5%
  C: 27.7%
  G: 46.5%
  T: 8.9%
  none/other: 0.3%

Overview of removed sequences
length  count   expect  max.err error counts
3       122913  75428.6 0       122913
4       31646   18857.2 0       31646
5       14723   4714.3  0       14723
6       10333   1178.6  0       10333
7       9522    294.6   0       9522
8       9018    73.7    0       9018
9       9103    18.4    0       8941 162
10      8995    4.6     1       8682 313
11      8715    1.2     1       8426 289
12      8403    0.3     1       8198 205
13      8396    0.1     1       8203 193
14      7985    0.0     1       7823 162
15      7896    0.0     1       7659 237
16      7740    0.0     1       7577 163
17      7351    0.0     1       7145 206
18      7245    0.0     1       6996 249
19      7019    0.0     1       6802 214 3
20      6764    0.0     2       6500 235 29
21      6469    0.0     2       6233 213 23
22      6423    0.0     2       6205 193 25
23      6001    0.0     2       5765 210 26
24      5970    0.0     2       5705 240 25
25      5839    0.0     2       5571 242 26
26      5236    0.0     2       4991 221 24
27      5207    0.0     2       4966 204 34 3
28      4910    0.0     2       4649 224 37
29      4709    0.0     2       4452 205 45 7
30      4477    0.0     3       4250 187 31 9
31      4218    0.0     3       3961 219 30 8
32      3888    0.0     3       3661 184 36 7
33      3566    0.0     3       3344 171 36 15
34      3558    0.0     3       3362 155 31 10
35      3186    0.0     3       2984 162 28 12
36      2972    0.0     3       2834 114 17 7
37      2813    0.0     3       2650 130 25 8
38      2611    0.0     3       2454 114 19 24
39      2332    0.0     3       2189 124 13 6
40      2209    0.0     3       2103 81 19 6
41      1991    0.0     3       1899 75 8 9
42      1885    0.0     3       1783 71 23 8
43      1558    0.0     3       1476 70 7 5
44      1378    0.0     3       1311 53 9 5
45      1333    0.0     3       1269 50 8 6
46      1137    0.0     3       1082 45 5 5
47      1080    0.0     3       1034 39 4 3
48      987     0.0     3       939 34 8 6
49      848     0.0     3       807 33 4 4
50      793     0.0     3       749 37 4 3
51      652     0.0     3       613 31 5 3
52      594     0.0     3       562 21 3 8
53      565     0.0     3       520 35 5 5
54      457     0.0     3       422 24 9 2
55      406     0.0     3       373 26 6 1
56      362     0.0     3       344 12 4 2
57      313     0.0     3       288 16 5 4
58      291     0.0     3       273 12 4 2
59      256     0.0     3       236 15 2 3
60      280     0.0     3       261 13 5 1
61      220     0.0     3       203 13 3 1
62      202     0.0     3       196 5 0 1
63      168     0.0     3       152 11 2 3
64      146     0.0     3       135 8 0 3
65      146     0.0     3       138 6 1 1
66      120     0.0     3       112 5 1 2
67      114     0.0     3       105 4 4 1
68      104     0.0     3       94 4 3 3
69      113     0.0     3       107 4 2
70      88      0.0     3       79 6 2 1
71      76      0.0     3       68 4 3 1
72      74      0.0     3       66 5 2 1
73      62      0.0     3       54 4 3 1
74      55      0.0     3       44 8 1 2
75      40      0.0     3       34 1 3 2
76      32      0.0     3       27 2 2 1
77      23      0.0     3       20 2 0 1
78      19      0.0     3       18 0 1
79      14      0.0     3       13 0 0 1
80      11      0.0     3       10 1
81      10      0.0     3       10
82      13      0.0     3       10 2 0 1
83      9       0.0     3       9
84      4       0.0     3       4
85      11      0.0     3       11
86      8       0.0     3       4 2 2
87      7       0.0     3       7
88      7       0.0     3       6 1
89      8       0.0     3       8
90      5       0.0     3       3 2
91      5       0.0     3       2 2 1
92      1       0.0     3       1
93      2       0.0     3       2
94      5       0.0     3       2 2 1
95      3       0.0     3       2 1
96      4       0.0     3       1 3
97      8       0.0     3       6 2
98      7       0.0     3       3 2 1 1
99      3       0.0     3       2 1
100     5       0.0     3       0 1 4
101     1340    0.0     3       0 1091 227 22

How many times R1 and R2 was trimmed for 29_4E_fox_S21_L008_R1_001 and 29_4E_fox_S21_L008_R2_001:

Total read pairs processed:          4,827,433
  Read 1 with adapter:                 361,886 (7.5%)
  Read 2 with adapter:                 400,819 (8.3%)
Pairs written (passing filters):     4,827,433 (100.0%)

Adapted 1: Sequence: AGATCGGAAGAGCACACGTCTGAACTCCAGTCA; Type: regular 3'; Length: 33; Trimmed: 361886 times
Adapter 2: Sequence: AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT; Type: regular 3'; Length: 33; Trimmed: 400819 times


----Cutadapt Summary for Undetermined_S0_L008_R1_001 and Undetermined_S0_L008_R2_001-----

=== Summary ===

Total read pairs processed:         14,760,166
  Read 1 with adapter:                 543,021 (3.7%)
  Read 2 with adapter:                 607,660 (4.1%)
Pairs written (passing filters):    14,760,166 (100.0%)

Total basepairs processed: 2,981,553,532 bp
  Read 1: 1,490,776,766 bp
  Read 2: 1,490,776,766 bp
Total written (filtered):  2,968,880,881 bp (99.6%)
  Read 1: 1,484,746,362 bp
  Read 2: 1,484,134,519 bp

=== First read: Adapter 1 ===

Sequence: AGATCGGAAGAGCACACGTCTGAACTCCAGTCA; Type: regular 3'; Length: 33; Trimmed: 543021 times

Minimum overlap: 3
No. of allowed errors:
1-9 bp: 0; 10-19 bp: 1; 20-29 bp: 2; 30-33 bp: 3

Bases preceding removed adapters:
  A: 21.4%
  C: 29.7%
  G: 31.9%
  T: 15.6%
  none/other: 1.4%

Overview of removed sequences
length  count   expect  max.err error counts
3       264793  230627.6        0       264793
4       62263   57656.9 0       62263
5       18513   14414.2 0       18513
6       9565    3603.6  0       9565
7       8857    900.9   0       8857
8       8166    225.2   0       8166
9       8179    56.3    0       7962 217
10      8463    14.1    1       7820 643
11      7691    3.5     1       7198 493
12      7423    0.9     1       7019 404
13      7373    0.2     1       6929 444
14      6700    0.1     1       6238 462
15      6402    0.0     1       6022 380
16      6234    0.0     1       5834 400
17      5867    0.0     1       5524 343
18      5573    0.0     1       5205 357 11
19      5416    0.0     1       5031 364 21
20      5199    0.0     2       4761 340 98
21      4884    0.0     2       4501 283 100
22      4719    0.0     2       4334 305 80
23      4565    0.0     2       4174 272 119
24      4412    0.0     2       4001 329 82
25      4119    0.0     2       3767 269 83
26      4020    0.0     2       3644 279 97
27      3815    0.0     2       3472 263 76 4
28      3526    0.0     2       3158 268 88 12
29      3342    0.0     2       2983 275 65 19
30      3164    0.0     3       2759 267 90 48
31      2924    0.0     3       2564 216 102 42
32      2641    0.0     3       2274 240 81 46
33      2586    0.0     3       2151 291 93 51
34      2517    0.0     3       2075 293 92 57
35      2299    0.0     3       1904 273 69 53
36      2250    0.0     3       1883 235 80 52
37      2042    0.0     3       1729 212 61 40
38      1957    0.0     3       1632 209 73 43
39      1857    0.0     3       1571 199 54 33
40      1702    0.0     3       1458 171 45 28
41      1591    0.0     3       1337 160 53 41
42      1537    0.0     3       1305 145 55 32
43      1356    0.0     3       1126 155 48 27
44      1191    0.0     3       1016 123 33 19
45      1113    0.0     3       964 94 42 13
46      1035    0.0     3       867 98 37 33
47      1004    0.0     3       847 95 44 18
48      899     0.0     3       785 85 19 10
49      846     0.0     3       719 87 22 18
50      799     0.0     3       690 74 20 15
51      698     0.0     3       597 63 26 12
52      648     0.0     3       558 67 15 8
53      548     0.0     3       475 46 14 13
54      552     0.0     3       482 50 13 7
55      459     0.0     3       382 57 11 9
56      410     0.0     3       357 33 12 8
57      399     0.0     3       335 48 11 5
58      360     0.0     3       308 35 10 7
59      398     0.0     3       349 26 13 10
60      347     0.0     3       301 34 7 5
61      306     0.0     3       261 28 11 6
62      262     0.0     3       222 29 6 5
63      262     0.0     3       225 24 10 3
64      206     0.0     3       177 21 4 4
65      219     0.0     3       188 20 4 7
66      195     0.0     3       168 20 4 3
67      182     0.0     3       157 19 4 2
68      159     0.0     3       144 11 2 2
69      151     0.0     3       133 13 2 3
70      138     0.0     3       116 11 9 2
71      136     0.0     3       112 17 3 4
72      101     0.0     3       84 8 6 3
73      98      0.0     3       88 9 1
74      86      0.0     3       66 14 4 2
75      48      0.0     3       41 5 1 1
76      47      0.0     3       37 7 3
77      41      0.0     3       30 5 5 1
78      52      0.0     3       41 6 2 3
79      33      0.0     3       29 2 1 1
80      28      0.0     3       23 3 1 1
81      29      0.0     3       23 3 3
82      15      0.0     3       15
83      24      0.0     3       17 6 1
84      21      0.0     3       15 6
85      20      0.0     3       16 3 0 1
86      21      0.0     3       16 4 0 1
87      20      0.0     3       14 3 1 2
88      14      0.0     3       11 2 1
89      24      0.0     3       21 1 1 1
90      8       0.0     3       6 1 1
91      16      0.0     3       13 2 1
92      11      0.0     3       5 3 3
93      12      0.0     3       6 1 5
94      10      0.0     3       5 3 1 1
95      16      0.0     3       11 5
96      12      0.0     3       8 2 0 2
97      20      0.0     3       10 2 4 4
98      29      0.0     3       13 2 9 5
99      10      0.0     3       1 1 2 6
100     26      0.0     3       1 0 4 21
101     7705    0.0     3       8 6265 1216 216


=== Second read: Adapter 2 ===

Sequence: AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT; Type: regular 3'; Length: 33; Trimmed: 607660 times

Minimum overlap: 3
No. of allowed errors:
1-9 bp: 0; 10-19 bp: 1; 20-29 bp: 2; 30-33 bp: 3

Bases preceding removed adapters:
  A: 23.7%
  C: 30.4%
  G: 33.5%
  T: 11.0%
  none/other: 1.3%

Overview of removed sequences
length  count   expect  max.err error counts
3       304354  230627.6        0       304354
4       69798   57656.9 0       69798
5       20224   14414.2 0       20224
6       11048   3603.6  0       11048
7       9400    900.9   0       9400
8       8578    225.2   0       8578
9       8687    56.3    0       8358 329
10      9045    14.1    1       8236 809
11      8202    3.5     1       7572 630
12      7797    0.9     1       7360 437
13      7726    0.2     1       7304 422
14      7094    0.1     1       6690 404
15      6832    0.0     1       6400 432
16      6671    0.0     1       6339 332
17      6239    0.0     1       5891 348
18      5898    0.0     1       5543 352 3
19      5783    0.0     1       5464 307 12
20      5579    0.0     2       5152 294 133
21      5234    0.0     2       4823 292 119
22      5040    0.0     2       4616 311 113
23      4896    0.0     2       4542 231 123
24      4706    0.0     2       4344 275 87
25      4406    0.0     2       4037 252 117
26      4324    0.0     2       3951 274 99
27      4087    0.0     2       3767 232 88
28      3796    0.0     2       3429 277 85 5
29      3571    0.0     2       3228 265 71 7
30      3410    0.0     3       3013 276 75 46
31      3132    0.0     3       2692 287 92 61
32      2895    0.0     3       2458 294 81 62
33      2781    0.0     3       2335 289 97 60
34      2728    0.0     3       2335 252 79 62
35      2497    0.0     3       2107 250 76 64
36      2428    0.0     3       2048 246 82 52
37      2219    0.0     3       1874 233 69 43
38      2128    0.0     3       1778 235 65 50
39      2010    0.0     3       1669 236 68 37
40      1835    0.0     3       1545 180 63 47
41      1736    0.0     3       1465 176 59 36
42      1670    0.0     3       1405 170 55 40
43      1499    0.0     3       1249 158 57 35
44      1306    0.0     3       1099 133 37 37
45      1226    0.0     3       1016 143 37 30
46      1135    0.0     3       965 109 36 25
47      1102    0.0     3       913 127 35 27
48      994     0.0     3       849 88 30 27
49      936     0.0     3       778 97 35 26
50      895     0.0     3       728 105 35 27
51      803     0.0     3       659 90 31 23
52      727     0.0     3       607 73 25 22
53      631     0.0     3       522 56 29 24
54      638     0.0     3       537 62 26 13
55      543     0.0     3       442 59 23 19
56      505     0.0     3       406 60 23 16
57      466     0.0     3       368 59 17 22
58      436     0.0     3       351 56 17 12
59      482     0.0     3       389 45 28 20
60      418     0.0     3       327 56 19 16
61      366     0.0     3       292 44 16 14
62      337     0.0     3       262 38 23 14
63      314     0.0     3       249 38 18 9
64      272     0.0     3       218 30 14 10
65      261     0.0     3       209 36 12 4
66      251     0.0     3       199 27 10 15
67      234     0.0     3       183 32 12 7
68      210     0.0     3       167 27 9 7
69      198     0.0     3       156 22 9 11
70      174     0.0     3       140 24 3 7
71      181     0.0     3       142 17 11 11
72      144     0.0     3       98 23 9 14
73      141     0.0     3       106 19 9 7
74      120     0.0     3       86 17 13 4
75      95      0.0     3       59 22 6 8
76      81      0.0     3       58 14 5 4
77      73      0.0     3       44 16 6 7
78      75      0.0     3       58 12 1 4
79      64      0.0     3       40 12 4 8
80      56      0.0     3       39 7 4 6
81      49      0.0     3       32 9 2 6
82      41      0.0     3       28 8 4 1
83      49      0.0     3       29 6 10 4
84      36      0.0     3       26 2 1 7
85      39      0.0     3       20 11 4 4
86      33      0.0     3       17 9 2 5
87      27      0.0     3       15 7 3 2
88      20      0.0     3       13 2 3 2
89      35      0.0     3       22 6 4 3
90      16      0.0     3       5 4 3 4
91      22      0.0     3       14 4 2 2
92      17      0.0     3       8 3 5 1
93      21      0.0     3       8 3 2 8
94      17      0.0     3       7 1 2 7
95      28      0.0     3       11 7 6 4
96      30      0.0     3       8 4 11 7
97      32      0.0     3       8 4 10 10
98      39      0.0     3       11 4 12 12
99      35      0.0     3       8 2 6 19
100     56      0.0     3       1 3 17 35
101     8145    0.0     3       226 6197 1385 337


How many times R1 and R2 was trimmed for 29_4E_fox_S21_L008_R1_001 and 29_4E_fox_S21_L008_R2_001:
Total read pairs processed:         14,760,166
  Read 1 with adapter:                 543,021 (3.7%)
  Read 2 with adapter:                 607,660 (4.1%)
Pairs written (passing filters):    14,760,166 (100.0%)

Adapter 1: Sequence: AGATCGGAAGAGCACACGTCTGAACTCCAGTCA; Type: regular 3'; Length: 33; Trimmed: 543021 times
Adapter 2: Sequence: AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT; Type: regular 3'; Length: 33; Trimmed: 607660 times

******Sanity check: Use your Unix skills to search for the adapter sequences in your datasets and confirm the expected sequence orientations. Report the commands you used, the reasoning behind them, and how you confirmed the adapter sequences.*********
resource: https://stackoverflow.com/questions/53180311/using-awk-to-print-index-of-a-pattern-in-a-file

Adapter sequences for R1 and R2:
R1: AGATCGGAAGAGCACACGTCTGAACTCCAGTCA
R2: AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT

original data files:
/projects/bgmp/shared/2017_sequencing/demultiplexed/29_4E_fox_S21_L008_R1_001.fastq.gz
/projects/bgmp/shared/2017_sequencing/demultiplexed/29_4E_fox_S21_L008_R2_001.fastq.gz

/projects/bgmp/shared/2017_sequencing/demultiplexed/Undetermined_S0_L008_R1_001.fastq.gz
/projects/bgmp/shared/2017_sequencing/demultiplexed/Undetermined_S0_L008_R2_001.fastq.gz


For R1 files----
zcat /projects/bgmp/shared/2017_sequencing/demultiplexed/29_4E_fox_S21_L008_R1_001.fastq.gz |  awk '/AGATCGGAAGAGCACACGTCTGAACTCCAGTCA/ {print index($0, "AGATCGGAAGAGCACACGTCTGAACTCCAGTCA" )}' | head -10

zcat /projects/bgmp/shared/2017_sequencing/demultiplexed/Undetermined_S0_L008_R1_001.fastq.gz |  awk '/AGATCGGAAGAGCACACGTCTGAACTCCAGTCA/ {print index($0, "AGATCGGAAGAGCACACGTCTGAACTCCAGTCA" )}' | head -10

For R2 Files----
zcat /projects/bgmp/shared/2017_sequencing/demultiplexed/29_4E_fox_S21_L008_R2_001.fastq.gz |  awk '/AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT/ {print index($0, "AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT" )}' | head -10

zcat /projects/bgmp/shared/2017_sequencing/demultiplexed/Undetermined_S0_L008_R2_001.fastq.gz |  awk '/AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT/ {print index($0, "AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT" )}' | head -10

To test whether the above command works on the already trimmed file (should return an empty index):
/projects/bgmp/tonib/bioinfo/Bi623/FastQC/Trim_Output/29_out_1P.fq.gz

cat /projects/bgmp/tonib/bioinfo/Bi623/FastQC/Trim_Output/29_out_1P.fq |  awk '/AGATCGGAAGAGCACACGTCTGAACTCCAGTCA/ {print index($0, "AGATCGGAAGAGCACACGTCTGAACTCCAGTCA" )}' | head -10


_______Make a new sbatch for trimming_____
---resource: http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/TrimmomaticManual_V0.32.pdf ---

Input 29:
out_29R1.f.fastq - for paired forward reads
out_29R2.r.fastq - for unpaired forward reads

Output:
29_out_1P.fq.gz - for paired forward reads
29_out_1U.fq.gz - for unpaired forward reads
29_out_2P.fq.gz - for paired reverse reads
29_out_2U.fq.gz - for unpaired reverse reads

Input Undetermined:
out_undR1.f.fastq - for paired reverse reads
out_undR1.r.fastq - for unpaired reverse reads

Output:
und_out_1P.fq.gz - for paired forward reads
und_out_1U.fq.gz - for unpaired forward reads
und_out_2P.fq.gz - for paired reverse reads
und_out_2U.fq.gz - for unpaired reverse reads


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

Using Trimmomatic:
trimmomatic PE 34_4H.f.fastq  out_29R1.fastq 34_Filtered_1P.fq.gz 34_Filtered_1U.fq.gz 34_Filtered_2P.fq.gz 34_Filtered_2U.fq.gz LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35


Run to make fastq files from our paired trim output files:

*to install fastqc into our QAA environment: conda install -n QAA fastqc 

*to make the fastqc files
fastqc -o /projects/bgmp/tonib/bioinfo/Bi623/FastQC/FastQC_trimmed /projects/bgmp/tonib/bioinfo/Bi623/FastQC/Trim_Output/und_out_2P.fq.gz

*to clone fastqc_trimmed to my computer:
scp -r tonib@talapas-ln1.uoregon.edu:/projects/bgmp/tonib/bioinfo/Bi623/FastQC/FastQC_trimmed /Users/tonibrooks/bioinfo/Bi623/FASTQC/FastQC_trimmed


---for read distributions---

cat /projects/bgmp/tonib/bioinfo/Bi623/FastQC/Trim_Output/29_out_1P.fq | sed -n "2~4p" | awk '{print length($0)}'| sort -n | uniq -c > distribution_29R1.txt

cat /projects/bgmp/tonib/bioinfo/Bi623/FastQC/Trim_Output/29_out_2P.fq | sed -n "2~4p" | awk '{print length($0)}'| sort -n | uniq -c > distribution_29R2.txt

cat /projects/bgmp/tonib/bioinfo/Bi623/FastQC/Trim_Output/und_out_1P.fq | sed -n "2~4p" | awk '{print length($0)}'| sort -n | uniq -c > distribution_undR1.txt

cat /projects/bgmp/tonib/bioinfo/Bi623/FastQC/Trim_Output/und_out_2P.fq | sed -n "2~4p" | awk '{print length($0)}'| sort -n | uniq -c > distribution_undR2.txt

----Installing STAR and other packages--
conda activate QAA
conda install star -c bioconda
STAR --version
  2.7.10a

conda install samtools -c bioconda
samtools --version

conda install -n QAA numpy
conda install -n QAA pysam

---Downloading mouse files---
wget http://ftp.ensembl.org/pub/release-107/fasta/mus_musculus/dna/Mus_musculus.GRCm39.dna.primary_assembly.fa.gz

directory: Mus_musculus.GRCm39.dna.ens107.STAR_2.7.10a

---STAR and GENOMEGEN RUN----

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
# R1='/projects/bgmp/tonib/bioinfo/Bi623/FastQC/Trim_Output/29_out_1P.fq.gz'
# R2='/projects/bgmp/tonib/bioinfo/Bi623/FastQC/Trim_Output/29_out_2P.fq.gz'

#had to run both genomegen and STAR together due to issues while running them separately.
#RUNNING GENONEGEN.SRUN (was not working to do the two separately)
conda activate QAA 
/usr/bin/time -v STAR --runThreadN 8 --runMode genomeGenerate --genomeDir Mus_musculus.GRCm39.dna.ens107.STAR_2.7.10a/ --genomeFastaFiles /projects/bgmp/tonib/bioinfo/Bi623/FastQC/Alignment_mouse/Mus_musculus.GRCm39.dna.primary_assembly.fa.gz --sjdbGTFfile Mus_musculus.GRCm39.107.gtf.gz

#RUNNING STAR.SRUN
/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
    --outFilterMultimapNmax 3 \
    --outSAMunmapped Within KeepPairs \
    --alignIntronMax 1000000 --alignMatesGapMax 1000000 \
    --readFilesCommand zcat \
    --readFilesIn /projects/bgmp/tonib/bioinfo/Bi623/FastQC/Trim_Output/29_out_1P.fq.gz  /projects/bgmp/tonib/bioinfo/Bi623/FastQC/Trim_Output/29_out_2P.fq.gz \
    --genomeDir Mus_musculus.GRCm39.dna.ens107.STAR_2.7.10a \
    --outFileNamePrefix aligned_genome.

'''
Bash commands if I wanted to convert SAM file to BAM file:
sbatch STAR.srun  [to run script]
squeue -u tonib   [to make sure its running and for how long]
samtools view -@ n -Sb -o aligned_genome.Aligned.out.bam aligned_genome.Aligned.out.sam   [to convert SAM to BAM]
samtools sort -O bam aligned_genome.Aligned.out.bam -o sorted_aligned_genome.Aligned.out.bam   [to sort my new BAM file]
samtools index sorted_aligned_genome.Aligned.out.bam    [to index my sorted BAM file]
samtools view sorted_aligned_genome.Aligned.out.bam 1 > sorted_aligned_genome.Aligned.out.Chromosome1.sam   [to append my indexed and sorted BAM file to my SAM file]
cat sorted_aligned_genome.Aligned.out.Chromosome1.sam   [to make sure file appended correctly]
'''

To do line count: wc -l aligned_genome.Aligned.out.sam 
output: 9598674 aligned_genome.Aligned.out.sam

check for mapped vs unmapped reads:

#command to run script: 
./mapped.py -f /projects/bgmp/tonib/bioinfo/Bi623/FastQC/Alignment_mouse/aligned_genome_und.Aligned.out.sam
  Number of mapped reads: 15584505
  Number of unmapped reads: 8735637
  Total Number of Reads: 25188716
  (15584505/25188716)*100% = 61.87% of mapped reads

./mapped.py -f /projects/bgmp/tonib/bioinfo/Bi623/FastQC/Alignment_mouse/aligned_genome29.Aligned.out.sam
  Number of mapped reads: 8883012
  Number of unmapped reads: 260796
  Total Number of Reads: 9598610
  (8883012/9598610)*100% = 92.54% of mapped reads

----To run htseq------
htseq-count --format sam --stranded=yes  /projects/bgmp/tonib/bioinfo/Bi623/FastQC/Alignment_mouse/aligned_genome29.Aligned.out.sam /projects/bgmp/tonib/bioinfo/Bi623/FastQC/Alignment_mouse/Mus_musculus.GRCm39.107.gtf > 29_htseq_Forward.txt

htseq-count --format sam --stranded=reverse  /p rojects/bgmp/tonib/bioinfo/Bi623/FastQC/Alignment_mouse/aligned_genome29.Aligned.out.sam /projects/bgmp/tonib/bioinfo/Bi623/FastQC/Alignment_mouse/Mus_musculus.GRCm39.107.gtf > 29_htseq_Reverse.txt


htseq-count --format sam --stranded=yes  /projects/bgmp/tonib/bioinfo/Bi623/FastQC/Alignment_mouse/aligned_genome_und.Aligned.out.sam /projects/bgmp/tonib/bioinfo/Bi623/FastQC/Alignment_mouse/Mus_musculus.GRCm39.107.gtf > und_htseq_Forward.txt

htseq-count --format sam --stranded=reverse  /projects/bgmp/tonib/bioinfo/Bi623/FastQC/Alignment_mouse/aligned_genome_und.Aligned.out.sam /projects/bgmp/tonib/bioinfo/Bi623/FastQC/Alignment_mouse/Mus_musculus.GRCm39.107.gtf > und_htseq_Reverse.txt
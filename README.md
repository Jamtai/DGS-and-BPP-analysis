# DGS-analysis-and-BPP-analysis
Degerate Sequence Analysis and Base-Pairing Probability Analysis
## Dependency
 1.  Install RNAstructure on your computer, if it is not already installed.
Open a terminal or command prompt and navigate to the RNAstructure directory.
Run the 'expand.py' script with the following command:
php
Copy code
```sh
python expand.py -f/s <input_file> <output_file>
```
Where <input_file> is the name of the file containing the degenerate RNA sequence, and <output_file> is the desired name for the output file containing the expanded sequence.

The script will expand all 'R's and 'Y's in the input sequence to their exact nucleotides and write the expanded sequence to the output file.
In the case of the example sequence you provided, the command to expand the sequence using 'expand.py' would be:


expand.py Input options:
        -s,--seq    : Sequence string to expand (results output to stdout)
               or
        -f,--fasta  : You can also specify a FASTA file. Results will be output as FASTA.
        -h,--help   : Displays help menu""")
 


 2.   To calculate the partition function for each sequence in a file containing expanded RNA sequences, you can use the RNAstructure software and follow the steps outlined below:

Set the DATAPATH environment variable to the directory containing the RNAstructure data tables. For example:
bash

```sh
source /opt/ohpc/pub/Software/mamba-rocky/etc/profile.d/conda.sh
#Set the OMP_NUM_THREADS environment variable to the desired number of threads for parallel processing. For example:

export OMP_NUM_THREADS=10
#Split the combined fasta file into individual sequences using a loop that reads the input file line by line and writes each sequence to a separate file. For example:
bash ./RNA_ires_degen.sh
```
This loop runs 3command lines at the same time
 The Fold command on each fasta file in the directory, creates a separate .ct file for each sequence with the filename based on the sequence ID, and outputs the .ct file to the 'fold' directory. 
 The partition-smp command on each fasta file in the directory, creates a separate .pfs file for each sequence with the filename based on the sequence ID, and outputs the .pfs file to the 'pfs' directory. .
 The MaxExpect command on each .pfs file and output the MEA structure to the corresponding file in the 'new' directory.
The fasta file is then removed after partition-smp is completed


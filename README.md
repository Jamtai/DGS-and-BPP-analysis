# DGS-analysis-and-BPP-analysis
degerate sequence analysis and base-pairing probability analysis

 1.  Install RNAstructure on your computer, if it is not already installed.
Open a terminal or command prompt and navigate to the RNAstructure directory.
Run the 'expand.py' script with the following command:
php
Copy code
python expand.py <input_file> <output_file>
Where <input_file> is the name of the file containing the degenerate RNA sequence, and <output_file> is the desired name for the output file containing the expanded sequence.

The script will expand all 'R's and 'Y's in the input sequence to their exact nucleotides and write the expanded sequence to the output file.
In the case of the example sequence you provided, the command to expand the sequence using 'expand.py' would be:

Copy code
python expand.py example_sequence.txt expanded_sequence.txt
Where 'example_sequence.txt' is the name of the file containing the degenerate RNA sequence, and 'expanded_sequence.txt' is the desired name for the output file containing the expanded sequence.
expand.py Input options:
        -s,--seq    : Sequence string to expand (results output to stdout)
               or
        -f,--fasta  : You can also specify a FASTA file. Results will be output as FASTA.
        -h,--help   : Displays help menu""")
 
 example:python3 ../expand.py -f ../input.fasta 



 2.   To calculate the partition function for each sequence in a file containing expanded RNA sequences, you can use the RNAstructure software and follow the steps outlined below:

Set the DATAPATH environment variable to the directory containing the RNAstructure data tables. For example:
bash
Copy code
source /opt/ohpc/pub/Software/mamba-rocky/etc/profile.d/conda.sh
Set the OMP_NUM_THREADS environment variable to the desired number of threads for parallel processing. For example:
arduino
Copy code
export OMP_NUM_THREADS=10
Split the combined fasta file into individual sequences using a loop that reads the input file line by line and writes each sequence to a separate file. For example:
while read line
do
    if [[ ${line:0:1} == '>' ]]
    then
        outfile=${line#>}.fa
        echo $line > "$outfile"
    else
        echo $line >> "$outfile"
    fi
done < expanded_sequences.fasta
This loop reads the 'expanded_sequences.fasta' file, creates a separate fasta file for each sequence with the filename based on the sequence ID, and writes each sequence to its corresponding file.

Use a loop to run the partition-smp command on each fasta file and output the partition function to a corresponding .pfs file. For example:
bash
Copy code
mkdir pfs # create a directory for output files
cd expanded_sequences # change to directory containing fasta files
for F in *.fa; do
    N=$(basename $F .fa) ;
    partition-smp $F ../pfs/$N.pfs ; # run partition-smp on each fasta file and output the pfs file to the pfs directory
    rm $F # remove fasta file after partition-smp is completed
done
This loop runs the partition-smp command on each fasta file in the directory, creates a separate .pfs file for each sequence with the filename based on the sequence ID, and outputs the .pfs file to the 'pfs' directory. The fasta file is then removed after partition-smp is completed.

 3.   To calculate the maximum expected accuracy (MEA) structure for each sequence using the partition function files (.pfs) generated in the previous step, you can use the MaxExpect command from the RNAstructure software and follow the steps below:

Create a directory to store the output MEA structures. For example:
bash
Copy code
mkdir /data/duren_lab/jjiamut/175bp/MEA/MaxExpect
This will create a directory named 'MaxExpect' inside the 'MEA' directory.

Use a loop to run the MaxExpect command on each .pfs file and output the MEA structure to the corresponding file in the 'MaxExpect' directory. For example:
bash
Copy code
cd /data/duren_lab/jjiamut/175bp/pfs # change to directory containing .pfs files
for F in *.pfs; do
    N=$(basename $F .pfs) ;
    MaxExpect $F /data/duren_lab/jjiamut/175bp/MEA/MaxExpect/$N ; # run MaxExpect on each .pfs file and output the MEA structure to the corresponding file in the 'MaxExpect' directory
done
This loop runs the MaxExpect command on each .pfs file in the directory, creates a separate file for each sequence with the filename based on the sequence ID, and outputs the MEA structure to the corresponding file in the 'MaxExpect' directory.

 4.Overall, the steps to calculate the MEA structure for each sequence involves creating a directory to store the output files and using a loop to run the MaxExpect command on each .pfs file and output the MEA structure to the corresponding file in the 'MaxExpect' directory.
Finally, unload the RNAstructure module using the command:
arduino
Copy code
module unload rnastructure
3.

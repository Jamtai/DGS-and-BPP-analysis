#!/bin/bash
#SBATCH -n 4                # Number of cores
#SBATCH -N 1                # Ensure that all cores are on one machine
#SBATCH -t 4-00:00          # Runtime in D-HH:MM
#SBATCH --mem=40000         # Memory pool for all cores
#SBATCH -w compute001
#SBATCH -o group1.out     # File to which STDOUT will be written
#SBATCH -e group1.er
#SBATCH --mail-user=jjiamut@clemson.edu
#
#module
module add rnastructure
export DATAPATH=/opt/ohpc/pub/Software/RNAstructure/data_tables
export OMP_NUM_THREADS=10
#split combined fasta into individual sequences
while read line
do
    if [[ ${line:0:1} == '>' ]]
    then
        outfile=${line#>}.fa
        echo $line > "$outfile"
    else
        echo $line >> "$outfile"
    fi
done < out.fasta
#loop
#in directory of fasta seqs
for F in *.fa; do
    N=$(basename $F .fa) ;
    Fold-smp $F $N.ct -mfe ;
    #partition-smp $F pfs/$N.pfs ;
    draw ct/$N.ct svg/$F.svg #--svg -n 1 -P pfs/$N.pfs ;
    rm $F
done

module unload rnastructure
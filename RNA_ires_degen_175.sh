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

source /opt/ohpc/pub/Software/mamba-rocky/etc/profile.d/conda.s
module add rnastructure
export OMP_NUM_THREADS=10
makdir ./pfs
mkdir ./new
mkdir ./folr
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
done < output.fasta
#loop
#in directory of fasta seqs
for F in *.fa; do
    C=$(basename $F.ct) ;
    N=$(basename $F.fa) ;
    Fold-smp $F /fold/$N.ct -mfe ;
    partition-smp $F pfs/$N.pfs ;
    MaxExpect  $F  /to/path/175bp/new/$C ;
done
module unload rnastructure

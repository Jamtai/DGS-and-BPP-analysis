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

#loop
#in directory of fasta seqs
for F in *.pfs; do
    N=$(basename $F .ct) ;
    MaxExpect  $F  /data/duren_lab/jjiamut/175bp/MEA/MaxExpect/$N ;
done
module unload rnastructure
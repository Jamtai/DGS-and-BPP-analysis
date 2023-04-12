module add rnastructure
source /opt/ohpc/pub/Software/mamba-rocky/etc/profile.d/conda.sh
export OMP_NUM_THREADS=10
#split combined fasta into individual sequences
#loop
#in directory of fasta seqs
for F in *.fa; do
    N=$(basename $F .fa) ;
    partition-smp $F ../pfs/$N.pfs ;
    rm $F
done
module unload rnastructure

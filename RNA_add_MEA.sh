module add rnastructure
export OMP_NUM_THREADS=10
mkdir ./new
#loop
#in directory of fasta seqs
for F in *.pfs; do
    N=$(basename $F .pfs) ;
    MaxExpect  $F  ./new/$N.ct ;
done
module unload rnastructure

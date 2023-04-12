module add rnastructure
export OMP_NUM_THREADS=10
mkdir ./new
#loop
#in directory of fasta seqs
for F in *.pfs; do
    N=$(basename $F .ct) ;
    MaxExpect  $F  ./new/$N ;
done
module unload rnastructure

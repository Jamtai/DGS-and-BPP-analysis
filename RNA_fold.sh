module add rnastructure
mkdir fold
for F in *.fa
do
    C=$(basename $F.ct) ;
    Fold-smp $F /fold/$C -mfe  ;
done
module unload rnastructure

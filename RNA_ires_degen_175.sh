
#module

###Secretariat source /opt/ohpc/pub/Software/mamba-rocky/etc/profile.d/conda.s
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
    N=$(basename $F .fa) ;
    Fold-smp $F rnafold/$N.ct -mfe ;
    partition-smp $F pfs/$N.pfs ;
    MaxExpect  pfs/$N.pfs  new/$N.ct ;
done
module unload rnastructure

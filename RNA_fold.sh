module add rnastructure
mkdir fold
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
for F in *.fa
do
    C=$(basename $F.ct) ;
    Fold-smp $F /fold/$C -mfe  ;
done
rm *.fa
module unload rnastructure

Bin=`dirname $(readlink -f $0)`
for a in `ls *.seq`; do 
    perl $Bin/primer_probe.pl $a -tmpri $1 -tmpro $2 -lenpri $3 -lenpro $4 -lenmax $5 -lenmin $6 &
done


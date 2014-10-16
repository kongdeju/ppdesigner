Bin=`dirname $(readlink -f $0)`
for a in `ls *.out2`
do 
`perl $Bin/p1p2p_sort_uniq.pl $a`
done

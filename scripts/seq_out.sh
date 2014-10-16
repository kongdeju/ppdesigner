Bin=`dirname $(readlink -f $0)`
for a in `ls *.regions`
do
`perl $Bin/seq_out.pl $a`
done

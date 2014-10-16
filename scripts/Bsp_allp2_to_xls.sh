Bin=`dirname $(readlink -f $0)`
for a in `ls *.p2.bsp`
do
`perl Bsp_to_xls.pl $a`
done



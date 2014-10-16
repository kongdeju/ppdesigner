Bin=`dirname $(readlink -f $0)`
db=$1;
`formatdb -i $db -p F`
for a in `ls *.p1`;do
blastall -p blastn -d $db -i $a -o $a.bsp  -e 100 -W 7 -b 15  &
done
wait
for b in `ls *.p2`;do
blastall -p blastn -d $db -i $b -o $b.bsp  -e 100 -W 7 -b 15   &
done
wait
for c in `ls *.probe`;do
blastall -p blastn -d $db -i $c -o $c.bsp  -e 100 -W 7 -b 15 -S 1 &
done
wait


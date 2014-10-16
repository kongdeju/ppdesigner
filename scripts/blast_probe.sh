Bin=`dirname $(readlink -f $0)`
#!/bin/bash
db=$1
`formatdb -i $db -p F`
for a in `ls *.probe`
do
blastall -p blastn -d $db -i $a -o $a.bsp -e 100
done


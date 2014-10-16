Bin=`dirname $(readlink -f $0)`
#!/bin/bash
for a in `ls *.p12p.uniq`
do
awk '{print $0 ,"\t",sqrt($3*$3+$7*$7),"\t",$2+$6+$10}' $a>$a.rank1
sort -k11n -k13n -k14n $a.rank1 > $a.rank2
done

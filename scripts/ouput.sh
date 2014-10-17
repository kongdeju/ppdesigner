#!/bin/bash
Bin=`dirname $(readlink -f $0)`
a=$1
b=$2
e=$3
f=`expr $b - $a`
c=`expr $a + $f / 2 + $e`
g=`expr $f / 2`
d=`expr $c + $e`
for a in `ls *.rank2`
do
awk '{print $1,"\t",$5,"\t",$9,"\t",$11,"\t",substr($4,18,4)+substr($4,29,4),"\t",substr($8,18,4)+substr($8,29,4)+'"$c"',"\t",substr($12,18,4)+substr($12,29,4)+'"$g"',"\t",substr($8,18,4)-substr($4,18,4)+'"$d"'}' $a >$a.output
uniq $a.output >$a.final
done

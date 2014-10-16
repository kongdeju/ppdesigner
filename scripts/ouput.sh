Bin=`dirname $(readlink -f $0)`
#!/bin/bash
for a in `ls *.rank2`
do
awk '{print $1,"\t",$5,"\t",$9,"\t",$11,"\t",substr($4,18,4)+substr($4,29,4),"\t",substr($8,18,4)+substr($8,29,4)+90,"\t",substr($12,18,4)+substr($12,29,4)+90,"\t",substr($8,18,4)-substr($4,18,4)+90+28}' $a >$a.output
uniq $a.output >$a.final
done


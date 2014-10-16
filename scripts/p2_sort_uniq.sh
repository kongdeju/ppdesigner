Bin=`dirname $(readlink -f $0)`
#!/bin/bash
for a in `ls *.p2.out2`
do 
`perl p1p2p_sort_uniq.pl $a`
done

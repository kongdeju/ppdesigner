Bin=`dirname $(readlink -f $0)`
#!/bin/bash
for a in `ls *.p1 *.p2 *.probe`
do
perl $Bin/seq_out2.pl $a
done

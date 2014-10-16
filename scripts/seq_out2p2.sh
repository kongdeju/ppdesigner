Bin=`dirname $(readlink -f $0)`
#!/bin/bash
for a in `ls *.p2`
do
`perl seq_out2.pl $a`
done

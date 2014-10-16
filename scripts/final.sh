Bin=`dirname $(readlink -f $0)`
#!/bin/bash
for a in `ls *.final`
do
`perl $Bin/final.pl $a`
done

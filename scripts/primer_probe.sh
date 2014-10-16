Bin=`dirname $(readlink -f $0)`
for a in `ls *.seq` ;do 
perl $Bin/primer_probe.pl $a &
done


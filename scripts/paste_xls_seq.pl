#!/usr/bin/perl -w
my $n = `ls *.regions |grep -c regions`;
my $m = $n+1;
for (my $i=1;$i<$m;$i++){
	`paste seq_${i}.bsp.xls seq_${i}.seq >seq_${i}.out`;
}

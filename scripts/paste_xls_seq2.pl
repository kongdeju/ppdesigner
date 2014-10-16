#!/usr/bin/perl -w
my $n = `ls *.p2 |grep -c p2`;
my $m = $n+1;
for (my $i=1;$i<$m;$i++){
	`paste seq_${i}.p2.bsp.xls.sort.uniq seq_${i}.p2.seq >seq_${i}.p2.out2`;
}

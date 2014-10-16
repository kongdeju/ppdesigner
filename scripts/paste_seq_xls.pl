#!/usr/bin/perl -w
my $n = `ls *.p1 |grep -c p1`;
my $m = $n+1;
for (my $i=1;$i<$m;$i++){
	`paste seq_${i}.p1.seq2 seq_${i}.p1.bsp.xls>seq_${i}.p1.out2`;
	`paste seq_${i}.p2.seq2 seq_${i}.p2.bsp.xls>seq_${i}.p2.out2`;
	`paste seq_${i}.probe.seq2 seq_${i}.probe.bsp.xls>seq_${i}.probe.out2`;
	
}

#!/usr/bin/perl -w
my $n = `ls *.probe |grep -c probe`;
my $m = $n+1;
for (my $i=1;$i<$m;$i++){
	`paste seq_${i}.probe.seq2 seq_${i}.probe.bsp.xls>seq_${i}.probe.out2`;
}

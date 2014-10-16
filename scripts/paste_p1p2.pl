#!/usr/bin/perl -w
my $n = `ls *.p1 |grep -c p1`;
my $m = $n+1;
for (my $i=1;$i<$m;$i++){
	`paste seq_${i}.p1.out2.uniq seq_${i}.p2.out2.uniq seq_${i}.probe.out2.uniq >seq_${i}.p12p.uniq`;


}

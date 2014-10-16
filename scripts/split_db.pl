#!/usr/bin/perl -w 
my $input = shift;
my $seq_num = `grep -c '>' $input`;
for (my $i=1,$m=1;$i<$seq_num*2;$i=$i+2,$m++){
	 my $j = $i+1;
	`sed $i,${j}d $input > seq_$m.db`;
}

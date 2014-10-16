#!/usr/bin/perl -w
my @txt = glob "seq*txt";
my $n = @txt;
open OUT ,">head.txt";
for (my $i=1;$i<$n+1;$i++){
	open IN,"seq_$i.txt" or die $!;
	while(<IN>){
		print OUT ">seq_${i}_1\n";
		print OUT "$_";
		last;
	}
}

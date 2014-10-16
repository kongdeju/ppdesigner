#!/usr/bin/perl
use Getopt::Long; 
my $in = shift;#all.dnd
my $in2 = shift;#all.fas
open IN ,"$in";
my $usage ="\n\n\tperl $0 <your.dnd> <your.fasta> <-k num>\n\n\n";
unless (defined $in){
	print $usage;
	exit 0;
}
my $kong=10;
Getopt::Long::GetOptions('kong=i'	=> \$kong);
my $a;
while(my $a = <IN>){
	$a =~ s/[\(\)\n\,]//g;
	if ($a =~ m/^\w/){
	$a =~ s/:.*//;
	push @a, $a;}
}
my $n = @a;
my $num;
my $num_of_grp = int($n/$kong);
$num = $num_of_grp+1;
my @grp;
for (my $a =0;$a<$kong;$a++){
	for ($b=0;$b<$num;$b++){
		my $index = $a*$num+$b;
			$grp[$a][$b] = $a[$index];
	}
}
my @group;
for(my $i=0;$i<$num;$i++){
	for (my $a=0;$a<$kong;$a++){
		my $index = $i*$kong+$a;
	        	$group[$i][$a] = $grp[$a][$i];
	}
}
open INT, "$in2";
open OUT,">$in2.txt";
while(<INT>){
	if ($_ =~ />/){
		if ($. != 1){
			my $a = $_;
			$a =~ s/\n//;
			$a =~ s/\r//;
			$a =~ s/\s//;
			print OUT "\n$a\n"}
		if ($. == 1){
			my $a = $_;
			$a =~ s/\n//;
			$a =~ s/\r//;
			$a =~ s/\s//;
			print OUT "$a\n"}
	}
	if ($_ !~ />/){
		my $a=$_;
		$a =~ s/\n//;
		$a =~ s/\r//;
		$a =~ s/\s//;
		print OUT $a;
	}
}
close OUT;
open INO,"$in2.txt";
my @lines = <INO>;
my $q = @lines;
for(my $i=0;$i<$num;$i++){
	my $qq = $i +1;
	open OUT,">group$qq.txt";
	for (my $a=0;$a<$kong;$a++){
			for (my $m =0;$m<$q;$m++){
				my $y1=$lines[$m];
				my $y2=$lines[$m+1];
				my $t='>' . $group[$i][$a] . "\n";
				if ($y1 eq $t){
					print OUT $y1,$y2;
				}	
		}
	
	}
	close OUT;
}	

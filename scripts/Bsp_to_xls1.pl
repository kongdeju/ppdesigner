#!/usr/bin/perl -w 
my $input = shift;
use Bio::SearchIO;
open OUT ,">$input.xls";
my $bsp = Bio::SearchIO->new(-format=>'blast',-file=>"$input");
while( my $result = $bsp->next_result){
	my $length =0;
	my $query_name = $result->query_name;
	my $num = $result->num_hits;
	my @hit_name;
	while( my $hit= $result->next_hit){
		push @hit_name,$hit->name;
		while( my $hsp = $hit->next_hsp){
			my $hit_len= $hsp->hsp_length;
			$length = $length + $hit_len;
		}
	}
	if ($num != 0 ){
		print OUT "$length\t$num\t@hit_name\n";
	}
	else{
		print OUT "10000\t10000\t$query_name\n";
	}
}

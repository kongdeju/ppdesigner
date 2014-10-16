#!/usr/bin/perl -w
use Bio::SeqIO;
my $input1 = shift;
open IN ,"$input1";
my $input2 = shift;
open OUT1,">region.fna";
open OUT2,">probe.fna";
open OUT3, ">primer1.fna";
open OUT4, ">primer2.fna";
my @lie7;
my @lie10;
my @probe;
my @lines = <IN>;
my $n = @lines;
my @names;
my @seq1;
for(my $i =0;$i<$n;$i+=2){
	push @names,$lines[$i];
}
for (my $i=1;$i<$n;$i+=2){
	push @seq1,$lines[$i];
}
foreach (@seq1){
	chomp();
	my @lie=split(/\s+/,$_);
	push @lie7,$lie[7];
	push @lie10,$lie[10];
	push @probe,$lie[4];
	push @p1,$lie[0];
	push @p2,$lie[2];
}
my $seq_obj = Bio::SeqIO->new(-format => 'fasta', -file => "$input2");
while (my $seq=$seq_obj->next_seq){
	my $seq_seq = $seq->seq;
	push @seqs,$seq_seq;
}
my $nm=@names;
my $nn=@seqs;
for (my $i=0;$i<$nm;$i++){
	if($i<$nn){
		my $region = substr($seqs[$i],$lie7[$i],$lie10[$i]);
		print OUT1 "$names[$i]";
		print OUT1 "$region\n";
		print OUT2 "$names[$i]";
		print OUT2 "$probe[$i]\n";
		print OUT3 "$names[$i]";
		print OUT3 "$p1[$i]\n";
		print OUT4 "$names[$i]";
		print OUT4 "$p2[$i]\n";
	}
	else{
		$names[$i] =~ /(\d+)_/;
		$index = $1-1;
		my $region = substr($seqs[$index],$lie7[$i],$lie10[$i]);
                print OUT1 "$names[$i]";
                print OUT1 "$region\n";
                print OUT2 "$names[$i]";
                print OUT2 "$probe[$i]\n";
		prnnt OUT3 "$names[$i]";
                print OUT3 "$p1[$i]\n";
                print OUT4 "$names[$i]";
                print OUT4 "$p2[$i]\n";
	}
}	

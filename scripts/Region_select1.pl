#!/usr/bin/perl -w 
use Bio::SeqIO;
my $fasta = shift;
my @seqs;
my $region_length = shift;
my $in_seq_obj = Bio::SeqIO->new(-file => $fasta, -format => 'fasta');
while(my $seq = $in_seq_obj ->next_seq){
	push @seqs , $seq->seq;
}

my @lengths_of_seqs;
foreach my $seq (@seqs){
	my $length_of_seq = length($seq);
	push @lengths_of_seqs,$length_of_seq;
}
$i=0;
$m=1;
my @regions_of_seqs;
foreach my $seq (@seqs){
	open OUT , ">seq_$m.regions";
	for ( my $index=0;$index<$lengths_of_seqs[$i]-$region_length-1;$index++){
		print OUT '>seq',$i,'-region-',$index,"\n";
		print OUT substr($seq,$index,$region_length),"\n";
	}
	$i++;
	$m++;
	close OUT;
}
=cut
for (my $index=0;$index<($lengths_of_seqs[0]-199);$index++){
	push @seq1_regions,substr($seqs[0],$index,200);
}
for (my $index=0;$index<($seq2_length-199);$index++){
	push @seq2_regions,substr($seq1,$index,200);
}
$n =1;
foreach my $seq1_region (@seq1_regions){
	foreach my $seq2_region (@seq2_regions){
		open OUT ,">regions_file$n.fna";
		print OUT '>seq1_region',$n,"\n";
		print OUT "$seq1_region\n";
		print OUT '>$seq2_region',$n,"\n";
		print OUT "$seq2_region\n";
		$n++;
		close OUT;
	}
}	
for(my $i=1;$i<$n;$i++){
	system "clustalw -INFILE=regions_file$i.fna -PIM -OUTFILE=regions_file$i.aln  -STATS=region_file$i.stat";
}	

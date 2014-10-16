#!/usr/bin/perl -w
use Bio::SeqIO;
my $input = shift;
$input =~ /(.+)?\./;
open OUT,">$1.seq";
my $in_obj =Bio::SeqIO->new(-format => "fasta",-file => "$input");
while (my $seq = $in_obj->next_seq){
        $seq_seq = $seq->seq;
	print OUT $seq_seq,"\n";
}

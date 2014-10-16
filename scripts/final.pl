#!/usr/bin/perl
use Bio::SeqFeature::Primer;
my $input = shift;
open IN ,"$input";
$input =~/(.+?)\./;
open OUT ,">$1.txt";
while(<IN>){
	tr / //d;
	my @lie=split('\t+',$_);
	if ($lie[0] ne 'A' && $lie[1] ne 'A'){
		my $p1=Bio::SeqFeature::Primer->new(-seq => $lie[0]);
		my $p2=Bio::SeqFeature::Primer->new(-seq => $lie[1]);
		my $pro=Bio::SeqFeature::Primer->new(-seq => $lie[2]);
		my $p1_tm=int($p1->Tm);
		my $p2_tm=int($p2->Tm);
		my $pro_tm=int($pro->Tm);
		print OUT "$lie[0]\t$p1_tm\t$lie[1]\t$p2_tm\t$lie[2]\t$pro_tm\t$lie[3]\t$lie[4]\t$lie[5]\t$lie[6]\t$lie[7]";
	}
}
=cut
for a in `ls *.rank2`
do
awk '$11<10{print $1,"\t",$5,"\t",$9,"\t",$11,"\t",substr($8,18,4)-substr($4,18,4)+160}' $a >$a.output
uniq $a.output >$a.final
done


#!/usr/bin/perl -w
use Bio::SeqFeature::Primer;
#$input=head.txt $input2=group.txt
my $input = shift;
my @genes;
my $in2 = shift;
open IN2, "$in2";
while(<IN2>){
	if (/>(.+)[\n]/){
		my $a = $1;
		$a =~ s/\r//;
		$a =~ s/\s//;
		push @genes,$a;
	}
}
$in2 =~ m/(.+?)\./;
my $pre = $1;
open IN, "$input";
my $aaa = $pre . '_primer.xls';
my $bbb = $pre . '_probe.xls';
open OUT1 ,">$aaa";
open OUT2 ,">$bbb";
print OUT1 "gene\toritention\tprimers\tprimer_length\tpcr_region\tTm\n";
print OUT2 "gene\tprobes\tlocation\tTm\n";
my $i=0;
while(<IN>){
	chomp();
	if (${.}%2 == 0){
		my @rows = split(/\t/,$_);
		my $p1_len=length($rows[0]);
		my $p2_len=length($rows[2]);
		my $primer1 = Bio::SeqFeature::Primer->new( -seq => "$rows[0]" );
		my $primer2 = Bio::SeqFeature::Primer->new( -seq => "$rows[2]" );
		my $probe	= Bio::SeqFeature::Primer->new( -seq => "$rows[4]" );
        my $Tm1 = int($primer1->Tm);
		my $Tm2 = int($primer2->Tm);
		my $Tm3 = int($probe->Tm);
		print OUT1 "$genes[$i]\tF\t$rows[0]\t$p1_len\t$rows[10]\t$Tm1\n";
		print  OUT1 "$genes[$i]\tR\t$rows[2]\t$p2_len\t$rows[10]\t$Tm2\n";
		print  OUT2 "$genes[$i]\t$rows[4]\t$rows[9]\t$Tm3\n";
		$i++;
	}	
}

#!/usr/bin/perl -w
use Bio::SeqFeature::Primer;
my $input = shift;
$input =~ /(.+)?\./;
my $prex = $1;
open P1,">$prex.p1";
open P2,">$prex.p2";
open PO,">$prex.probe";
open IN,"$input";
my @seq;
my $P_Tm=54;
my $probe_Tm=54;
my $primer_length=21;
my $probe_length=19;
my $up_down =10;

while(<IN>){
	chomp();
	push @seq, $_;
}
my $c=0;
foreach my $seq (@seq){
	my @P1;
	my @P2;
	my @probe;
	my $m = 30-$primer_length;
	my $n = 90-$probe_length;
	for (my $i=0;$i<$m;$i++){
		push @P1,substr($seq,$i,$primer_length);
		push @P2,substr($seq,$i+90,$primer_length);
	}
	my $t=0;
	foreach my $P1 (@P1){
		my $GC=$P1=~tr/GCgc/GCgc/;
		my $AT=$P1=~tr/ATat/ATat/;
		my $polyA=$P1=~/AAAAAAA/;
		my $polyC=$P1=~/CCCCCCC/;
		my $polyG=$P1=~/GGGGGGG/;
		my $polyT=$P1=~/TTTTTTT/;
		my $primer = Bio::SeqFeature::Primer->new( -seq => "$P1" );
		my $Tm = $primer->Tm;
		if ( $Tm >= $P_Tm-$up_down && $Tm <= $P_Tm+$up_down && !$polyA && !$polyT && !$polyC && !$polyG){

			
			printf P1  ">Primer1-innergion%04d-Region%04d\n",$t,$c;
			printf P1 "$P1\n";
		}
		else{
			printf P1 ">Primer1-innergion%04d-Region%04d\n",$t,$c;
   
   
			print P1 "A\n";

		}
		$t++;
	}
	
	my $x=0;
	foreach my $P2 (@P2){
		my $P2_rev_com = reverse $P2;
		$P2_rev_com =~ tr /ACGTacgt/TGCAtgca/;
		my $GC=$P2_rev_com=~tr/GCgc/GCgc/;
		my $AT=$P2_rev_com=~tr/ATat/ATat/;
		my $polyA=$P2_rev_com=~/AAAAAAA/;
		my $polyT=$P2_rev_com=~/TTTTTTT/;
		my $polyC=$P2_rev_com=~/CCCCCCC/;
		my $polyG=$P2_rev_com=~/GGGGGGG/;
		my $primer2 = Bio::SeqFeature::Primer->new( -seq => "$P2_rev_com" );
		my $Tm = $primer2->Tm;
		if ($Tm >= $P_Tm-$up_down && $Tm <= $P_Tm+$up_down && !$polyA && !$polyT && !$polyC && !$polyG){
			printf P2  ">Primer2-innergion%04d-Region%04d\n",$x,$c;
			printf  P2 "$P2_rev_com\n";
		}
   
		else{
                        printf P2 ">Primer2-innergion%04d-Region%04d\n",$x,$c;
                        print P2 "A\n";

                }   
	$x++;
	} 
	for (my $j=0;$j<$n-30;$j++){
		push @probe,substr($seq,$j+30,$probe_length);
	}
	my $y=0;
	foreach my $probe (@probe){
		my $GC=$probe=~tr/GCgc/GCgc/;
		my $AT=$probe=~tr/ATat/ATat/;
		my $polyA=$probe=~/AAAAAA/;
        my $polyC=$probe=~/CCCCCC/;
		my $polyG=$probe=~/GGGGGG/;
        my $polyT=$probe=~/TTTTTT/;
                my $primer = Bio::SeqFeature::Primer->new( -seq => "$probe" );
		my $Tm = $primer->Tm;
		if ( $Tm >= $P_Tm-$up_down && $Tm <= $P_Tm+$up_down && !$polyA && !$polyT && !$polyC && !$polyG){
			printf PO  ">Probe12-innergion%04d-Region%04d\n",$y,$c;
			printf  PO "$probe\n";
		}
		else{
                        printf PO ">probe12-innergion%04d-Region%04d\n",$y,$c;
                        print PO "A\n";

                }   

		$y++;

	}

	$c++;}

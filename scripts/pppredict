#!/usr/bin/perl -w
use FindBin qw($Bin);
my $input = shift;
system "perl $Bin/head.pl";
system "perl $Bin/region.pl head.txt $input";
system "sh $Bin/all_vs_all.sh";

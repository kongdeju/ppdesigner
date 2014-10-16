#!/usr/bin/perl -w
my $input = shift;
my $db = shift;
   $input =~ /(.+)?\./;
my $out = "$1.bsp";
`formatdb -i $db -p F`;
`blastall -p blastn -i $input -d $db -o "$1.bsp" -e 100  -a 5`;

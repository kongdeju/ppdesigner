#!/usr/bin/perl -w
my $input = shift;
`sort -k4.29 -k3n -k2n $input > $input.sort`;
`uniq -f 3 -s 30 $input.sort>$input.uniq`;


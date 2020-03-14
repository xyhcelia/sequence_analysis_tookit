#!/usr/bin/perl
use strict;

open IN,$ARGV[0] or die "perl blast_1st_hits.pl blast.result output <--header|optional>\napplied for blast result format 7\n";
open OUT,">$ARGV[1]";

if(@ARGV==3){print OUT "query\tsubject\tidentity\taln_length\tmismatch\tgap\tq.start\tq.end\ts.start\ts.end\te-value\tbit_score\n";}

my %hash;
while(<IN>){
    chomp;
    my @array=split;
    $hash{$.}=$array[0];
    if($hash{$.-1}=~/#/ && $array[0]!~/#/){print OUT $_,"\n";}else{}
}
close IN;
close OUT;

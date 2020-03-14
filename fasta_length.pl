#!/usr/bin/perl
use strict;

open IN,$ARGV[0];

$/=">";
my $len;

<IN>;
while(<IN>){
   chomp;
   my @array=split;
   $len=0;
   my $n=@array;
   foreach my $i(1..$n-1){
    $len+=length($array[$i]);
   }
   print  "$array[0]\t$len\n";
}
close IN;

#!/usr/bin/perl
use strict;

my $ref = $ARGV[0];
my $block = $ARGV[1];
my $outname = $ARGV[2];

# ref is the usual fasta file , e.g. reference fasta or assembly contig fasta
# ref must be samtools faidx in ahead

# block is self-constructed txt file "\t" split
#tig00000423_pilon	628884	629560	-	JB938_wtf2
#tig00000420_pilon	404212	405808	+	JB938_wtf8
#tig00000062_pilon	136577	137899	-	JB938_wtf17

open(OUT,">$outname") || die;

open(IN,"<$block") || die;
while (<IN>){
	chomp;
	chop if(/\r$/);
	my @line = split(/\t/);
	
	my $tmpstr = $line[0].":".$line[1]."-".$line[2];
	
	my $seq;
	
	if ($line[3] eq "+"){
		$seq = `samtools faidx $ref $tmpstr | grep -v ">" | tr -d "\n" | tr "atgcn" "ATGCN"` ;
		
	}else{
		$seq = `samtools faidx $ref $tmpstr | grep -v ">" | tr -d "\n" | tr "[ATGCatgcNn]" "[TACGTACGNN]" | rev | tr -d "\n"`;
	}
	
	print OUT ">$line[4]\n$seq\n";
}

close IN;
close OUT;

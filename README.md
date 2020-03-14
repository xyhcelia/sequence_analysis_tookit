## 1. 03_extract_fasta_from_ref.pl
Created by Suo Fang;
```
Usage:perl 03_extract_fasta_from_ref.pl input.fasta input.txt output.fa
input.txt provide the extraction information,from which sequence and where to where to be extracted.
Format example:
I       1798347 1799015 +       target_seq1
I       1799128 1799817 +       target_seq2
I       1800212 1802983 -       target_seq3
I       1803773 1804372 -       target_seq4
```

## 2. blast_1st_hits.pl
```
perl blast_1st_hits.pl blast.result output <--header|optional>
applied for blast result format 7
```

## 3. fasta_length.pl
```
perl fasta_length.pl input.fa >output.length.txt
```

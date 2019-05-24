#!/usr/bin/perl
###  USAGE: perl sffct.pl $sfno 

my $source_file = shift @ARGV;
my $sfno = shift @ARGV;
my $source;
my $sffct = "FCT-SF.txt";

open IF, $source_file or die "Can't open $source_file for reading:$!\n";
while(<IF>) {
   my @temp = split(/\s+/,$_);  
   if($temp[0] < $sfno) {
      $source .= $_;
   }
}  
close IF;
 
open OF, ">$sffct" or die "Can't open $sffct for writing:$!\n";
print OF "$source";
close OF;


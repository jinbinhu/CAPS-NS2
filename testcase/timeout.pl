#!/usr/bin/perl
###  creator:hujinbin
###  created data:20170124

my $source_file = shift @ARGV;
my $sfno = shift @ARGV;
my $timeoutnum=0;
my $to_file = "timeout.txt";

open IF, $source_file or die "Can't open $source_file for reading:$!\n";
while(<IF>) {
   my @temp = split(/\s+/,$_);  
   if(($temp[3] > 0.2) || ($temp[3] == 0.2)) {   
      $timeoutnum++;
  }
}  
close IF;

print "TimeoutNum = $timeoutnum\n";
 
open OF, ">>$to_file" or die "Can't open $to_file for writing:$!\n";
print OF "$sfno  $timeoutnum\n";
close OF;


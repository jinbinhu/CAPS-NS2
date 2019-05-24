#!/usr/bin/perl
###  creator:hujinbin
###  created data:20170124
###  AFCT 

my $source_file = shift @ARGV;
my $sfno = shift @ARGV;
my $source;
my $FCTsum = 0;
my $flownum = 0;
my $AFCT;
my $AFCT_file = "AFCT.txt";

open IF, $source_file or die "Can't open $source_file for reading:$!\n";
while(<IF>) {
   my @temp = split(/\s+/,$_);  
   $FCTsum += $temp[3];
   $flownum ++;
  }  
close IF;
 
$AFCT = $FCTsum/$flownum;

print "AFCT = $AFCT\n";

open OF, ">>$AFCT_file" or die "Can't open $AFCT_file for writing:$!\n";
print OF "$sfno $AFCT\n";
close OF;







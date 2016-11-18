use warnings;
use strict;
use integer;

open(DATA, "<8");

#my $hash = ();
my $length1 = 0;
my $length2 = 0;

while(<DATA>) {
    my $variable;
    my $line = $_;
#    print $line;
    my $length = length($line)-1;
    $length1 += $length;

#    $line =~ s/\\x[0-9a-f]{2}/\\\\xab/g;
    $line =~ s/\\/\\\\/g;
    $line =~ s/\"/\\"/g;
    $line =~ s/^(\S*)$/\"$1\"/sg;
#    print $line;

    my $second_length = length($line) - 1;
    print "$second_length\n";
    $length2 += $second_length;

}

close DATA;

my $lala = $length2 - $length1;
print "$length1\n";
print "$lala\n";


#use Data::Dumper;
#print Dumper $hash;

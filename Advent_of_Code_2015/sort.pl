use warnings;
use strict;
use List::Permutor;


open(DATA, "<94");

my $hash = ();

my @towns = qw/AlphaCentauri
    Arbre
    Faerun
    Norrath
    Snowdin
    Tambi
    Tristram
    Straylight/;


#print "@towns";

while(<DATA>) {
    my $variable;
    my $line = $_;
    my ($town1, $town2, $distance) = $line =~ /^(\S+) to (\S+) = (\d+)/;
#    print $town1 . " " . $town2 . " " . $distance . "\n";
    $hash->{$town1}->{$town2} = $distance + 0;
    $hash->{$town2}->{$town1} = $distance + 0;
}

close DATA;

my $max_length = 0;
my $permutor = List::Permutor->new(@towns);
#my $permutor = List::Permutor->new('Tambi', 'Tristram', 'Snowdin');
while ( my @permutation = $permutor->next() ) {
    print "@permutation\n";
    my $length = 0;
    for (my $i = 0; $i < 7; $i++) {
        $length += $hash->{$permutation[$i]}->{$permutation[$i+1]};
    }
    print "$length\n";
    if ($max_length < $length) {
        $max_length = $length;
    }
}

print "$max_length\n";

#use Data::Dumper;
#print Dumper $hash;

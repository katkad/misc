use warnings;
use strict;
use List::Permutor;


open(DATA, "<13");

my $hash = ();

my @towns = qw/Alice
    Bob
    Carol
    David
    Eric
    Frank
    George
    Me
    Mallory/;


#print "@towns";

while(<DATA>) {
    my $line = $_;
    my ($town1, $condition, $distance, $town2) = $line =~ /^(\S+) would (\S+) (\d+) .* (\S+).$/;
    print $town1 . " " . $town2 . " " . $distance . " " . $condition . "\n";
    if ($condition eq "gain") {
        $hash->{$town1}->{$town2} += $distance + 0;
        $hash->{$town2}->{$town1} += $distance + 0;
    }
    elsif ($condition =~ /lose/) {
        $hash->{$town1}->{$town2} -= $distance + 0;
        $hash->{$town2}->{$town1} -= $distance + 0;
    }
}

close DATA;


my $max_length = 0;
my $permutor = List::Permutor->new(@towns);
#my $permutor = List::Permutor->new('Tambi', 'Tristram', 'Snowdin');
while ( my @permutation = $permutor->next() ) {
    print "@permutation\n";
    my $length = 0;
    for (my $i = 0; $i < 8; $i++) {
        $length += $hash->{$permutation[$i]}->{$permutation[$i+1]};
    }
    $length += $hash->{$permutation[8]}->{$permutation[0]};
    print "$length\n";
    if ($max_length < $length) {
        $max_length = $length;
    }
}

print "$max_length\n";


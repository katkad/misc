use warnings;
use strict;


open(DATA, "<14");

my $hash = ();
my $seconds = 2503;

while(<DATA>) {
    my $line = $_;
    my ($reindeer, $velocity, $time, $rest) = $line =~ /^(\S+) can fly (\d+) km\/s for (\d+) seconds, but then must rest for (\d+)/;
#    print $reindeer . " " . $velocity . " " . $time . " " . $rest . "\n";

    $hash->{$reindeer}->{'distance'} = 0;
    $hash->{$reindeer}->{'points'} = 0;
    $hash->{$reindeer}->{'sum'} = $time + $rest;
    $hash->{$reindeer}->{'time'} = $time;
    $hash->{$reindeer}->{'velocity'} = $velocity;
}
close DATA;

use Data::Dumper;
for (my $j = 1; $j <= $seconds; $j++) {
    print "$j\n";

    for (keys $hash) {
        my $leftover = $j % $hash->{$_}->{'sum'};
#        print "$leftover\n";
#        print $hash->{$_}->{'time'} . "\n";

        if ($leftover != 0 && $hash->{$_}->{'time'} >= $leftover) {
            $hash->{$_}->{'distance'} += $hash->{$_}->{'velocity'};
        }
    }

    my $max = 0;
    for (keys $hash) {
        if ($hash->{$_}->{'distance'} > $max) {
            $max = $hash->{$_}->{'distance'};
        }
    }

    for (keys $hash) {
        if ($hash->{$_}->{'distance'} == $max) {
            print $_ . "\n";
            $hash->{$_}->{'points'}++;
        }
    }
#print Dumper $hash;

}

my $reindeer = '';
my $max = 0;
for (keys $hash) {
    if ($hash->{$_}->{'points'} > $max) {
        $max = $hash->{$_}->{'points'};
        $reindeer = $_;
    }
}

print "$max\n";
print "$reindeer\n";



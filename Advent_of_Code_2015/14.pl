use warnings;
use strict;


open(DATA, "<14");

my $hash = ();
my $seconds = 84;

while(<DATA>) {
    my $line = $_;
    my ($reindeer, $velocity, $time, $rest) = $line =~ /^(\S+) can fly (\d+) km\/s for (\d+) seconds, but then must rest for (\d+)/;
    print $reindeer . " " . $velocity . " " . $time . " " . $rest . "\n";

    $hash->{$reindeer} = 0;

    my $cycles = int($seconds / ($time+$rest));
#    print "$cycles\n";

    my $leftover = $seconds % ($time+$rest);
    print "$leftover\n";

    $hash->{$reindeer} = $cycles * $velocity * $time;

    for(my $i=1; $i <= $time && $i <= $leftover; $i++) {
        $hash->{$reindeer} += $velocity;
    }
    print "$hash->{$reindeer}\n";
}

close DATA;

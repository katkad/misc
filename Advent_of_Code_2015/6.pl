use warnings;
use strict;

open(DATA, "<6");

my $hash = ();

while(<DATA>) {
    my ($charge, $x1, $y1, $x2, $y2) = $_ =~ /(turn on|turn off|toggle) (\d+),(\d+) through (\d+),(\d+)/;
    print "$charge $x1 $y1 $x2 $y2\n";

    if ($charge eq 'turn on') {
        for(my $i = $x1; $i<=$x2; $i++) {
            for(my $j = $y1; $j<=$y2; $j++) {
                $hash->{$i}->{$j} = 1;
            }
        }
    }
    if ($charge eq 'turn off') {
        for(my $i = $x1; $i<=$x2; $i++) {
            for(my $j = $y1; $j<=$y2; $j++) {
                $hash->{$i}->{$j} = '';
            }
        }
    }
    if ($charge eq 'toggle') {
        for(my $i = $x1; $i<=$x2; $i++) {
            for(my $j = $y1; $j<=$y2; $j++) {
                my $old = $hash->{$i}->{$j};
                $hash->{$i}->{$j} = !$old;
            }
        }
    }
}

close DATA;


my $i = 0;
for (keys $hash) {
    my $a = $_;
    for (keys $hash->{$a}) {
        if ($hash->{$a}->{$_} eq '1') {
            $i++;
        }
    }
}

print $i . "\n";

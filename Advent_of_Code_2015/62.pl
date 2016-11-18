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
                if (!$hash->{$i}->{$j}) {
                    $hash->{$i}->{$j} = 1;
                }
                else {
                    $hash->{$i}->{$j}++;
                }
            }
        }
    }
    if ($charge eq 'turn off') {
        for(my $i = $x1; $i<=$x2; $i++) {
            for(my $j = $y1; $j<=$y2; $j++) {
                if (!$hash->{$i}->{$j} || $hash->{$i}->{$j} == 1) {
                    $hash->{$i}->{$j} = 0;
                }
                else {
                    $hash->{$i}->{$j}--;
                }
            }
        }
    }
    if ($charge eq 'toggle') {
        for(my $i = $x1; $i<=$x2; $i++) {
            for(my $j = $y1; $j<=$y2; $j++) {
                if (!$hash->{$i}->{$j}) {
                    $hash->{$i}->{$j} = 2;
                }
                else {
                    $hash->{$i}->{$j}++;
                    $hash->{$i}->{$j}++;
                }
            }
        }
    }
}

close DATA;


my $i = 0;
for (keys $hash) {
    my $a = $_;
    for (keys $hash->{$a}) {
        $i += $hash->{$a}->{$_};
    }
}

print $i . "\n";

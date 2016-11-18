use warnings;
use strict;

open(DATA, "<2");

my $all_surface = 0;
while(<DATA>) {
    my ($l, $w, $h) = $_ =~ /(\d+)x(\d+)x(\d+)/;
    print "$l $w $h\n";

    my $min = $l+$w;
    if ($min > $w+$h) {
        $min = $w+$h;
    }
    if ($min > $h+$l) {
        $min = $h+$l;
    }

    my $surface = 0;
    $surface += 2*$min;
#    print  $l*$w*$h . "\n";

    $surface += $l*$w*$h;
#    print $surface . "\n";
    $all_surface += $surface;
}

print $all_surface . "\n";

close DATA;

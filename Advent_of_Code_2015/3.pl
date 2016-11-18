use warnings;
use strict;

open(DATA, "<3");

my $hash = ();
my $x1 = 0;
my $y1 = 0;
my $x2 = 0;
my $y2 = 0;
$hash->{$x1}->{$y1} = 1;

while(<DATA>) {
    my $string = $_;
    my $length = length($string);
    for (my $position = 0; $position <= $length; $position++) {
        my $char = substr($string, $position, 1);
        if ($position % 2 == 0) {
            if ($char eq '^') {
                $x1++;
            }
            if ($char eq 'v') {
                $x1--;
            }
            if ($char eq '>') {
                $y1++;
            }
            if ($char eq '<') {
                $y1--;
            }
            $hash->{$x1}->{$y1} = 1;
        }
        else {
            if ($char eq '^') {
                $x2++;
            }
            if ($char eq 'v') {
                $x2--;
            }
            if ($char eq '>') {
                $y2++;
            }
            if ($char eq '<') {
                $y2--;
            }
            $hash->{$x2}->{$y2} = 1;
        }
    }
}
#use Data::Dumper;
#print Dumper $hash;
my $i = 0;
for (keys $hash) {
    for (keys $hash->{$_}) {
#        print $_ . "\n";
        $i++;
    }
}

print $i . "\n";
close DATA;

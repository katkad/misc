use strict;
use warnings;

my $a = 28;
my $b = 35;
my $c = 18;
my $d = 19;

if ($a + $b + $c + $d != 100) {
    print "AAAAA\n";
    exit;
}

my $x = 5 * $a - $b - $d;
my $y = -$a + 3*$b - $c;
my $z = 4*$c;
my $v = 2*$d;


#print "$x $y $z $v\n";

my $sum = $x * $y * $z * $v;

print "$sum\n";

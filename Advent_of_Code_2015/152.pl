use strict;
use warnings;

my $a = 0;
my $b = 0;
my $c = 0;
my $d = 0;

my $max_sum = 0;

for ($a = 1; $a <= 97; $a++) {
    for ($b = 1; $b <= 97; $b++) {
        for ($c = 1; $c <= 97; $c++) {
            for ($d = 1; $d <= 97; $d++) {

                if ($a + $b + $c + $d != 100) {
                    next;
                }

                if (5*$a + $b + 6*$c + 8*$d != 500) {
                    next;
                }

                print "$a $b $c $d\n";

                my $x = 5 * $a - $b - $d;
                my $y = -$a + 3*$b - $c;
                my $z = 4*$c;
                my $v = 2*$d;

                my $sum = $x * $y * $z * $v;
                print "$sum\n";

                if ($max_sum < $sum) {
                    $max_sum = $sum;
                }
            }
        }
    }
}

print "$max_sum\n";

use warnings;
use strict;
use Algorithm::Combinatorics qw(combinations);


my $hash = ();

my $towns = [qw/3
    4
    4
    6
    9
    10
    17
    17
    21
    27
    31
    34
    36
    38
    41
    43
    44
    44
    46
    47/];

my $iter = combinations($towns, 4);
use Data::Dumper;
while (my $c = $iter->next) {
    my $sum = 0;
    map { $sum += $_ + 0 } @$c;
    
    if ($sum == 150) {
        print "@$c\n";
#    print "$sum\n";
    }
}

# 1655 je too high
# 737 je too low

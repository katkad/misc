use warnings;
use strict;

open(DATA, "<1");

my $position = 0;
my $story = 0;
my $n;
my $data;
while(($n = read, <DATA>, $data, 4) != 0) {
    print "$data";
    if ($data == '(') {
        $story++;
    }
    elsif ($data == ')') {
        $story--;
    }
}
print "$story" . "\n";

close DATA;

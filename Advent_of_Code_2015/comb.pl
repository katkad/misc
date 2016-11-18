#!/usr/bin/env perl

use strict;
use warnings;
use Algorithm::Combinatorics qw(combinations);

my $strings = [qw(AAA BBB CCC DDD EEE)];

my $iter = combinations($strings, 4);

while (my $c = $iter->next) {
    print "@$c\n";
}

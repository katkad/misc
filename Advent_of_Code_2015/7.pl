use warnings;
use strict;
use integer;

open(DATA, "<74");

my $hash = ();

while(<DATA>) {
    my $variable;
    print $_;
    if ($_ =~ /^(\d+) -> (\S+)/) {
        (my $value, $variable) = $_ =~ /^(\d+) -> (\S+)/;
        print $value . " " . $variable . "\n";
        $hash->{$variable} = $value + 0;
    }
    elsif ($_ =~ /^(\S+) -> (\S+)/) {
        (my $value, $variable) = $_ =~ /^(\S+) -> (\S+)/;
        print $value . " " . $variable . "\n";
        $hash->{$variable} = $hash->{$value};
    }
    elsif ($_ =~ /^NOT (\S+) -> (\S+)/) {
        (my $value, $variable) = $_ =~ /^NOT (\S+) -> (\S+)/;
        print "NOT " . $value . " " . $variable . "\n";
        $hash->{$variable} = ~$hash->{$value};
    }
    elsif ($_ =~ /^(\S+) (\S+) (\S+) -> (\S+)/) {
        (my $left, my $operation, my $right, $variable) = $_ =~ /^(\S+) (\S+) (\S+) -> (\S+)/;
        print $left . " " . $operation . " " . $right . " " . $variable . "\n";

        my $leftist;
        if ($left =~ /^\d/) {
            $leftist = $left;
        }
        else {
            $leftist = $hash->{$left};
        }

        my $rightist;
        if ($right =~ /^\d/) {
            $rightist = $right;
        }
        else {
            $rightist = $hash->{$right};
        }

        print $leftist . " " .  $rightist . "\n";

        if ($operation eq 'AND') {
            $hash->{$variable} = $leftist & $rightist;
        }
        elsif ($operation eq 'OR') {
            $hash->{$variable} = $leftist | $rightist;
        }
        elsif ($operation eq 'LSHIFT') {
            $hash->{$variable} = $leftist << $rightist;
        }
        elsif ($operation eq 'RSHIFT') {
            $hash->{$variable} = $leftist >> $rightist;
        }
    }
    if ($hash->{$variable} < 0) {
        $hash->{$variable} = 65536 + $hash->{$variable};
    }
}

close DATA;


#use Data::Dumper;
#print Dumper $hash;

print $hash->{'lx'};

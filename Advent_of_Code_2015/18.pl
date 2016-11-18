use warnings;
use strict;

open(DATA, "<18");
my $hash = ();

my $lines = -1;
my $length = 0;

while(<DATA>) {
#    print $_;
    $lines++;
    my $string = $_;
    chomp($string);
    $length = length($string);
    
    for (my $position = 0; $position < $length; $position++) {
        my $char = substr($string, $position, 1);
#        print $char;
        if ($char eq '#') {
            $hash->{$lines}->{$position} = 1;
        }
    }
}

close DATA;


# 2380 je too high
for (my $i=0; $i<100; $i++) {
    my $new_hash = ();

    for (my $new_line = 0; $new_line <= $lines; $new_line++) {
        for (my $position = 0; $position < $length; $position++) {
            my $sum = ($hash->{$new_line-1}->{$position-1} // 0) +
                 ($hash->{$new_line-1}->{$position} // 0) +
                 ($hash->{$new_line-1}->{$position+1} // 0) +
                 ($hash->{$new_line}->{$position-1} // 0)  +
                 ($hash->{$new_line}->{$position+1} // 0)  +
                 ($hash->{$new_line+1}->{$position-1} // 0)  +
                 ($hash->{$new_line+1}->{$position} // 0)  +
                 ($hash->{$new_line+1}->{$position+1} // 0) ;

#            if($new_line == 1) {
#                print "$sum\n";
#            }

            if ($hash->{$new_line}->{$position}) {
                if ($sum == 2 || $sum == 3) {
                    $new_hash->{$new_line}->{$position} = 1;
                }
                else {
                    $new_hash->{$new_line}->{$position} = 0;
                }
            }
            else {
                if ($sum == 3) {
                    $new_hash->{$new_line}->{$position} = 1;
                }
                else {
                    $new_hash->{$new_line}->{$position} = 0;
                }
            }
        }
    }
    
    $new_hash->{0}->{0} = 1;
    $new_hash->{0}->{99} = 1;
    $new_hash->{99}->{0} = 1;
    $new_hash->{99}->{99} = 1;

    $hash = $new_hash;
}

#use Data::Dumper;
#print Dumper $hash;

my $sum = 0;

for (my $new_line = 0; $new_line <= $lines; $new_line++) {
    for (my $position = 0; $position < $length; $position++) {
        $sum += ($hash->{$new_line}->{$position} // 0);
    }
}

print "$sum\n";

=pod
for (my $i = 0; $i < 50; $i++) {
    my $next_string = '';

    my $length = length($last_string);
    for (my $position = 0; $position < $length; $position++) {
        my $char = substr($last_string, $position, 1);

        my $next_char = substr($last_string, $position+1, 1);

        $occurence += 1;

        if ($char ne $next_char) {
            $next_string .= $occurence;
            $next_string .= $char;
            $occurence = 0;
        }
    }
#    print "$next_string\n";
    $last_string = $next_string;
}

my $length = length($last_string);
print "$length\n";
=cut

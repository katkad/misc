use warnings;
use strict;

open(DATA, "<5");

while(<DATA>) {
    my $string = $_;

    if ($string =~ /[aeiou].*[aeiou].*[aeiou]/) {
        if ($string =~ /^.*(.)\1.*$/) {
            if ($string !~ /(ab|cd|pq|xy)/) {
                print $string;
            }
=pod
            my $length = length($string);
            my $do_print = '1';
            for (my $i = 0; $i<$length-2; $i++) {
                my $char = substr($string, $i, 1);
                my $nextchar = substr($string, $i+1, 1);

                if (ord($nextchar) - ord($char) == 1) {
#                    print $char . $nextchar . "\n";
                    $do_print = '';
                }
            }
            if ($do_print) {
                print $string;
            }
=cut
        }
    }
}


close DATA;

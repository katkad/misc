use warnings;
use strict;

my $last_string = '1113222113';


my $occurence = 0;
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

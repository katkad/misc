use warnings;
use strict;

my $string = 'hepxxyzz';

my $length = length($string);


#    print $string . "\n";
while (1) {
    my $newstring = $string;

    my $char = substr($string, 7, 1);
    my $new_char = chr(ord($char)+1);

    if ($char eq 'z') {
        $new_char = 'a';
    }

    $newstring =~ s/^(\S{7})\S$/$1$new_char/;

    if ($new_char eq 'a') {
        $char = substr($string, 6, 1);
        $new_char = chr(ord($char)+1);

        if ($char eq 'z') {
            $new_char = 'a';
        }

        $newstring =~ s/^(\S{6})\S(\S)$/$1$new_char$2/;

        if ($new_char eq 'a') {
            $char = substr($string, 5, 1);
            $new_char = chr(ord($char)+1);

            if ($char eq 'z') {
                $new_char = 'a';
            }

            $newstring =~ s/^(\S{5})\S(\S{2})$/$1$new_char$2/;

            if ($new_char eq 'a') {
                $char = substr($string, 4, 1);
                $new_char = chr(ord($char)+1);

                if ($char eq 'z') {
                    $new_char = 'a';
                }

                $newstring =~ s/^(\S{4})\S(\S{3})$/$1$new_char$2/;

                if ($new_char eq 'a') {
                    $char = substr($string, 3, 1);
                    $new_char = chr(ord($char)+1);

                    if ($char eq 'z') {
                        $new_char = 'a';
                    }

                    $newstring =~ s/^(\S{3})\S(\S{4})$/$1$new_char$2/;

                    if ($new_char eq 'a') {
                        $char = substr($string, 2, 1);
                        $new_char = chr(ord($char)+1);

                        if ($char eq 'z') {
                            $new_char = 'a';
                        }

                        $newstring =~ s/^(\S{2})\S(\S{5})$/$1$new_char$2/;

                        if ($new_char eq 'a') {
                            $char = substr($string, 1, 1);
                            $new_char = chr(ord($char)+1);

                            if ($char eq 'z') {
                                $new_char = 'a';
                            }

                            $newstring =~ s/^(\S{1})\S(\S{6})$/$1$new_char$2/;

                            if ($new_char eq 'a') {
                                $char = substr($string, 0, 1);
                                $new_char = chr(ord($char)+1);

                                if ($char eq 'z') {
                                    $new_char = 'a';
                                }

                                $newstring =~ s/^\S(\S{7})$/$new_char$1/;
                            }
                        }
                    }
                }
            }
        }
    }

    my $check = 0;
    for (my $i = 0; $i < $length-2; $i++) {
        my $char1 =  ord(substr($newstring, $i, 1));
        my $char2 =  ord(substr($newstring, $i+1, 1));
        my $char3 =  ord(substr($newstring, $i+2, 1));

        if ($char1+1 eq $char2 && $char2+1 eq $char3) {
            $check = 1;
        }
    }

    print $newstring . "\n";

    if ($newstring !~ /[iol]/ && $newstring =~ /(.)\1.*(.)\2/ && $check) {
        last;
    }
    $string = $newstring;
}

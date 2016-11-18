use warnings;
use strict;
use Digest::MD5 qw(md5_hex);

my $string = 'bgvyzdsv';

for (my $i = 1000000; $i<10000000; $i++) {
    my $twostring = $string . $i;

    my $md5 = md5_hex($twostring);
    if ($md5 =~ /^000000.*$/) {
        print $md5 . "\n";
        print $i . "\n";
        exit;
    }
}

use warnings;
use strict;
use JSON;
use utf8;

# 0 to nie je


open(DATA, "<lala3");
my $sum = 0;

while (<DATA>) {
    my $line = $_;
=pod
    my  $json = JSON->new->allow_nonref;
    my $perl_scalar = $json->decode( $line );
    use Data::Dumper;
    print Dumper $perl_scalar;
    $line =~ s/[{}:"a-z\[\]]//sg;
    $line =~ s/,/\r\n/sg;

    print $line . "\n";
=cut

    if ($line =~ /\d+/) {
        $sum += $line +0;
    }
}

print "$sum\n";

close DATA;

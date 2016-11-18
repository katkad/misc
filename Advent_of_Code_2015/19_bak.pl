use warnings;
use strict;
use JSON;
use utf8;

# 0 to nie je

my $string = 'CRnCaSiRnBSiRnFArTiBPTiTiBFArPBCaSiThSiRnTiBPBPMgArCaSiRnTiMgArCaSiThCaSiRnFArRnSiRnFArTiTiBFArCaCaSiRnSiThCaCaSiRnMgArFYSiRnFYCaFArSiThCaSiThPBPTiMgArCaPRnSiAlArPBCaCaSiRnFYSiThCaRnFArArCaCaSiRnPBSiRnFArMgYCaCaCaCaSiThCaCaSiAlArCaCaSiRnPBSiAlArBCaCaCaCaSiThCaPBSiThPBPBCaSiRnFYFArSiThCaSiRnFArBCaCaSiRnFYFArSiThCaPBSiThCaSiRnPMgArRnFArPTiBCaPRnFArCaCaCaCaSiRnCaCaSiRnFYFArFArBCaSiThFArThSiThSiRnTiRnPMgArFArCaSiThCaPBCaSiRnBFArCaCaPRnCaCaPMgArSiRnFYFArCaSiThRnPBPMgAr';

my @arr1 = ();
my @arr2 = ();

open(DATA, "<19");

while (<DATA>) {
    my $line = $_;

    my ($one, $two) = $line =~ /(\S+) => (\S+)/;
    print "$one $two\n";

    push @arr1, $one;
    push @arr2, $two;
}

print "@arr1\n";

close DATA;

print $string . "\n";

my %hash = ();

my $length = scalar(@arr1);
print $length . "\n";

for (my $i = 0; $i < $length; $i++) {
    my $char = $arr1[$i];
    my $subst = $arr2[$i];
    my $offset = 0;

    my $result = index($string, $char, $offset);

    while ($result != -1) {

        print "Found $char at $result\n";

        my $new = substr($string, 0, $result);
        $new .= $subst;

        $new .= substr($string, $result + length($char));

        $hash{$new} = 1;

        $offset = $result + 1;
        $result = index($string, $char, $offset);

    }
}

my $size =  keys %hash;
print $size . "\n";

exit;


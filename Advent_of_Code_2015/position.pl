  #!/usr/bin/perl
  use strict;
  use warnings;

  my $string = 'perlmeme.org';
  my $char = 'e';
  my $offset = 0;

  my $result = index($string, $char, $offset);

  while ($result != -1) {

    print "Found $char at $result\n";

    $offset = $result + 1;
    $result = index($string, $char, $offset);

  }

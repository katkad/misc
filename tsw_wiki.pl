#!/usr/bin/perl

use Modern::Perl;
no warnings;
use LWP::UserAgent;
use HTTP::Request;
use HTML::TreeBuilder;
use HTML::Element;

my $ua = LWP::UserAgent->new;
$ua->agent("Mozilla/8.0"); # pretend we are very capable browser

my $url = 'http://wiki.crygaia.com/view/Kingsmouth_missions';
my $req = HTTP::Request->new(GET => $url);
$req->header('Accept' => 'text/html');

my $res = $ua->request($req);

if ($res->is_success) {
#   print $res->content;
} else {
   print "Error: " . $res->status_line . "\n";
}

my $root = HTML::TreeBuilder->new_from_content($res->content);

my $table = $root->find_by_attribute('class', 'wikitable sortable');

my @trs = $table->find('tr');

shift @trs;

my $base = 'http://wiki.crygaia.com';

foreach (@trs) {
#  print "\n\n".$_->as_trimmed_text() ."\n";
  my @tds = $_->find('td');

  my $type = $tds[0]->attr('data-sort-value');
  my $mission = $tds[1]->as_trimmed_text();

  my $source_anchor = $tds[2]->find('a');
  my $source = ($source_anchor) ?
    '[['. $source_anchor->as_trimmed_text() .']]' : $tds[2]->as_trimmed_text();

  my $mission_a = $tds[1]->find('a');
  my $mission_page = $base . $mission_a->attr('href');

  $req = HTTP::Request->new(GET => $mission_page);

  $res = $ua->request($req);

  if ($res->is_success) {
  #   print $res->content;
  } else {
     print "Error: " . $res->status_line . "\n";
  }

  $root = HTML::TreeBuilder->new_from_content($res->content);

  my $infobox = $root->find_by_attribute('class', 'infobox');
  my $infobox_text = $infobox->as_trimmed_text();

  if (!$source_anchor && $infobox_text =~ /Starting Coords:\s*(\d+,\s*\d+)/si) {
    ($source) =  "$1";
    $source =~ s/,\s*/, /;
  }

  my $exp;
  if ($infobox_text =~ /(\d+(,\d+)*)\s*Experience/si) {
    ($exp) = "$1";
  }
  elsif ($infobox_text =~ /(\d+(,\d+)*)\s*xp/si) {
    ($exp) = "$1";
  }

  my @uls = $root->find('ul');
  my ($rewards, $rewards_text, $pax_romana, $sequins, $item);

  foreach (@uls) {
    if ($_->as_trimmed_text() =~ /(\d+(,\d+)*|#|\?)\s* Pax Romana/si) {
      ($pax_romana) = "$1";
      $rewards = $_;
      $rewards_text = $rewards->as_trimmed_text();
      last;
    }
  }

#  print $rewards_text;

  if ($rewards_text =~ /(\d+)\s+Sequin/si) {
    ($sequins) = "$1";
  }

  my @lis = $rewards->find('li');

  my $len = scalar @lis;
#  print "len".$len."\n";

  my $i = $len - 1;

  if($i > 3) {
    $item = ($lis[$i]->find('a')) ?
      '[['. $lis[$i]->as_trimmed_text() .']]' : $lis[$i]->as_trimmed_text();
  }

#  print "$pax_romana\n$sequins\n$item\n";
  print '|data-sort-value="' . $type . '"|{{' . $type . '|25px}}||[[' .
    $mission . ']]||' . $source . '||align="right"|' . $exp . '||align="right"|'
    . $pax_romana . '||' . $sequins . '||' . $item . "\n" . '|-' . "\n";
}

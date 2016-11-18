open FILE1, "1" or die $!;
my ($buf, $data, $n);
while (($n = read, FILE1, $data, 4) != 0)
{
print "$n bytes read\n";
$buf .= $data;
}
close(FILE1);

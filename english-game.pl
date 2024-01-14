print "If you start game when , push the Enter key. \n";
my $Enter = <STDIN>;
my $op;

my $count;
my $lines;
my $c1;
my $b1;
open($op ,"<", "./mondai.txt");
@lines = map { $_ } <$op>;

close $op;

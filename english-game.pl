print "If you start game when , push the Enter key. \n";
my $Enter = <STDIN>;
my $op;

my $count;
my $lines;
my $c1;
my $b1;
my $answer;
open($op ,"<", "./mondai.txt");
@lines = map { $_ } <$op>;

print "--grep---"."\n";

for($c1=0;$c1<=$#lines; $c1++)
{
	print "問題:".$lines[$c1++];

	if($c1 % 2 != 0)
	{
		print "練習 ".$lines[$c1];
		
	}
	$answer = <STDIN>;
	chomp($answer);
	print "c1 ".$lines[$c1];
	chomp($lines[$c1]);
	if($answer eq $lines[$c1]){
		print "success\n";
	}
	else{
		print "failed\n";
	}
		
}


	


use strict;
use warnings;

print "If you start game when , push the Enter key. \n";
my $Enter = <STDIN>;

my %words = (a=>['私にそれをさせてください。', 'Let me do it.'], b=>['留学する事を決める', 'Decide to study abroad.']
	, c=>['犬をきちんと訓練する','Train dogs properly.']);


my $i;
$i=0;

my $o;

my $len;
$len = keys %words;

&mains;

sub mains
{
	for($i=0;$i<$len;$i++)
	{
		print "問題：";
		print $words{chr(97+$i)}[0], "\n";
		my $Answer = <STDIN>;
		chomp($Answer);
		my $words_answer = $words{chr(97+$i)}[1];
		if($Answer eq $words_answer){
			print "正解.";
			print "\n";
		}else{
			print "不正解.\n";
		}
	}
}

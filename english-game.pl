use strict;
use warnings;

print "If you start game when , push the Enter key. \n";
my $Enter = <STDIN>;

my %words = (a=>['私にそれをさせてください。', 'Let me do it.'], b=>['留学する事を決める', 'Decide to study abroad.']
	, c=>['犬をきちんと訓練する','Train dogs properly.']
	,d=>['日本中を旅行する', 'Travel all through Japan.'] 
	,e=>['ドアを開けたままにする。', 'Leave a door open.']
	,f=>['車を止める', 'Park a car.']
	,g=>['見本', 'specimen']);

open(my $op ,"<", "./mondai.txt");
my @lines = map { chomp; $_ } <$op>;

close $op;

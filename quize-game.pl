use strict;
use warnings;

print "Hello.";
print "\n";

my @nameArray = ('たかし',  '山田', '太郎');
print "$nameArray[1]";
print "Linux コマンド問題集LPIC１０１試験対応";
my %words = (a=>['ディレクトリ内のファイルとディレクトリをすべて
標準出力するコマンドを書け', 'ls'],b=>['ターミナルの画面をクリアに
するコマンドを書け',  'clear'], c=>['コマンドでファイルをssh接続
でファイル転送するコマンド名を書け', 'scp']);



#my $answer = <STDIN>;
#chomp($answer);

#my $words_length = @words;

     
print scalar(keys(%words)), "\n";
print $#{$words{a}}, "\n";
print $words{a}[0], "\n";

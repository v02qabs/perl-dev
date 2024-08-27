# main.pl

use strict;
use warnings;

# 自作モジュールをインポート
use lib '.';  # モジュールのディレクトリを指定
use MyModule;

# 関数の呼び出し
my $greeting = MyModule::hello('Perl');
print "$greeting\n";

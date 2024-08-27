# MyModule.pm

package MyModule;

use strict;
use warnings;

# 関数の定義
sub hello {
    my $name = shift;
    return "Hello, $name!";
}

1; # モジュールは真値を返す必要がある

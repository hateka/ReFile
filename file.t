use strict;
use warnings;

use Test::More "no_plan";

use FindBin;
use ReFile;

use_ok('ReFile');
use_ok('FindBin');

my $path = $FindBin::Bin;

my $file_type = 'html';

my $f = ReFile->new();

is($f->set_path($path),$path);

my @flist = $f->isdir();
my @list = $f->readlist(@flist,$file_type);

my %str = (
    'pre' => 'preline',
    'post' => 'postline'
   );

$f->re_str(%str);
$f->rewrite(@list);
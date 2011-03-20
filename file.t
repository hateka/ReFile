use strict;
use warnings;

use Test::More "no_plan";

use ReFile;

use_ok('ReFile');

my $path = 'C:\Documents and Settings\Administrator';
my $file_type = 'php';

my $f = ReFile->new();

is($f->set_path($path),$path);

my @flist = $f->isdir();
my @list = $f->readlist(@flist,$file_type);

my %str = (
    'pre' => '       <li>企画営業スタッフ募集中</li>',
    'post' => '       <li>制作スタッフ募集中</li>'
   );

$f->re_str(%str);
$f->rewrite(@list);

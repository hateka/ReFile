use strict;
use warnings;

use Test::More "no_plan";

use FindBin;
use ReFile;

use_ok('ReFile');
use_ok('FindBin');

my $path = $FindBin::Bin;

#my $path = 'C:\Documents and Settings\Administrator';
my $file_type = 'html';

my $f = ReFile->new();

is($f->set_path($path),$path);

my @flist = $f->isdir();
my @list = $f->readlist(@flist,$file_type);

my %str = (
    'pre' => '    <li class="shop"><a href="deli.html"><img src="../images/entame/lnavi_deli_off.gif" alt="Delicious Matrix" width="138" height="40" /></a></li>',
    'post' => 'kamokamo!!'
   );

$f->re_str(%str);
$f->rewrite(@list);

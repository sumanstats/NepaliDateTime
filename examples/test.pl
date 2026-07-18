use strict;
use warnings;
use utf8;
use FindBin;
use lib "$FindBin::Bin/../lib";

use NepaliDateTime::Date;
use NepaliDateTime::DateTime;

my $today = NepaliDateTime::Date->new(2083,1,22);


$today->print_calendar();

$today->print_year_calendar(devanagari => 1);
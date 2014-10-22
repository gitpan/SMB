#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 3;
use Time::HiRes qw(time);

use lib '../lib', 'lib';

use_ok('SMB::Time', qw(from_nttime to_nttime));

my $time = time;
my $nttime = to_nttime($time);
note "time=$time nttime=$nttime";
my $time2 = from_nttime($nttime);
is($time, $time2, "to_nttime + from_nttime");

$nttime = 130158657277172029;  # 2013-06-16 15:15:27 GMT
$time = from_nttime($nttime);
is(int($time), 1371392127, "from_nttime($nttime)");

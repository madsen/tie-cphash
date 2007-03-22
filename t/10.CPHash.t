#! /usr/bin/perl
#---------------------------------------------------------------------
# $Id$
# Copyright 1997 Christopher J. Madsen
#
# This program is free software; you can redistribute it and/or modify
# it under the same terms as Perl itself.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See either the
# GNU General Public License or the Artistic License for more details.
#
# Test the Tie::CPHash module
#---------------------------------------------------------------------
#########################

use Test::More tests => 7;
BEGIN { use_ok('Tie::CPHash') };

#########################

my(%h,$j,$test);

tie(%h, 'Tie::CPHash');
ok(1, 'tied %h');

SKIP: {
  skip 'SCALAR added in Perl 5.8.3', 1 unless $] >= 5.008003;
  ok((not scalar %h), 'SCALAR empty');
};

$h{Hello} = 'World';
$j = $h{HeLLo};
is(           $j => 'World',  'HeLLo - World');
is((keys %h)[-1] => 'Hello',  'last key Hello');

$h{World} = 'HW';
$h{HELLO} = $h{World};
is(tied(%h)->key('hello') => 'HELLO',  'last key HELLO');

SKIP: {
  skip 'SCALAR added in Perl 5.8.3', 1 unless $] >= 5.008003;
  ok(scalar %h, 'SCALAR not empty');
};

# Local Variables:
# mode: perl
# End:

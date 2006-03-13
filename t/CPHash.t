# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl CPHash.t'
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

ok((not scalar %h), 'SCALAR empty');

$h{Hello} = 'World';
$j = $h{HeLLo};
is(           $j => 'World',  'HeLLo - World');
is((keys %h)[-1] => 'Hello',  'last key Hello');

$h{World} = 'HW';
$h{HELLO} = $h{World};
is(tied(%h)->key('hello') => 'HELLO',  'last key HELLO');

ok(scalar %h, 'SCALAR not empty');

# Local Variables:
# mode: perl
# End:

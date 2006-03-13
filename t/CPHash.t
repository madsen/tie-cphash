# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'
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
######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..4\n"; }
END {print "not ok 1\n" unless $loaded;}
require Tie::CPHash;
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

my(%h,$j,$test);

tie(%h, 'Tie::CPHash');
print "ok 2\n";

$h{Hello} = 'World';
$j = $h{HeLLo};
print "not" unless $j eq 'World' and (keys %h)[-1] eq 'Hello';
print "ok 3\n";

$h{World} = 'HW';
$h{HELLO} = $h{World};
print "not" unless tied(%h)->key('hello') eq 'HELLO';
print "ok 4\n";

# Local Variables:
# mode: perl
# End:

# $Id: Makefile.PL,v 1.0 1998/01/15 21:30:49 Madsen Exp $

use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'	=> 'Tie::CPHash',
    'VERSION_FROM' => 'CPHash.pm', # finds $VERSION
    'dist'	=> {COMPRESS => 'gzip -9f', SUFFIX => 'gz',
# This next line is just for my own use, you should comment it out:
                    PREOP => 'cjm_fixup $(DISTVNAME)' # Converts CRLF to LF
                   }
);

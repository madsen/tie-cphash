# $Id$

use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'	=> 'Tie::CPHash',
    'VERSION_FROM' => 'CPHash.pm', # finds $VERSION
    'dist'	=> {COMPRESS => 'gzip -9f', SUFFIX => 'gz',
                    (-e 'cjm_fixup'
                     ? (PREOP => './cjm_fixup $(DISTVNAME)')
                     : () ) },
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'CPHash.pm', # retrieve abstract from module
       AUTHOR         => 'Christopher J. Madsen <cjm@pobox.com>') : ()),
);

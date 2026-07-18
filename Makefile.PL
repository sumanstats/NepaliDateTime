use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'NepaliDateTime',
    AUTHOR           => 'Dr Suman Khanal <suman81765@gmail.com> (SUMAN)',
    VERSION_FROM     => 'lib/NepaliDateTime.pm',
    ABSTRACT_FROM    => 'lib/NepaliDateTime.pm',
    LICENSE          => 'mit',
    MIN_PERL_VERSION => '5.12.0',

    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => '6.64',   # needed for TEST_REQUIRES support
    },

    PREREQ_PM => {
        'Carp'  => 0,
        'POSIX' => 0,
    },

    TEST_REQUIRES => {
        'Test2::V1' => '1.302218',
    },

    META_MERGE => {
        'meta-spec'     => { version => 2 },
        dynamic_config  => 0,
        x_static_install => 1,
        resources => {
            repository => {
                type => 'git',
                url  => 'https://github.com/sumanstats/NepaliDateTime',
            },
        },
    },

    test => { TESTS => 't/*.t' },
);



# if README.md needs to be generated from makefile
# install of pod::markdown should happen at build time then 
# sub MY::postamble {
#     return <<'MAKE_FRAG';

# README.md: lib/NepaliDateTime.pm tools/gen_readme.pl
# 	$(PERL) tools/gen_readme.pl

# distdir: README.md

# clean ::
# 	rm -f README.md

# MAKE_FRAG
# }
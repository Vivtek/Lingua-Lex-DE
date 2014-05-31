use 5.006;
use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;
use File::ShareDir::Install;

install_share module => 'Lingua::Lex::DE', 'dict';

WriteMakefile(
    NAME             => 'Lingua::Lex::DE',
    AUTHOR           => q{Michael Roberts <michael@vivtek.com>},
    VERSION_FROM     => 'lib/Lingua/Lex/DE.pm',
    ABSTRACT_FROM    => 'lib/Lingua/Lex/DE.pm',
    LICENSE          => 'Artistic_2_0',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.006,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More' => 0,
        'File::ShareDir::Install' => 0,
    },
    PREREQ_PM => {
        'Lingua::Lex' => 0,
        #'Foo::Bar::Module' => 5.0401,
    },
    META_MERGE => {
        'meta-spec' => { version => 2 },
        resources => {
            repository => {
               type => 'git',
               url  => 'https://github.com/Vivtek/Lingua-Lex-DE.git',
               web  => 'https://github.com/Vivtek/Lingua-Lex-DE',
            },
        },
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Lingua-Lex-DE-*' },
);

package MY;
use File::ShareDir::Install qw( postamble );
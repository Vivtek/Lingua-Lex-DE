#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Lingua::Lex::DE' ) || print "Bail out!\n";
}

diag( "Testing Lingua::Lex::DE $Lingua::Lex::DE::VERSION, Perl $], $^X" );
